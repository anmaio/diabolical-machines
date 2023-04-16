// // SPDX-License-Identifier: UNLICENSED
// pragma solidity 0.8.16;

// import "forge-std/Script.sol";

// import "../src/BasicNFT.sol";

// contract BasicNFTScript is Script {

//   BasicNFT public basicNFT;

//   /**
//    * @notice This function deploys and mints a BasicNFT contract.
//    * @dev This function deploys a BasicNFT contract and then mints 5 tokens with a value of 20 each.
//    */
//   function deployAndMintBasicNFT() public {
//     basicNFT = new BasicNFT();
//     for (uint i = 0; i < 5;) {
//       basicNFT.mint(20);
//       unchecked {
//         ++i;
//       }
//     }
//   }
  
//   /**
//    * @notice This function is used to deploy a basic NFT and mint it.
//    * @dev This function requires the deployer's private key to be passed in as an environment variable. The function then starts a broadcast, deploys and mints the basic NFT, and then stops the broadcast. 
//    */
//   function run() public {
//     uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

//     vm.startBroadcast(deployerPrivateKey);

//     deployAndMintBasicNFT();

//     vm.stopBroadcast();
//   }
// }