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

import "../src/Assets/Assets/AssetsImp1.sol";
import "../src/Assets/Assets/AssetsImp2.sol";
import "../src/Assets/Assets/AssetsImp3.sol";
import "../src/Assets/Assets/AssetsImp4.sol";
import "../src/Assets/Assets/AssetsImp5.sol";
import "../src/Assets/Assets/AssetsImp6.sol";

import "../src/Assets/Misc/MiscImp1.sol";

import "../src/Assets/Props/PropsImp1.sol";

import "../src/Assets/Cells/CellsImp1.sol";

import "../src/Assets/Drills/DrillsImp1.sol";
import "../src/Assets/Drills/DrillsImp2.sol";
import "../src/Assets/Drills/DrillsImp3.sol";
import "../src/Assets/Drills/DrillsImp4.sol";

import "../src/Assets/Tubes/TubesImp1.sol";

import "../src/Assets/TraitBase.sol";
import "../src/AssetRetriever.sol";

contract CliffordTest is Test {

  uint internal constant MINT_SIZE = 10;
  string[3] public allStates = ["Degraded", "Basic", "Embellished"];
  string public output = "[\n  ";

  // Trait bases
  TraitBase public substancesTB;
  TraitBase public feedbackTB;
  TraitBase public eyesTB;
  TraitBase public assetsTB;
  TraitBase public propsTB;
  TraitBase public altarTB;
  TraitBase public drillsTB;
  TraitBase public tubesTB;
  TraitBase public cellsTB;
  TraitBase public miscTB;

  AssetRetriever public assetRetriever;

  // Machines
  Altar public altar;
  // Beast public beast;
  Drills public drills;
  // Nose public nose;
  // Tubes public tubes;
  // Conveyorbelt public conveyorbelt;

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

  // Feedback
  function deployFeedback() internal {
    FeedbackImp1 feedbackImp1 = new FeedbackImp1();
    address[] memory feedbackImpsAds = new address[](1);
    feedbackImpsAds[0] = address(feedbackImp1);
    feedbackTB = new TraitBase(feedbackImpsAds);
  }

  // Eyes
  function deployEyes() internal {
    EyesImp1 eyesImp1 = new EyesImp1();
    address[] memory eyesImpsAds = new address[](1);
    eyesImpsAds[0] = address(eyesImp1);
    eyesTB = new TraitBase(eyesImpsAds);
  }

  // Assets
  function deployAssets() internal {
    AssetsImp1 assetsImp1 = new AssetsImp1();
    AssetsImp2 assetsImp2 = new AssetsImp2();
    AssetsImp3 assetsImp3 = new AssetsImp3();
    AssetsImp4 assetsImp4 = new AssetsImp4();
    AssetsImp5 assetsImp5 = new AssetsImp5();
    AssetsImp6 assetsImp6 = new AssetsImp6();
    address[] memory assetsImpsAds = new address[](6);
    assetsImpsAds[0] = address(assetsImp1);
    assetsImpsAds[1] = address(assetsImp2);
    assetsImpsAds[2] = address(assetsImp3);
    assetsImpsAds[3] = address(assetsImp4);
    assetsImpsAds[4] = address(assetsImp5);
    assetsImpsAds[5] = address(assetsImp6);
    assetsTB = new TraitBase(assetsImpsAds);
  }

  // Props
  function deployProps() internal {
    PropsImp1 propsImp1 = new PropsImp1();
    address[] memory propsImpsAds = new address[](1);
    propsImpsAds[0] = address(propsImp1);
    propsTB = new TraitBase(propsImpsAds);
  }

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

  // Drills
  function deployDrills() internal {
    DrillsImp1 drillsImp1 = new DrillsImp1();
    DrillsImp2 drillsImp2 = new DrillsImp2();
    DrillsImp3 drillsImp3 = new DrillsImp3();
    DrillsImp4 drillsImp4 = new DrillsImp4();
    address[] memory drillsImpsAds = new address[](4);
    drillsImpsAds[0] = address(drillsImp1);
    drillsImpsAds[1] = address(drillsImp2);
    drillsImpsAds[2] = address(drillsImp3);
    drillsImpsAds[3] = address(drillsImp4);
    drillsTB = new TraitBase(drillsImpsAds);
  }

  // Tubes
  function deployTubes() internal {
    TubesImp1 tubesImp1 = new TubesImp1();
    address[] memory tubesImpsAds = new address[](1);
    tubesImpsAds[0] = address(tubesImp1);
    tubesTB = new TraitBase(tubesImpsAds);
  }

  // Cells
  function deployCells() internal {
    CellsImp1 cellsImp1 = new CellsImp1();
    address[] memory cellsImpsAds = new address[](1);
    cellsImpsAds[0] = address(cellsImp1);
    cellsTB = new TraitBase(cellsImpsAds);
  }

  // Misc
  function deployMisc() internal {
    MiscImp1 miscImp1 = new MiscImp1();
    address[] memory miscImpsAds = new address[](1);
    miscImpsAds[0] = address(miscImp1);
    miscTB = new TraitBase(miscImpsAds);
  }

  function deployAssetRetriever() internal {
    address[] memory traitBases = new address[](10);
    traitBases[0] = address(substancesTB);
    traitBases[1] = address(feedbackTB);
    traitBases[2] = address(eyesTB);
    traitBases[3] = address(assetsTB);
    traitBases[4] = address(propsTB);
    traitBases[5] = address(altarTB);
    traitBases[6] = address(drillsTB);
    traitBases[7] = address(tubesTB);
    traitBases[8] = address(cellsTB);
    traitBases[9] = address(miscTB);
    assetRetriever = new AssetRetriever(traitBases); // Add the address of each TraitBase
  }

  // deploy machines
  function deployMachines() internal {
    altar = new Altar(address(assetRetriever));
    drills = new Drills(address(assetRetriever));
    // beast = new Beast();
    // nose = new Nose();
    // tubes = new Tubes();
    // conveyorbelt = new Conveyorbelt();
  }

  // deploy logic
  function deployLogic() internal {
    globalSVG = new GlobalSVG();
    machine = new Machine([address(altar), address(drills)], assetRetriever);
    metadata = new Metadata(machine, globalSVG);
    clifford = new Clifford(metadata);
  }

  function setUp() public {

    // Can be Done individually
    deploySubstances();
    deployFeedback();
    deployEyes();
    deployAssets();
    deployProps();
    deployAltar();
    deployDrills();
    deployTubes();
    deployCells();
    deployMisc();
    deployAssetRetriever();
    deployMachines();
    deployLogic();

    // Testing only
    setupMint();
  }

  function setupMint() public {
    address to = address(1337);

    // ERC721A has the ability to mint multiple tokens at once
    // Using single mints for now for convenience
    for (uint256 i = 0; i < MINT_SIZE; i++) {
      // to, quantity
      clifford.publicMint(to, 1);
      vm.roll(i*69);
      vm.warp(i*69);
      clifford.reveal();
    }
  }

  // test writing X images to a file
  function testWriteImages() public {
    for (uint256 i = 0; i < MINT_SIZE; i++) {
      string memory path = string.concat("images/", Strings.toString(i), ".svg");
      vm.writeFile(path, metadata.composeOnlyImage(clifford.getRandBytes(i)));
    }
  }

  // create a json file with the ids of the images that were created
  function testWriteJson() public {

    string memory itemOpen = "{\n    \"id\": ";

    for (uint256 i = 0; i < MINT_SIZE; i++) {
      string memory id = Strings.toString(i);
      string memory itemClose = "\n  },\n  ";
      if (i == MINT_SIZE - 1) {
        itemClose = "\n  }\n";
      }

      string memory state = allStates[metadata.getState(clifford.getRandBytes(i))];

      string memory productivityValue = Strings.toString(machine.getProductivityValue(metadata.getMachine(clifford.getRandBytes(i)), clifford.getRandBytes(i), metadata.getState(clifford.getRandBytes(i))));

      string memory globalAsset = metadata.getGlobalAssetName(clifford.getRandBytes(i));

      string memory expansionProp = metadata.getExpansionPropName(clifford.getRandBytes(i));

      string memory colour = metadata.getColourIndexTier(clifford.getRandBytes(i), metadata.getState(clifford.getRandBytes(i)));

      string memory item = string.concat(
        itemOpen, 
        id, 
        ",\n    \"RandomNumber\": \"", 
        string(clifford.getRandBytes(i)), // random number
        "\",\n    \"State\": \"",
        state, 
        "\""
      );

      item = string.concat(
        item, 
        ",\n    \"Machine\": \"",
        metadata.getMachine(clifford.getRandBytes(i)), // machine name
        "\""
        ",\n    \"Productivity\": \"",
        metadata.getProductivity(clifford.getRandBytes(i)), // productivity
        "\",\n    \"ProductivityValue\": \"",
        productivityValue
      );

      item = string.concat(
        item, 
        "\",\n    \"GlobalAsset\": \"",
        globalAsset,
        "\",\n    \"ExpansionProp\": \"",
        expansionProp,
        "\",\n    \"Colour\": \"",
        colour,
        "\"",
        itemClose
      );

      output = string.concat(output, item);
    }

    string memory json = string.concat(output, "]");
    vm.writeFile("outputJson/ids.json", json);
    
  }

  function testWriteMetadata() public {
    string memory itemOpen = "{\n    \"attributes\": [\n      {\n        \"trait_type\": \"State\",\n        \"value\": \"";

    for (uint256 i = 0; i < MINT_SIZE; i++) {
      string memory id = Strings.toString(i);

      string memory state = allStates[metadata.getState(clifford.getRandBytes(i))];

      string memory machineName = metadata.getMachine(clifford.getRandBytes(i));

      string memory productivity = metadata.getProductivity(clifford.getRandBytes(i));

      string memory globalAsset = metadata.getGlobalAssetName(clifford.getRandBytes(i));

      string memory expansionProp = metadata.getExpansionPropName(clifford.getRandBytes(i));

      string memory colour = metadata.getColourIndexTier(clifford.getRandBytes(i), metadata.getState(clifford.getRandBytes(i)));

      string memory item = string.concat(
        itemOpen, 
        state, 
        "\"\n      },\n      {\n        \"trait_type\": \"Machine\",\n        \"value\": \"",
        machineName, 
        "\"\n      },\n      {\n        \"trait_type\": \"Productivity\",\n        \"value\": \"",
        productivity, 
        "\"\n      },\n      {\n        \"trait_type\": \"Global Asset\",\n        \"value\": \"",
        globalAsset
      );

      item = string.concat(
        item, 
        "\"\n      },\n      {\n        \"trait_type\": \"Expansion Prop\",\n        \"value\": \"",
        expansionProp,
        "\"\n      },\n      {\n        \"trait_type\": \"Colour\",\n        \"value\": \"",
        colour,
        "\"\n      }\n    ],\n    \"description\": \"Clifford is a generative art project that explores the relationship between humans and machines. Each Clifford is a unique, one-of-a-kind, generative art piece that is created by a machine. Clifford is a generative art project that explores the relationship between humans and machines. Each Clifford is a unique, one-of-a-kind, generative art piece that is created by a machine.\",\n    \"image\": \"https://gallerydevukssa.blob.core.windows.net/token-image/cliffordImage.jpg\",\n    \"name\": \"Clifford #",
        id,
        "\"\n}"
      );

      vm.writeFile(string.concat("outputMetadata/", id, ".json"), item);
    }
    
  }

}
