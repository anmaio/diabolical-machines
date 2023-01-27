// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "@openzeppelin/contracts/utils/Strings.sol";

library GridHelper {
  uint256 public constant MAX_GRID_INDEX = 8;

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

  function groupTransform(string memory x, string memory y, string memory data) internal pure returns (string memory) {
    return string.concat("<g transform='translate(", x, ",", y, ")'>", data, "</g>");
  }

  function uintToBytes(uint256 x) public pure returns (bytes memory b) {
      b = new bytes(32);
      assembly {
          mstore(add(b, 32), x)
      } //  first 32 bytes = length of the bytes value
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
        groupTransform(xOffset, yOffset, object)
      );
    }
    return output;
  }

  function setUintArrayFromString(string memory values, uint numOfValues, uint lengthOfValue) internal pure returns (uint[] memory) {
    uint[] memory output = new uint[](numOfValues);
    for (uint256 i = 0; i < numOfValues; i++) {
      output[i] = stringToUint(string(slice(bytes(values), i*lengthOfValue, lengthOfValue)));
    }
    return output;
  }

  function shiftToEndUintArray(uint index, uint[] memory arr) internal pure returns (uint[] memory) {
    require(index < arr.length, "index out of bound");

    for (uint i = index; i < arr.length - 1; i++) {
        arr[i] = arr[i + 1];
    }
    return arr;
  }
}