// // SPDX-License-Identifier: UNLICENSED
// pragma solidity 0.8.16;

// import "forge-std/Script.sol";
// import "forge-std/StdJson.sol";

// contract ParseFromFileScript is Script {

//   uint internal constant NUMBER_OF_ITEMS = 1000;

//   using stdJson for string;

//   function readFromFile() public view {
//     string memory contents = vm.readFile("outputJson/ids.json");

//     // bytes memory contentsDetails = contents.parseRaw(".State");

//     // string memory state = contents.readString("[1].State");

//     string[] memory states = new string[](NUMBER_OF_ITEMS);

//     for (uint i = 0; i < NUMBER_OF_ITEMS; i++) {
//       states[i] = contents.readString(string(abi.encodePacked("[", vm.toString(i), "].State")));
//       console2.log("state: ", states[i]);
//     }

//     // log the length of the contents
//     // console2.log("contents length", contentsDetails.length);
//   }


//   function run() public {
//     uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

//     vm.startBroadcast(deployerPrivateKey);

//     readFromFile();

//     vm.stopBroadcast();
//   }
// }