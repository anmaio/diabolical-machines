// SPDX-License-Identifier: MIT
// An example of a consumer contract that relies on a subscription for funding.
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "./Metadata.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT THAT USES HARDCODED VALUES FOR CLARITY.
 * THIS IS AN EXAMPLE CONTRACT THAT USES UN-AUDITED CODE.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */

contract VRFv2SubscriptionManager is VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface COORDINATOR;
    LinkTokenInterface LINKTOKEN;

    // Goerli coordinator. For other networks,
    // see https://docs.chain.link/docs/vrf-contracts/#configurations
    address vrfCoordinator = 0x2Ca8E0C643bDe4C2E08ab1fA0da3401AdAD7734D;

    // Goerli LINK token contract. For other networks, see
    // https://docs.chain.link/docs/vrf-contracts/#configurations
    address link_token_contract = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB;

    // The gas lane to use, which specifies the maximum gas price to bump to.
    // For a list of available gas lanes on each network,
    // see https://docs.chain.link/docs/vrf-contracts/#configurations
    bytes32 keyHash = 0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15;

    // Depends on the number of requested values that you want sent to the
    // fulfillRandomWords() function. Storing each word costs about 20,000 gas,
    // so 100,000 is a safe default for this example contract. Test and adjust
    // this limit based on the network that you select, the size of the request,
    // and the processing of the callback request in the fulfillRandomWords()
    // function.
    uint32 callbackGasLimit = 750000;

    // The default is 3, but you can set this higher.
    uint16 requestConfirmations = 3;

    // For this example, retrieve 2 random values in one request.
    // Cannot exceed VRFCoordinatorV2.MAX_NUM_WORDS.
    uint32 numWords = 1;

    // Contract that calls the mint function
    address minter;

    // Contract that deploys the contracts
    // remaining LINK will be withdrawn to this address after minting
    address s_owner;

    // Subscription Id set during deployment
    uint64 public s_subscriptionId;

    mapping(uint256 => uint256) public requestIdToTokenId;
    mapping(uint256 => uint256) public tokenIdToRandomWord;

    Metadata private _metadata;

    constructor(address mintContract, Metadata metadata) VRFConsumerBaseV2(vrfCoordinator) {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        LINKTOKEN = LinkTokenInterface(link_token_contract);
        minter = mintContract;
        s_owner = msg.sender;
        _metadata = metadata;
        //Create a new subscription when you deploy the contract.
        createNewSubscription();
    }

    // Assumes the subscription is funded sufficiently.
    function requestRandomWords(uint256 _tokenId) external onlyMintContract {
        // Will revert if subscription is not set and funded.
        uint256 s_requestId = COORDINATOR.requestRandomWords(
            keyHash,
            s_subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            numWords
        );
        requestIdToTokenId[s_requestId] = _tokenId;
    }

    function fulfillRandomWords(
        uint256 requestId, /* requestId */
        uint256[] memory randomWords
    ) internal override {
        uint256 tokenId = requestIdToTokenId[requestId];
        tokenIdToRandomWord[tokenId] = randomWords[0];
        _metadata.generateAllPositions(tokenId, randomWords[0]);
    }

    // Create a new subscription when the contract is initially deployed.
    function createNewSubscription() private onlyOwner {
        s_subscriptionId = COORDINATOR.createSubscription();
        // Add this contract as a consumer of its own subscription.
        COORDINATOR.addConsumer(s_subscriptionId, address(this));
    }

    // 1000000000000000000 = 1 LINK
    function topUpSubscription(uint256 amount) external {
        LINKTOKEN.transferAndCall(address(COORDINATOR), amount, abi.encode(s_subscriptionId));
    }

    function cancelSubscription(address receivingWallet) external onlyOwner {
        // Cancel the subscription and send the remaining LINK to a wallet address.
        COORDINATOR.cancelSubscription(s_subscriptionId, receivingWallet);
        s_subscriptionId = 0;
    }

    // Transfer this contract's funds to an address.
    // 1000000000000000000 = 1 LINK
    function withdraw(uint256 amount, address to) external onlyOwner {
        LINKTOKEN.transfer(to, amount);
    }

    modifier onlyMintContract() {
        require(msg.sender == minter);
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == s_owner);
        _;
    }
}
