// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "./Compose.sol";
import "./Clifford.sol";
import "./Machine.sol";
import "./GridHelper.sol";

contract Metadata is Ownable {
  Compose private _compose;
  Machine private _machine;
  Clifford private _clifford;

  string[] public floorTraits = ["altar", "props"];
  uint256[] public floorProbabilities = [0, 0];
  string[] public leftWallTraits = ["lFrame"];
  uint256[] public leftWallProbabilities = [0];
  string[] public rightWallTraits = ["rFrame", "rClock"];
  uint256[] public rightWallProbabilities = [0, 0];

  uint public constant MAX_RIGHT_WALL_OBJECTS = 2;
  uint public constant MAX_LEFT_WALL_OBJECTS = 1;
  uint public constant MAX_FLOOR_OBJECTS = 2;

  string[9] public emptyGrid = ["", "", "", "", "", "", "", "", ""];

  string[] public multipleMachines = ["drills"];
  
  // A grid might look like this:
  // string[9] public exampleGrid = [
  //     "x", "x", "x",
  //     "clock", "", "",
  //     "", "", "frame"
  // ];

  // storage image base uri
  // string private constant _imageURI = "https://bepocdevukssaoutput.blob.core.windows.net/output/";

  constructor(Compose compose, Machine machine) {
      _compose = compose;
      _machine = machine;
  }

  // set handle random
  function setClifford(Clifford clifford) public onlyOwner {
    _clifford = clifford;
  }

  // selecting the walls and floor could be moved into the same function
  // probably only worth doing if we get a stack too deep error

  // get the postions of the right wall objects
  function getRWGrid(uint256 tokenId) public view returns (string[9] memory) {
    uint rand = getRandAndSlice(tokenId, 1, MAX_RIGHT_WALL_OBJECTS * 2);

    // start with an empty grid
    string[9] memory newGrid = preRWGrid(tokenId);
    for (uint256 i = 0; i < MAX_RIGHT_WALL_OBJECTS; i++) {
      uint256 probability = rand % 100;
      uint256 index = 9;
      if (probability < rightWallProbabilities[i]) {
          uint256 position = rand % 9;
          (newGrid, index) = GridHelper.pickPosition(newGrid, rightWallTraits[i], position);
      }
      rand = rand / 100;
    }
    return newGrid;
  }

  // get the postions of the left wall objects
  function getLWGrid(uint256 tokenId) public view returns (string[9] memory) {
    uint rand = getRandAndSlice(tokenId, 1 + MAX_RIGHT_WALL_OBJECTS * 2, MAX_LEFT_WALL_OBJECTS * 2);

    // start with an empty grid
    string[9] memory newGrid = preLWGrid(tokenId);
    for (uint256 i = 0; i < MAX_LEFT_WALL_OBJECTS; i++) {
      uint256 probability = rand % 100;
      uint256 index = 9;
      
      if (probability < leftWallProbabilities[i]) {
        // cannot go on the bottom row of the wall
        uint256 position = rand % 9;
        (newGrid, index) = GridHelper.pickPosition(newGrid, leftWallTraits[i], position);
      }
      rand = rand / 100;
    }
    return newGrid;
  }

  // get the postions of the floor objects
  function getFGrid(uint256 tokenId) public view returns (string[9] memory) {
    uint rand = getRandAndSlice(tokenId, 1 + MAX_RIGHT_WALL_OBJECTS * 2 + MAX_LEFT_WALL_OBJECTS * 2, MAX_FLOOR_OBJECTS * 2);

    // start with an empty grid
    string[9] memory newGrid = preFloorGrid(tokenId);
    for (uint256 i = 0; i < floorTraits.length; i++) {
      uint256 probability = rand % 100;
      uint256 index = 9;
      if (probability < floorProbabilities[i]) {
        uint256 position = rand % 9;
        (newGrid, index) = GridHelper.pickPosition(newGrid, floorTraits[i], position);
      }
      rand = rand / 100;
    }
    return newGrid;
  }

  function getMachine(uint tokenId) public view returns (string memory) {
    uint rand = getRandAndSlice(tokenId, 1, 2);

    string memory machine = _machine.selectMachine(rand);
    return machine;
  }

  // // Determine if left aligned
  // function getLeftAligned(uint tokenId) public view returns (bool) {
  //   uint rand = getRandAndSlice(tokenId, 1, 2); // tokenId, start, length

  //   bool leftAligned = rand % 2 == 0;
  //   return leftAligned;
  // }

  function getMachinePosition(uint tokenId) public view returns (uint[] memory) {
    uint rand = getRandAndSlice(tokenId, 1, 2); // tokenId, start, length
    uint[] memory positions = _machine.getMachinePosition(getMachine(tokenId), rand);
    return positions;
  }

  function preFloorGrid(uint tokenId) public view returns (string[9] memory) {
    uint[] memory positions = getMachinePosition(tokenId);
    string memory machine = getMachine(tokenId);
    string[9] memory grid = emptyGrid;
    // render order of machine is the last position it occupies
    grid[GridHelper.getLastValidIndex(positions)] = machine;
    // grid[positions[positions.length - 1]] = machine; // ERROR HERE
    for (uint i = 0; i < positions.length - 1; i++) {
      if (positions[i] != 9) {
        if (isMultipleMachines(machine)) {
          grid[positions[i]] = machine;
        } else {
          grid[positions[i]] = "x";
        }
      }
    }
    return grid;
  }

  function preLWGrid(uint tokenId) public view returns (string[9] memory) {
    uint[] memory positions = getMachinePosition(tokenId);
    string[9] memory grid = emptyGrid;
    // get the grid for if the machine is touching the wall
    string memory machine = getMachine(tokenId);
    string[9] memory machineGrid = _machine.getMachinePWGrid(machine);
    // check if the positions next to the wall are taken(0, 1, 2)
    for (uint i = 0; i < positions.length; i++) {
      if (positions[i] == 0 || positions[i] == 1 || positions[i] == 2) {
        // second loop will rule out bottom row if the machine is 2 or 3 high
        for (uint j = 0; j < 3; j++) {
          grid[positions[i] + j * 3] = machineGrid[positions[i] + j * 3];
        }
      }
    }
    // similar logic but for objects
    string[9] memory floorGrid = getFGrid(tokenId);
    // bottom row in grid
    for (uint i = 0; i < 3; i++) {
      // if not empty and not a machine
      if (keccak256(abi.encodePacked(floorGrid[i])) != keccak256(abi.encodePacked("")) && keccak256(abi.encodePacked(floorGrid[i])) != keccak256(abi.encodePacked(machine))) {
        grid[i] = "x";
      }
    }
    return grid;
  }

  function preRWGrid(uint tokenId) public view returns (string[9] memory) {
    uint[] memory positions = getMachinePosition(tokenId);
    string[9] memory grid = emptyGrid;
    // get the SW height of the machine
    uint height = _machine.getMachineSWHeight(getMachine(tokenId));
    // check if the positions next to the wall are taken(0, 3, 6)
    for (uint i = 0; i < positions.length; i++) {
      if (positions[i] == 0 || positions[i] == 3 || positions[i] == 6) {
        for (uint j = 0; j < height; j++) {
          grid[positions[i] / 3 + j * 3] = "x";
        }
      }
    }
    // similar logic but for objects
    string[9] memory floorGrid = getFGrid(tokenId);
    // bottom row in grid
    for (uint i = 0; i < 3; i++) {
      // if not empty and touching the wall
      if (keccak256(abi.encodePacked(floorGrid[i*3])) != keccak256(abi.encodePacked(""))) {
        grid[i*3] = "x";
      }
    }
    return grid;
  }

  // get the random number for the token
  function getRandBytes(uint tokenId) public view returns (bytes memory) {
    return bytes(Strings.toString(_clifford.getSeed(tokenId)));
  }

  function getRandAndSlice(uint tokenId, uint start, uint length) internal view returns (uint256) {
      bytes memory randBytes = getRandBytes(tokenId);
      randBytes = GridHelper.slice(randBytes, start, length);
      uint256 output = GridHelper.bytesToUint(randBytes);
      return output;
  }

  // function leftAlign(uint tokenId) public view returns (bool) {
  //   uint rand = getRandAndSlice(tokenId, 10, 2); // tokenId, start, length
  //   if (rand < 50) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // check if machine can appear multiple times
  function isMultipleMachines(string memory machine) internal view returns (bool) {
    // iterate through multiple machines and check if the machine is in the list
    for (uint256 i = 0; i < multipleMachines.length; i++) {
      if (keccak256(abi.encodePacked(multipleMachines[i])) == keccak256(abi.encodePacked(machine))) {
        return true;
      }
    }
    return false;
  }

  //["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"]
  // Function build metadata for a given token
  function buildMetadata(uint256 tokenId) public view returns (string memory) {
    string memory jsonInitial = string.concat(
        '{"name": "Clifford # ',
        Strings.toString(tokenId),
        '", "description": "Clifford nft description", "attributes": [{"trait_type": "Right Wall 1", "value":"',
        GridHelper.padGrid(GridHelper.getObjectsFromGrid(getRWGrid(tokenId)), MAX_RIGHT_WALL_OBJECTS)[0],
        '"}, {"trait_type": "Right Wall 2", "value":"',
        GridHelper.padGrid(GridHelper.getObjectsFromGrid(getRWGrid(tokenId)), MAX_RIGHT_WALL_OBJECTS)[1],
        '"}, {"trait_type": "Left Wall 1", "value":"',
        GridHelper.padGrid(GridHelper.getObjectsFromGrid(getLWGrid(tokenId)), MAX_LEFT_WALL_OBJECTS)[0],
        '"}, {"trait_type": "Floor 1", "value":"',
        GridHelper.padGrid(GridHelper.getObjectsFromGrid(getFGrid(tokenId)), MAX_FLOOR_OBJECTS)[0],
        '"}, {"trait_type": "Floor 2", "value":"',
        GridHelper.padGrid(GridHelper.getObjectsFromGrid(getFGrid(tokenId)), MAX_FLOOR_OBJECTS)[1],
        '"}],',
        '"image": "data:image/svg+xml;base64,'
        // _imageURI,
        // Strings.toString(tokenId),
        // '.png", "animation_url": "data:image/svg+xml;base64,'
    );

      string memory jsonFinal = Base64.encode(
          bytes(string.concat(jsonInitial, _compose.composeSVG(tokenId), '"}'))
      );
      string memory output = string.concat("data:application/json;base64,", jsonFinal);
      return output;
  }
}
