// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

import "../../Noise.sol";

contract Noses {
  
  AssetRetriever internal _assetRetriever;

  // Floor
  string internal constant SMALL_OFFSETS = "06240210";
  string internal constant LARGE_OFFSETS = "0468027003120360";
  string internal constant OUT_WALL_OFFSETS = "00000180";
  string internal constant FLAT_WALL_OFFSETS = "03120000015600900000036000000540";
  uint internal constant NUMBER_OF_FLAT_WALL_POSITIONS = 4;

  string internal constant NOSE_NUMBERS = "180021800318001";

  // c-gauge-a
  // c-feedback-c
  // c-feedback-a
  // c-feedback-d
  // c-feedback-b

  string internal constant GAUGE_NUMBERS = "0400904002040000400304001";

  string internal constant MID_EYE_NUMBERS = "000000500205006";

  string internal constant TOP_EYE_NUMBERS = "000000500005004";

  // None
  // C-HOLE-A
  // C-HOLE-FX-A
  // C-HOLE-FX-B
  // C-HOLE-FX-C
  // C-HOLE-FX-D

  string internal constant HOLE_NUMBERS = "000000801118004180051800618007";

  string internal constant HOLE_TRANSFORM_NUMBERS = "130011300213003130041300513006";

  uint internal constant PANEL_NUMBER = 18000;

  uint internal constant FLIP_WRAPPER_NUMBER = 13010;

  uint internal constant ALL_NOSES_WRAPPER_NUMBER = 18012;
  uint internal constant JUST_NOSES_WRAPPER_NUMBER = 18013;

  uint internal constant GROUP_CLOSE_NUMBER = 13000;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getNoseNumbers(uint rand, int baseline) internal pure returns (uint) {
    uint noseDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12)] + baseline);

    return GridHelper.getSingleObject(NOSE_NUMBERS, noseDigits, 3, 5);
  }

  function getGaugeNumber(uint rand, int baseline) internal pure returns (uint) {
    uint gaugeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 14)] + baseline);

    return GridHelper.getSingleObject(GAUGE_NUMBERS, gaugeDigits, 5, 5);
  }

  function getMidEyesNumber(uint rand, int baseline) internal pure returns (uint) {
    uint midEyesDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 15)] + baseline);

    uint noseNumber = getNoseNumbers(rand, baseline);

    // this nose does not work with midEyesNumbersArray[0]
    if (noseNumber == 18001) {
      return 0;
    }

    return GridHelper.getSingleObject(MID_EYE_NUMBERS, midEyesDigits, 3, 5);
  }

  function getTopEyesNumber(uint rand, int baseline) internal pure returns (uint) {
    uint topEyesDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 16)] + baseline);

    return GridHelper.getSingleObject(TOP_EYE_NUMBERS, topEyesDigits, 3, 5);
  }

  function getHoleNumbers(uint rand, uint version, int baseline) internal pure returns (uint, string memory, uint count) {
    uint holeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 24+version)] + baseline);

    uint holeNumber = GridHelper.getSingleObject(HOLE_NUMBERS, holeDigits, 6, 5);

    // Only relevant if hole is not none
    uint numOfHoles = holeDigits % 5 + 1;

    if (numOfHoles == 1) {
      return (holeNumber, "00000000", 1);
    } else if (numOfHoles == 2) {
      return (holeNumber, "00680000-0680000", 2);
    } else if (numOfHoles == 3) {
      return (holeNumber, "0000000000680000-0680000", 3);
    } else if (numOfHoles == 4) {
      return (holeNumber, "000000450000-04500680000-0680000", 4);
    } else {
      return (holeNumber, "00000000000000450000-04500680000-0680000", 5);
    }

  }

  function getCharacterPosition(uint characterNumber) internal pure returns(string memory) {
    if (characterNumber == 14000 || characterNumber == 14002 || characterNumber == 14004) {
      return "03120180";
    } else {
      return "00000000";
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](80);
    string[] memory offsetsUsed = new string[](80);

    for (uint i = 0; i < 6; ++i) {
      numbersUsed[count] = GridHelper.stringToUint(string(GridHelper.slice(bytes(HOLE_TRANSFORM_NUMBERS), i*5, 5)));
      count++;

      (uint holeNumber, string memory holeOffset, uint holeCount) = getHoleNumbers(rand, i, baseline);
      for (uint j = 0; j < holeCount; ++j) {
        numbersUsed[count] = holeNumber;
        offsetsUsed[count] = string(GridHelper.slice(bytes(holeOffset), j*8, 8));
        count++;
      }

      numbersUsed[count] = GROUP_CLOSE_NUMBER;
      count++;
    }

    numbersUsed[count] = GlobalNumbers.getFlatWallNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getSingleOffset(rand, baseline, FLAT_WALL_OFFSETS, NUMBER_OF_FLAT_WALL_POSITIONS);
    count++;

    numbersUsed[count] = ALL_NOSES_WRAPPER_NUMBER;
    count++;

    numbersUsed[count] = PANEL_NUMBER;
    count++;

    uint gaugeNumber = getGaugeNumber(rand, baseline);
    numbersUsed[count] = gaugeNumber;
    offsetsUsed[count] = "-139-076";
    count++;

    numbersUsed[count] = gaugeNumber;
    offsetsUsed[count] = "0174-245";
    count++;

    numbersUsed[count] = getMidEyesNumber(rand, baseline);
    offsetsUsed[count] = "-140-079";
    count++;

    numbersUsed[count] = getTopEyesNumber(rand, baseline);
    offsetsUsed[count] = "-140-079";
    count++;

    numbersUsed[count] = JUST_NOSES_WRAPPER_NUMBER;
    count++;

    numbersUsed[count] = getNoseNumbers(rand, baseline);
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
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

  // add this to be excluded from coverage report
  // Not used in release 1 so should be excluded from coverage report
  function test() public {}
}