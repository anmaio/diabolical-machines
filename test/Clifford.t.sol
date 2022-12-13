// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Test.sol";
import "../src/Clifford.sol";
import "../src/Compose.sol";
import "../src/Metadata.sol";
import "../src/HandleRandom.sol";
import "../src/SharedAssets.sol";
import "../src/Machine.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract CliffordTest is Test {

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
      }
    }

    // test writing 5 images to a file
    function testWriteImages() public {
      for (uint256 i = 0; i < 5; i++) {
        string memory path = string.concat("outputImages/", Strings.toString(i), ".svg");
        vm.writeFile(path, compose.composeOnlyImage(i));
      }
    }


    function testSingleMint() public view {
      // console.log(clifford.tokenURI(2));
    }

}
