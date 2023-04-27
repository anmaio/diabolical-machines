// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import "forge-std/Test.sol";
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

import "../src/TraitBase.sol";
import "../src/AssetRetriever.sol";

contract CliffordTest is Test {

  uint internal constant MINT_SIZE = 0;
  // string[] public allMachines = ["Altar", "Apparatus", "Cells", "Tubes", "Beast", "ConveyorBelt"];
  string[] public allMachines = ["Altar"];
  string[3] public allStates = ["Degraded", "Basic", "Embellished"];
  string public output = "[\n  ";

  address internal constant CYPHER_CONTRACT = 0xdDA32aabBBB6c44eFC567baC5F7C35f185338456;
  address internal constant TOP_CYPHER_HOLDER = 0x0aD0b792A54704dc7b6f85CBB774106d22E814d9;

  uint private constant BID_INCREMENT = 0.01 ether;

  uint private constant AUCTION_LENGTH = 5 days;

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
  error NftsAlreadyDistributed();

	error AuctionNotOver();
  error NftsNotAllMinted();

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
    address[] memory assetsImpsAds = new address[](5);
    assetsImpsAds[0] = address(assetsImp1);
    assetsImpsAds[1] = address(assetsImp2);
    assetsImpsAds[2] = address(assetsImp3);
    assetsImpsAds[3] = address(assetsImp4);
    assetsImpsAds[4] = address(assetsImp5);
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

  function deployAssetRetriever() internal {
    // Order of traitBases must match the order of TraitBases in AssetRetriever
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
    // Add the address of each TraitBase
    assetRetriever = new AssetRetriever(traitBases);
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
    globalSVG = new GlobalSVG();
    // machine = new Machine([address(altar), address(drills), address(noses), address(apparatus), address(cells), address(tubes), address(beast), address(conveyorBelt)], assetRetriever);
    machine = new Machine([address(altar), address(apparatus), address(cells), address(tubes), address(beast), address(conveyorBelt)], assetRetriever);
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
    deployTubes();
    deployApparatus();
    deployCells();
    deployBeast();
    deployConveyor();
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
  // 1000 = 5ETH

  function auctionSimulator(uint numOfBidders) public {
    // start the cypher claim period
    clifford.startCypherClaimPeriod();
    // start the auction
    clifford.startAuction();

    // for numOfBidders create an address array with random addresses
    address[] memory bidders = new address[](numOfBidders);
    for (uint i = 0; i < numOfBidders; i++) {
      bidders[i] = address(uint160(uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, i)))));
    }

    // for each bidder
    for (uint i = 0; i < numOfBidders; i++) {
      // get the minimum bid value
      uint minBidValue = clifford.getMinimumBid();
      uint userBidAmount = (uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, i))) % 20 + 1) * BID_INCREMENT;
      if (userBidAmount < minBidValue || i % 2 == 0) { // 50% chance to bid the minimum
        userBidAmount = minBidValue;
      }
      vm.deal(bidders[i], 100 ether);
      vm.prank(bidders[i]);
      clifford.placeBid{value: userBidAmount}();
    }

    uint ppu = clifford.getCurrentPricePerUnit();
    uint finalMinBid = clifford.getMinimumBid();
    uint preDistributionBalance = address(clifford).balance;

    // Get when the auction ends
    uint256 auctionEnd = clifford.getEndTimestamp();
    // Fast forward to the end of the auction
    vm.warp(auctionEnd);

    clifford.distributeNFTs();

    clifford.devClaim();

    console2.log("numOfBidders: ", numOfBidders);
    console2.log("current ppu: ", ppu);
    console2.log("current minimum bid: ", finalMinBid);
    console2.log("clifford balance before distribution: ", preDistributionBalance);
    console2.log("clifford balance after distribution: ", address(clifford).balance);
    console2.log("dev amount: ", clifford.balanceOf(clifford.owner()));
  }

  function testAuctionSimulator() public {
    uint numOfBidders = 500;

    auctionSimulator(numOfBidders);
  }

  function preWriteImages() internal {
    // start the cypher claim period
    clifford.startCypherClaimPeriod();
    // start the auction
    clifford.startAuction();
    // Get when the auction ends
    uint256 auctionEnd = clifford.getEndTimestamp();
    // Fast forward to the end of the auction
    vm.warp(auctionEnd);
    // mint entire supply to dev
    clifford.devClaim();
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
    writeImagesInRange(0, MINT_SIZE/10);
  }

  function testWriteImages2() public {
    writeImagesInRange(MINT_SIZE/10, 2*MINT_SIZE/10);
  }

  function testWriteImages3() public {
    writeImagesInRange(2*MINT_SIZE/10, 3*MINT_SIZE/10);
  }

  function testWriteImages4() public {
    writeImagesInRange(3*MINT_SIZE/10, 4*MINT_SIZE/10);
  }

  function testWriteImages5() public {
    writeImagesInRange(4*MINT_SIZE/10, 5*MINT_SIZE/10);
  }

  function testWriteImages6() public {
    writeImagesInRange(5*MINT_SIZE/10, 6*MINT_SIZE/10);
  }

  function testWriteImages7() public {
    writeImagesInRange(6*MINT_SIZE/10, 7*MINT_SIZE/10);
  }

  function testWriteImages8() public {
    writeImagesInRange(7*MINT_SIZE/10, 8*MINT_SIZE/10);
  }

  function testWriteImages9() public {
    writeImagesInRange(8*MINT_SIZE/10, 9*MINT_SIZE/10);
  }

  function testWriteImages10() public {
    writeImagesInRange(9*MINT_SIZE/10, 10*MINT_SIZE/10);
  }

  // create a json file with the ids of the images that were created
  function testWriteJson() public {
    preWriteImages();

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
        "\",\n    \"Pattern\": \"",
        metadata.getPatternName(clifford.getSeed(i), baseline),
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

  // Simple tests to simulate the auction process

  function testInitialCypherClaimState() public {
    // Check if the state is correct
    assertEq(clifford.getIfCypherClaimStarted() , false, "Cypher claim should not be started");
  }

  function testStartCypherClaim() public {
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();
    // Check if the state is correct
    assertEq(clifford.getIfCypherClaimStarted() , true, "Cypher claim should be started");
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
    // Starting the auction
    clifford.startAuction();
    // Check if the state is correct
    assertEq(clifford.getStartTimestamp() , block.timestamp, "Auction should be started");
    assertEq(clifford.getEndTimestamp() , block.timestamp + AUCTION_LENGTH, "Auction should be started");
  }

  function testPlaceSingleBid() public {
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();
    // Starting the auction
    clifford.startAuction();
    // Placing a bid of 1 ETH
    clifford.placeBid{value: 1 ether}();
    // Check the value of our bids
    assertEq(clifford.getUserBid(address(this)), 1 ether, "Bid should be 1 ETH");
  }

  function testPlaceMultipleBids() public {
    // Starting the cypher claim
    clifford.startCypherClaimPeriod();
    // Starting the auction
    clifford.startAuction();
    // Placing a bid of 1 ETH
    clifford.placeBid{value: 1 ether}();
    // Placing a bid of 2 ETH
    clifford.placeBid{value: 2 ether}();
    // Check the value of our bids
    assertEq(clifford.getUserBid(address(this)), 3 ether, "Bid should be 3 ETH");
  }


  // Test calling functions out of order to ensure they revert

  function testStartAuctionBeforeCypherClaim() public {
    // We should not be able to start the auction before the cypher claim
    // Trying to start the auction
    vm.expectRevert(CypherClaimNotStarted.selector);
    clifford.startAuction();
  }

  function testDevClaimBeforeCypherClaim() public {
    // We should not be able to claim dev before the cypher claim
    // Trying to start the dev claim
    vm.expectRevert(AuctionNotOver.selector);
    clifford.devClaim();
  }

  function testWithdrawBeforeCypherClaim() public {
    // We should not be able to withdraw before the cypher claim
    // Trying to withdraw
    vm.expectRevert(NftsNotAllMinted.selector);
    clifford.withdraw();
  }

  function testDevClaimBeforeAuctionOver() public {
    // We should not be able to claim dev before the auction is over
    // start the dev claim
    clifford.startCypherClaimPeriod();
    // start the auction
    clifford.startAuction();
    // Trying to start the dev claim
    vm.expectRevert(AuctionNotOver.selector);
    clifford.devClaim();
  }

  function testWithdrawBeforeAuctionOver() public {
    // We should not be able to withdraw before the auction is over
    // start the dev claim
    clifford.startCypherClaimPeriod();
    // start the auction
    clifford.startAuction();
    // Trying to withdraw
    vm.expectRevert(NftsNotAllMinted.selector);
    clifford.withdraw();
  }

  function testWithdrawBeforeDevClaim() public {
    // We should not be able to withdraw before the dev claim
    // start the dev claim
    clifford.startCypherClaimPeriod();
    // start the auction
    clifford.startAuction();
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
