// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
import "./Metadata.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT THAT USES HARDCODED VALUES FOR CLARITY.
 * THIS IS AN EXAMPLE CONTRACT THAT USES UN-AUDITED CODE.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */

/**
 * Request testnet LINK and ETH here: https://faucets.chain.link/
 * Find information on LINK Token Contracts and get the latest ETH and LINK faucets here: https://docs.chain.link/docs/link-token-contracts/
 */

contract Rng is VRFConsumerBase {

	bytes32 internal _keyHash = 0x0476f9a745b61ea5c0ab224d3a6e4c99f0b02fce4da01143a4f70aa80ae76e8a;
	uint256 internal _fee = 0.1 * 10 ** 18; // // 0.1 LINK (Goerli fee) change to 2 Link for Mainnet

	mapping(bytes32 => uint256) public requestIdToTokenId;
	mapping(uint256 => uint256) public tokenIdToRandomWord;

	// Contract that calls the mint function
	address public minter;

	// Contract that deploys the contracts
	// remaining LINK will be withdrawn to this address after minting
	address public owner;

	Metadata private _metadata;

	/**
		* Constructor inherits VRFConsumerBase
		*
		* Network: Goerli
		* Chainlink VRF Coordinator address: 0x2bce784e69d2Ff36c71edcB9F88358dB0DfB55b4
		* LINK token address: 0x326C977E6efc84E512bB9C30f76E30c160eD06FB
		* Key Hash: 0x0476f9a745b61ea5c0ab224d3a6e4c99f0b02fce4da01143a4f70aa80ae76e8a
		*/
	constructor(address mintContract, Metadata metadata)
			VRFConsumerBase(
					0x2bce784e69d2Ff36c71edcB9F88358dB0DfB55b4, // VRF Coordinator
					0x326C977E6efc84E512bB9C30f76E30c160eD06FB  // LINK Token
			)
	{
		owner = msg.sender;
		minter = mintContract;
        _metadata = metadata;
	}

	/**
		* Requests randomness
		*/
	function getRandomNumber(uint _tokenId) public onlyMintContract {
		require(LINK.balanceOf(address(this)) >= _fee, "Not enough LINK - fill contract with faucet");
		bytes32 _requestId = requestRandomness(_keyHash, _fee);
		requestIdToTokenId[_requestId] = _tokenId;
	}

	/**
		* Callback function used by VRF Coordinator
		*/
	function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
		uint tokenId = requestIdToTokenId[requestId];
		tokenIdToRandomWord[tokenId] = randomness;
    _metadata.generateAllPositions(tokenId, randomness);
	}

	function setMinter(address _minter) public {
			minter = _minter;
	}

	// Transfer this contract's funds to an address.
  // 1000000000000000000 = 1 LINK
  function withdrawLink(uint256 amount, address to) external onlyOwner {
    LINK.transfer(to, amount);
  }

	// function withdrawLink() external {} - Implement a withdraw function to avoid locking your LINK in the contract

	modifier onlyMintContract() {
			require(msg.sender == minter);
			_;
	}

	modifier onlyOwner() {
			require(msg.sender == owner);
			_;
	}
}