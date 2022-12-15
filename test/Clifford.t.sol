// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Test.sol";
import "../src/Clifford.sol";
import "../src/Compose.sol";
import "../src/Metadata.sol";
import "../src/HandleRandom.sol";
import "../src/SharedAssets.sol";
import "../src/Machine.sol";
import "../src/GlobalSVG.sol";

import "../src/machines/cypherRoom/CypherRoom.sol";
import "../src/machines/altar/Altar.sol";
import "../src/machines/beast/Beast.sol";
import "../src/machines/drills/Drills.sol";
import "../src/machines/nose/Nose.sol";
import "../src/machines/tubes/Tubes.sol";
import "../src/machines/conveyorbelt/Conveyorbelt.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

contract CliffordTest is Test {

    CypherRoom public cypherRoom;
    Altar public altar;
    Beast public beast;
    Drills public drills;
    Nose public nose;
    Tubes public tubes;
    Conveyorbelt public conveyorbelt;

    SharedAssets public sharedAssets;
    Compose public compose;
    Machine public machine;
    Metadata public metadata;
    HandleRandom public handleRandom;
    Clifford public clifford;
    GlobalSVG public globalSVG;

    function setUp() public {
        cypherRoom = new CypherRoom();
        altar = new Altar();
        beast = new Beast();
        drills = new Drills();
        nose = new Nose();
        tubes = new Tubes();
        conveyorbelt = new Conveyorbelt();

        globalSVG = new GlobalSVG();
        sharedAssets = new SharedAssets();
        machine = new Machine();
        compose = new Compose(sharedAssets, machine, globalSVG);
        metadata = new Metadata(compose, machine);
        clifford = new Clifford(metadata);
        handleRandom = new HandleRandom(clifford);

        metadata.setHandleRandom(handleRandom);
        clifford.setHandleRandom(handleRandom);
        compose.setMetadata(metadata);
        machine.setMetadata(metadata);

        machine.setCypherRoom(cypherRoom);
        machine.setAltar(altar);
        machine.setBeast(beast);
        machine.setDrills(drills);
        machine.setNose(nose);
        machine.setTubes(tubes);
        machine.setConveyorbelt(conveyorbelt);

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
