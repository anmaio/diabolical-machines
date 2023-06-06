// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import "forge-std/Test.sol";
import "solady/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
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

contract CliffordTest is Test {

  uint internal constant MINT_SIZE = 10;
  uint internal constant DEPLOYMENT_MINT_SIZE = 250;

  string[3] public allStates = ["Degraded", "Basic", "Embellished"];
  string public openJson = "[\n";

  address internal constant CYPHER_CONTRACT = 0xdDA32aabBBB6c44eFC567baC5F7C35f185338456;
  address internal constant TOP_CYPHER_HOLDER = 0x0aD0b792A54704dc7b6f85CBB774106d22E814d9;
  
  Metadata internal constant DEPLOYED_METADATA = Metadata(0x45e3FF727Ef1F96F4a929295A2B49570e3AE9E6d);

  uint private constant BID_INCREMENT = 0.01 ether;

  uint private constant AUCTION_LENGTH = 1 weeks;

  uint private constant BID_EXTENSION_LENGTH = 15 minutes;

  // CUSTOM ERRORS

  error InvalidTokenId(uint tokenId);
  error SeedNotSet(uint genId);
  error TransferFailed();

  error NotOwnerOfCypher(uint tokenId);
  error CypherAlreadyClaimed(uint tokenId);
	error CypherClaimNotActive();

  error CannotBidZero();
  error IncorrectBidIncrement(uint amount);
  error AuctionNotActive();
  error BidTooSmall(uint amount);
  error AuctionAlreadyStarted();
  error CypherClaimNotStarted();
  error CypherClaimNotEnded();
  error NftsAlreadyDistributed();

	error AuctionNotOver();
  error NftsNotAllMinted();
  error TransferNotSuccessful(address to);
  error NoBidToClaim(address to);
  error TooManyRequested();

  error MintZeroQuantity();

  // Trait bases
  TraitBase private substancesTB;
  TraitBase private feedbackTB;
  TraitBase private eyesTB;
  TraitBase private assetsTB;
  TraitBase private propsTB;
  TraitBase private altarTB;
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

  function setUp() public {

    // Can be Done individually
    deploySubstances();
    deployProps();
    deployActivation();
    deployFeedback();
    deployEyes();
    deployAssets();
    deployAltar();
    deployApparatus();
    deployCells();
    deployTubes();
    deployBeast();
    deployConveyor();
    deployMisc();
    deployCharacter();
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

    TraitBase[] memory traitBases = new TraitBase[](14);
    traitBases[0] = substancesTB;
    traitBases[1] = propsTB;
    traitBases[2] = activationTB;
    traitBases[3] = feedbackTB;
    traitBases[4] = eyesTB;
    traitBases[5] = assetsTB;
    traitBases[6] = altarTB;
    traitBases[7] = apparatusTB;
    traitBases[8] = cellsTB;
    traitBases[9] = tubesTB;
    traitBases[10] = beastTB;
    traitBases[11] = conveyorTB;
    traitBases[12] = miscTB;
    traitBases[13] = characterTB;

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

    deployAssetRetriever(traitBases);
    deployMachines();
    deployLogic();

    // Must be last to deploy

    clifford = new Clifford(metadata);

    // Testing only
    setupMint();
  }

  function setupMint() public {
    // address to = address(1337);

    // // ERC721A has the ability to mint multiple tokens at once
    // // Using single mints for now for convenience
    // for (uint256 i = 0; i < MINT_SIZE; i++) {
    //   // to, quantity
    //   clifford.publicMint(to, 1);
    //   vm.roll(i*99);
    //   vm.warp(i*99);
    //   clifford.reveal();
    // }
  }

  // 20 = 0.1ETH
  // 100 = 0.5ETH
  // 200 = 1ETH
  // 400 = 2ETH
  // 1000 = 5ETH

  function auctionSimulator(uint numOfBidders) public {
    // start the cypher claim period
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);

    // for numOfBidders create an address array with random addresses
    address[] memory bidders = new address[](numOfBidders);
    for (uint i = 0; i < numOfBidders; i++) {
      bidders[i] = address(uint160(uint(keccak256(abi.encodePacked(i)))));
    }

    // for each bidder
    for (uint i = 0; i < numOfBidders; i++) {
      // get the minimum bid value
      uint minBidValue = clifford.getMinimumBid();
      uint userBidAmount = (uint(keccak256(abi.encodePacked(bidders[i]))) % 200 + 1) * BID_INCREMENT;
      if (userBidAmount < minBidValue || i % 2 == 0) { // 50% chance to bid the minimum
        userBidAmount = minBidValue;
      }
      vm.deal(bidders[i], 100 ether);
      vm.prank(bidders[i], bidders[i]);
      clifford.placeBid{value: userBidAmount}();
    }

    uint ppu = clifford.getCurrentPricePerUnit();
    uint finalMinBid = clifford.getMinimumBid();
    uint preDistributionBalance = address(clifford).balance;

    // Get when the auction ends
    uint256 auctionEnd = clifford.getEndTimestamp();
    // Fast forward to the end of the auction
    vm.warp(auctionEnd + 15 minutes);

    console.log("GAS BEFORE DISTRIBUTION: ", gasleft());

    // clifford.distributeNFTs();
    for (uint i = 0; i < numOfBidders; i++) {
      vm.prank(bidders[i], bidders[i]);
      clifford.claimAfterAuction();
    }

    console.log("GAS AFTER DISTRIBUTION: ", gasleft());

    // get to when the claim period ends
    vm.warp(auctionEnd + 1 weeks);
    clifford.withdrawRemainingNFTs(6000 - clifford.totalSupply());

    console2.log("numOfBidders: ", numOfBidders);
    console2.log("current ppu: ", ppu);
    console2.log("current minimum bid: ", finalMinBid);
    console2.log("clifford balance before distribution: ", preDistributionBalance);
    console2.log("clifford balance after distribution: ", address(clifford).balance);
    console2.log("withdraw nfts amount: ", clifford.balanceOf(clifford.owner()));
  }

  function testAuctionSimulator() public {
    uint numOfBidders = 100;

    auctionSimulator(numOfBidders);
  }

  function preWriteImages() internal {
    // start the cypher claim period
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);
    // Get when the auction ends
    uint256 auctionEnd = clifford.getEndTimestamp();
    // Fast forward to the end of the auction
    vm.warp(auctionEnd + 1 weeks);
    // mint entire supply to dev
    clifford.withdrawRemainingNFTs(6000 - clifford.totalSupply());
    // reveal all
    clifford.reveal();
  }

  function writeImagesInRange(uint start, uint stop) public {
    preWriteImages();
    for (uint i = start; i < stop; i++) {
      string memory path = string.concat("images/", Strings.toString(i), ".svg");
      int baseline = metadata.getBaselineRarity(clifford.getSeed(i));
      vm.writeFile(path, metadata.composeOnlyImage(clifford.getSeed(i), baseline));
      console.log("wrote image ", i);
    }
  }

  // test writing X images to a file
  function testWriteImages1() public {
    // Memory leak causes wsl to crash for me with large amount of images
    // https://github.com/ethereum/solidity/issues/13885
    writeImagesInRange(0, MINT_SIZE/20);
  }

  function testWriteImages2() public {
    writeImagesInRange(MINT_SIZE/20, 2*MINT_SIZE/20);
  }

  function testWriteImages3() public {
    writeImagesInRange(2*MINT_SIZE/20, 3*MINT_SIZE/20);
  }

  function testWriteImages4() public {
    writeImagesInRange(3*MINT_SIZE/20, 4*MINT_SIZE/20);
  }

  function testWriteImages5() public {
    writeImagesInRange(4*MINT_SIZE/20, 5*MINT_SIZE/20);
  }

  function testWriteImages6() public {
    writeImagesInRange(5*MINT_SIZE/20, 6*MINT_SIZE/20);
  }

  function testWriteImages7() public {
    writeImagesInRange(6*MINT_SIZE/20, 7*MINT_SIZE/20);
  }

  function testWriteImages8() public {
    writeImagesInRange(7*MINT_SIZE/20, 8*MINT_SIZE/20);
  }

  function testWriteImages9() public {
    writeImagesInRange(8*MINT_SIZE/20, 9*MINT_SIZE/20);
  }

  function testWriteImages10() public {
    writeImagesInRange(9*MINT_SIZE/20, 10*MINT_SIZE/20);
  }

  function testWriteImages11() public {
    writeImagesInRange(10*MINT_SIZE/20, 11*MINT_SIZE/20);
  }

  function testWriteImages12() public {
    writeImagesInRange(11*MINT_SIZE/20, 12*MINT_SIZE/20);
  }

  function testWriteImages13() public {
    writeImagesInRange(12*MINT_SIZE/20, 13*MINT_SIZE/20);
  }

  function testWriteImages14() public {
    writeImagesInRange(13*MINT_SIZE/20, 14*MINT_SIZE/20);
  }

  function testWriteImages15() public {
    writeImagesInRange(14*MINT_SIZE/20, 15*MINT_SIZE/20);
  }

  function testWriteImages16() public {
    writeImagesInRange(15*MINT_SIZE/20, 16*MINT_SIZE/20);
  }

  function testWriteImages17() public {
    writeImagesInRange(16*MINT_SIZE/20, 17*MINT_SIZE/20);
  }

  function testWriteImages18() public {
    writeImagesInRange(17*MINT_SIZE/20, 18*MINT_SIZE/20);
  }

  function testWriteImages19() public {
    writeImagesInRange(18*MINT_SIZE/20, 19*MINT_SIZE/20);
  }

  function testWriteImages20() public {
    writeImagesInRange(19*MINT_SIZE/20, MINT_SIZE);
  }

  function writeImagesFromChain(uint start, uint stop) public {
    if (block.chainid != 1) {
      return;
    }
    for (uint i = start; i < stop; i++) {
      uint seed = uint256(keccak256(abi.encodePacked(i*i+9000, block.timestamp, block.number)));
      string memory path = string.concat("deploymentImages/", Strings.toString(i), ".svg");
      int baseline = int(seed % 256);
      string memory image = DEPLOYED_METADATA.composeOnlyImage(seed, baseline);
      vm.writeFile(path, image);
    }
  }

  function testWriteChain() public {
    // Memory leak causes wsl to crash for me with large amount of images
    // https://github.com/ethereum/solidity/issues/13885
    writeImagesFromChain(0, DEPLOYMENT_MINT_SIZE);
  }

  // create a json file with the ids of the images that were created

  function writeJson(uint start, uint stop) public {
    string memory output = "  ";
    string memory itemOpen = "{\n    \"id\": ";

    for (uint256 i = start; i < stop; i++) {
      string memory id = Strings.toString(i);
      string memory itemClose = "\n  },\n  ";

      int baseline = metadata.getBaselineRarity(clifford.getSeed(i));

      uint state = metadata.getState(baseline);

      string memory globalAsset = machine.getSmallAssetName(clifford.getSeed(i), baseline);

      string memory expansionProp = machine.getLargeAssetName(clifford.getSeed(i), baseline);

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
        metadata.getMachine(clifford.getSeed(i)) // machine name
      );

      item = string.concat(
        item, 
        "\",\n    \"Wall Out\": \"",
        machine.getWallOutName(clifford.getSeed(i), baseline),
        "\",\n    \"Wall Flat\": \"",
        machine.getWallFlatName(clifford.getSeed(i), baseline)
      );

      item = string.concat(
        item, 
        "\",\n    \"Small Asset\": \"",
        globalAsset,
        "\",\n    \"Large Asset\": \"",
        expansionProp,
        "\",\n    \"Colour\": \"",
        colour
      );

      item = string.concat(
        item,
        "\",\n    \"Pattern\": \"",
        Patterns.getPatternName(clifford.getSeed(i), baseline),
        "\",\n    \"Character\": \"",
        machine.getCharacterName(clifford.getSeed(i), baseline),
        "\"",
        itemClose
      );

      output = string.concat(output, item);
    }

    vm.writeLine("outputJson/ids.json", output);
  }

  function testTokenURI() public {
    preWriteImages();
    // get the result of the tokenURI function call for token 0
    string memory tokenURI = clifford.tokenURI(0);
    // save the result to a file
    vm.writeFile("outputJson/tokenURI.json", tokenURI);
  }

  function testPreWriteJson() public {
    vm.writeFile("outputJson/ids.json", openJson);
  }

  function testWriteJson01() public {
    preWriteImages();

    writeJson(0, MINT_SIZE/20);
  }

  function testWriteJson02() public {
    preWriteImages();

    writeJson(MINT_SIZE/20, 2*MINT_SIZE/20);
  }

  function testWriteJson03() public {
    preWriteImages();

    writeJson(2*MINT_SIZE/20, 3*MINT_SIZE/20);
  }

  function testWriteJson04() public {
    preWriteImages();

    writeJson(3*MINT_SIZE/20, 4*MINT_SIZE/20);
  }

  function testWriteJson05() public {
    preWriteImages();

    writeJson(4*MINT_SIZE/20, 5*MINT_SIZE/20);
  }

  function testWriteJson06() public {
    preWriteImages();

    writeJson(5*MINT_SIZE/20, 6*MINT_SIZE/20);
  }

  function testWriteJson07() public {
    preWriteImages();

    writeJson(6*MINT_SIZE/20, 7*MINT_SIZE/20);
  }

  function testWriteJson08() public {
    preWriteImages();

    writeJson(7*MINT_SIZE/20, 8*MINT_SIZE/20);
  }

  function testWriteJson09() public {
    preWriteImages();

    writeJson(8*MINT_SIZE/20, 9*MINT_SIZE/20);
  }

  function testWriteJson10() public {
    preWriteImages();

    writeJson(9*MINT_SIZE/20, 10*MINT_SIZE/20);
  }

  function testWriteJson11() public {
    preWriteImages();

    writeJson(10*MINT_SIZE/20, 11*MINT_SIZE/20);
  }

  function testWriteJson12() public {
    preWriteImages();

    writeJson(11*MINT_SIZE/20, 12*MINT_SIZE/20);
  }

  function testWriteJson13() public {
    preWriteImages();

    writeJson(12*MINT_SIZE/20, 13*MINT_SIZE/20);
  }

  function testWriteJson14() public {
    preWriteImages();

    writeJson(13*MINT_SIZE/20, 14*MINT_SIZE/20);
  }

  function testWriteJson15() public {
    preWriteImages();

    writeJson(14*MINT_SIZE/20, 15*MINT_SIZE/20);
  }

  function testWriteJson16() public {
    preWriteImages();

    writeJson(15*MINT_SIZE/20, 16*MINT_SIZE/20);
  }

  function testWriteJson17() public {
    preWriteImages();

    writeJson(16*MINT_SIZE/20, 17*MINT_SIZE/20);
  }

  function testWriteJson18() public {
    preWriteImages();

    writeJson(17*MINT_SIZE/20, 18*MINT_SIZE/20);
  }

  function testWriteJson19() public {
    preWriteImages();

    writeJson(18*MINT_SIZE/20, 19*MINT_SIZE/20);
  }

  function testWriteJson20() public {
    preWriteImages();

    writeJson(19*MINT_SIZE/20, MINT_SIZE);
  }

  // Simple tests to simulate the auction process

  function testInitialCypherClaimState() public {
    // Check if the state is correct
    assertEq(clifford.getStartTimestamp() , 0, "Cypher claim should not be started");
  }

  function testStartCypherClaim() public {
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();
    // Check if the state is correct
    assertFalse(clifford.getStartTimestamp() == 0, "Cypher claim should be started");
  }

  function testSingleCypherClaim() public {
    // Will only work with mainnet fork
    if (block.chainid != 1) {
      return;
    }
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();
    // Get the token id of a cypher we know that TOP_CYPHER_HOLDER owns
    uint256 cypherId = IERC721Enumerable(CYPHER_CONTRACT).tokenOfOwnerByIndex(TOP_CYPHER_HOLDER, 0);

    vm.prank(TOP_CYPHER_HOLDER);

    uint[] memory cypherIds = new uint[](1);
    cypherIds[0] = cypherId;

    // Claiming a single cypher
    clifford.claimCyphers(cypherIds);

    // user should now own one clifford NFT
    assertEq(clifford.balanceOf(TOP_CYPHER_HOLDER), 1, "User should own one clifford NFT");
    
  }

  function testMultipleCypherClaim(uint amount) public {
    // Will only work with mainnet fork
    if (block.chainid != 1) {
      return;
    }

    // Get the balance of the top cypher holder
    uint256 balance = IERC721Enumerable(CYPHER_CONTRACT).balanceOf(TOP_CYPHER_HOLDER);

    vm.assume(amount <= balance && amount > 0);
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();
    
    uint[] memory cypherIds = new uint[](amount);

    for (uint i = 0; i < amount; i++) {
      // Get the token id of a cypher we know that TOP_CYPHER_HOLDER owns
      cypherIds[i] = IERC721Enumerable(CYPHER_CONTRACT).tokenOfOwnerByIndex(TOP_CYPHER_HOLDER, i);
    }

    vm.prank(TOP_CYPHER_HOLDER);

    // Claiming multiple cyphers
    clifford.claimCyphers(cypherIds);

    // user should now own two clifford NFTs
    assertEq(clifford.balanceOf(TOP_CYPHER_HOLDER), amount, string.concat("User should own ", Strings.toString(amount), " clifford NFTs"));
  }

  // User claims against some of their cyphers then decides to claim against the rest
  function testSplitClaimCyphers(uint amount) public {
    // Will only work with mainnet fork
    if (block.chainid != 1) {
      return;
    }

    // Get the balance of the top cypher holder
    uint256 balance = IERC721Enumerable(CYPHER_CONTRACT).balanceOf(TOP_CYPHER_HOLDER);

    // must own at least 2 cyphers
    vm.assume(amount <= balance && amount > 1);
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();

    uint claimOne = amount / 2;
    
    uint[] memory cypherIdsOne = new uint[](claimOne);
    uint[] memory cypherIdsTwo = new uint[](amount - claimOne);

    for (uint i = 0; i < claimOne; i++) {
      // Get the token id of a cypher we know that TOP_CYPHER_HOLDER owns
      cypherIdsOne[i] = IERC721Enumerable(CYPHER_CONTRACT).tokenOfOwnerByIndex(TOP_CYPHER_HOLDER, i);
    }

    for (uint i = claimOne; i < amount; i++) {
      // Get the token id of a cypher we know that TOP_CYPHER_HOLDER owns
      cypherIdsTwo[i - claimOne] = IERC721Enumerable(CYPHER_CONTRACT).tokenOfOwnerByIndex(TOP_CYPHER_HOLDER, i);
    }

    vm.startPrank(TOP_CYPHER_HOLDER);

    // claim one
    clifford.claimCyphers(cypherIdsOne);

    // claim two
    clifford.claimCyphers(cypherIdsTwo);

    vm.stopPrank();

    // user should now own amount clifford NFTs
    assertEq(clifford.balanceOf(TOP_CYPHER_HOLDER), amount, string.concat("User should own ", Strings.toString(amount), " clifford NFTs"));
  }

  // Test the auction process

  function testInitialAuctionState() public {
    // Check if the state is correct
    assertEq(clifford.getStartTimestamp() , 0, "Auction should not be started");
    assertEq(clifford.getEndTimestamp() , 0, "Auction should not be started");
  }

  function testStartAuction() public {
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);
    // Check if the state is correct
    assertEq(clifford.getStartTimestamp() , block.timestamp, "Auction should be started");
    assertEq(clifford.getEndTimestamp() , block.timestamp + AUCTION_LENGTH, "Auction should be started");
  }

  function testPlaceSingleBid() public {
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);
    // Placing a bid of 1 ETH
    vm.deal(TOP_CYPHER_HOLDER, 10 ether);
    vm.prank(TOP_CYPHER_HOLDER, TOP_CYPHER_HOLDER);
    clifford.placeBid{value: 1 ether}();
    // Check the value of our bids
    assertEq(clifford.getUserBid(TOP_CYPHER_HOLDER), 1 ether, "Bid should be 1 ETH");
  }

  function testPlaceMultipleBids() public {
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);
    // Placing a bid of 1 ETH
    vm.deal(TOP_CYPHER_HOLDER, 10 ether);
    vm.prank(TOP_CYPHER_HOLDER, TOP_CYPHER_HOLDER);
    clifford.placeBid{value: 1 ether}();
    // Placing a bid of 2 ETH
    vm.prank(TOP_CYPHER_HOLDER, TOP_CYPHER_HOLDER);
    clifford.placeBid{value: 2 ether}();
    // Check the value of our bids
    assertEq(clifford.getUserBid(TOP_CYPHER_HOLDER), 3 ether, "Bid should be 3 ETH");
  }

  function testAuctionExtension() public {
    // start the cypher claim period
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);
    // Get when the auction ends
    uint256 auctionEnd = clifford.getEndTimestamp();
    // Fast forward to just before the end of the auction
    vm.warp(auctionEnd - BID_EXTENSION_LENGTH / 2);
    // get the current block timestamp
    uint256 currentTimestamp = block.timestamp;
    // place a bid
    vm.deal(TOP_CYPHER_HOLDER, 10 ether);
    vm.prank(TOP_CYPHER_HOLDER, TOP_CYPHER_HOLDER);
    clifford.placeBid{value: 1 ether}();
    // check if the auction end was extended
    assertEq(clifford.getEndTimestamp(), currentTimestamp + BID_EXTENSION_LENGTH, "Auction should have been extended");
  }

  function testMultipleClaimsAfterAuction() public {
    uint numOfBidders = 100;

    auctionSimulator(numOfBidders);

    // this test starts after everyone has claimed so it should not be possible to claim again
    // try to claim again
    address bidder = address(uint160(uint(keccak256(abi.encodePacked(uint(0))))));

    // attempt to claim
    vm.prank(bidder, bidder);
    vm.expectRevert(abi.encodeWithSelector(NoBidToClaim.selector, bidder));
    clifford.claimAfterAuction();
  }

  function testClaimFromNonBidder() public {
    uint numOfBidders = 100;

    auctionSimulator(numOfBidders);

    // TOP_CYPHER_HOLDER should not be able to claim as they did not bid

    // attempt to claim
    vm.prank(TOP_CYPHER_HOLDER, TOP_CYPHER_HOLDER);
    vm.expectRevert(abi.encodeWithSelector(NoBidToClaim.selector, TOP_CYPHER_HOLDER));
    clifford.claimAfterAuction();
  }

  function testWithdrawRemainingNfts() public {
    // start the cypher claim period
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);
    // Get when the auction ends
    uint256 auctionEnd = clifford.getEndTimestamp();
    // Fast forward to the end of the auction
    vm.warp(auctionEnd + 1 weeks);
    // mint entire supply to dev
    clifford.withdrawRemainingNFTs(6000 - clifford.totalSupply());
    // check if the dev has the correct amount of NFTs
    assertEq(clifford.balanceOf(address(this)), clifford.totalSupply(), string.concat("Dev should have ", Strings.toString(clifford.totalSupply()), " NFTs"));
  }

  function testWithdrawAfterAllNftsMinted() public {
    uint numOfBidders = 100;

    auctionSimulator(numOfBidders);

    clifford.transferOwnership(TOP_CYPHER_HOLDER);

    vm.prank(clifford.owner());

    clifford.withdraw();
  }

  // Test calling functions out of order to ensure they revert

  function testWithdrawNftsBeforeCypherClaim() public {
    // We should not be able to claim nfts before the cypher claim
    // Trying to claim the nfts
    uint currentSupply = clifford.totalSupply();
    vm.expectRevert(AuctionNotOver.selector);
    clifford.withdrawRemainingNFTs(6000 - currentSupply);
  }

  function testWithdrawBeforeCypherClaim() public {
    // We should not be able to withdraw before the cypher claim
    // Trying to withdraw
    vm.expectRevert(NftsNotAllMinted.selector);
    clifford.withdraw();
  }

  function testWithdrawNftsBeforeAuctionOver() public {
    // We should not be able to withdraw nfts before the auction is over
    // start the cypher claim
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);
    // Trying to withdraw the remainder
    uint currentSupply = clifford.totalSupply();
    vm.expectRevert(AuctionNotOver.selector);
    clifford.withdrawRemainingNFTs(6000 - currentSupply);
  }

  function testWithdrawBeforeAuctionOver() public {
    // We should not be able to withdraw before the auction is over
    // start the cypher claim
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);
    // Trying to withdraw
    vm.expectRevert(NftsNotAllMinted.selector);
    clifford.withdraw();
  }

  function testWithdrawBeforeAllNftsMinted() public {
    // We should not be able to withdraw before all the nfts are minted
    // start the cypher claim
    clifford.startCypherClaimPeriod();
    // warp the time to 1 week after the cypher claim period
    vm.warp(block.timestamp + 1 weeks);
    // Get when the auction ends
    uint256 auctionEnd = clifford.getEndTimestamp();
    // Fast forward to the end of the auction
    vm.warp(auctionEnd);
    // Trying to withdraw
    vm.expectRevert(NftsNotAllMinted.selector);
    clifford.withdraw();
  }

  // User tries actions that should revert

  function testClaimNotOwnedCypher() public {
    // Will only work with mainnet fork
    if (block.chainid != 1) {
      return;
    }
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();

    uint[] memory cypherIds = new uint[](1);
    cypherIds[0] = 0;

    // Trying to claim a cypher we don't own
    vm.expectRevert(abi.encodeWithSelector(NotOwnerOfCypher.selector, cypherIds[0]));
    clifford.claimCyphers(cypherIds);
  }

  // user claims a cypher then tries to claim it again
  function testClaimCypherAlreadyClaimed() public {
    // Will only work with mainnet fork
    if (block.chainid != 1) {
      return;
    }
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();

    // Get the token id of a cypher we know that TOP_CYPHER_HOLDER owns
    uint256 cypherId = IERC721Enumerable(CYPHER_CONTRACT).tokenOfOwnerByIndex(TOP_CYPHER_HOLDER, 0);

    uint[] memory cypherIds = new uint[](1);
    cypherIds[0] = cypherId;

    vm.startPrank(TOP_CYPHER_HOLDER);

    // Claiming a single cypher
    clifford.claimCyphers(cypherIds);

    // Trying to claim a cypher we already claimed
    vm.expectRevert(abi.encodeWithSelector(CypherAlreadyClaimed.selector, cypherIds[0]));
    clifford.claimCyphers(cypherIds);

    vm.stopPrank();
  }

  // user tries to claim some cyphers they own and some they don't
  // expected behavior is to revert
  function testClaimMixOfClaimedCyphers() public {
    // Will only work with mainnet fork
    if (block.chainid != 1) {
      return;
    }
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();

    uint[] memory cypherIds = new uint[](3);
    cypherIds[0] = IERC721Enumerable(CYPHER_CONTRACT).tokenOfOwnerByIndex(TOP_CYPHER_HOLDER, 0);
    cypherIds[1] = IERC721Enumerable(CYPHER_CONTRACT).tokenOfOwnerByIndex(TOP_CYPHER_HOLDER, 1);
    cypherIds[2] = 0; // cypher we don't own

    vm.prank(TOP_CYPHER_HOLDER);

    // We don't own cypherIds[2] so this should revert
    vm.expectRevert(abi.encodeWithSelector(NotOwnerOfCypher.selector, cypherIds[2]));
    clifford.claimCyphers(cypherIds);
  }

  // user tries to claim a cypher that doesn't exist
  function testClaimNonExistentCypher() public {
    // Will only work with mainnet fork
    if (block.chainid != 1) {
      return;
    }
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();

    uint[] memory cypherIds = new uint[](1);
    cypherIds[0] = 6969; // cypher that doesn't exist

    vm.expectRevert("ERC721: owner query for nonexistent token");

    // No cypher with id 6969 so this should revert
    clifford.claimCyphers(cypherIds);
  }

  // user tries to claim zero cyphers
  function testClaimZeroCyphers() public {
    // Will only work with mainnet fork
    if (block.chainid != 1) {
      return;
    }
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();

    uint[] memory cypherIds = new uint[](0);

    // Trying to claim zero cyphers
    vm.expectRevert(MintZeroQuantity.selector);
    clifford.claimCyphers(cypherIds);
  }
  
}
