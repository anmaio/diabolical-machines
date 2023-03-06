// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import "forge-std/Script.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "../src/Clifford.sol";
import "../src/Metadata.sol";
import "../src/Machine.sol";
import "../src/GlobalSVG.sol";

import "../src/machines/altar/Altar.sol";
import "../src/machines/beast/Beast.sol";
import "../src/machines/drills/Drills.sol";
import "../src/machines/noses/Noses.sol";
import "../src/machines/tubes/Tubes.sol";
import "../src/machines/conveyorbelt/Conveyorbelt.sol";

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

import "../src/Assets/Activation/ActivationImp1.sol";

import "../src/Assets/Character/CharacterImp1.sol";
import "../src/Assets/Character/CharacterImp2.sol";
import "../src/Assets/Character/CharacterImp3.sol";
import "../src/Assets/Character/CharacterImp4.sol";
import "../src/Assets/Character/CharacterImp5.sol";


import "../src/Assets/TraitBase.sol";
import "../src/AssetRetriever.sol";
import "../src/Noise.sol";

contract CliffordScript is Script {
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
  Noise public noise;

  // Machines
  Altar public altar;
  // Beast public beast;
  Drills public drills;
  Noses public noses;
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
    address[] memory apparatusImpsAds = new address[](1);
    apparatusImpsAds[0] = address(apparatusImp1);
    apparatusTB = new TraitBase(apparatusImpsAds);
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

  function deployNoise() internal {
    noise = new Noise();
  }

  // deploy machines
  function deployMachines() internal {
    altar = new Altar(address(assetRetriever), address(noise));
    drills = new Drills(address(assetRetriever), address(noise));
    // beast = new Beast();
    noses = new Noses(address(assetRetriever), address(noise));
    // tubes = new Tubes();
    // conveyorbelt = new Conveyorbelt();
  }

  // deploy logic
  function deployLogic() internal {
    globalSVG = new GlobalSVG();
    machine = new Machine([address(altar), address(drills), address(noses)], assetRetriever);
    metadata = new Metadata(machine, globalSVG, noise);
    clifford = new Clifford(metadata);
  }

  function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    vm.startBroadcast(deployerPrivateKey);

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
    deployNoise();
    deployMachines();
    deployLogic();

    address to = 0xB2a61F4dE7d8C1985cb5565CFCBD7F1A18CBF123;
    clifford.publicMint(to, 10);

    vm.stopBroadcast();
  }
}
