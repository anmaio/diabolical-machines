// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";
import "../../Noise.sol";

contract Altar {

  AssetRetriever internal _assetRetriever;

  // Each position is represented by 6 bytes, 3 for x and 3 for y
  string internal constant ORB_OFFSETS = "00000000-312-180";

  string internal constant BASE_NUMBERS = "070000700107002";
  string internal constant FRAME_NUMBERS = "070030700407012070110701805026";
  string internal constant ORB_BASE_NUMBERS = "00000070050700607008070090701007007";
  string internal constant STEPS_RUNNERS_NUMBERS = "070130701407015";
  string internal constant RUG_NUMBERS = "000000702007021";
  string internal constant FLOOB_ANIMATION_NUMBERS = "07019070160702507022";
  string internal constant WRAPPER_NUMBERS = "07023070240702607027";

  string internal constant FLOOB_NUMBERS = "0101001005010130100401008010090102001017010190101601015";
  string internal constant ORB_NUMBERS = "0000004035040360403704038";
  string internal constant TOP_ROW_NUMBERS = "000000603106012";

  // Floor
  string internal constant SMALL_OFFSETS = "04680270";
  string internal constant LARGE_OFFSETS = "03120360";
  string internal constant OUT_WALL_OFFSETS = "00000180";
  string internal constant FLAT_WALL_OFFSETS = "0312000003120180015600900156027001560450";
  uint internal constant NUMBER_OF_FLAT_WALL_POSITIONS = 5;

  // Wall
  // string internal constant WALL_OFFSETS = "0000018001560090015602700312000003120180";
  // uint internal constant NUMBER_OF_WALL_POSITIONS = 5;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getCubeNumber(uint rand, int baseline) internal pure returns (uint) {
    uint baseDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12)] + baseline);

    uint[3] memory stepsNumbers = getStepsNumber(rand, baseline);
    // Only 1 of the bases fit with the steps
    if (stepsNumbers[1] == 7013) {
      return 7000;
    }

    if (stepsNumbers[1] == 0) {
      return 0;
    }

    return GridHelper.getSingleObject(BASE_NUMBERS, baseDigits, 3, 5);
  }

  function getFrameNumber(uint rand, int baseline) internal pure returns (uint[3] memory) {
    uint frameDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 13)] + baseline);

    uint[] memory frameProbabilitiesArray = GridHelper.createEqualProbabilityArray(8);

    uint[] memory frameNumbersArray = GridHelper.setUintArrayFromString(FRAME_NUMBERS, 6, 5);

    if (frameDigits < frameProbabilitiesArray[0]) {
      return [frameNumbersArray[4], 0, 0];
    } else if (frameDigits < frameProbabilitiesArray[1]) {
      return [frameNumbersArray[1], frameNumbersArray[5], 0];
    } else if (frameDigits < frameProbabilitiesArray[2]) {
      return [frameNumbersArray[0], frameNumbersArray[5], 0];
    } else if (frameDigits < frameProbabilitiesArray[3]) {
      return [frameNumbersArray[0], frameNumbersArray[4], 0];
    } else if (frameDigits < frameProbabilitiesArray[4]) {
      return [frameNumbersArray[2], frameNumbersArray[4], 0];
    } else if (frameDigits < frameProbabilitiesArray[5]) {
      return [frameNumbersArray[2], frameNumbersArray[5], 0];
    } else if (frameDigits < frameProbabilitiesArray[6]) {
      return [frameNumbersArray[3], frameNumbersArray[0], frameNumbersArray[4]];
    } else {
      return [frameNumbersArray[3], frameNumbersArray[0], frameNumbersArray[5]];
    }
  }

  function getStepsNumber(uint rand, int baseline) internal pure returns (uint[3] memory) {
    uint stepsDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 16)] + baseline);

    uint[] memory stepsProbabilitiesArray = GridHelper.createEqualProbabilityArray(4);

    uint[] memory stepsRunnersNumbersArray = GridHelper.setUintArrayFromString(STEPS_RUNNERS_NUMBERS, 3, 5);

    if (stepsDigits < stepsProbabilitiesArray[0]) {
      return [uint(0), 0, 0];
    } else if (stepsDigits < stepsProbabilitiesArray[1]) {
      return [0, stepsRunnersNumbersArray[0], 0];
    } else if (stepsDigits < stepsProbabilitiesArray[2]) {
      return [0, stepsRunnersNumbersArray[0], stepsRunnersNumbersArray[1]];
    } else {
      return [stepsRunnersNumbersArray[2], stepsRunnersNumbersArray[0], stepsRunnersNumbersArray[1]];
    }
  }

  function getRugNumber(uint rand, int baseline) internal pure returns (uint) {
    uint rugDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 17)] + baseline);

    return GridHelper.getSingleObject(RUG_NUMBERS, rugDigits, 3, 5);
  }

  function getOrbBaseNumber(uint rand, uint version, int baseline) internal pure returns (uint) {
    uint orbBaseDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 14+version)] + baseline);

    return GridHelper.getSingleObject(ORB_BASE_NUMBERS, orbBaseDigits, 7, 5);
  }

  function getOrbNumber(uint rand, uint version, int baseline) internal pure returns (uint) {
    uint orbDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 18+version)] + baseline);

    return GridHelper.getSingleObject(ORB_NUMBERS, orbDigits, 5, 5);
  }

  function getFloobAnimationNumbers(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint floobDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 25)] + baseline);

    uint[] memory numbersUsed = new uint[](5);
    uint[] memory floobAnimationNumbersArray = GridHelper.setUintArrayFromString(FLOOB_ANIMATION_NUMBERS, 4, 5);
    uint[] memory wrapperNumbersArray = GridHelper.setUintArrayFromString(WRAPPER_NUMBERS, 4, 5);

    // get the cube number
    uint cubeNumber = getCubeNumber(rand, baseline);

    // if the cube number is 0, then we want to use the floob animation that appears from the floor
    if (cubeNumber == 0) {
      numbersUsed[0] = floobAnimationNumbersArray[2];
      numbersUsed[1] = floobAnimationNumbersArray[3];
      numbersUsed[2] = wrapperNumbersArray[2];
      numbersUsed[3] = GridHelper.getSingleObject(FLOOB_NUMBERS, floobDigits, 11, 5);
      numbersUsed[4] = wrapperNumbersArray[3];
      return numbersUsed;
    } else {
      numbersUsed[0] = floobAnimationNumbersArray[0];
      numbersUsed[1] = floobAnimationNumbersArray[1];
      numbersUsed[2] = wrapperNumbersArray[0];
      numbersUsed[3] = GridHelper.getSingleObject(FLOOB_NUMBERS, floobDigits, 11, 5);
      numbersUsed[4] = wrapperNumbersArray[1];
      return numbersUsed;
    }
  }

  function getTopRowItemNumber(uint rand, int baseline) internal pure returns (uint) {
    uint topRowDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 24)] + baseline);

    bool canFit;
    if (GlobalNumbers.getOutWallNumber(rand, baseline) == 0) {
      canFit = true;
    }

    if (!canFit) {
      return 0;
    }

    else {
      return GridHelper.getSingleObject(TOP_ROW_NUMBERS, topRowDigits, 3, 5);
    }
  }

  function getCharacterPosition(uint characterNumber, uint rand, int baseline) internal pure returns(string memory) {
    if (characterNumber != 14000 && characterNumber != 14004) {
      return "03120180";
    } else {
      uint orbNumber = getOrbNumber(rand, 0, baseline);
      uint orbBaseNumber = getOrbBaseNumber(rand, 0, baseline);
      if (orbNumber == 0 && orbBaseNumber == 0) {
        return "-3120180";
      } else {
        return "01800120";
      }
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](50);
    string[] memory offsetsUsed = new string[](50);

    numbersUsed[count] = GlobalNumbers.getFlatWallNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getSingleOffset(rand, baseline, FLAT_WALL_OFFSETS, NUMBER_OF_FLAT_WALL_POSITIONS);
    count++;

    numbersUsed[count] = getTopRowItemNumber(rand, baseline);
    count++;

    uint[3] memory frame = getFrameNumber(rand, baseline);
    for (uint i = 0; i < frame.length; ++i) {
      numbersUsed[count] = frame[i];
      count++;
    }

    numbersUsed[count] = getOrbBaseNumber(rand, 1, baseline);
    offsetsUsed[count] = "-312-180";
    count++;
    numbersUsed[count] = getOrbNumber(rand, 1, baseline);
    offsetsUsed[count] = "-312-180";
    count++;
    numbersUsed[count] = getCubeNumber(rand, baseline);
    count++;
    uint[] memory floobAnimation = getFloobAnimationNumbers(rand, baseline);
    for (uint i = 0; i < floobAnimation.length; ++i) {
      numbersUsed[count] = floobAnimation[i];
      count++;
    }

    numbersUsed[count] = getOrbBaseNumber(rand, 0, baseline);
    count++;
    numbersUsed[count] = getOrbNumber(rand, 0, baseline);
    count++;

    numbersUsed[count] = getRugNumber(rand, baseline);
    count++;
    uint[3] memory stepsRunner = getStepsNumber(rand, baseline);
    for (uint i = 0; i < stepsRunner.length; ++i) {
      numbersUsed[count] = stepsRunner[i];
      count++;
    }

    numbersUsed[count] = GlobalNumbers.getSmallAssetNumber(rand, baseline);
    offsetsUsed[count] = SMALL_OFFSETS;
    count++;

    numbersUsed[count] = GlobalNumbers.getLargeAssetNumber(rand, baseline);
    offsetsUsed[count] = LARGE_OFFSETS;
    count++;

    numbersUsed[count] = GlobalNumbers.getOutWallNumber(rand, baseline);
    offsetsUsed[count] = OUT_WALL_OFFSETS;
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