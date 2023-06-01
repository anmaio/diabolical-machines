// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import "forge-std/Script.sol";
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
import "../src/machines/tubes/Tubes.sol";
import "../src/machines/beast/Beast.sol";
import "../src/machines/conveyorBelt/ConveyorBelt.sol";

import "../src/Assets/Altar/AltarImp1.sol";
import "../src/Assets/Altar/AltarImp2.sol";
import "../src/Assets/Altar/AltarImp3.sol";

import "../src/Assets/Substances/SubstancesImp1.sol";

import "../src/Assets/Eyes/EyesImp1.sol";
import "../src/Assets/Eyes/EyesImp2.sol";
import "../src/Assets/Eyes/EyesImp3.sol";
import "../src/Assets/Eyes/EyesImp4.sol";

import "../src/Assets/Feedback/FeedbackImp1.sol";
import "../src/Assets/Feedback/FeedbackImp2.sol";

import "../src/Assets/Assets/AssetsImp1.sol";
import "../src/Assets/Assets/AssetsImp2.sol";
import "../src/Assets/Assets/AssetsImp3.sol";
import "../src/Assets/Assets/AssetsImp4.sol";
import "../src/Assets/Assets/AssetsImp5.sol";
import "../src/Assets/Assets/AssetsImp6.sol";
import "../src/Assets/Assets/AssetsImp7.sol";
import "../src/Assets/Assets/AssetsImp8.sol";
import "../src/Assets/Assets/AssetsImp9.sol";
import "../src/Assets/Assets/AssetsImp10.sol";

import "../src/Assets/Misc/MiscImp1.sol";

import "../src/Assets/Props/PropsImp1.sol";
import "../src/Assets/Props/PropsImp2.sol";

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
import "../src/Assets/Tubes/TubesImp2.sol";
import "../src/Assets/Tubes/TubesImp3.sol";
import "../src/Assets/Tubes/TubesImp4.sol";
import "../src/Assets/Tubes/TubesImp5.sol";

import "../src/Assets/Apparatus/ApparatusImp1.sol";
import "../src/Assets/Apparatus/ApparatusImp2.sol";
import "../src/Assets/Apparatus/ApparatusImp3.sol";
import "../src/Assets/Apparatus/ApparatusImp4.sol";
import "../src/Assets/Apparatus/ApparatusImp5.sol";
import "../src/Assets/Apparatus/ApparatusImp6.sol";

import "../src/Assets/Beast/BeastImp1.sol";
import "../src/Assets/Beast/BeastImp2.sol";
import "../src/Assets/Beast/BeastImp3.sol";
import "../src/Assets/Beast/BeastImp4.sol";
import "../src/Assets/Beast/BeastImp5.sol";
import "../src/Assets/Beast/BeastImp6.sol";
import "../src/Assets/Beast/BeastImp7.sol";
import "../src/Assets/Beast/BeastImp8.sol";
import "../src/Assets/Beast/BeastImp9.sol";
import "../src/Assets/Beast/BeastImp10.sol";

import "../src/Assets/Conveyor/ConveyorImp1.sol";
import "../src/Assets/Conveyor/ConveyorImp2.sol";
import "../src/Assets/Conveyor/ConveyorImp3.sol";
import "../src/Assets/Conveyor/ConveyorImp4.sol";
import "../src/Assets/Conveyor/ConveyorImp5.sol";
import "../src/Assets/Conveyor/ConveyorImp6.sol";
import "../src/Assets/Conveyor/ConveyorImp7.sol";
import "../src/Assets/Conveyor/ConveyorImp8.sol";
import "../src/Assets/Conveyor/ConveyorImp9.sol";
import "../src/Assets/Conveyor/ConveyorImp10.sol";

import "../src/Assets/Activation/ActivationImp1.sol";

import "../src/Assets/Character/CharacterImp1.sol";
import "../src/Assets/Character/CharacterImp2.sol";
import "../src/Assets/Character/CharacterImp3.sol";
import "../src/Assets/Character/CharacterImp4.sol";
import "../src/Assets/Character/CharacterImp5.sol";

