// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Script.sol";
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

contract CliffordScript is Script {
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
    machine = new Machine([address(conveyorbelt), address(drills), address(nose), address(beast), address(altar), address(tubes)]);
    metadata = new Metadata(machine, globalSVG);
    clifford = new Clifford(metadata);

    // machine.setAllWorkstations([address(conveyorbelt), address(drills), address(nose), address(beast), address(altar), address(tubes)]);
  }

  function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    vm.startBroadcast(deployerPrivateKey);

    // Can be Done individually
    deploySubstances();
    deployFeedback();
    deployEyes();
    deployAltar();
    deployAssetRetriever();
    deployMachines();
    deployLogic();

    address to = 0xB2a61F4dE7d8C1985cb5565CFCBD7F1A18CBF123;
    clifford.publicMint(to, 1);

    vm.stopBroadcast();
  }
}
