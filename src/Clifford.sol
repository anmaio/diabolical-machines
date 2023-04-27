// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/access/Ownable.sol";

import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

import "ERC721A/ERC721A.sol";
import "./Metadata.sol";
import "solady/utils/LibBitmap.sol";

interface ICypher {
    function ownerOf(uint) external view returns (address);
}

/// @notice Main Contract for the diabolical machines NFT collection.
/// @author Zac Williams (https://twitter.com/ZacW369)
/// @author Anomalous Materials (https://twitter.com/AnomalousMatter)

contract Clifford is ERC721A, Ownable, VRFConsumerBaseV2 {
  VRFCoordinatorV2Interface immutable COORDINATOR;
  LinkTokenInterface immutable LINKTOKEN;

  // CUSTOM ERRORS

  error InvalidTokenId(uint tokenId);
  error SeedNotSet(uint genId);
  error TransferFailed();

  error NotOwnerOfCypher(uint tokenId);
  error CypherAlreadyClaimed(uint tokenId);
	error CypherClaimNotActive();

  error CannotBidZero();
  error IncorrectBidIncrement(uint amount);
  error AuctionNotActive();
  error BidTooSmall(uint amount);
  error AuctionAlreadyStarted();
  error CypherClaimNotStarted();
  error NftsAlreadyDistributed();

	error AuctionNotOver();
  error NftsNotAllMinted();

  // EVENTS

  // emit genId and seed when random number is generated
  event RandomNumberGenerated(uint256 genId, uint256 seed);

  // emit genId when reveal is called
  event RandomnessRequested(uint256 genId);

  // emit address of a failed transfer
  event TransferNotSuccessful(address to);

  // MAPPINGS

  // requestId => genId
  mapping(uint256 => uint256) private requestIdToGenId;

  // genId => seed
  mapping(uint256 => uint256) private genSeed;

  // tokenId => genId
  mapping(uint256 => uint256) private tokenIdToGenId;

  mapping(address => uint) private allBids;

  // CONSTANTS

  // testing variable for local node or to save time on testnet
  bool public constant PSUEDO_RANDOM = true;

  uint256 public constant MAX_SUPPLY = 6_000;

  // Mainnet coordinator
  address private constant vrfCoordinator = 0x271682DEB8C4E0901D1a1550aD2e64D568E69909;

  address private constant link_token_contract = 0x514910771AF9Ca656af840dff83E8264EcF986CA; // Mainnet

  // The gas lane to use, which specifies the maximum gas price to bump to.
  bytes32 private keyHash = 0xff8dedfbfa60af186cf3c830acbc32c05aae823045ae5ea7da1e45fbfaba4f92; // Mainnet 500 GWEI

  uint32 private constant callbackGasLimit = 100_000;

  // The default is 3, but you can set this higher.
  uint16 private constant requestConfirmations = 3;

  // Number of random values to request
  uint32 private constant numWords = 1;

  // Subscription Id set during deployment
  uint64 public constant s_subscriptionId = 0; // Need to create subscription before deployment

  // Auction Settings

  uint private constant BID_INCREMENT = 0.01 ether;

  uint private constant AUCTION_LENGTH = 5 days;

  uint private constant BID_EXTENSION_LENGTH = 15 minutes;

  uint private constant BID_INCREASE_PERCENT = 10;

  ICypher internal constant CYPHER_CONTRACT = ICypher(0xdDA32aabBBB6c44eFC567baC5F7C35f185338456);

  // current genId for minting
  uint private currentGen;

  // Cypher claims
  bool private cypherClaimStarted;

  LibBitmap.Bitmap private cypherClaims;

  // totalSupply subtract Cypher claims
  uint private saleCount;

  // Auction Info
  uint private startedAt;
  uint private endAt;
  uint private sumOfAllBids;
  address[] private allBidders;

  bool distributed;

  Metadata private immutable _metadata;

  constructor(Metadata metadata) ERC721A("Clifford", "Cliff") VRFConsumerBaseV2(vrfCoordinator) {
    COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
    LINKTOKEN = LinkTokenInterface(link_token_contract);
    _metadata = metadata;
  }

  // Assumes the subscription is funded sufficiently.
  function reveal() external onlyOwner {
    uint gen = currentGen;
    currentGen++;
    if (!PSUEDO_RANDOM) {
      // Will revert if subscription is not set and funded.
      uint256 s_requestId = COORDINATOR.requestRandomWords(
        keyHash,
        s_subscriptionId,
        requestConfirmations,
        callbackGasLimit,
        numWords
      );
      requestIdToGenId[s_requestId] = gen;
      emit RandomnessRequested(gen);

    } else { // Testing
      genSeed[gen] = uint256(keccak256(abi.encodePacked(block.number, block.timestamp, totalSupply())));
    }
  }

  function fulfillRandomWords(
      uint256 requestId, /* requestId */
      uint256[] memory randomWords
  ) internal override {
    uint256 randomness = randomWords[0];
    uint256 genId = requestIdToGenId[requestId];
    delete requestIdToGenId[genId];
    genSeed[genId] = randomness;
    emit RandomNumberGenerated(genId, randomness);
  }

  function _validMint(address to, uint quantity) internal {
    uint startingSupply = totalSupply();
    for (uint i = 0; i < quantity;) {
      uint tokenId = startingSupply + i;
      tokenIdToGenId[tokenId] = currentGen;
      unchecked {
        ++i;
      }
    }
    _mint(to, quantity);
  }

	// Step 1 - Cypher Claim

  function startCypherClaimPeriod() external onlyOwner {
		cypherClaimStarted = true;
	}

  function _validateCypherClaim(uint tokenId) internal {
      // Check sender owns the cypher they are claiming for
      if (msg.sender != CYPHER_CONTRACT.ownerOf(tokenId)) revert NotOwnerOfCypher(tokenId);

      // check the cypher has not already been claimed
      if (LibBitmap.get(cypherClaims, tokenId) == true) revert CypherAlreadyClaimed(tokenId);

      // set claimed for this cypher to be true
      LibBitmap.set(cypherClaims, tokenId);
  }

  function claimCyphers(uint[] memory tokenIds) public {
    if (!cypherClaimStarted || startedAt != 0) revert CypherClaimNotActive();
    uint numOfCyphers = tokenIds.length;
    for (uint i = 0; i < numOfCyphers;) {
      _validateCypherClaim(tokenIds[i]);
      unchecked {
          ++i;
      }
    }
    _validMint(msg.sender, numOfCyphers);
  }

	// Step 2 - Auction

	function startAuction() external onlyOwner {
    if (!cypherClaimStarted) revert CypherClaimNotStarted();

    if (startedAt != 0) revert AuctionAlreadyStarted();

    saleCount = MAX_SUPPLY - totalSupply();

    startedAt = block.timestamp;
    endAt = block.timestamp + AUCTION_LENGTH;
  }

  function placeBid() public payable {
    // Check the auction hasn't ended
    // This will also revert if the auction hasn't started as the endAt value will not have been set
    if (block.timestamp >= endAt) revert AuctionNotActive();

    uint bidAmount = msg.value;

    // msg.value cannot be zero
    if (bidAmount == 0) revert CannotBidZero();

    // Check the bid increment is correct
    if (bidAmount % BID_INCREMENT != 0) revert IncorrectBidIncrement(bidAmount);

    uint totalBidsFromBidder = bidAmount + allBids[msg.sender];

    // Check the bid is large enough to recieve at least 1 NFT at the current price
    uint currentPricePerUnit = getMinimumBid();
    if (totalBidsFromBidder < currentPricePerUnit) revert BidTooSmall(bidAmount);

    // reset the timer to 15mins if less than 15mins is remaining
    if (block.timestamp + BID_EXTENSION_LENGTH > endAt) {
        endAt = block.timestamp + BID_EXTENSION_LENGTH;
    }

    // keeptrack of all bidders for distributing NFT's and refunds
    // if the 2 values are equal then their original bid must be zero
    if (bidAmount == totalBidsFromBidder) {
      allBidders.push(msg.sender);
    }

    sumOfAllBids += bidAmount;
    allBids[msg.sender] = totalBidsFromBidder;
  }

  function distributeNFTs() external onlyOwner {
    if (distributed) revert NftsAlreadyDistributed();

    distributed = true;

    uint pricePerUnit = getCurrentPricePerUnit();
    for (uint i = 0; i < allBidders.length; ++i) {
      address bidder = allBidders[i];
      uint amount = allBids[bidder];
      uint quantityToMint = amount / pricePerUnit;
      if (quantityToMint > 0) {
        // not using safemint for same reason as the transfer comment below
        _validMint(bidder, quantityToMint);
      }
      uint remainder = amount % pricePerUnit;
      // We don't want to fail if the transfer is not successful otherwise a malicious bidder could...
      // break this function by bidding with a contract that cannot recieve ether
      (bool success, ) = bidder.call{value: remainder}("");
      if (!success) emit TransferNotSuccessful(bidder);
    }
  }

	// Step 3 - Team Claim
 
	function devClaim() external onlyOwner {
    // Check the auction has started and ended
		if (startedAt == 0 || block.timestamp < endAt) revert AuctionNotOver();

    // After the first call to devClaim, this will always revert
    // In the rare case that there are no NFTs left to mint, this will revert
		_validMint(owner(), MAX_SUPPLY - totalSupply());
	}

  function withdraw(address recipient) external onlyOwner {
    if (MAX_SUPPLY != totalSupply()) revert NftsNotAllMinted();
    (bool success, ) = recipient.call{value: address(this).balance}("");
    if (!success) revert TransferFailed();
  }

	// Getters/ View Functions

  function getSeed(uint256 tokenId) public view returns (uint256) {
    if (tokenId >= totalSupply()) revert InvalidTokenId(tokenId);

    uint _genSeed = genSeed[tokenIdToGenId[tokenId]];
    if (_genSeed == 0) revert SeedNotSet(tokenIdToGenId[tokenId]);

    return uint256(keccak256(abi.encodePacked(_genSeed, tokenId)));
  }

  function tokenURI(uint256 tokenId) public view override returns (string memory) {
    return _metadata.buildMetadata(tokenId, getSeed(tokenId));
  }

  function getCurrentPricePerUnit() public view returns (uint) {
    return sumOfAllBids / saleCount;
  }

  function getMinimumBid() public view returns (uint) {
    uint minimum = getCurrentPricePerUnit() + getCurrentPricePerUnit() / BID_INCREASE_PERCENT;
    if (minimum <= BID_INCREMENT) {
      return BID_INCREMENT;
    } else {
      return minimum - minimum % BID_INCREMENT + BID_INCREMENT;
    }
  }

  function getAllBidders() external view returns (address[] memory) {
    return allBidders;
  }

  function getUserBid(address bidder) external view returns (uint) {
    return allBids[bidder];
  }

  function getStartTimestamp() external view returns(uint) {
    return startedAt;
  }

  function getEndTimestamp() external view returns(uint) {
    return endAt;
  }

  function getIfCypherClaimStarted() external view returns(bool) {
    return cypherClaimStarted && startedAt >= endAt;
  }
}
