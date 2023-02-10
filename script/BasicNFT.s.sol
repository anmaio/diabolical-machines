// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import "forge-std/Script.sol";

import "../src/BasicNFT.sol";

contract BasicNFTScript is Script {

  BasicNFT public basicNFT;

  function deployAndMintBasicNFT() public {
    basicNFT = new BasicNFT();
    for (uint i = 0; i < 5;) {
      basicNFT.mint(20);
      unchecked {
        ++i;
      }
    }
  }
  
  function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    vm.startBroadcast(deployerPrivateKey);

    deployAndMintBasicNFT();

    vm.stopBroadcast();
  }
}