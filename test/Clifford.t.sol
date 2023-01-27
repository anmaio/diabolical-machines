// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Test.sol";
import "../src/Clifford.sol";
import "../src/Metadata.sol";
import "../src/Machine.sol";
import "../src/GlobalSVG.sol";

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

  uint internal constant MINT_SIZE = 10;

  // Trait bases
  TraitBase public substancesTB;
  TraitBase public feedbackTB;
  TraitBase public eyesTB;
  TraitBase public altarTB;

  AssetRetriever public assetRetriever;

  // Machines
  Altar public altar;
  Beast public beast;
  Drills public drills;
  Nose public nose;
  Tubes public tubes;
  Conveyorbelt public conveyorbelt;

  Machine public machine;
  Metadata public metadata;
  Clifford public clifford;
  GlobalSVG public globalSVG;

  // Substances
  function deploySubstances() internal {
    SubstancesImp1 substancesImp1 = new SubstancesImp1();
    address[] memory substancesImpsAds = new address[](1);
    substancesImpsAds[0] = address(substancesImp1);
    substancesTB = new TraitBase(substancesImpsAds);
  }
  // SubstancesImp1 public substancesImp1 = new SubstancesImp1();

  // Feedback
  function deployFeedback() internal {
    FeedbackImp1 feedbackImp1 = new FeedbackImp1();
    address[] memory feedbackImpsAds = new address[](1);
    feedbackImpsAds[0] = address(feedbackImp1);
    feedbackTB = new TraitBase(feedbackImpsAds);
  }
  // FeedbackImp1 public feedbackImp1 = new FeedbackImp1();

  // Eyes
  function deployEyes() internal {
    EyesImp1 eyesImp1 = new EyesImp1();
    address[] memory eyesImpsAds = new address[](1);
    eyesImpsAds[0] = address(eyesImp1);
    eyesTB = new TraitBase(eyesImpsAds);
  }
  // EyesImp1 public eyesImp1 = new EyesImp1();

  // Altar
  function deployAltar() internal {
    AltarImp1 altarImp1 = new AltarImp1();
    AltarImp2 altarImp2 = new AltarImp2();
    AltarImp3 altarImp3 = new AltarImp3();
    address[] memory altarImpsAds = new address[](3);
    altarImpsAds[0] = address(altarImp1);
    altarImpsAds[1] = address(altarImp2);
    altarImpsAds[2] = address(altarImp3);
    altarTB = new TraitBase(altarImpsAds);
  }

  function deployAssetRetriever() internal {
    address[] memory traitBases = new address[](4);
    traitBases[0] = address(substancesTB);
    traitBases[1] = address(feedbackTB);
    traitBases[2] = address(eyesTB);
    traitBases[3] = address(altarTB);
    assetRetriever = new AssetRetriever(traitBases); // Add the address of each TraitBase
  }

  // deploy machines
  function deployMachines() internal {
    altar = new Altar(address(assetRetriever));
    beast = new Beast();
    drills = new Drills();
    nose = new Nose();
    tubes = new Tubes();
    conveyorbelt = new Conveyorbelt();
  }

  // deploy logic
  function deployLogic() internal {
    globalSVG = new GlobalSVG();
    machine = new Machine();
    metadata = new Metadata(machine, globalSVG);
    clifford = new Clifford(metadata);

    machine.setAllWorkstations([address(conveyorbelt), address(drills), address(nose), address(beast), address(altar), address(tubes)]);
  }

  function setUp() public {

    // Can be Done individually
    deploySubstances();
    deployFeedback();
    deployEyes();
    deployAltar();
    deployAssetRetriever();
    deployMachines();
    deployLogic();

    // Testing only
    setupMint();
    clifford.reveal();
  }

  function setupMint() public {
    address to = address(1337);

    // ERC721A has the ability to mint multiple tokens at once
    // Using single mints for now for convenience
    for (uint256 i = 0; i < MINT_SIZE; i++) {
      // to, quantity
      clifford.publicMint(to, 1);
    }
  }

  // test writing X images to a file
  function testWriteImages() public {
    for (uint256 i = 0; i < MINT_SIZE; i++) {
      string memory path = string.concat("images/", Strings.toString(i), ".svg");
      vm.writeFile(path, metadata.composeOnlyImage(i, clifford.getRandBytes(i)));
    }
  }

  // create a json file with the ids of the images that were created
  function testWriteJson() public {
    
    string memory output = "[\n  ";
    string memory closing = "]";

    string memory itemOpen = "{\n    \"id\": ";

    for (uint256 i = 0; i < MINT_SIZE; i++) {
      string memory id = Strings.toString(i);
      string memory itemClose = "\n  },\n  ";
      if (i == MINT_SIZE - 1) {
        itemClose = "\n  }\n";
    }
      string memory randomNumber = string(clifford.getRandBytes(i));
      string memory state = Strings.toString(metadata.getState(clifford.getRandBytes(i)));

      string memory machine = metadata.getMachine(i, clifford.getRandBytes(i));

      string memory item = string.concat(
        itemOpen, 
        id, 
        ",\n    \"RandomNumber\": \"", 
        randomNumber, 
        "\",\n    \"State\": \"",
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
