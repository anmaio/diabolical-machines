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

  string internal constant PIPE_OFFSETS = "00000000000000600000012000000180000002400000030000000360";

  string internal constant SAW_A_OFFSETS = "120401204112042";

  string internal constant SAW_C_OFFSETS = "120431204412045";

  string internal constant HATCH_DECORATION_NUMBERS = "000001204712046";

  string internal constant SHELF_ITEM_NUMBERS = "0600106003";

  uint internal constant CB_OFFSETS = 13014;

  uint internal constant WALL_PIPES = 12036;

  uint internal constant HATCH_A = 12037;

  uint internal constant HATCH_C = 12038;

  uint internal constant FHOLE_NUMBER = 12039;

  uint internal constant SHELF_NUMBER = 6015;

  uint internal constant FLIP_NUMBER = 13010;

  // EYES
  string internal constant EYES_NUMBERS = "0000012048120491205012051";
  uint internal constant WIDE_EYES_NUMBER = 5004;

  string internal constant FEEDBACK_NUMBERS = "000000400004001040020400309000";

  uint internal constant TRANSFORM_1_NEGATIVE = 13013;

  uint internal constant FLIP_WRAPPER_NUMBER = 13010;

  uint internal constant GROUP_CLOSE_NUMBER = 13000;

  // Floor
  string internal constant SMALL_OFFSETS = "04680270";
  string internal constant LARGE_OFFSETS = "03120360";
  string internal constant OUT_WALL_OFFSETS = "00000180";
  string internal constant FLAT_WALL_OFFSETS = "03120000015600900000036000000540";
  uint internal constant NUMBER_OF_FLAT_WALL_POSITIONS = 4;

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
    for (uint i = 0; i < 10; ++i) {
      if (versionDigits > versionProbabilitiesArray[i]) {
        sum += versionLengthsArray[i];
      } else {
        index = i;
        lengthOfItems = versionLengthsArray[i];
        break;
      }
    }

    if (lengthOfItems == 0) {
      index = 10;
      lengthOfItems = versionLengthsArray[10];
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

  function getWallPipes(uint rand, int baseline, uint version) internal pure returns (uint) {
    uint wallDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 14 + version)] + baseline);

    if (wallDigits % 2 == 0) {
      return WALL_PIPES;
    } else {
      return 0;
    }
  }

  function getHatch(uint rand, int baseline) internal pure returns (uint) {
    uint hatchDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 25)] + baseline);

    if (hatchDigits % 2 == 0) {
      return HATCH_A;
    } else {
      return HATCH_C;
    }
  }

  function getSaw(uint rand, int baseline) internal pure returns (uint) {
    uint sawDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 26)] + baseline);

    if (getHatch(rand, baseline) == HATCH_A) {
      return GridHelper.getSingleObject(SAW_A_OFFSETS, sawDigits, 3, 5);
    } else {
      return GridHelper.getSingleObject(SAW_C_OFFSETS, sawDigits, 3, 5);
    }
  }

  function getHatchDecoration(uint rand, int baseline) internal pure returns (uint) {
    uint hatchDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 27)] + baseline);

    if (getHatch(rand, baseline) == HATCH_C) {
      return 0;
    } else {
      return GridHelper.getSingleObject(HATCH_DECORATION_NUMBERS, hatchDigits, 3, 5);
    }
  }

  function getShelfItem(uint rand, int baseline) internal pure returns (uint[3] memory) {
    uint shelfDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 28)] + baseline);

    if (shelfDigits % 5 != 0) {
      return [uint(0), 0, 0];
    }

    uint[] memory shelfNumbersArray = GridHelper.setUintArrayFromString(SHELF_ITEM_NUMBERS, 2, 5);

    uint[] memory shelfProbabilitiesArray = GridHelper.createEqualProbabilityArray(4);

    if (shelfDigits < shelfProbabilitiesArray[0]) {
      return [SHELF_NUMBER, 0, 0];
    } else if (shelfDigits < shelfProbabilitiesArray[1]) {
      return [SHELF_NUMBER, shelfNumbersArray[0], 0];
    } else if (shelfDigits < shelfProbabilitiesArray[2]) {
      return [SHELF_NUMBER, shelfNumbersArray[1], 0];
    } else {
      return [SHELF_NUMBER, shelfNumbersArray[0], shelfNumbersArray[1]];
    }
  }

  function getEyes(uint rand, int baseline) internal pure returns (uint) {
    uint eyesDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 29)] + baseline);

    if (eyesDigits % 2 == 0) {
      return 0;
    } else {
      return GridHelper.getSingleObject(EYES_NUMBERS, eyesDigits, 5, 5);
    }
  }

  function getFeedback(uint rand, int baseline) internal pure returns (uint) {
    uint feedbackDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 29)] + baseline);

    if (feedbackDigits % 2 != 0) {
      return 0;
    } else {
      return GridHelper.getSingleObject(FEEDBACK_NUMBERS, feedbackDigits, 6, 5);
    }
  }

  function getCharacterPosition() internal pure returns(string memory) {
    return "03120180";
  }

  function getAllNumbersUsed(uint rand, int baseline) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](80);
    string[] memory offsetsUsed = new string[](80);

    numbersUsed[count] = GlobalNumbers.getFlatWallNumber(rand, baseline);
    offsetsUsed[count] = FLAT_WALL_OFFSETS;
    count++;

    for (uint i = 0; i < 6; ++i) {
      numbersUsed[count] = getWallPipes(rand, baseline, i);
      offsetsUsed[count] = string(GridHelper.slice(bytes(PIPE_OFFSETS), i*8, 8));
      count++;
    }

    // get the hole number
    numbersUsed[count] = getHole(rand, baseline);
    count++;

    // get the platform numbers
    uint[] memory platformNumbers = getPlatforms(rand, baseline);
    for (uint j = 0; j < platformNumbers.length; ++j) {
      numbersUsed[count] = platformNumbers[j];
      count++;
    }

    // get the hatch number

    numbersUsed[count] = getHatch(rand, baseline);
    count++;

    // fhole
    numbersUsed[count] = FHOLE_NUMBER;
    count++;

    // get the saw number
    numbersUsed[count] = getSaw(rand, baseline);
    count++;

    // get the hatch decoration number
    numbersUsed[count] = getHatchDecoration(rand, baseline);
    count++;


    // get the floob number
    numbersUsed[count] = getFloob(rand, baseline);
    count++;

    // get the eyes number
    numbersUsed[count] = getEyes(rand, baseline);
    count++;

    // get the wide eyes number
    if (rand % 4 == 0) {
      numbersUsed[count] = WIDE_EYES_NUMBER;
      count++;
    }

    numbersUsed[count] = FLIP_WRAPPER_NUMBER;
    count++;

    // get the feedback number
    numbersUsed[count] = getFeedback(rand, baseline);
    offsetsUsed[count] = "-020-540";
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    // get the shelf item numbers
    offsetsUsed[count] = "-0200046"; // shelf offset
    uint[3] memory shelfItemNumbers = getShelfItem(rand, baseline);
    for (uint i = 0; i < 3; ++i) {
      numbersUsed[count] = shelfItemNumbers[i];
      count++;
    }

    uint[5] memory characterNumbers = GlobalNumbers.getCharacterNumberAndLeverNumber(rand, false, baseline);
    numbersUsed[count] = characterNumbers[0];
    count++;

    for (uint i = 1; i <= 2; ++i) {
      numbersUsed[count] = characterNumbers[i];
      offsetsUsed[count] = "03120180";
      count++;
    }

    numbersUsed[count] = characterNumbers[3];
    offsetsUsed[count] = getCharacterPosition();
    count++;

    numbersUsed[count] = characterNumbers[4];
    count++;

    numbersUsed[count] = GlobalNumbers.getSmallAssetNumber(rand, baseline);
    offsetsUsed[count] = SMALL_OFFSETS;
    count++;

    numbersUsed[count] = GlobalNumbers.getLargeAssetNumber(rand, baseline);
    offsetsUsed[count] = LARGE_OFFSETS;
    count++;

    numbersUsed[count] = FLIP_NUMBER;
    count++;

    numbersUsed[count] = GlobalNumbers.getOutWallNumber(rand, baseline);
    offsetsUsed[count] = OUT_WALL_OFFSETS;
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
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