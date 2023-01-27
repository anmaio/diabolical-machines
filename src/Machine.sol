// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./GridHelper.sol";

interface IMachine {
  function getMachine(bytes memory bytesNeeded, uint state) external view returns (string memory);
}

contract Machine {

  address[6] private _workstations;

  // Owner of the contract
  address private _owner;

  // GRIDS
  string[9] internal noRow1Grid = ["x", "x", "x", "", "", "", "", "", ""];
  string[9] internal fullGrid = ["x", "x", "x", "x", "x", "x", "x", "x", "x"];
  string[9] internal charTouchingWall = ["x", "x", "", "x", "x", "", "", "", ""];

  // conveyor belt
  // string[] public machines = ["conveyorbelt", "drills", "nose", "beast", "altar", "tubes", "cypherRoom"];
  // TESTING
  string[] public machines = ["altar"];
  mapping(string => uint[][]) internal machineToPosition;
  mapping(string => uint) internal machineToSWHeight;
  mapping(string => string[9]) internal machineToLWGrid;

  // Used if a machine has repeating parts or parts that occur in other machines
  // mapping(string => string[]) internal partXOffset;
  // mapping(string => string[]) internal partYOffset;

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

  function setAllWorkstations(address[6] memory workstations) external onlyOwner {
    _workstations = workstations;
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

  // // Get machine's SVG
  // function getMachineSVG(string memory machine, bytes memory rand, uint state) external view returns (string memory) {
  //   // // get the number of parts the main svg is split into
  //   // string memory svg = "";
  //   // // get the svg for each part given the alignment
  
  //   // string memory tempSvg = "";
  //   // tempSvg = string.concat(
  //   //   machineToGetter(machine, rand, state),
  //   //   // machineParts[machineToSVGIndex[machine][i + offset]],
      
  //   //   // Testing text
  //   //   machineText[machine], // open text
  //   //   // machineToSVG[machine][numParts * 2], // open text
  //   //   "</text>"
  //   //   // CommonSVG.G2_END
  //   // );
  //   // svg = string.concat(svg, tempSvg);

  //   return machineToGetter(machine, rand, state);
  // }

  // function matchIndexToContract(uint index, uint currentPosition) internal view {
  //   if (partsToContract[currentPosition] < index) {
  //     matchIndexToContract(index, currentPosition + 1);
  //   } else {
  //     getMachinePartFromContract(currentPosition, index);
  //   }
    
  // }

  function machineToGetter(string memory machine, bytes memory rand, uint state) external view returns (string memory) {
    if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("conveyorbelt"))) {
      return getConveyorBelt(rand, state);
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("drills"))) {
      return getDrills(rand, state);
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("nose"))) {
      return getNose(rand, state);
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("beast"))) {
      return getBeast(rand, state);
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("altar"))) {
      return getAltar(rand, state);
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("tubes"))) {
      return getTubes(rand, state);
    } else {
      return "";
    }
  }

  // Machine Getters

  function getConveyorBelt(bytes memory rand, uint state) internal view returns (string memory) {
    return IMachine(_workstations[0]).getMachine(rand, state);
  }

  function getDrills(bytes memory rand, uint state) internal view returns (string memory) {
    return IMachine(_workstations[1]).getMachine(rand, state);
  }

  function getNose(bytes memory rand, uint state) internal view returns (string memory) {
    return IMachine(_workstations[2]).getMachine(rand, state);
  }

  function getBeast(bytes memory rand, uint state) internal view returns (string memory) {
    return IMachine(_workstations[3]).getMachine(rand, state);
  }

  function getAltar(bytes memory rand, uint state) internal view returns (string memory) {
    return IMachine(_workstations[4]).getMachine(rand, state);
  }

  function getTubes(bytes memory rand, uint state) internal view returns (string memory) {
    return IMachine(_workstations[5]).getMachine(rand, state);
  }

  modifier onlyOwner() {
    require(msg.sender == _owner, "Only owner can call this function.");
    _;
  }
}