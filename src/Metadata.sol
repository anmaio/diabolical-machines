// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "./Compose.sol";
import "./VRFv2Consumer.sol";
import "./Machine.sol";

contract Metadata is Ownable {
    Compose private _compose;
    Machine private _machine;
    VRFv2Consumer private _VRF;

    string[] public floorTraits = ["altar", "props"];
    uint256[] public floorProbabilities = [100, 100];
    string[] public leftWallTraits = ["lFrame"];
    uint256[] public leftWallProbabilities = [100];
    string[] public rightWallTraits = ["rFrame", "rClock"];
    uint256[] public rightWallProbabilities = [100, 100];

    uint256 public constant MAX_GRID_INDEX = 8;

    uint public constant MAX_RIGHT_WALL_OBJECTS = 2;
    uint public constant MAX_LEFT_WALL_OBJECTS = 1;
    uint public constant MAX_FLOOR_OBJECTS = 2;    

    // tokenId -> [position]
    mapping(uint256 => uint256[]) public traitPositions;

    string[9] public emptyGrid = ["", "", "", "", "", "", "", "", ""];

    string[9] public noRow1Grid = ["x", "x", "x", "", "", "", "", "", ""];
    
    // A grid might look like this:
    // string[9] public exampleGrid = [
    //     "x", "x", "x",
    //     "clock", "", "",
    //     "", "", "frame"
    // ];

    // storage image base uri
    string private _imageURI = "https://bepocdevukssaoutput.blob.core.windows.net/output/";

    constructor(Compose compose, Machine machine) {
        _compose = compose;
        _machine = machine;
    }

    // set vrf consumer
    function setVRFConsumer(VRFv2Consumer vrf) public onlyOwner {
        _VRF = vrf;
    }

    function pickPosition(
        string[9] memory grid,
        string memory object,
        uint256 rand
    ) public pure returns (string[9] memory newGrid, uint256 index) {
        // loop through the grid until a position is found that is not taken
        for (uint256 i = 0; i < grid.length; i++) {
            if (keccak256(abi.encodePacked(grid[rand])) == keccak256(abi.encodePacked(""))) {
                grid[rand] = object;
                return (grid, rand);
            }
            rand = (rand + 1) % grid.length;
        }
        // return invalid index if no position is found
        return (grid, MAX_GRID_INDEX + 1);
    }

    // selecting the walls and floor could be moved into the same function
    // probably only worth doing if we get a stack too deep error

    // alternative to generateRightWallPositions
    function getRWGrid(uint256 _tokenId) public view returns (string[9] memory) {
        uint256 uintVrf = _VRF.getNumberFromId(_tokenId);
        bytes memory vrf = uintToBytes(uintVrf);
        vrf = slice(vrf, 1, rightWallTraits.length * 2);
        uint256 rand = uint256(keccak256(vrf));
        // start with an empty grid
        string[9] memory newGrid = preRWGrid(_tokenId);
        for (uint256 i = 0; i < rightWallTraits.length; i++) {
            uint256 probability = rand % 100;
            uint256 index = 9;
            if (probability < rightWallProbabilities[i]) {
                // cannot go on the bottom row of the wall
                uint256 position = (rand % 6) + 3;
                (newGrid, index) = pickPosition(newGrid, rightWallTraits[i], position);
            }
            rand = rand / 100;
        }
        return newGrid;
    }

    // alternative to generateLeftWallPositions
    function getLWGrid(uint256 _tokenId) public view returns (string[9] memory) {
        uint256 uintVrf = _VRF.getNumberFromId(_tokenId);
        bytes memory vrf = uintToBytes(uintVrf);
        vrf = slice(vrf, 1 + rightWallTraits.length * 2, leftWallTraits.length * 2);
        uint256 rand = uint256(keccak256(vrf));
        // start with an empty grid
        string[9] memory newGrid = preLWGrid(_tokenId);
        for (uint256 i = 0; i < leftWallTraits.length; i++) {
            uint256 probability = rand % 100;
            uint256 index = 9;
            
            if (probability < leftWallProbabilities[i]) {
              // cannot go on the bottom row of the wall
              uint256 position = (rand % 6) + 3;
              (newGrid, index) = pickPosition(newGrid, leftWallTraits[i], position);
            }
            rand = rand / 100;
        }
        return newGrid;
    }

    // alternative to generateFloorPositions
    function getFGrid(uint256 _tokenId) public view returns (string[9] memory) {
        uint256 uintVrf = _VRF.getNumberFromId(_tokenId);
        bytes memory vrf = uintToBytes(uintVrf);
        vrf = slice(vrf, 1 + rightWallTraits.length * 2 + leftWallTraits.length * 2, floorTraits.length * 2);
        uint256 rand = uint256(keccak256(vrf));
        // start with an empty grid
        string[9] memory newGrid = preFloorGrid(_tokenId);
        for (uint256 i = 0; i < floorTraits.length; i++) {
            uint256 probability = rand % 100;
            uint256 index = 9;
            if (probability < floorProbabilities[i]) {
                uint256 position = rand % 9;
                (newGrid, index) = pickPosition(newGrid, floorTraits[i], position);
            }
            rand = rand / 100;
        }
        return newGrid;
    }

    function getMachine(uint _tokenId) public view returns (string memory) {
        uint256 uintVrf = _VRF.getNumberFromId(_tokenId);
        bytes memory vrf = uintToBytes(uintVrf);
        vrf = slice(vrf, 1, 2);
        uint256 rand = uint256(keccak256(vrf));

        string memory machine = _machine.selectMachine(rand);
        return machine;
    }

    function getMachinePosition(uint _tokenId) public view returns (uint[] memory) {
        uint256 uintVrf = _VRF.getNumberFromId(_tokenId);
        bytes memory vrf = uintToBytes(uintVrf);
        vrf = slice(vrf, 1, 2);
        uint256 rand = uint256(keccak256(vrf));

        uint[] memory positions = _machine.getMachinePosition(getMachine(_tokenId), rand);
        return positions;
    }

    function preFloorGrid(uint _tokenId) public view returns (string[9] memory) {
      uint[] memory positions = getMachinePosition(_tokenId);
      string memory machine = getMachine(_tokenId);
      string[9] memory grid = emptyGrid;
      for (uint i = 0; i < positions.length; i++) {
        if (positions[i] != 9) {
          if (i == 0) {
            grid[positions[i]] = machine;
          } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("drills"))) {
            grid[positions[i]] = machine;
          } else {
            grid[positions[i]] = "x";
          }
        }
      }
      return grid;
    }

    function preLWGrid(uint _tokenId) public view returns (string[9] memory) {
      uint[] memory positions = getMachinePosition(_tokenId);
      string[9] memory grid = emptyGrid;
      // get the grid if the machine is touching the wall
      string memory machine = getMachine(_tokenId);
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
      string[9] memory floorGrid = getFGrid(_tokenId);
      // bottom row in grid
      for (uint i = 0; i < 3; i++) {
        // if not empty and not a machine
        if (keccak256(abi.encodePacked(floorGrid[i])) != keccak256(abi.encodePacked("")) && keccak256(abi.encodePacked(floorGrid[i])) != keccak256(abi.encodePacked(machine))) {
          grid[i] = "x";
        }
      }
      return grid;
    }

    function preRWGrid(uint _tokenId) public view returns (string[9] memory) {
      uint[] memory positions = getMachinePosition(_tokenId);
      string[9] memory grid = emptyGrid;
      // get the SW height of the machine
      uint height = _machine.getMachineSWHeight(getMachine(_tokenId));
      // check if the positions next to the wall are taken(0, 3, 6)
      for (uint i = 0; i < positions.length; i++) {
        if (positions[i] == 0 || positions[i] == 3 || positions[i] == 6) {
          for (uint j = 1; j < height; j++) {
            grid[positions[i] / 3 + j * 3] = "x";
          }
        }
      }
      // similar logic but for objects
      string[9] memory floorGrid = getFGrid(_tokenId);
      // bottom row in grid
      for (uint i = 0; i < 3; i++) {
        // if not empty and touching the wall
        if (keccak256(abi.encodePacked(floorGrid[i*3])) != keccak256(abi.encodePacked(""))) {
          grid[i*3] = "x";
        }
      }
      return grid;
    }

    // slice array of bytes
    function slice(
        bytes memory data,
        uint256 start,
        uint256 len
    ) internal pure returns (bytes memory) {
        bytes memory b = new bytes(len);
        for (uint256 i = 0; i < len; i++) {
            b[i] = data[i + start];
        }
        return b;
    }

    // check a given grid is not full
    function isGridFull(string[9] memory grid) public pure returns (bool) {
        for (uint256 i = 0; i < grid.length; i++) {
            if (keccak256(abi.encodePacked(grid[i])) == keccak256(abi.encodePacked(""))) {
                return false;
            }
        }
        return true;
    }

    function uintToBytes(uint256 x) public pure returns (bytes memory b) {
        b = new bytes(32);
        assembly {
            mstore(add(b, 32), x)
        } //  first 32 bytes = length of the bytes value
    }

    function combineUintArrays(uint256[] memory a, uint256[] memory b) public pure returns (uint256[] memory) {
        uint256[] memory c = new uint256[](a.length + b.length);
        for (uint256 i = 0; i < a.length; i++) {
            c[i] = a[i];
        }
        for (uint256 i = 0; i < b.length; i++) {
            c[i + a.length] = b[i];
        }
        return c;
    }

    function combineStringArrays(string[] memory a, string[] memory b) public pure returns (string[] memory) {
        string[] memory c = new string[](a.length + b.length);
        for (uint256 i = 0; i < a.length; i++) {
            c[i] = a[i];
        }
        for (uint256 i = 0; i < b.length; i++) {
            c[i + a.length] = b[i];
        }
        return c;
    }

    function getObjectsFromGrid(string[9] memory grid) public pure returns (string[] memory objects) {
      uint count = 0;
      string[] memory tempArray = new string[](9);
      for (uint256 i = 0; i < grid.length; i++) {
        if (keccak256(abi.encodePacked(grid[i])) != keccak256(abi.encodePacked("")) && keccak256(abi.encodePacked(grid[i])) != keccak256(abi.encodePacked("x"))) {
            tempArray[count] = grid[i];
            count++;
        }
      }
      string[] memory objectArray = new string[](count);
      for (uint256 i = 0; i < count; i++) {
        objectArray[i] = tempArray[i];
      }
      return objectArray;
    }

    function getIndexesFromGrid(string[9] memory grid) public pure returns (uint256[] memory indexes) {
      uint count = 0;
      uint256[] memory tempArray = new uint256[](9);
      for (uint256 i = 0; i < grid.length; i++) {
        if (keccak256(abi.encodePacked(grid[i])) != keccak256(abi.encodePacked("")) && keccak256(abi.encodePacked(grid[i])) != keccak256(abi.encodePacked("x"))) {
          tempArray[count] = i;
          count++;
        }
      }
      uint[] memory indexArray = new uint[](count);
      for (uint256 i = 0; i < count; i++) {
        indexArray[i] = tempArray[i];
      }
      return indexArray;
    }

    function padGrid(string[] memory grid, uint finalSize) public pure returns (string[] memory newGrid) {
        newGrid = new string[](finalSize);
        for (uint256 i = 0; i < newGrid.length; i++) {
          if (i < grid.length) {
            newGrid[i] = grid[i];
          } else {
            newGrid[i] = "None";
          }
        }
        return newGrid;
    }

    function leftAlign(uint _tokenId) public view returns (bool) {
      uint256 uintVrf = _VRF.getNumberFromId(_tokenId);
      bytes memory vrf = uintToBytes(uintVrf);
      vrf = slice(vrf, 10, 2);
      uint256 rand = uint256(keccak256(vrf));
      if (rand < 50) {
        return true;
      } else {
        return false;
      }
    }

    //["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"]
    // Function build metadata for a given token
    function buildMetadata(uint256 _tokenId) public view returns (string memory) {
      // string[] memory rwObjects = getObjectsFromGrid(getRWGrid(_tokenId));
      // string[] memory lwObjects = getObjectsFromGrid(getLWGrid(_tokenId));
      // string[] memory fObjects = getObjectsFromGrid(getFGrid(_tokenId));
      string memory jsonInitial = string.concat(
          '{"name": "Clifford # ',
          Strings.toString(_tokenId),
          '", "description": "Clifford nft description", "attributes": [{"trait_type": "Right Wall 1", "value":"',
          padGrid(getObjectsFromGrid(getRWGrid(_tokenId)), MAX_RIGHT_WALL_OBJECTS)[0],
          '"}, {"trait_type": "Right Wall 2", "value":"',
          padGrid(getObjectsFromGrid(getRWGrid(_tokenId)), MAX_RIGHT_WALL_OBJECTS)[1],
          '"}, {"trait_type": "Left Wall 1", "value":"',
          padGrid(getObjectsFromGrid(getLWGrid(_tokenId)), MAX_LEFT_WALL_OBJECTS)[0],
          '"}, {"trait_type": "Floor 1", "value":"',
          padGrid(getObjectsFromGrid(getFGrid(_tokenId)), MAX_FLOOR_OBJECTS)[0],
          '"}, {"trait_type": "Floor 2", "value":"',
          padGrid(getObjectsFromGrid(getFGrid(_tokenId)), MAX_FLOOR_OBJECTS)[1],
          '"}],',
          '"image": "',
          _imageURI,
          Strings.toString(_tokenId),
          '.png", "animation_url": "data:image/svg+xml;base64,'
      );

        string memory jsonFinal = Base64.encode(
            bytes(string.concat(jsonInitial, _compose.composeSVG(combineStringArrays(getObjectsFromGrid(getRWGrid(_tokenId)), combineStringArrays(getObjectsFromGrid(getLWGrid(_tokenId)), getObjectsFromGrid(getFGrid(_tokenId)))), combineUintArrays(combineUintArrays(getIndexesFromGrid(getRWGrid(_tokenId)), getIndexesFromGrid(getLWGrid(_tokenId))), getIndexesFromGrid(getFGrid(_tokenId))), getMachine(_tokenId), leftAlign(_tokenId)), '"}'))
        );
        string memory output = string.concat("data:application/json;base64,", jsonFinal);
        return output;
    }
}
