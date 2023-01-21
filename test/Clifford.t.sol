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

import "../src/Assets/Altar/AltarImp1.sol";
import "../src/Assets/Altar/AltarImp2.sol";
import "../src/Assets/Altar/AltarImp3.sol";

import "../src/Assets/Substances/SubstancesImp1.sol";

import "../src/Assets/TraitBase.sol";
import "../src/AssetRetriever.sol";



contract CliffordTest is Test {

  // Substances
  SubstancesImp1 public substancesImp1 = new SubstancesImp1();

  // Altar
  AltarImp1 public altarImp1 = new AltarImp1();
  AltarImp2 public altarImp2 = new AltarImp2();
  AltarImp3 public altarImp3 = new AltarImp3();

  // Trait bases
  TraitBase public altarTB;
  TraitBase public substancesTB;

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
    // Substances
    address[] memory substancesImpsAds = new address[](1);
    substancesImpsAds[0] = address(substancesImp1);
    substancesTB = new TraitBase(substancesImpsAds);

    // Altar
    address[] memory altarImpsAds = new address[](3);
    altarImpsAds[0] = address(altarImp1);
    altarImpsAds[1] = address(altarImp2);
    altarImpsAds[2] = address(altarImp3);
    altarTB = new TraitBase(altarImpsAds);

    // Asset Retriever
    address[] memory traitBases = new address[](2);
    traitBases[0] = address(substancesTB);
    traitBases[1] = address(altarTB);
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
