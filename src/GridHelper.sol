// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./CommonSVG.sol";

library GridHelper {
  uint256 public constant MAX_GRID_INDEX = 8;

  // pick the position of a 1x1 object in a given grid
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

  function getLastValidIndex(uint[] memory gridIndexes) public pure returns (uint256) {
    uint indexLength = gridIndexes.length;
    for (uint256 i = 1; i < indexLength; i++) {
      if (gridIndexes[indexLength - i] != 9) {
        return gridIndexes[indexLength - i];
      }
    }
    return 0; // first index is always 0
  }

  function bytesToUint(bytes memory b) internal pure returns (uint256){
    uint result = 0;
    for (uint256 i = 0; i < b.length; i++) {
        uint256 c = uint256(uint8(b[i]));
        if (c >= 48 && c <= 57) {
            result = result * 10 + (c - 48);
        }
    }
    return result;
  }

  function stringToUint(string memory s) internal pure returns (uint) {
      bytes memory b = bytes(s);
      uint result = 0;
      for (uint256 i = 0; i < b.length; i++) {
          uint256 c = uint256(uint8(b[i]));
          if (c >= 48 && c <= 57) {
              result = result * 10 + (c - 48);
          }
      }
      return result;
  }

  function repeatGivenObject(string memory object, uint times, bytes memory offsetBytes) internal pure returns (string memory) {
    // uint sliceSize = offsetBytes.length / (times * 2); // /2 for x and y
    require(offsetBytes.length % (times * 2) == 0, "offsetBytes length must be divisible by times * 2");
    string memory output = "";
    for (uint256 i = 0; i < times; i++) {
      string memory xOffset = string(slice(offsetBytes, 2*i * offsetBytes.length / (times * 2), offsetBytes.length / (times * 2)));
      string memory yOffset = string(slice(offsetBytes, (2*i + 1) * offsetBytes.length / (times * 2), offsetBytes.length / (times * 2)));
      output = string.concat(
        output,
        CommonSVG.groupTransform(xOffset, yOffset, object)
      );
    }
    return output;
  }
}