// // SPDX-License-Identifier: UNLICENSED
// pragma solidity 0.8.16;

// import "forge-std/Script.sol";

// import "../src/Clifford.sol";

// contract RevealScript is Script {

//   Clifford public clifford = Clifford(0x005eF30bb262f3C5Ef22B86Efa89DA7E556173e2);

  
  
//   function run() public {
//     uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

//     vm.startBroadcast(deployerPrivateKey);

//     // clifford.publicMint(0xB2a61F4dE7d8C1985cb5565CFCBD7F1A18CBF123, 10);
//     clifford.reveal();

//     vm.stopBroadcast();
//   }
// }