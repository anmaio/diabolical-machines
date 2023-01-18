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

import "../src/Assets/MachinesDevices/MachinesDevicesImp1.sol";
import "../src/Assets/MachinesDevices/MachinesDevicesImp2.sol";
import "../src/Assets/MachinesDevices/MachinesDevicesImp3.sol";

import "../src/Assets/TraitBase.sol";
import "../src/AssetRetriever.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

contract CliffordTest is Test {
  MachinesDevicesImp1 public machineDevicesImp1;
  MachinesDevicesImp2 public machineDevicesImp2;
  MachinesDevicesImp3 public machineDevicesImp3;

  TraitBase public machineDevices;

  AssetRetriever public assetRetriever;

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
    // Machine Devices
    machineDevicesImp1 = new MachinesDevicesImp1();
    machineDevicesImp2 = new MachinesDevicesImp2();
    machineDevicesImp3 = new MachinesDevicesImp3();
    address[] memory machineDevicesImpsAds = new address[](3);
    machineDevicesImpsAds[0] = address(machineDevicesImp1);
    machineDevicesImpsAds[1] = address(machineDevicesImp2);
    machineDevicesImpsAds[2] = address(machineDevicesImp3);
    uint[] memory machineDevicesImpsIndexes = new uint[](4);
    machineDevicesImpsIndexes[0] = 0;
    machineDevicesImpsIndexes[1] = 5;
    machineDevicesImpsIndexes[2] = 10;
    machineDevicesImpsIndexes[3] = 18;
    machineDevices = new TraitBase(machineDevicesImpsAds, machineDevicesImpsIndexes);

    // Asset Retriever
    address[] memory traitBases = new address[](1);
    traitBases[0] = address(machineDevices);
    assetRetriever = new AssetRetriever(traitBases); // Add the address of each TraitBase

    // Logic Contracts for each Workstation
    cypherRoom = new CypherRoom();
    altar = new Altar(address(assetRetriever));
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

    metadata.setClifford(clifford);
    // clifford.setHandleRandom(handleRandom);
    compose.setMetadata(metadata);
    machine.setMetadata(address(metadata));

    machine.setAllWorkstations([address(conveyorbelt), address(drills), address(nose), address(beast), address(altar), address(tubes), address(cypherRoom)]);

    setupMint();
    clifford.reveal();
  }

  function setupMint() public {
    address to = address(1337);

    // ERC721A has the ability to mint multiple tokens at once
    // Using single mints for now while randomness is Psuedo Random and dependant on block.timestamp
    for (uint256 i = 0; i < 15; i++) {
      vm.roll(i*99);
      vm.warp(i*99);
      vm.difficulty(i*99);
      // to, quantity
      clifford.publicMint(to, 1);
    }
  }

  // test writing 5 images to a file
  function testWriteImages() public {
    for (uint256 i = 0; i < 15; i++) {
      string memory path = string.concat("outputImages/", Strings.toString(i), ".svg");
      vm.writeFile(path, compose.composeOnlyImage(i));
    }
  }


  // function testSingleMint() public view {
  //   console.log(clifford.tokenURI(2));
  // }

}