import "../src/libraryDeployments/Deployment1.sol";
import "../src/libraryDeployments/Deployment2.sol";
import "../src/libraryDeployments/Deployment3.sol";
import "../src/libraryDeployments/Deployment4.sol";
import "../src/libraryDeployments/Deployment5.sol";
import "../src/libraryDeployments/Deployment6.sol";
import "../src/libraryDeployments/Deployment7.sol";
import "../src/libraryDeployments/Deployment8.sol";
import "../src/libraryDeployments/Deployment9.sol";
import "../src/libraryDeployments/Deployment10.sol";
import "../src/libraryDeployments/Deployment11.sol";
import "../src/libraryDeployments/Deployment12.sol";
import "../src/libraryDeployments/Deployment13.sol";

import "../src/TraitBase.sol";
import "../src/AssetRetriever.sol";

contract CliffordScript is Script {
  // Trait bases
  TraitBase private substancesTB;
  TraitBase private feedbackTB;
  TraitBase private eyesTB;
  TraitBase private assetsTB;
  TraitBase private propsTB;
  TraitBase private altarTB;
  // TraitBase private drillsTB;
  // TraitBase private nosesTB;
  TraitBase private tubesTB;
  TraitBase private apparatusTB;
  TraitBase private cellsTB;
  TraitBase private beastTB;
  TraitBase private conveyorTB;
  TraitBase private miscTB;
  TraitBase private activationTB;
  TraitBase private characterTB;

  AssetRetriever private assetRetriever;

  // Library deployments
  Deployment1 private deployment1;
  Deployment2 private deployment2;
  Deployment3 private deployment3;
  Deployment4 private deployment4;
  Deployment5 private deployment5;
  Deployment6 private deployment6;
  Deployment7 private deployment7;
  Deployment8 private deployment8;
  Deployment9 private deployment9;
  Deployment10 private deployment10;
  Deployment11 private deployment11;
  Deployment12 private deployment12;
  Deployment13 private deployment13;

  // Machines
  Altar private altar;
  // Drills private drills;
  // Noses private noses;
  Apparatus private apparatus;
  Cells private cells;
  Tubes private tubes;
  Beast private beast;
  ConveyorBelt private conveyorBelt;

  Machine private machine;
  Metadata private metadata;
  Clifford private clifford;
  GlobalSVG private globalSVG;

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
    EyesImp3 eyesImp3 = new EyesImp3();
    EyesImp4 eyesImp4 = new EyesImp4();
    address[] memory eyesImpsAds = new address[](4);
    eyesImpsAds[0] = address(eyesImp1);
    eyesImpsAds[1] = address(eyesImp2);
    eyesImpsAds[2] = address(eyesImp3);
    eyesImpsAds[3] = address(eyesImp4);
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
    AssetsImp7 assetsImp7 = new AssetsImp7();
    AssetsImp8 assetsImp8 = new AssetsImp8();
    AssetsImp9 assetsImp9 = new AssetsImp9();
    AssetsImp10 assetsImp10 = new AssetsImp10();
    address[] memory assetsImpsAds = new address[](10);
    assetsImpsAds[0] = address(assetsImp1);
    assetsImpsAds[1] = address(assetsImp2);
    assetsImpsAds[2] = address(assetsImp3);
    assetsImpsAds[3] = address(assetsImp4);
    assetsImpsAds[4] = address(assetsImp5);
    assetsImpsAds[5] = address(assetsImp6);
    assetsImpsAds[6] = address(assetsImp7);
    assetsImpsAds[7] = address(assetsImp8);
    assetsImpsAds[8] = address(assetsImp9);
    assetsImpsAds[9] = address(assetsImp10);
    assetsTB = new TraitBase(assetsImpsAds);
  }

  // Props
  function deployProps() internal {
    PropsImp1 propsImp1 = new PropsImp1();
    PropsImp2 propsImp2 = new PropsImp2();
    address[] memory propsImpsAds = new address[](2);
    propsImpsAds[0] = address(propsImp1);
    propsImpsAds[1] = address(propsImp2);
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

  // Tubes
  function deployTubes() internal {
    TubesImp1 tubesImp1 = new TubesImp1();
    TubesImp2 tubesImp2 = new TubesImp2();
    TubesImp3 tubesImp3 = new TubesImp3();
    TubesImp4 tubesImp4 = new TubesImp4();
    TubesImp5 tubesImp5 = new TubesImp5();
    address[] memory tubesImpsAds = new address[](5);
    tubesImpsAds[0] = address(tubesImp1);
    tubesImpsAds[1] = address(tubesImp2);
    tubesImpsAds[2] = address(tubesImp3);
    tubesImpsAds[3] = address(tubesImp4);
    tubesImpsAds[4] = address(tubesImp5);
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

  // Beast
  function deployBeast() internal {
    BeastImp1 beastImp1 = new BeastImp1();
    BeastImp2 beastImp2 = new BeastImp2();
    BeastImp3 beastImp3 = new BeastImp3();
    BeastImp4 beastImp4 = new BeastImp4();
    BeastImp5 beastImp5 = new BeastImp5();
    BeastImp6 beastImp6 = new BeastImp6();
    BeastImp7 beastImp7 = new BeastImp7();
    BeastImp8 beastImp8 = new BeastImp8();
    BeastImp9 beastImp9 = new BeastImp9();
    BeastImp10 beastImp10 = new BeastImp10();
    address[] memory beastImpsAds = new address[](10);
    beastImpsAds[0] = address(beastImp1);
    beastImpsAds[1] = address(beastImp2);
    beastImpsAds[2] = address(beastImp3);
    beastImpsAds[3] = address(beastImp4);
    beastImpsAds[4] = address(beastImp5);
    beastImpsAds[5] = address(beastImp6);
    beastImpsAds[6] = address(beastImp7);
    beastImpsAds[7] = address(beastImp8);
    beastImpsAds[8] = address(beastImp9);
    beastImpsAds[9] = address(beastImp10);
    beastTB = new TraitBase(beastImpsAds);
  }

  // Conveyor
  function deployConveyor() internal {
    ConveyorImp1 conveyorImp1 = new ConveyorImp1();
    ConveyorImp2 conveyorImp2 = new ConveyorImp2();
    ConveyorImp3 conveyorImp3 = new ConveyorImp3();
    ConveyorImp4 conveyorImp4 = new ConveyorImp4();
    ConveyorImp5 conveyorImp5 = new ConveyorImp5();
    ConveyorImp6 conveyorImp6 = new ConveyorImp6();
    ConveyorImp7 conveyorImp7 = new ConveyorImp7();
    ConveyorImp8 conveyorImp8 = new ConveyorImp8();
    ConveyorImp9 conveyorImp9 = new ConveyorImp9();
    ConveyorImp10 conveyorImp10 = new ConveyorImp10();
    address[] memory conveyorImpsAds = new address[](10);
    conveyorImpsAds[0] = address(conveyorImp1);
    conveyorImpsAds[1] = address(conveyorImp2);
    conveyorImpsAds[2] = address(conveyorImp3);
    conveyorImpsAds[3] = address(conveyorImp4);
    conveyorImpsAds[4] = address(conveyorImp5);
    conveyorImpsAds[5] = address(conveyorImp6);
    conveyorImpsAds[6] = address(conveyorImp7);
    conveyorImpsAds[7] = address(conveyorImp8);
    conveyorImpsAds[8] = address(conveyorImp9);
    conveyorImpsAds[9] = address(conveyorImp10);
    conveyorTB = new TraitBase(conveyorImpsAds);
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

  function deployAssetRetriever(TraitBase[] memory allTraitBases) internal {
    // Order of traitBases must match the order of TraitBases in AssetRetriever

    // Add the address of each TraitBase
    assetRetriever = new AssetRetriever(allTraitBases);
  }

  // deploy machines
  function deployMachines() internal {
    altar = new Altar(address(assetRetriever));
    // drills = new Drills(address(assetRetriever));
    // noses = new Noses(address(assetRetriever));
    apparatus = new Apparatus(address(assetRetriever));
    cells = new Cells(address(assetRetriever));
    tubes = new Tubes(address(assetRetriever));
    beast = new Beast(address(assetRetriever));
    conveyorBelt = new ConveyorBelt(address(assetRetriever));
  }

  // deploy logic
  function deployLogic() internal {
    globalSVG = new GlobalSVG([address(deployment1), address(deployment2), address(deployment3), address(deployment4), address(deployment5), address(deployment6), address(deployment7), address(deployment8), address(deployment9), address(deployment10), address(deployment11), address(deployment12), address(deployment13)]);
    machine = new Machine([address(altar), address(apparatus), address(cells), address(tubes), address(beast), address(conveyorBelt)], assetRetriever);
    metadata = new Metadata(machine, globalSVG);
  }

  function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    vm.startBroadcast(deployerPrivateKey);

    // Can be Done individually but MUST keep track of addresses
    // deploySubstances();
    // deployProps();
    // deployActivation();
    // deployFeedback();
    // deployEyes();
    // deployAssets();
    // deployAltar();
    // deployApparatus();
    // deployCells();
    // deployTubes();
    // deployBeast();
    // deployConveyor();
    // deployMisc();
    // deployCharacter();

    // // Global SVG styles, defs, pattterns, sound
    deployment1 = new Deployment1();
    deployment2 = new Deployment2();
    deployment3 = new Deployment3();
    deployment4 = new Deployment4();
    deployment5 = new Deployment5();
    deployment6 = new Deployment6();
    deployment7 = new Deployment7();
    deployment8 = new Deployment8();
    deployment9 = new Deployment9();
    deployment10 = new Deployment10();
    deployment11 = new Deployment11();
    deployment12 = new Deployment12();
    deployment13 = new Deployment13();

    // MUST be done in this specific order
    // substances, props, activation, feedback, eyes, assets, altar, apparatus, cells, tubes, beast, conveyor, misc, character

    // TraitBase[] memory traitBases = new TraitBase[](14);
    // traitBases[0] = substancesTB;
    // traitBases[1] = propsTB;
    // traitBases[2] = activationTB;
    // traitBases[3] = feedbackTB;
    // traitBases[4] = eyesTB;
    // traitBases[5] = assetsTB;
    // traitBases[6] = altarTB;
    // traitBases[7] = apparatusTB;
    // traitBases[8] = cellsTB;
    // traitBases[9] = tubesTB;
    // traitBases[10] = beastTB;
    // traitBases[11] = conveyorTB;
    // traitBases[12] = miscTB;
    // traitBases[13] = characterTB;

    // OR Manually add the addresses

    // TraitBase[] memory traitBases = new TraitBase[](14);
    // traitBases[0] = TraitBase(0x00); // substances
    // traitBases[1] = TraitBase(0x00); // props
    // traitBases[2] = TraitBase(0x00); // activation
    // traitBases[3] = TraitBase(0x00); // feedback
    // traitBases[4] = TraitBase(0x00); // eyes
    // traitBases[5] = TraitBase(0x00); // assets
    // traitBases[6] = TraitBase(0x00); // altar
    // traitBases[7] = TraitBase(0x00); // apparatus
    // traitBases[8] = TraitBase(0x00); // cells
    // traitBases[9] = TraitBase(0x00); // tubes
    // traitBases[10] = TraitBase(0x00); // beast
    // traitBases[11] = TraitBase(0x00); // conveyor
    // traitBases[12] = TraitBase(0x00); // misc
    // traitBases[13] = TraitBase(0x00); // character

    // Need to be deployed together

    // deployAssetRetriever(traitBases);
    // deployMachines();
    // deployLogic();

    // Must be last to deploy

    // clifford = new Clifford(metadata);

    vm.stopBroadcast();
  }

  // add this to be excluded from coverage report
  function test() public {}
}
