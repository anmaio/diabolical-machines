// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

import "../../Noise.sol";

contract ConveyorBelt {

  AssetRetriever internal _assetRetriever;

  uint internal constant NUM_OF_VERSIONS = 11;

  string internal constant PLATFORM_LENGTHS = "13578356589";

  string internal constant PLATFORM_NUMBERS = "000001202112022120231201012020120211202212023120111201612021120221202312024120251201012011120171202112022120231202412025120211202212026120211202212024120261202712012120131201912021120221202612021120221202412026120271200912014120151202112022120241202612027120091201312014120181202112022120241202612027";

  string internal constant HOLES_NUMBERS = "1200412000120061200712005120001200112003120011200212008";

  string internal constant FLOOB_NUMBERS = "1203212031120301202812028120311202912030120291202812028";

  uint internal constant GROUP_CLOSE_NUMBER = 19000;

  // Floor
  string internal constant FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_FLOOR_POSITIONS = 2;

  // Wall
  string internal constant WALL_OFFSETS = "01560090015602700312000003120180";
  uint internal constant NUMBER_OF_WALL_POSITIONS = 4;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getVersion(uint rand, int baseline) internal pure returns (uint[3] memory) {
    uint versionDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12)] + baseline);

    uint[] memory versionProbabilitiesArray = GridHelper.createEqualProbabilityArray(NUM_OF_VERSIONS);

    uint[] memory versionLengthsArray = GridHelper.setUintArrayFromString(PLATFORM_LENGTHS, NUM_OF_VERSIONS, 1);

    uint sum = 0;
    uint index = 0;
    uint lengthOfItems = 0;
    for (uint i = 0; i < 11; ++i) {
      if (versionDigits > versionProbabilitiesArray[i]) {
        sum += versionLengthsArray[i];
      } else {
        index = i;
        lengthOfItems = versionLengthsArray[i];
        break;
      }
    }

    return [index, sum, lengthOfItems];
  }

  function getPlatforms(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint[3] memory versionNumbersArray = getVersion(rand, baseline);
    uint sum = versionNumbersArray[1];
    uint lenghtOfItems = versionNumbersArray[2];

    // slice the platform numbers from sum to sum + lenghtOfItems
    string memory combinedPlatformNumbers = string(GridHelper.slice(bytes(PLATFORM_NUMBERS), sum*5, lenghtOfItems*5));
    uint[] memory platformNumbersArray = GridHelper.setUintArrayFromString(combinedPlatformNumbers, lenghtOfItems, 5);

    return platformNumbersArray;
  }

  function getHole(uint rand, int baseline) internal pure returns (uint) {
    uint index = getVersion(rand, baseline)[0];

    uint[] memory holeNumbersArray = GridHelper.setUintArrayFromString(HOLES_NUMBERS, 11, 5);

    return holeNumbersArray[index];
  }

  function getFloob(uint rand, int baseline) internal pure returns (uint) {
    uint index = getVersion(rand, baseline)[0];

    uint[] memory floobNumbersArray = GridHelper.setUintArrayFromString(FLOOB_NUMBERS, 11, 5);

    return floobNumbersArray[index];
  }

  function getCharacterPosition(uint characterNumber, uint rand, int baseline) internal pure returns(string memory) {

    if ((characterNumber == 20000 || characterNumber == 20002 || characterNumber == 20004) && keccak256(bytes(GlobalNumbers.getGlobalAssetPosition(rand, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS))) != keccak256(bytes("04680270")) && keccak256(bytes(GlobalNumbers.getExpansionPropPosition(rand, baseline, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS, WALL_OFFSETS, NUMBER_OF_WALL_POSITIONS))) != keccak256(bytes("04680270"))) {
      return "01560270";
    } else {
      return "03120180";
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](50);
    string[] memory offsetsUsed = new string[](50);

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getExpansionPropPosition(rand, baseline, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS, WALL_OFFSETS, NUMBER_OF_WALL_POSITIONS);
    count++;

    // get the hole number
    numbersUsed[count] = getHole(rand, baseline);
    count++;

    // get the platform numbers
    uint[] memory platformNumbers = getPlatforms(rand, baseline);
    for (uint i = 0; i < platformNumbers.length; ++i) {
      numbersUsed[count] = platformNumbers[i];
      count++;
    }

    // get the floob number
    numbersUsed[count] = getFloob(rand, baseline);
    count++;

    uint[5] memory characterNumbers = GlobalNumbers.getCharacterNumberAndLeverNumber(rand, false, baseline);
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

    numbersUsed[count] = GlobalNumbers.getGlobalAssetNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getGlobalAssetPosition(rand, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS);
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