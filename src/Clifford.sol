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

/// @notice Main Contract for the Machine For Dying NFT collection.
/// @author Zac Williams (https://twitter.com/ZacW369)
/// @author Anomalous Materials (https://twitter.com/AnomalousMatter)

contract Clifford is ERC721A, Ownable, VRFConsumerBaseV2 {
  
  address private constant vrfCoordinator = 0x271682DEB8C4E0901D1a1550aD2e64D568E69909;

  VRFCoordinatorV2Interface constant COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
  LinkTokenInterface constant LINKTOKEN = LinkTokenInterface(0x514910771AF9Ca656af840dff83E8264EcF986CA);

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
  error CypherClaimNotEnded();

	error AuctionNotOver();
  error NftsNotAllMinted();
  error TransferNotSuccessful(address to);
  error NoBidToClaim(address to);
  error TooManyRequested();

  // EVENTS

  // emit genId and seed when random number is generated
  event RandomNumberGenerated(uint256 genId, uint256 seed);

  // emit genId when reveal is called
  event RandomnessRequested(uint256 genId);

  // emit bidder's address and amount bid
  event UserPlacesBid(address user, uint amount);

  // MAPPINGS

  // requestId => genId
  mapping(uint256 => uint256) private requestIdToGenId;

  // genId => seed
  mapping(uint256 => uint256) private genSeed;

  // genId => tokenId
  mapping(uint256 => uint256) private genIdToTokenId;

  // bidder => total amount bidded
  mapping(address => uint) private allBids;

  // CONSTANTS

  uint256 public constant MAX_SUPPLY = 6_000;

  // The gas lane to use, which specifies the maximum gas price to bump to.
  bytes32 private constant keyHash = 0xff8dedfbfa60af186cf3c830acbc32c05aae823045ae5ea7da1e45fbfaba4f92;

  uint32 private constant callbackGasLimit = 100_000;

  uint16 private constant requestConfirmations = 3;

  // Number of random values to request
  uint32 private constant numWords = 1;

  // Subscription Id set during deployment
  uint64 public constant s_subscriptionId = 747;

  // Auction Settings

  uint private constant BID_INCREMENT = 0.01 ether;

  uint private constant AUCTION_LENGTH = 1 weeks;

  // Time after auction ends that users can claim their nfts and refunds
  // Also the time cypher holders have to claim their NFT
  uint private constant CLAIM_PERIOD = 1 weeks;

  uint private constant BID_EXTENSION_LENGTH = 15 minutes;

  uint private constant BID_INCREASE_PERCENT = 10;

  ICypher internal constant CYPHER_CONTRACT = ICypher(0xdDA32aabBBB6c44eFC567baC5F7C35f185338456);

  // current genId for minting
  uint private currentGen;

  uint private numOfCyphersClaimed;

  // Cypher claims equivalent to mapping(uint => bool) private cypherClaims;
  LibBitmap.Bitmap private cypherClaims;

  // Auction Info
  uint private startedAt;
  uint private endAt;
  uint private sumOfAllBids;
  address[] private allBidders;

  Metadata private immutable _metadata;

  constructor(Metadata metadata) ERC721A("AMachineForDying", "AMFD") VRFConsumerBaseV2(vrfCoordinator) {
    _metadata = metadata;
  }

  /**
    * @dev Reveals all minted tokens that have not been revealed yet.
   */
  
  function reveal() external onlyOwner {
    // Assumes the subscription is funded sufficiently.
    uint gen = currentGen;
    genIdToTokenId[gen] = totalSupply();
    currentGen++;

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
  }

  /**
    * @dev Callback function used by VRF Coordinator.
    * @param requestId The request Id used to get the random number.
    * @param randomWords The random words generated by the VRF Coordinator.
   */

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

	// Step 1 - Cypher Claim

  /**
    * @dev Start the cypher claim period.
   */

  function startCypherClaimPeriod() external onlyOwner {
    // Auction settings
    startedAt = block.timestamp + CLAIM_PERIOD;
    endAt = block.timestamp + CLAIM_PERIOD + AUCTION_LENGTH;
	}

  /**
    * @dev Validate that the cypher can be claimed and that the sender owns the cypher.
    * @param tokenId The tokenId to validate.
   */

  function _validateCypherClaim(uint tokenId) internal {
      // Check sender owns the cypher they are claiming for
      if (msg.sender != CYPHER_CONTRACT.ownerOf(tokenId)) revert NotOwnerOfCypher(tokenId);

      // check the cypher has not already been claimed
      if (LibBitmap.get(cypherClaims, tokenId)) revert CypherAlreadyClaimed(tokenId);

      // set claimed for this cypher to be true
      LibBitmap.set(cypherClaims, tokenId);
  }

  /**
    * @dev Claim a free NFT for each cypher you own.
    * @param tokenIds The tokenIds to claim for.
   */

  function claimCyphers(uint[] memory tokenIds) external {
    // will revert if the claim period hasn't started or if the auction has started
    if (block.timestamp >= startedAt) revert CypherClaimNotActive();
    uint numOfCyphers = tokenIds.length;
    numOfCyphersClaimed += numOfCyphers;
    for (uint i = 0; i < numOfCyphers;) {
      _validateCypherClaim(tokenIds[i]);
      unchecked {
          ++i;
      }
    }
    _mint(msg.sender, numOfCyphers);
  }

	// Step 2 - Auction

  /**
    * @dev User places a bid in the auction in the form of ETH.
   */

  function placeBid() external payable {
    // Check the auction has started and hasn't ended
    if (block.timestamp >= endAt || block.timestamp < startedAt) revert AuctionNotActive();

    uint bidAmount = msg.value;

    // msg.value cannot be zero
    if (bidAmount == 0) revert CannotBidZero();

    // Check the bid increment is correct
    if (bidAmount % BID_INCREMENT != 0) revert IncorrectBidIncrement(bidAmount);

    uint totalBidsFromBidder = bidAmount + allBids[msg.sender];

    // Check the bid is large enough to recieve at least 1 NFT at the current price
    if (totalBidsFromBidder < getMinimumBid()) revert BidTooSmall(bidAmount);

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

    emit UserPlacesBid(msg.sender, totalBidsFromBidder);
  }

  /**
    * @dev When the auction ends, bidders can claim their NFT's and any remaining ETH.
   */

  function claimAfterAuction() external {
    // Check the auction has ended and it is within the claim period (1 week)
    if (block.timestamp < endAt + BID_EXTENSION_LENGTH || block.timestamp > endAt + CLAIM_PERIOD) revert AuctionNotOver();

    // Check the sender has placed a bid and has not already claimed
    if (allBids[msg.sender] == 0) revert NoBidToClaim(msg.sender);

    uint pricePerUnit = getCurrentPricePerUnit();

    uint amount = allBids[msg.sender];
    uint quantityToMint = amount / pricePerUnit;

    allBids[msg.sender] = 0;

    if (quantityToMint > 0) {
      _mint(msg.sender, quantityToMint);
    }

    uint remainder = amount % pricePerUnit;
    (bool success, ) = (msg.sender).call{value: remainder}("");
    if (!success) revert TransferNotSuccessful(msg.sender);
  }

	// Step 3 - Withdraw Remaining NFTs
 
	function withdrawRemainingNFTs(uint amount) external onlyOwner {
    // Check the auction has started, ended and the claim period has passed
		if (startedAt == 0 || block.timestamp < endAt + CLAIM_PERIOD) revert AuctionNotOver();

    if (totalSupply() + amount > MAX_SUPPLY) revert TooManyRequested();

    // After all nfts have been minted, this will revert
    // In the rare case that there are no NFTs left after the auction, this will revert
		_mint(owner(), amount);
	}

  // Step 4 - Withdraw

  /**
    * @dev Withdraw the ETH from the contract, but only after all other steps have been completed.
   */

  function withdraw() external onlyOwner {
    if (totalSupply() != MAX_SUPPLY) revert NftsNotAllMinted();
    (bool success, ) = msg.sender.call{value: address(this).balance}("");
    if (!success) revert TransferFailed();
  }

	// Getters/ View Functions

  /**
    * @dev Get the seed for a given tokenId.
    * @param tokenId The tokenId to get the seed for.
    * @return The seed(random number) for the given tokenId.
   */

  function getSeed(uint256 tokenId) public view returns (uint256) {
    if (tokenId >= totalSupply()) revert InvalidTokenId(tokenId);

    for (uint i = 0; i < currentGen;) {
      if (tokenId < genIdToTokenId[i]) {
        uint seed = genSeed[i];
        return uint256(keccak256(abi.encodePacked(seed, tokenId)));
      }
      unchecked {
          ++i;
      }
    }

    return 0;
  }

  /**
    * @dev Get the metadata for a given tokenId.
    * @param tokenId The tokenId to get the metadata for.
    * @return The metadata for the given tokenId.
   */

  function tokenURI(uint256 tokenId) public view override returns (string memory) {
    uint seed = getSeed(tokenId);
    if (seed == 0) {
      return "ipfs://QmTJf1jnE2E8iMtVdVvdcCUwC1D8kJ4Qktise1XM1CfvyS";
    }
    return _metadata.buildMetadata(tokenId, seed);
  }

  /**
    * @dev Get the current price per unit.
    * @return The current price per unit.
   */

  function getCurrentPricePerUnit() public view returns (uint) {
    return sumOfAllBids / (MAX_SUPPLY - numOfCyphersClaimed);
  }

  /**
    * @dev Get the minimum bid.
    * @return The minimum bid.
   */

  function getMinimumBid() public view returns (uint) {
    uint minimum = getCurrentPricePerUnit() + getCurrentPricePerUnit() / BID_INCREASE_PERCENT;
    if (minimum <= BID_INCREMENT) {
      return BID_INCREMENT;
    } else {
      return minimum - minimum % BID_INCREMENT + BID_INCREMENT;
    }
  }

  /**
    * @dev Get all bidders.
    * @return An array of all bidders.
   */

  function getAllBidders() external view returns (address[] memory) {
    return allBidders;
  }

  /**
    * @dev Get the total amount of bids for a given bidder, assuming they have not claimed.
    * @param bidder The bidder to get the total amount of bids for.
    * @return The total amount of bids for the given bidder.
   */

  function getUserBid(address bidder) external view returns (uint) {
    return allBids[bidder];
  }

  /**
    * @dev Get when the auction started
    * @return The timestamp when the auction started.
   */

  function getStartTimestamp() external view returns(uint) {
    return startedAt;
  }

  /**
    * @dev Get when the auction is currently scheduled to end. This may be extended if a bid is placed in the last 15mins.
    * @return The timestamp when the auction ends.
   */

  function getEndTimestamp() external view returns(uint) {
    return endAt;
  }

  /**
    * @dev check if an individual cypher claim has been claimed
    * @param tokenId The tokenId to check if it has been claimed.
    * @return true if the given tokenId has been claimed.
   */

  function getIfCypherClaimed(uint tokenId) external view returns(bool) {
    return LibBitmap.get(cypherClaims, tokenId);
  }
}
