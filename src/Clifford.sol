// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

import "ERC721A/ERC721A.sol";
import "base64-sol/base64.sol";
import "./Metadata.sol";

contract Clifford is ERC721A, Ownable, VRFConsumerBaseV2, ReentrancyGuard {
    VRFCoordinatorV2Interface COORDINATOR;
    LinkTokenInterface LINKTOKEN;

    // emit genId and seed when random number is generated
    event RandomNumberGenerated(uint256 genId, uint256 seed);

    // emit genId when reveal is called
    event RandomnessRequested(uint256 genId);

    // testing variable for local node or to save time on testnet
    bool public constant PSUEDO_RANDOM = true;

    // Counters.Counter private _tokenIdCounter;
    uint256 public constant MAX_SUPPLY = 10_000;
    // bool public saleComplete = false;
    Metadata private _metadata;

    // Goerli coordinator. For other networks,
    // see https://docs.chain.link/docs/vrf-contracts/#configurations
    address private constant vrfCoordinator = 0x2Ca8E0C643bDe4C2E08ab1fA0da3401AdAD7734D;
    // address private constant vrfCoordinator = 0x271682DEB8C4E0901D1a1550aD2e64D568E69909; // Mainnet

    // Goerli LINK token contract. For other networks, see
    // https://docs.chain.link/docs/vrf-contracts/#configurations
    address private constant link_token_contract = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB; // Goerli
    // address private constant link_token_contract = 0x514910771AF9Ca656af840dff83E8264EcF986CA; // Mainnet

    // The gas lane to use, which specifies the maximum gas price to bump to.
    // For a list of available gas lanes on each network,
    // see https://docs.chain.link/docs/vrf-contracts/#configurations
    bytes32 private keyHash = 0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15;
    // bytes32 private keyHash = 0xff8dedfbfa60af186cf3c830acbc32c05aae823045ae5ea7da1e45fbfaba4f92; // Mainnet 500 GWEI

    // Depends on the number of requested values that you want sent to the
    // fulfillRandomWords() function. Storing each word costs about 20,000 gas,
    // so 100,000 is a safe default for this example contract. Test and adjust
    // this limit based on the network that you select, the size of the request,
    // and the processing of the callback request in the fulfillRandomWords()
    // function.
    uint32 private constant callbackGasLimit = 100_000;

    // The default is 3, but you can set this higher.
    uint16 private constant requestConfirmations = 3;

    // For this example, retrieve 2 random values in one request.
    // Cannot exceed VRFCoordinatorV2.MAX_NUM_WORDS.
    uint32 private constant numWords = 1;

    // Subscription Id set during deployment
    uint64 public s_subscriptionId = 8715;
    // uint64 public s_subscriptionId = 0;

    // requestId => genId
    mapping(uint256 => uint256) private requestIdToGenId;

    // genId => seed
    mapping(uint256 => uint256) private genSeed;

    // tokenId => genId
    mapping(uint256 => uint256) private tokenIdToGenId;

    // current genId for minting
    uint256 private currentGen;

    constructor(Metadata metadata) ERC721A("Clifford", "Cliff") VRFConsumerBaseV2(vrfCoordinator) {
      COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
      LINKTOKEN = LinkTokenInterface(link_token_contract);
      _metadata = metadata;
    }

    function publicMint(address to, uint quantity) public {
      require(quantity <= 30, "Quantity too high"); // To prevent excessive first-time token transfer costs, please limit the quantity to a reasonable number (e.g. 30).
      uint startingSupply = totalSupply();
      require(startingSupply + quantity <= MAX_SUPPLY, "Max supply reached");
      for (uint i = 0; i < quantity;) {
        uint tokenId = startingSupply + i;
        tokenIdToGenId[tokenId] = currentGen;
        unchecked {
          ++i;
        }
      }
      _safeMint(to, quantity); //Safe minting is reentrancy safe since V3.
    }

    function getSeed(uint256 tokenId) public view returns (uint256) {
      require(totalSupply() > tokenId, "Token does not exist");

      uint _genSeed = genSeed[tokenIdToGenId[tokenId]];
      require(_genSeed != 0, "Seed not set");

      return uint256(keccak256(abi.encodePacked(_genSeed, tokenId)));
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return _metadata.buildMetadata(tokenId, getSeed(tokenId));
    }

    function withdrawMoney() external onlyOwner {
      (bool success, ) = msg.sender.call{value: address(this).balance}("");
      require(success, "Transfer failed.");
    }

    // Assumes the subscription is funded sufficiently.
    function reveal() external nonReentrant { // TODO: add onlyOwner
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
}
