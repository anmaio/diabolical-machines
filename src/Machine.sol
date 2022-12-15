// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./Metadata.sol";
import "./CommonSVG.sol";
import "./machines/drills/Drills.sol";
import "./machines/nose/Nose.sol";
import "./machines/beast/Beast.sol";
import "./machines/altar/Altar.sol";
import "./machines/conveyorbelt/Conveyorbelt.sol";
import "./machines/tubes/Tubes.sol";
import "./machines/cypherRoom/CypherRoom.sol";

contract Machine {
  Metadata private _metadata;

  Drills private _drills;
  Nose private _nose;
  Beast private _beast;
  Altar private _altar;
  Conveyorbelt private _conveyorbelt;
  Tubes private _tubes;
  CypherRoom private _cypherRoom;

  // Owner of the contract
  address internal _owner;

  // GRIDS
  string[9] internal noRow1Grid = ["x", "x", "x", "", "", "", "", "", ""];
  string[9] internal fullGrid = ["x", "x", "x", "x", "x", "x", "x", "x", "x"];
  string[9] internal charTouchingWall = ["x", "x", "", "x", "x", "", "", "", ""];

  // conveyor belt
  string[] public machines = ["nose", "conveyorbelt", "beast", "drills", "altar", "tubes", "cypherRoom"];
  // TESTING
  // string[] public machines = ["tubes"];
  mapping(string => uint[][]) internal machineToPosition;
  mapping(string => uint) internal machineToSWHeight;
  mapping(string => string[9]) internal machineToLWGrid;

  // Used if a machine has repeating parts or parts that occur in other machines
  mapping(string => string[]) internal partXOffset;
  mapping(string => string[]) internal partYOffset;

  // TESTING labels index of machines position
  mapping(string => string) internal machineText;

  uint[] internal partsToContract = [0, 1, 2, 3, 4]; // index is which contract 

  constructor() {
    _owner = msg.sender;

    // conveyor belt
    machineToPosition["conveyorbelt"] = [[0,1,2,3,4,5,6,7]];
    machineToSWHeight["conveyorbelt"] = 2;
    machineText["conveyorbelt"] = "<text class='bla' x='300' y='0'>";
    machineToLWGrid["conveyorbelt"] = fullGrid;

    // drills
    machineToPosition["drills"] = [[0,1,2,3,4,5], [0,1,2,9,9,9], [9,9,9,3,4,5]];
    machineToSWHeight["drills"] = 3;
    machineText["drills"] = "<text class='bla3' x='155' y='180'>";
    machineToLWGrid["drills"] = fullGrid;

    // nose
    machineToPosition["nose"] = [[0,1,2,3,4,5,6,7,8]];
    machineToSWHeight["nose"] = 3;
    machineText["nose"] = "<text class='bla3' x='155' y='180'>";
    machineToLWGrid["nose"] = fullGrid;

    // beast
    machineToPosition["beast"] = [[0,1,2,3,4,5,6]];
    machineToSWHeight["beast"] = 3;
    machineText["beast"] = "<text class='bla3' x='-150' y='-300'>";
    machineToLWGrid["beast"] = fullGrid;

    // altar
    machineToPosition["altar"] = [[0,1,2,3,4,5,6,7,8]];
    machineToSWHeight["altar"] = 3;
    machineText["altar"] = "<text class='bla3' x='155' y='180'>";
    machineToLWGrid["altar"] = fullGrid;

    // tubes
    machineToPosition["tubes"] = [[0,1,2,3,4,6,7]];
    machineToSWHeight["tubes"] = 3;
    machineText["tubes"] = "<text class='bla3' x='155' y='180'>";
    machineToLWGrid["tubes"] = fullGrid;

    // cypherRoom
    machineToPosition["cypherRoom"] = [[0,1,2,3,4,5,6,7,8]];
    machineToSWHeight["cypherRoom"] = 3;
    machineText["cypherRoom"] = "<text class='bla3' x='155' y='180'>";
    machineToLWGrid["cypherRoom"] = fullGrid;
  }

  function setMetadata(Metadata metadata) external onlyOwner {
    _metadata = metadata;
  }

  function setDrills(Drills drills) external onlyOwner {
    _drills = drills;
  }

  function setNose(Nose nose) external onlyOwner {
    _nose = nose;
  }

  function setBeast(Beast beast) external onlyOwner {
    _beast = beast;
  }

  function setAltar(Altar altar) external onlyOwner {
    _altar = altar;
  }

  function setConveyorbelt(Conveyorbelt conveyorbelt) external onlyOwner {
    _conveyorbelt = conveyorbelt;
  }

  function setTubes(Tubes tubes) external onlyOwner {
    _tubes = tubes;
  }

  function setCypherRoom(CypherRoom cypherRoom) external onlyOwner {
    _cypherRoom = cypherRoom;
  }

  function selectMachine(uint rand) public view returns (string memory) {
      return machines[rand % machines.length];
  }

  function getMachinePosition (string memory machine, uint rand) public view returns (uint[] memory) {
    return machineToPosition[machine][rand % machineToPosition[machine].length];
  }

  function getMachineSWHeight(string memory machine) public view returns (uint) {
    return machineToSWHeight[machine];
  }

  function getMachinePWGrid(string memory machine) public view returns (string[9] memory) {
    return machineToLWGrid[machine];
  }

  // INTERNAL FUNCTIONS

  function positionText(string memory name, uint position) internal pure returns (string memory) {
    return string.concat(
        "<tspan>",
        name,
        Strings.toString(position),
        "</tspan>"
    );
  }

  // Get machine's SVG
  function getMachineSVG(string memory machine, uint position, uint _tokenId) external view returns (string memory) {
    // get the number of parts the main svg is split into
    string memory svg = "";
    // get the svg for each part given the alignment
  
    string memory tempSvg = "";
    tempSvg = string.concat(
      machineToGetter(machine, _tokenId),
      // machineParts[machineToSVGIndex[machine][i + offset]],
      
      // Testing text
      machineText[machine], // open text
      // machineToSVG[machine][numParts * 2], // open text
      positionText(machine, position),
      CommonSVG.TEXT_CLOSE
      // CommonSVG.G2_END
    );
    svg = string.concat(svg, tempSvg);

    return svg;
  }

  // function matchIndexToContract(uint index, uint currentPosition) internal view {
  //   if (partsToContract[currentPosition] < index) {
  //     matchIndexToContract(index, currentPosition + 1);
  //   } else {
  //     getMachinePartFromContract(currentPosition, index);
  //   }
    
  // }

  function machineToGetter(string memory machine, uint _tokenId) internal view returns (string memory) {
    if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("conveyorbelt"))) {
      return getConveyorBelt();
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("drills"))) {
      return getDrills(_tokenId);
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("nose"))) {
      return getNose(_tokenId);
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("beast"))) {
      return getBeast(_tokenId);
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("altar"))) {
      return getAltar(_tokenId);
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("cypherRoom"))) {
      return getCypherRoom();
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("tubes"))) {
      return getTubes(_tokenId);
    } else {
      return "";
    }
  }

  // Machine Getters

  function getConveyorBelt() internal view returns (string memory) {
    // return string.concat(CB1.getMachine(), CB2.getMachine(), CB3.getMachine(), CB4.getMachine(), CB5.getMachine(), CB6.getMachine(), CB7.getMachine(), CB8.getMachine());
    return _conveyorbelt.getMachine();
  }

  function getDrills(uint _tokenId) internal view returns (string memory) {
    bytes memory rand = _metadata.getRandBytes(_tokenId);
    bytes memory bytesNeeded = GridHelper.slice(rand, 16, 4);
    return _drills.getMachine(bytesNeeded);
  }

  function getNose(uint _tokenId) internal view returns (string memory) {
    uint[6] memory holeDistribution;
    // 0 = 4 holes, 1 = 5 holes, 2 = no holes
    // TODO slice to get a random distribution
    for (uint i = 0; i < 6; i++) {
      holeDistribution[i] = _metadata.getRandAndSlice(_tokenId, 10+i, 1) % 3;
    }

    bytes memory rand = _metadata.getRandBytes(_tokenId);

    // 2 for eyes, 2 for nose
    bytes memory bytesNeeded = GridHelper.slice(rand, 20, 4);
    
    string memory holes = _nose.getMachine(holeDistribution, bytesNeeded);

    return holes;
  }

  function getBeast(uint _tokenId) internal view returns (string memory) {
    bytes memory rand = _metadata.getRandBytes(_tokenId);
    bytes memory bytesNeeded = GridHelper.slice(rand, 16, 4);
    return _beast.getMachine(bytesNeeded);
  }

  function getAltar(uint _tokenId) internal view returns (string memory) {
    bytes memory rand = _metadata.getRandBytes(_tokenId);
    // 2 for frame, 2 for orb1, 2 for orb2, 2 for cube, 2 for stairs, 2 for rug
    bytes memory bytesNeeded = GridHelper.slice(rand, 16, 12);
    return _altar.getMachine(bytesNeeded);
  }

  function getTubes(uint _tokenId) internal view returns (string memory) {
    bytes memory rand = _metadata.getRandBytes(_tokenId);
    
    bytes memory bytesNeeded = GridHelper.slice(rand, 16, 4);
    return _tubes.getMachine(bytesNeeded);
  }

  function getCypherRoom() internal view returns (string memory) {
    // bytes memory rand = _metadata.getRandBytes(_tokenId);
    
    // bytes memory bytesNeeded = GridHelper.slice(rand, 16, 12);
    return _cypherRoom.getMachine();
  }

  modifier onlyOwner() {
    require(msg.sender == _owner, "Only owner can call this function.");
    _;
  }
}