// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Test.sol";
import "../src/Clifford.sol";
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

import "../src/Assets/Eyes/EyesImp1.sol";

import "../src/Assets/Feedback/FeedbackImp1.sol";

import "../src/Assets/TraitBase.sol";
import "../src/AssetRetriever.sol";



contract CliffordTest is Test {

  uint internal constant MINT_SIZE = 1000;

  // Substances
  SubstancesImp1 public substancesImp1 = new SubstancesImp1();

  // Feedback
  FeedbackImp1 public feedbackImp1 = new FeedbackImp1();

  // Eyes
  EyesImp1 public eyesImp1 = new EyesImp1();

  // Altar
  AltarImp1 public altarImp1 = new AltarImp1();
  AltarImp2 public altarImp2 = new AltarImp2();
  AltarImp3 public altarImp3 = new AltarImp3();

  // Trait bases
  TraitBase public substancesTB;
  TraitBase public feedbackTB;
  TraitBase public eyesTB;
  TraitBase public altarTB;

  AssetRetriever public assetRetriever;

  CypherRoom public cypherRoom;
  Altar public altar;
  Beast public beast;
  Drills public drills;
  Nose public nose;
  Tubes public tubes;
  Conveyorbelt public conveyorbelt;

  SharedAssets public sharedAssets;
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

    // Feedback
    address[] memory feedbackImpsAds = new address[](1);
    feedbackImpsAds[0] = address(feedbackImp1);
    feedbackTB = new TraitBase(feedbackImpsAds);

    // Eyes
    address[] memory eyesImpsAds = new address[](1);
    eyesImpsAds[0] = address(eyesImp1);
    eyesTB = new TraitBase(eyesImpsAds);

    // Altar
    address[] memory altarImpsAds = new address[](3);
    altarImpsAds[0] = address(altarImp1);
    altarImpsAds[1] = address(altarImp2);
    altarImpsAds[2] = address(altarImp3);
    altarTB = new TraitBase(altarImpsAds);

    // Asset Retriever
    address[] memory traitBases = new address[](4);
    traitBases[0] = address(substancesTB);
    traitBases[1] = address(feedbackTB);
    traitBases[2] = address(eyesTB);
    traitBases[3] = address(altarTB);
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
    metadata = new Metadata(machine, globalSVG);
    clifford = new Clifford(metadata);
    handleRandom = new HandleRandom(clifford);

    metadata.setClifford(clifford);
    // clifford.setHandleRandom(handleRandom);
    machine.setMetadata(address(metadata));

    machine.setAllWorkstations([address(conveyorbelt), address(drills), address(nose), address(beast), address(altar), address(tubes), address(cypherRoom)]);

    setupMint();
    clifford.reveal();
  }

  function setupMint() public {
    address to = address(1337);

    // ERC721A has the ability to mint multiple tokens at once
    // Using single mints for now while randomness is Psuedo Random and dependant on block.timestamp
    for (uint256 i = 0; i < MINT_SIZE; i++) {
      vm.roll(i*99);
      vm.warp(i*99);
      vm.difficulty(i*99);
      // to, quantity
      clifford.publicMint(to, 1);
    }
  }

  // test writing X images to a file
  function testWriteImages() public {
    for (uint256 i = 0; i < MINT_SIZE; i++) {
      string memory path = string.concat("outputImages/", Strings.toString(i), ".svg");
      vm.writeFile(path, metadata.composeOnlyImage(i));
    }
  }

  // create a json file with the ids of the images that were created
  function testWriteJson() public {

    string[3] memory states = ["Degraded", "Basic", "Embellished"];
    
    string memory output = "[\n  ";
    string memory closing = "]";

    string memory itemOpen = "{\n    \"id\": ";

    for (uint256 i = 0; i < MINT_SIZE; i++) {
      string memory id = Strings.toString(i);
      string memory itemClose = "\n  },\n  ";
      if (i == MINT_SIZE - 1) {
        itemClose = "\n  }\n";
      }
      string memory randomNumber = string(metadata.getRandBytes(i));
      string memory state = Strings.toString(metadata.getState(metadata.getRandBytes(i)));

      string memory machine = metadata.getMachine(i);

      string memory item = string.concat(
        itemOpen, 
        id, 
        ",\n    \"RandomNumber\": ", 
        randomNumber, 
        ",\n    \"State\": \"",
        state, 
        "\""
      );

      item = string.concat(
        item, 
        ",\n    \"Machine\": \"",
        machine,
        "\"",
        itemClose
      );

      output = string.concat(output, item);
    }

    string memory json = string.concat(output, closing);
    vm.writeFile("outputJson/ids.json", json);
    
  }

}
