// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "../src/Clifford.sol";
import "../src/Metadata.sol";
import "../src/Machine.sol";
import "../src/GlobalSVG.sol";

import "../src/machines/altar/Altar.sol";
import "../src/machines/drills/Drills.sol";
import "../src/machines/apparatus/Apparatus.sol";
import "../src/machines/noses/Noses.sol";
import "../src/machines/cells/Cells.sol";

import "../src/Assets/Altar/AltarImp1.sol";
import "../src/Assets/Altar/AltarImp2.sol";
import "../src/Assets/Altar/AltarImp3.sol";

import "../src/Assets/Substances/SubstancesImp1.sol";

import "../src/Assets/Eyes/EyesImp1.sol";
import "../src/Assets/Eyes/EyesImp2.sol";

import "../src/Assets/Feedback/FeedbackImp1.sol";
import "../src/Assets/Feedback/FeedbackImp2.sol";

import "../src/Assets/Assets/AssetsImp1.sol";
import "../src/Assets/Assets/AssetsImp2.sol";
import "../src/Assets/Assets/AssetsImp3.sol";
import "../src/Assets/Assets/AssetsImp4.sol";
import "../src/Assets/Assets/AssetsImp5.sol";
import "../src/Assets/Assets/AssetsImp6.sol";

import "../src/Assets/Misc/MiscImp1.sol";

import "../src/Assets/Props/PropsImp1.sol";

import "../src/Assets/Cells/CellsImp1.sol";
import "../src/Assets/Cells/CellsImp2.sol";
import "../src/Assets/Cells/CellsImp3.sol";
import "../src/Assets/Cells/CellsImp4.sol";
import "../src/Assets/Cells/CellsImp5.sol";
import "../src/Assets/Cells/CellsImp6.sol";
import "../src/Assets/Cells/CellsImp7.sol";

import "../src/Assets/Drills/DrillsImp1.sol";
import "../src/Assets/Drills/DrillsImp2.sol";
import "../src/Assets/Drills/DrillsImp3.sol";
import "../src/Assets/Drills/DrillsImp4.sol";

import "../src/Assets/Noses/NosesImp1.sol";
import "../src/Assets/Noses/NosesImp2.sol";
import "../src/Assets/Noses/NosesImp3.sol";
import "../src/Assets/Noses/NosesImp4.sol";

import "../src/Assets/Tubes/TubesImp1.sol";

import "../src/Assets/Apparatus/ApparatusImp1.sol";
import "../src/Assets/Apparatus/ApparatusImp2.sol";
import "../src/Assets/Apparatus/ApparatusImp3.sol";
import "../src/Assets/Apparatus/ApparatusImp4.sol";
import "../src/Assets/Apparatus/ApparatusImp5.sol";
import "../src/Assets/Apparatus/ApparatusImp6.sol";

import "../src/Assets/Activation/ActivationImp1.sol";

import "../src/Assets/Character/CharacterImp1.sol";
import "../src/Assets/Character/CharacterImp2.sol";
import "../src/Assets/Character/CharacterImp3.sol";
import "../src/Assets/Character/CharacterImp4.sol";
import "../src/Assets/Character/CharacterImp5.sol";

import "../src/Assets/TraitBase.sol";
import "../src/AssetRetriever.sol";

