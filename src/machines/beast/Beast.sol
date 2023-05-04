// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";
import "../../Noise.sol";

contract Beast {

  AssetRetriever internal _assetRetriever;

  string internal constant BASE_NUMBERS = "1100111000";
  string internal constant TOP_PIPE_NUMBERS = "11002110041100311005";

  string internal constant LEFT_NO_BODY_NUMBERS = "11006110081100711009";
  string internal constant LEFT_MID_EYE = "0000011029";

  string internal constant LEFT_BODY_EYE_NUMBERS = "000000502211031";
  string internal constant LEFT_BODY_PIPE_NUMBERS = "1101911017";

  string internal constant RIGHT_PIPE_NUMBERS = "11010110121101111013";
  string internal constant GLOOP_NUMBERS = "000001102811027";

  string internal constant TASSLE_NUMBERS = "1102111025";
  string internal constant TOP_EYE_NUMBERS = "00000050200501805039";

  string internal constant RIGHT_EYE_NUMBERS = "000000502405007";
  string internal constant GAUGE_NUMBERS = "0000004003040020400104000";
  string internal constant FLOOB_NUMBERS = "1101611020110221102411023";

  uint internal constant LEFT_BODY = 11030;
  uint internal constant LEFT_PANEL = 11018;

  uint internal constant NOSE_NUMBER = 11015;
  uint internal constant NOSE_SHADOW = 11032;

  uint internal constant HATCH_NUMBER = 11026;
  uint internal constant CONVEYOR_NUMBER = 11014;

  // Floor
  string internal constant SMALL_OFFSETS = "04680270";
  string internal constant LARGE_OFFSETS = "03120360";
  string internal constant OUT_WALL_OFFSETS = "00000180";
  string internal constant FLAT_WALL_OFFSETS = "01200300";
  uint internal constant NUMBER_OF_FLAT_WALL_POSITIONS = 4;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getBaseNumber(uint rand, int baseline) internal pure returns (uint) {
    uint baseDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12)] + baseline + 64);

    return GridHelper.getSingleObject(BASE_NUMBERS, baseDigits, 2, 5);
  }

  function getTopPipeNumber(uint rand, int baseline) internal pure returns (uint) {
    uint topPipeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 13)] + baseline);

    return GridHelper.getSingleObject(TOP_PIPE_NUMBERS, topPipeDigits, 4, 5);
  }

  function getLeftItems(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint[] memory numbersUsed = new uint[](4);

    if (baseline % 2 == 0) {
      numbersUsed = getLeftWithBody(rand, baseline);
    } else {
      numbersUsed = getLeftWithoutBody(rand, baseline);
    }

    return numbersUsed;
  }

  function getLeftWithBody(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint leftWithBodyDigits1 = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 14)] + baseline);
    uint leftWithBodyDigits2 = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 15)] + baseline);

    uint[] memory numbersUsed = new uint[](4);

    numbersUsed[0] = LEFT_BODY;
    numbersUsed[1] = LEFT_PANEL;

    numbersUsed[2] = GridHelper.getSingleObject(LEFT_BODY_EYE_NUMBERS, leftWithBodyDigits1, 3, 5);

    numbersUsed[3] = GridHelper.getSingleObject(LEFT_BODY_PIPE_NUMBERS, leftWithBodyDigits2, 2, 5);

    return numbersUsed;
  }

  function getLeftWithoutBody(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint leftNoBodyDigits1 = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 14)] + baseline);
    uint leftNoBodyDigits2 = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 15)] + baseline);

    uint[] memory numbersUsed = new uint[](2);

    numbersUsed[0] = GridHelper.getSingleObject(LEFT_NO_BODY_NUMBERS, leftNoBodyDigits1, 4, 5);

    numbersUsed[1] = GridHelper.getSingleObject(LEFT_MID_EYE, leftNoBodyDigits2, 2, 5);

    return numbersUsed;
  }

  function getDegradedRight(uint rand, int baseline) internal pure returns (uint[2] memory) {
    uint rightDigits1 = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 16)] + baseline);
    uint rightDigits2 = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 17)] + baseline);

    uint gloop = GridHelper.getSingleObject(GLOOP_NUMBERS, rightDigits1, 3, 5);

    uint rightPipe = GridHelper.getSingleObject(RIGHT_PIPE_NUMBERS, rightDigits2, 4, 5);

    return [gloop, rightPipe];
  }

  function getRunnerTassles(uint rand, int baseline) internal pure returns (uint[2] memory) {
    uint tassleDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 16)] + baseline);

    uint[] memory tassleprobabilitiesArray = GridHelper.createEqualProbabilityArray(2);

    uint[] memory tassleNumbersArray = GridHelper.setUintArrayFromString(TASSLE_NUMBERS, 2, 5);

    if (tassleDigits < tassleprobabilitiesArray[0]) {
      return [uint(0), 0];
    } else {
      return [tassleNumbersArray[0], tassleNumbersArray[1]];
    }
  }

  function getTopEyes(uint rand, int baseline) internal pure returns (uint) {
    uint topEyeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 17)] + baseline);

    return GridHelper.getSingleObject(TOP_EYE_NUMBERS, topEyeDigits, 4, 5);
  }

  function getRightEyes(uint rand, int baseline) internal pure returns (uint) {
    uint rightEyeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 18)] + baseline);

    return GridHelper.getSingleObject(RIGHT_EYE_NUMBERS, rightEyeDigits, 3, 5);
  }

  function getGauge(uint rand, int baseline) internal pure returns (uint) {
    uint gaugeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 19)] + baseline);

    return GridHelper.getSingleObject(GAUGE_NUMBERS, gaugeDigits, 5, 5);
  }

  function getFloob(uint rand, int baseline) internal pure returns (uint) {
    uint floobDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 26)] + baseline);

    return GridHelper.getSingleObject(FLOOB_NUMBERS, floobDigits, 5, 5);
  }

  function getCharacterPosition(uint characterNumber) internal pure returns(string memory) {
    if (characterNumber == 14000 || characterNumber == 14002 || characterNumber == 14004) {
      return "01560270";
    } else {
      return "03120180";
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](50);
    string[] memory offsetsUsed = new string[](50);

    numbersUsed[count] = GlobalNumbers.getFlatWallNumber(rand, baseline);
    offsetsUsed[count] = FLAT_WALL_OFFSETS;
    count++;

    uint baseNumber = getBaseNumber(rand, baseline);

    numbersUsed[count] = baseNumber;
    count++;

    // tassles
    uint[2] memory tassles = getRunnerTassles(rand, baseline);
    for (uint i = 0; i < tassles.length; ++i) {
      numbersUsed[count] = tassles[i];
      if (baseNumber == 11001) {
        offsetsUsed[count] = "00000280";
      }
      count++;
    }

    if (baseNumber == 11001) { // small base
      // gloop and right pipe
      uint[2] memory degradedRight = getDegradedRight(rand, baseline);
      numbersUsed[count] = degradedRight[0];
      count++;
      numbersUsed[count] = degradedRight[1];
      count++;
    } else {
      // right eye
      numbersUsed[count] = getRightEyes(rand, baseline);
      offsetsUsed[count] = "-0200000";
      count++;

      // gauge
      numbersUsed[count] = getGauge(rand, baseline);
      offsetsUsed[count] = "0325-130";
      count++;

      // nose shadow
      numbersUsed[count] = NOSE_SHADOW;
      count++;

      uint floobNumber = getFloob(rand, baseline);

      if (floobNumber != 11016) {
        numbersUsed[count] = HATCH_NUMBER;
        count++;
        numbersUsed[count] = CONVEYOR_NUMBER;
        count++;
      }

      // nose
      numbersUsed[count] = NOSE_NUMBER;
      count++;

      // floob
      numbersUsed[count] = floobNumber;
      count++;
    }

    numbersUsed[count] = getTopPipeNumber(rand, baseline);
    if (baseNumber == 11000) {
      offsetsUsed[count] = "0000-280";
    }
    count++;

    
    // top eyes
    numbersUsed[count] = getTopEyes(rand, baseline);
    if (baseNumber == 11001) {
      offsetsUsed[count] = "00000280";
    }
    count++;

    // Left items
    uint[] memory leftItems = getLeftItems(rand, baseline);
    for (uint i = 0; i < leftItems.length; ++i) {
      numbersUsed[count] = leftItems[i];
      count++;
    }

    uint[5] memory characterNumbers = GlobalNumbers.getCharacterNumberAndLeverNumber(rand, true, baseline);
    numbersUsed[count] = characterNumbers[0];
    count++;

    for (uint i = 1; i <= 2; ++i) {
      numbersUsed[count] = characterNumbers[i];
      offsetsUsed[count] = "03120180";
      count++;
    }

    numbersUsed[count] = characterNumbers[3];
    offsetsUsed[count] = getCharacterPosition(characterNumbers[3]);
    count++;

    numbersUsed[count] = characterNumbers[4];
    count++;

    numbersUsed[count] = GlobalNumbers.getSmallAssetNumber(rand, baseline);
    offsetsUsed[count] = SMALL_OFFSETS;
    count++;

    numbersUsed[count] = GlobalNumbers.getLargeAssetNumber(rand, baseline);
    offsetsUsed[count] = LARGE_OFFSETS;
    count++;

    numbersUsed[count] = GlobalNumbers.getOutWallNumber(rand, baseline);
    offsetsUsed[count] = OUT_WALL_OFFSETS;
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