// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Script.sol";
import "../src/Clifford.sol";
import "../src/Compose.sol";
import "../src/Metadata.sol";
import "../src/HandleRandom.sol";
import "../src/SharedAssets.sol";
import "../src/Machine.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract CliffordScript is Script {
    SharedAssets public sharedAssets;
    Compose public compose;
    Machine public machine;
    Metadata public metadata;
    HandleRandom public handleRandom;
    Clifford public clifford;

    function setUp() public {
        sharedAssets = new SharedAssets();
        machine = new Machine();
        compose = new Compose(sharedAssets, machine);
        metadata = new Metadata(compose, machine);
        clifford = new Clifford(metadata);
        handleRandom = new HandleRandom(clifford);

        metadata.setHandleRandom(handleRandom);
        clifford.setHandleRandom(handleRandom);
        compose.setMetadata(metadata);
        machine.setMetadata(metadata);

        setupMint();
    }

    function setupMint() public {
      address to = address(1337);

      // ERC721A has the ability to mint multiple tokens at once
      // Using single mints for now while randomness is Psuedo Random and dependant on block.timestamp
      for (uint256 i = 0; i < 5; i++) {
        vm.roll(i*99);
        vm.warp(i*99);
        vm.difficulty(i*99);
        // to, quantity
        clifford.publicMint(to, 1);
        string memory path = string.concat("outputImages/", Strings.toString(i), ".svg");
        vm.writeFile(path, compose.composeOnlyImage(i));
      }
    }

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        address to = address(1337);
        clifford.publicMint(to, 1);
        console.log(clifford.tokenURI(0));

        vm.stopBroadcast();
    }
}