contract CliffordTest is Test {

  uint internal constant MINT_SIZE = 2000;
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
  TraitBase public nosesTB;
  TraitBase public tubesTB;
  TraitBase public apparatusTB;
  TraitBase public cellsTB;
  TraitBase public miscTB;
  TraitBase public activationTB;
  TraitBase public characterTB;

  AssetRetriever public assetRetriever;

  // Machines
  Altar public altar;
  Drills public drills;
  Noses public noses;
  Apparatus public apparatus;
  Cells public cells;

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
    FeedbackImp2 feedbackImp2 = new FeedbackImp2();
    address[] memory feedbackImpsAds = new address[](2);
    feedbackImpsAds[0] = address(feedbackImp1);
    feedbackImpsAds[1] = address(feedbackImp2);
    feedbackTB = new TraitBase(feedbackImpsAds);
  }

  // Eyes
  function deployEyes() internal {
    EyesImp1 eyesImp1 = new EyesImp1();
    EyesImp2 eyesImp2 = new EyesImp2();
    address[] memory eyesImpsAds = new address[](2);
    eyesImpsAds[0] = address(eyesImp1);
    eyesImpsAds[1] = address(eyesImp2);
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

  // Noses
  function deployNoses() internal {
    NosesImp1 nosesImp1 = new NosesImp1();
    NosesImp2 nosesImp2 = new NosesImp2();
    NosesImp3 nosesImp3 = new NosesImp3();
    NosesImp4 nosesImp4 = new NosesImp4();
    address[] memory nosesImpsAds = new address[](4);
    nosesImpsAds[0] = address(nosesImp1);
    nosesImpsAds[1] = address(nosesImp2);
    nosesImpsAds[2] = address(nosesImp3);
    nosesImpsAds[3] = address(nosesImp4);
    nosesTB = new TraitBase(nosesImpsAds);
  }

  // Tubes
  function deployTubes() internal {
    TubesImp1 tubesImp1 = new TubesImp1();
    address[] memory tubesImpsAds = new address[](1);
    tubesImpsAds[0] = address(tubesImp1);
    tubesTB = new TraitBase(tubesImpsAds);
  }

  // Apparatus
  function deployApparatus() internal {
    ApparatusImp1 apparatusImp1 = new ApparatusImp1();
    ApparatusImp2 apparatusImp2 = new ApparatusImp2();
    ApparatusImp3 apparatusImp3 = new ApparatusImp3();
    ApparatusImp4 apparatusImp4 = new ApparatusImp4();
    ApparatusImp5 apparatusImp5 = new ApparatusImp5();
    ApparatusImp6 apparatusImp6 = new ApparatusImp6();
    address[] memory apparatusImpsAds = new address[](6);
    apparatusImpsAds[0] = address(apparatusImp1);
    apparatusImpsAds[1] = address(apparatusImp2);
    apparatusImpsAds[2] = address(apparatusImp3);
    apparatusImpsAds[3] = address(apparatusImp4);
    apparatusImpsAds[4] = address(apparatusImp5);
    apparatusImpsAds[5] = address(apparatusImp6);
    apparatusTB = new TraitBase(apparatusImpsAds);
  }

  // Cells
  function deployCells() internal {
    CellsImp1 cellsImp1 = new CellsImp1();
    CellsImp2 cellsImp2 = new CellsImp2();
    CellsImp3 cellsImp3 = new CellsImp3();
    CellsImp4 cellsImp4 = new CellsImp4();
    CellsImp5 cellsImp5 = new CellsImp5();
    CellsImp6 cellsImp6 = new CellsImp6();
    CellsImp7 cellsImp7 = new CellsImp7();
    address[] memory cellsImpsAds = new address[](7);
    cellsImpsAds[0] = address(cellsImp1);
    cellsImpsAds[1] = address(cellsImp2);
    cellsImpsAds[2] = address(cellsImp3);
    cellsImpsAds[3] = address(cellsImp4);
    cellsImpsAds[4] = address(cellsImp5);
    cellsImpsAds[5] = address(cellsImp6);
    cellsImpsAds[6] = address(cellsImp7);
    cellsTB = new TraitBase(cellsImpsAds);
  }

  // Misc
  function deployMisc() internal {
    MiscImp1 miscImp1 = new MiscImp1();
    address[] memory miscImpsAds = new address[](1);
    miscImpsAds[0] = address(miscImp1);
    miscTB = new TraitBase(miscImpsAds);
  }

  // Activation
  function deployActivation() internal {
    ActivationImp1 activationImp1 = new ActivationImp1();
    address[] memory activationImpsAds = new address[](1);
    activationImpsAds[0] = address(activationImp1);
    activationTB = new TraitBase(activationImpsAds);
  }

  // Character
  function deployCharacter() internal {
    CharacterImp1 characterImp1 = new CharacterImp1();
    CharacterImp2 characterImp2 = new CharacterImp2();
    CharacterImp3 characterImp3 = new CharacterImp3();
    CharacterImp4 characterImp4 = new CharacterImp4();
    CharacterImp5 characterImp5 = new CharacterImp5();
    address[] memory characterImpsAds = new address[](5);
    characterImpsAds[0] = address(characterImp1);
    characterImpsAds[1] = address(characterImp2);
    characterImpsAds[2] = address(characterImp3);
    characterImpsAds[3] = address(characterImp4);
    characterImpsAds[4] = address(characterImp5);
    characterTB = new TraitBase(characterImpsAds);
  }

  function deployAssetRetriever() internal {
    address[] memory traitBases = new address[](14);
    traitBases[0] = address(substancesTB);
    traitBases[1] = address(feedbackTB);
    traitBases[2] = address(eyesTB);
    traitBases[3] = address(assetsTB);
    traitBases[4] = address(propsTB);
    traitBases[5] = address(altarTB);
    traitBases[6] = address(drillsTB);
    traitBases[7] = address(nosesTB);
    traitBases[8] = address(tubesTB);
    traitBases[9] = address(apparatusTB);
    traitBases[10] = address(cellsTB);
    traitBases[11] = address(miscTB);
    traitBases[12] = address(activationTB);
    traitBases[13] = address(characterTB);
    assetRetriever = new AssetRetriever(traitBases); // Add the address of each TraitBase
  }

  // deploy machines
  function deployMachines() internal {
    altar = new Altar(address(assetRetriever));
    drills = new Drills(address(assetRetriever));
    noses = new Noses(address(assetRetriever));
    apparatus = new Apparatus(address(assetRetriever));
    cells = new Cells(address(assetRetriever));
  }

  // deploy logic
  function deployLogic() internal {
    globalSVG = new GlobalSVG();
    machine = new Machine([address(altar), address(drills), address(noses), address(apparatus), address(cells)], assetRetriever);
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
    deployNoses();
    deployTubes();
    deployApparatus();
    deployCells();
    deployMisc();
    deployActivation();
    deployCharacter();
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
      vm.roll(i*99);
      vm.warp(i*99);
      clifford.reveal();
    }
  }

  function writeImagesInRange(uint start, uint stop) public {
    for (uint i = start; i < stop; i++) {
      string memory path = string.concat("images/", Strings.toString(i), ".svg");
      int baseline = metadata.getBaselineRarity(clifford.getSeed(i));
      vm.writeFile(path, metadata.composeOnlyImage(clifford.getSeed(i), baseline));
      console.log("wrote image ", i);
    }
  }

  // test writing X images to a file
  function testWriteImages() public {
    // Memory leak causes wsl to crash for me with 1000 images
    // https://github.com/ethereum/solidity/issues/13885

    writeImagesInRange(0, MINT_SIZE/100);
    writeImagesInRange(MINT_SIZE/100, 2*MINT_SIZE/100);
    writeImagesInRange(2*MINT_SIZE/100, 3*MINT_SIZE/100);
    writeImagesInRange(3*MINT_SIZE/100, 4*MINT_SIZE/100);
    writeImagesInRange(4*MINT_SIZE/100, 5*MINT_SIZE/100);
    writeImagesInRange(5*MINT_SIZE/100, 6*MINT_SIZE/100);
    writeImagesInRange(6*MINT_SIZE/100, 7*MINT_SIZE/100);
    writeImagesInRange(7*MINT_SIZE/100, 8*MINT_SIZE/100);
    writeImagesInRange(8*MINT_SIZE/100, 9*MINT_SIZE/100);
    writeImagesInRange(9*MINT_SIZE/100, 10*MINT_SIZE/100);
    writeImagesInRange(10*MINT_SIZE/100, 11*MINT_SIZE/100);
    writeImagesInRange(11*MINT_SIZE/100, 12*MINT_SIZE/100);
    writeImagesInRange(12*MINT_SIZE/100, 13*MINT_SIZE/100);
    writeImagesInRange(13*MINT_SIZE/100, 14*MINT_SIZE/100);
    writeImagesInRange(14*MINT_SIZE/100, 15*MINT_SIZE/100);
    writeImagesInRange(15*MINT_SIZE/100, 16*MINT_SIZE/100);
    writeImagesInRange(16*MINT_SIZE/100, 17*MINT_SIZE/100);
    writeImagesInRange(17*MINT_SIZE/100, 18*MINT_SIZE/100);
    writeImagesInRange(18*MINT_SIZE/100, 19*MINT_SIZE/100);
    writeImagesInRange(19*MINT_SIZE/100, 20*MINT_SIZE/100);
    writeImagesInRange(20*MINT_SIZE/100, 21*MINT_SIZE/100);
    writeImagesInRange(21*MINT_SIZE/100, 22*MINT_SIZE/100);
    writeImagesInRange(22*MINT_SIZE/100, 23*MINT_SIZE/100);
    writeImagesInRange(23*MINT_SIZE/100, 24*MINT_SIZE/100);
    writeImagesInRange(24*MINT_SIZE/100, 25*MINT_SIZE/100);
    writeImagesInRange(25*MINT_SIZE/100, 26*MINT_SIZE/100);
    writeImagesInRange(26*MINT_SIZE/100, 27*MINT_SIZE/100);
    writeImagesInRange(27*MINT_SIZE/100, 28*MINT_SIZE/100);
    writeImagesInRange(28*MINT_SIZE/100, 29*MINT_SIZE/100);
    writeImagesInRange(29*MINT_SIZE/100, 30*MINT_SIZE/100);
    writeImagesInRange(30*MINT_SIZE/100, 31*MINT_SIZE/100);
    writeImagesInRange(31*MINT_SIZE/100, 32*MINT_SIZE/100);
    writeImagesInRange(32*MINT_SIZE/100, 33*MINT_SIZE/100);
    writeImagesInRange(33*MINT_SIZE/100, 34*MINT_SIZE/100);
    writeImagesInRange(34*MINT_SIZE/100, 35*MINT_SIZE/100);
    writeImagesInRange(35*MINT_SIZE/100, 36*MINT_SIZE/100);
    writeImagesInRange(36*MINT_SIZE/100, 37*MINT_SIZE/100);
    writeImagesInRange(37*MINT_SIZE/100, 38*MINT_SIZE/100);
    writeImagesInRange(38*MINT_SIZE/100, 39*MINT_SIZE/100);
    writeImagesInRange(39*MINT_SIZE/100, 40*MINT_SIZE/100);
    writeImagesInRange(40*MINT_SIZE/100, 41*MINT_SIZE/100);
    writeImagesInRange(41*MINT_SIZE/100, 42*MINT_SIZE/100);
    writeImagesInRange(42*MINT_SIZE/100, 43*MINT_SIZE/100);
    writeImagesInRange(43*MINT_SIZE/100, 44*MINT_SIZE/100);
    writeImagesInRange(44*MINT_SIZE/100, 45*MINT_SIZE/100);
    writeImagesInRange(45*MINT_SIZE/100, 46*MINT_SIZE/100);
    writeImagesInRange(46*MINT_SIZE/100, 47*MINT_SIZE/100);
    writeImagesInRange(47*MINT_SIZE/100, 48*MINT_SIZE/100);
    writeImagesInRange(48*MINT_SIZE/100, 49*MINT_SIZE/100);
    writeImagesInRange(49*MINT_SIZE/100, 50*MINT_SIZE/100);
    writeImagesInRange(50*MINT_SIZE/100, 51*MINT_SIZE/100);
    writeImagesInRange(51*MINT_SIZE/100, 52*MINT_SIZE/100);
    writeImagesInRange(52*MINT_SIZE/100, 53*MINT_SIZE/100);
    writeImagesInRange(53*MINT_SIZE/100, 54*MINT_SIZE/100);
    writeImagesInRange(54*MINT_SIZE/100, 55*MINT_SIZE/100);
    writeImagesInRange(55*MINT_SIZE/100, 56*MINT_SIZE/100);
    writeImagesInRange(56*MINT_SIZE/100, 57*MINT_SIZE/100);
    writeImagesInRange(57*MINT_SIZE/100, 58*MINT_SIZE/100);
    writeImagesInRange(58*MINT_SIZE/100, 59*MINT_SIZE/100);
    writeImagesInRange(59*MINT_SIZE/100, 60*MINT_SIZE/100);
    writeImagesInRange(60*MINT_SIZE/100, 61*MINT_SIZE/100);
    writeImagesInRange(61*MINT_SIZE/100, 62*MINT_SIZE/100);
    writeImagesInRange(62*MINT_SIZE/100, 63*MINT_SIZE/100);
    writeImagesInRange(63*MINT_SIZE/100, 64*MINT_SIZE/100);
    writeImagesInRange(64*MINT_SIZE/100, 65*MINT_SIZE/100);
    writeImagesInRange(65*MINT_SIZE/100, 66*MINT_SIZE/100);
    writeImagesInRange(66*MINT_SIZE/100, 67*MINT_SIZE/100);
    writeImagesInRange(67*MINT_SIZE/100, 68*MINT_SIZE/100);
    writeImagesInRange(68*MINT_SIZE/100, 69*MINT_SIZE/100);
    writeImagesInRange(69*MINT_SIZE/100, 70*MINT_SIZE/100);
    writeImagesInRange(70*MINT_SIZE/100, 71*MINT_SIZE/100);
    writeImagesInRange(71*MINT_SIZE/100, 72*MINT_SIZE/100);
    writeImagesInRange(72*MINT_SIZE/100, 73*MINT_SIZE/100);
    writeImagesInRange(73*MINT_SIZE/100, 74*MINT_SIZE/100);
    writeImagesInRange(74*MINT_SIZE/100, 75*MINT_SIZE/100);
    writeImagesInRange(75*MINT_SIZE/100, 76*MINT_SIZE/100);
    writeImagesInRange(76*MINT_SIZE/100, 77*MINT_SIZE/100);
    writeImagesInRange(77*MINT_SIZE/100, 78*MINT_SIZE/100);
    writeImagesInRange(78*MINT_SIZE/100, 79*MINT_SIZE/100);
    writeImagesInRange(79*MINT_SIZE/100, 80*MINT_SIZE/100);
    writeImagesInRange(80*MINT_SIZE/100, 81*MINT_SIZE/100);
    writeImagesInRange(81*MINT_SIZE/100, 82*MINT_SIZE/100);
    writeImagesInRange(82*MINT_SIZE/100, 83*MINT_SIZE/100);
    writeImagesInRange(83*MINT_SIZE/100, 84*MINT_SIZE/100);
    writeImagesInRange(84*MINT_SIZE/100, 85*MINT_SIZE/100);
    writeImagesInRange(85*MINT_SIZE/100, 86*MINT_SIZE/100);
    writeImagesInRange(86*MINT_SIZE/100, 87*MINT_SIZE/100);
    writeImagesInRange(87*MINT_SIZE/100, 88*MINT_SIZE/100);
    writeImagesInRange(88*MINT_SIZE/100, 89*MINT_SIZE/100);
    writeImagesInRange(89*MINT_SIZE/100, 90*MINT_SIZE/100);
    writeImagesInRange(90*MINT_SIZE/100, 91*MINT_SIZE/100);
    writeImagesInRange(91*MINT_SIZE/100, 92*MINT_SIZE/100);
    writeImagesInRange(92*MINT_SIZE/100, 93*MINT_SIZE/100);
    writeImagesInRange(93*MINT_SIZE/100, 94*MINT_SIZE/100);
    writeImagesInRange(94*MINT_SIZE/100, 95*MINT_SIZE/100);
    writeImagesInRange(95*MINT_SIZE/100, 96*MINT_SIZE/100);
    writeImagesInRange(96*MINT_SIZE/100, 97*MINT_SIZE/100);
    writeImagesInRange(97*MINT_SIZE/100, 98*MINT_SIZE/100);
    writeImagesInRange(98*MINT_SIZE/100, 99*MINT_SIZE/100);
    writeImagesInRange(99*MINT_SIZE/100, MINT_SIZE);

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

      int baseline = metadata.getBaselineRarity(clifford.getSeed(i));

      uint state = metadata.getState(baseline);

      string memory productivityValue = Strings.toString(machine.getProductivityValue(metadata.getMachine(clifford.getSeed(i)), clifford.getSeed(i), baseline));

      string memory globalAsset = machine.getGlobalAssetName(clifford.getSeed(i), baseline);

      string memory expansionProp = machine.getExpansionPropName(clifford.getSeed(i), baseline);

      string memory colour = metadata.getColourIndexTier(clifford.getSeed(i), baseline);

      string memory item = string.concat(
        itemOpen, 
        id, 
        ",\n    \"RandomNumber\": \"", 
        Strings.toString(clifford.getSeed(i)), // random number
        "\",\n    \"State\": \"",
        allStates[state], 
        "\""
      );

      item = string.concat(
        item, 
        ",\n    \"Machine\": \"",
        metadata.getMachine(clifford.getSeed(i)), // machine name
        "\""
        ",\n    \"Productivity\": \"",
        metadata.getProductivity(clifford.getSeed(i), baseline), // productivity
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
        colour
      );

      item = string.concat(
        item, 
        "\",\n    \"Character\": \"",
        machine.getCharacterName(clifford.getSeed(i), baseline),
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

      int baseline = metadata.getBaselineRarity(clifford.getSeed(i));

      uint state = metadata.getState(baseline);

      string memory machineName = metadata.getMachine(clifford.getSeed(i));

      string memory productivity = metadata.getProductivity(clifford.getSeed(i), baseline);

      string memory globalAsset = machine.getGlobalAssetName(clifford.getSeed(i), baseline);

      string memory expansionProp = machine.getExpansionPropName(clifford.getSeed(i), baseline);

      string memory colour = metadata.getColourIndexTier(clifford.getSeed(i), baseline);

      string memory item = string.concat(
        itemOpen, 
        allStates[state], 
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

  // Used to test Halmos symbolic execution
  function testHalmos(uint96 price, uint32 quantity) public pure {
    unchecked {
      uint128 total = uint120(price) * quantity; // buggy type casting: uint120 vs uint128
      assert(quantity == 0 || total >= price);
    }
  }

}
