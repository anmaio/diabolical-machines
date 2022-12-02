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
      for (uint256 i = 0; i < 100; i++) {
        vm.roll(i*99);
        vm.warp(i*99);
        vm.difficulty(i*99);
        // to, quantity
        clifford.publicMint(to, 1);
      }


      // for (uint256 i = 0; i < 5; i++) {
      //   console.log("Minted token: ", i);
      //   uint rand = handleRandom.getRandomNumber(i);
      //   console.log("rand: ", rand);
      //   console.log("metadata slice: ", metadata.getRandAndSlice(i, 8, 8));
      // }

      // console.log(clifford.tokenURI(0));
      // console.log(compose.composeOnlyImage(0));
      // vm.writeFile("images/test.svg", compose.composeOnlyImage(0));
    }

    // function testFileOutput1() public {
    //   for (uint256 i = 0; i < 40; i++) {
    //     string memory path = string.concat("images/", Strings.toString(i), ".svg");
    //     vm.writeFile(path, compose.composeOnlyImage(i));
    //   }
    // }

}
