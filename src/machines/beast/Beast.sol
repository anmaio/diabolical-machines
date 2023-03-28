// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";
import "../../Noise.sol";

contract Beast {

  AssetRetriever internal _assetRetriever;

  // Floor
  string internal constant FLOOR_OFFSETS = "0156027003120360";
  uint internal constant NUMBER_OF_FLOOR_POSITIONS = 2;

  // Wall
  string internal constant WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_WALL_POSITIONS = 5;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getCharacterPosition(uint characterNumber, uint rand, int baseline) internal pure returns(string memory) {
    if (characterNumber != 20000 && characterNumber != 20004) {
      return "03120180";
    } else {
      string memory globalAssetPossition = GlobalNumbers.getGlobalAssetPosition(rand, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS);
      string memory expansionPropPosition = GlobalNumbers.getExpansionPropPosition(rand, baseline, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS, WALL_OFFSETS, NUMBER_OF_WALL_POSITIONS);
      if (keccak256(bytes(globalAssetPossition)) != keccak256(bytes("03120360")) && keccak256(bytes(expansionPropPosition)) != keccak256(bytes("03120360"))) {
        return "00000360";
      } else {
        return "03120180";
      }
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](50);
    string[] memory offsetsUsed = new string[](50);

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getExpansionPropPosition(rand, baseline, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS, WALL_OFFSETS, NUMBER_OF_WALL_POSITIONS);
    count++;

    numbersUsed[count] = GlobalNumbers.getGlobalAssetNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getGlobalAssetPosition(rand, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS);
    count++;

    uint[5] memory characterNumbers = GlobalNumbers.getCharacterNumberAndLeverNumber(rand, true, baseline);
    numbersUsed[count] = characterNumbers[0];
    count++;

    for (uint i = 1; i <= 2; ++i) {
      numbersUsed[count] = characterNumbers[i];
      offsetsUsed[count] = "03120180";
      count++;
    }

    numbersUsed[count] = characterNumbers[3];
    offsetsUsed[count] = getCharacterPosition(characterNumbers[3], rand, baseline);
    count++;

    numbersUsed[count] = characterNumbers[4];
    count++;
    

    return (numbersUsed, offsetsUsed);
  }

  function getMachine(uint rand, int baseline) external view returns (string memory) {

    string memory output = "";

    // get all numbers used, returns a uint[] and a string[] of offsets
    (uint[] memory allNumbers, string[] memory allOffsets) = getAllNumbersUsed(rand, baseline);

    for (uint i = 0; i < allNumbers.length; ++i) {
      if (bytes(allOffsets[i]).length == 0) {
        output = string.concat(output, _assetRetriever.getAsset(allNumbers[i]));
      } else {
        output = string.concat(output, GridHelper.groupTransform(string(GridHelper.slice(bytes(allOffsets[i]), 0, 4)), string(GridHelper.slice(bytes(allOffsets[i]), 4, 4)), _assetRetriever.getAsset(allNumbers[i])));
      }
    }

    return output;
  }
}