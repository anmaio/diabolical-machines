// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

contract Noses {
  AssetRetriever internal _assetRetriever;

  // Floor
  string internal constant DEGRADED_FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_DEGRADED_FLOOR_POSITIONS = 2;
  string internal constant BASIC_FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_BASIC_FLOOR_POSITIONS = 2;
  string internal constant EMBELLISHED_FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_EMBELLISHED_FLOOR_POSITIONS = 2;

  // Wall
  string internal constant DEGRADED_WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_DEGRADED_WALL_POSITIONS = 5;
  string internal constant BASIC_WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_BASIC_WALL_POSITIONS = 5;
  string internal constant EMBELLISHED_WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_EMBELLISHED_WALL_POSITIONS = 5;

  string internal constant NOSE_NUMBERS = "160021600316001";
  string internal constant NOSE_CHANCE = "609533661070";

  string internal constant GAUGE_NUMBERS = "40094002400040034001";

  // State         D  B  E
  // c-gauge-a     30 20 05
  // c-feedback-c  50 40 20
  // c-feedback-a  60 55 40
  // c-feedback-d  65 80 65
  // c-feedback-b  70 90 99

  string internal constant GAUGE_PROBABILITIES = "305060657020405580900520406599";

  string internal constant MID_EYE_NUMBERS = "50025006";
  string internal constant MID_EYE_CHANCE = "304040604090";

  string internal constant TOP_EYE_NUMBERS = "50005004";
  string internal constant TOP_EYE_CHANCE = "304040604090";

  string internal constant HOLE_NUMBERS = "0801116004160051600616007";

  // State        D  B  E
  // C-HOLE-A     20 20 08
  // C-HOLE-FX-A  28 35 25
  // C-HOLE-FX-B  32 50 43
  // C-HOLE-FX-C  34 65 70
  // C-HOLE-FX-D  35 70 99

  string internal constant HOLE_PROBABILITIES = "202832343520355065700825437099";

  string internal constant HOLE_TRANSFORM_NUMBERS = "190011900219003190041900519006";

  uint internal constant PANEL_NUMBER = 16000;

  uint internal constant FLIP_WRAPPER_NUMBER = 19010;

  uint internal constant ALL_NOSES_WRAPPER_NUMBER = 16012;
  uint internal constant JUST_NOSES_WRAPPER_NUMBER = 16013;

  uint internal constant GROUP_CLOSE_NUMBER = 19000;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getNoseNumbers(uint rand, uint state) internal pure returns (uint) {
    uint[] memory noseNumbersArray = GridHelper.setUintArrayFromString(NOSE_NUMBERS, 3, 5);
    uint[] memory noseChanceArray = GridHelper.setUintArrayFromString(NOSE_CHANCE, 6, 2);
    // uint noseDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 12, 2));
    uint noseDigits = GridHelper.getRandByte(rand, 12);

    if (noseDigits < noseChanceArray[2*state]) {
      return noseNumbersArray[0];
    } else if (noseDigits < noseChanceArray[2*state+1]) {
      return noseNumbersArray[1];
    } else {
      return noseNumbersArray[2];
    }
  }

  function getGaugeNumber(uint rand, uint state) internal pure returns (uint) {
    uint[] memory gaugeNumbersArray = GridHelper.setUintArrayFromString(GAUGE_NUMBERS, 5, 4);
    uint[] memory gaugeChanceArray = GridHelper.setUintArrayFromString(GAUGE_PROBABILITIES, 15, 2);
    // uint gaugeDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 14, 2));
    uint gaugeDigits = GridHelper.getRandByte(rand, 14);

    if (gaugeDigits < gaugeChanceArray[5*state]) {
      return gaugeNumbersArray[0];
    } else if (gaugeDigits < gaugeChanceArray[5*state+1]) {
      return gaugeNumbersArray[1];
    } else if (gaugeDigits < gaugeChanceArray[5*state+2]) {
      return gaugeNumbersArray[2];
    } else if (gaugeDigits < gaugeChanceArray[5*state+3]) {
      return gaugeNumbersArray[3];
    } else if (gaugeDigits < gaugeChanceArray[5*state+4]) {
      return gaugeNumbersArray[4];
    } else {
      return 0;
    }
    // refactor to for loop
    // uint sum = 0;
    // for (uint i = 0; i < 5; i++) {
    //   sum += gaugeChanceArray[5*state+i];
    //   if (gaugeDigits < sum) {
    //     return gaugeNumbersArray[i];
    //   }
    // }
    // return 0;
  }

  function getMidEyesNumber(uint rand, uint state) internal pure returns (uint) {
    uint[] memory midEyesNumbersArray = GridHelper.setUintArrayFromString(MID_EYE_NUMBERS, 2, 4);
    uint[] memory midEyesChanceArray = GridHelper.setUintArrayFromString(MID_EYE_CHANCE, 6, 2);
    // uint midEyesDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 15, 2));
    uint midEyesDigits = GridHelper.getRandByte(rand, 15);

    uint noseNumber = getNoseNumbers(rand, state);

    if (midEyesDigits < midEyesChanceArray[2*state] && noseNumber != 16001) {
      return midEyesNumbersArray[0];
    } else if (midEyesDigits < midEyesChanceArray[2*state+1]) {
      return midEyesNumbersArray[1];
    } else {
      return 0;
    }
  }

  function getTopEyesNumber(uint rand, uint state) internal pure returns (uint) {
    uint[] memory topEyesNumbersArray = GridHelper.setUintArrayFromString(TOP_EYE_NUMBERS, 2, 4);
    uint[] memory topEyesChanceArray = GridHelper.setUintArrayFromString(TOP_EYE_CHANCE, 6, 2);
    // uint topEyesDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 16, 2));
    uint topEyesDigits = GridHelper.getRandByte(rand, 16);

    if (topEyesDigits < topEyesChanceArray[2*state]) {
      return topEyesNumbersArray[0];
    } else if (topEyesDigits < topEyesChanceArray[2*state+1]) {
      return topEyesNumbersArray[1];
    } else {
      return 0;
    }
  }

  function IsMultipleHoles(uint rand, uint state) internal pure returns(bool) {
    // uint multipleHolesDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 18, 2));
    uint multipleHolesDigits = GridHelper.getRandByte(rand, 18);
    
    uint multipleHolesChance = 0;
    if (state == 0) {
      multipleHolesChance = 98;
    } else if (state == 1) {
      multipleHolesChance = 80;
    } else if (state == 2) {
      multipleHolesChance = 50;
    }
    return multipleHolesDigits < multipleHolesChance;
  }

  function getHoleNumbers(uint rand, uint state, uint version) internal pure returns (uint, string memory, uint count) {
    // uint holeDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 24+version, 2));
    uint holeDigits = GridHelper.getRandByte(rand, 24+version);
    uint[] memory holeNumbersArray = GridHelper.setUintArrayFromString(HOLE_NUMBERS, 5, 5);
    uint[] memory holeChanceArray = GridHelper.setUintArrayFromString(HOLE_PROBABILITIES, 15, 2);

    uint holeNumber;

    if (holeDigits < holeChanceArray[5*state]) {
      holeNumber = holeNumbersArray[0];
    } else if (holeDigits < holeChanceArray[5*state+1]) {
      holeNumber = holeNumbersArray[1];
    } else if (holeDigits < holeChanceArray[5*state+2]) {
      holeNumber = holeNumbersArray[2];
    } else if (holeDigits < holeChanceArray[5*state+3]) {
      holeNumber = holeNumbersArray[3];
    } else if (holeDigits < holeChanceArray[5*state+4]) {
      holeNumber = holeNumbersArray[4];
    } else {
      holeNumber = 0;
    }

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

  function getGlobalAssetPosition(uint rand, uint state) internal pure returns (string memory) {
    string memory globalAssetOffsets = DEGRADED_FLOOR_OFFSETS;
    uint numberOfPositions = NUMBER_OF_DEGRADED_FLOOR_POSITIONS;
    if (state == 1) {
      globalAssetOffsets = BASIC_FLOOR_OFFSETS;
      numberOfPositions = NUMBER_OF_BASIC_FLOOR_POSITIONS;
    } else if (state == 2) {
      globalAssetOffsets = EMBELLISHED_FLOOR_OFFSETS;
      numberOfPositions = NUMBER_OF_EMBELLISHED_FLOOR_POSITIONS;
    }

    // uint globalAssetDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 21, 2));
    uint globalAssetDigits = GridHelper.getRandByte(rand, 21);

    string memory assetOffset = string(GridHelper.slice(bytes(globalAssetOffsets), (globalAssetDigits % numberOfPositions)*8, 8));

    return assetOffset;

  }

  function getExpansionPropPosition(uint rand, uint state) internal pure returns (string memory) {
    string memory floorOffsets = DEGRADED_FLOOR_OFFSETS;
    string memory wallOffsets = DEGRADED_WALL_OFFSETS;
    uint numberOfFloorPositions = NUMBER_OF_DEGRADED_FLOOR_POSITIONS;
    uint numberOfWallPositions = NUMBER_OF_DEGRADED_WALL_POSITIONS;
    if (state == 1) {
      floorOffsets = BASIC_FLOOR_OFFSETS;
      wallOffsets = BASIC_WALL_OFFSETS;
      numberOfFloorPositions = NUMBER_OF_BASIC_FLOOR_POSITIONS;
      numberOfWallPositions = NUMBER_OF_BASIC_WALL_POSITIONS;
    } else if (state == 2) {
      floorOffsets = EMBELLISHED_FLOOR_OFFSETS;
      wallOffsets = EMBELLISHED_WALL_OFFSETS;
      numberOfFloorPositions = NUMBER_OF_EMBELLISHED_FLOOR_POSITIONS;
      numberOfWallPositions = NUMBER_OF_EMBELLISHED_WALL_POSITIONS;
    }

    // uint expansionPropDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 23, 2));
    uint expansionPropDigits = GridHelper.getRandByte(rand, 23);
    uint expansionPropsNumber = GlobalNumbers.getExpansionPropsNumber(rand, state);
    if (expansionPropsNumber == 2000 || expansionPropsNumber == 2005 || expansionPropsNumber == 2006 || expansionPropsNumber == 2007) {
      return string(GridHelper.slice(bytes(wallOffsets), (expansionPropDigits % numberOfWallPositions)*8, 8));
    } else {
      // Need to check that the position is not already taken by the global asset
      string memory globalAssetOffset = getGlobalAssetPosition(rand, state);
      string memory expansionPropOffset = string(GridHelper.slice(bytes(floorOffsets), (expansionPropDigits % numberOfFloorPositions)*8, 8));
      if (keccak256(bytes(expansionPropOffset)) == keccak256(bytes(globalAssetOffset))) {
        return string(GridHelper.slice(bytes(floorOffsets), ((expansionPropDigits+1) % numberOfFloorPositions)*8, 8));
      } else {
        return expansionPropOffset;
      }
    }

  }

  function getAllNumbersUsed(uint rand, uint state) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](80);
    string[] memory offsetsUsed = new string[](80);

    for (uint i = 0; i < 6; ++i) {
      numbersUsed[count] = GridHelper.stringToUint(string(GridHelper.slice(bytes(HOLE_TRANSFORM_NUMBERS), i*5, 5)));
      count++;

      (uint holeNumber, string memory holeOffset, uint holeCount) = getHoleNumbers(rand, state, i);
      for (uint j = 0; j < holeCount; ++j) {
        numbersUsed[count] = holeNumber;
        offsetsUsed[count] = string(GridHelper.slice(bytes(holeOffset), j*8, 8));
        count++;
      }

      numbersUsed[count] = GROUP_CLOSE_NUMBER;
      count++;
    }

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, state);
    offsetsUsed[count] = getExpansionPropPosition(rand, state);
    count++;

    numbersUsed[count] = ALL_NOSES_WRAPPER_NUMBER;
    count++;

    numbersUsed[count] = PANEL_NUMBER;
    count++;

    uint gaugeNumber = getGaugeNumber(rand, state);
    numbersUsed[count] = gaugeNumber;
    offsetsUsed[count] = "-139-076";
    count++;

    numbersUsed[count] = gaugeNumber;
    offsetsUsed[count] = "0174-245";
    count++;

    numbersUsed[count] = getMidEyesNumber(rand, state);
    offsetsUsed[count] = "-140-079";
    count++;

    numbersUsed[count] = getTopEyesNumber(rand, state);
    offsetsUsed[count] = "-140-079";
    count++;

    numbersUsed[count] = JUST_NOSES_WRAPPER_NUMBER;
    count++;

    numbersUsed[count] = getNoseNumbers(rand, state);
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    numbersUsed[count] = GlobalNumbers.getGlobalAssetNumber(rand, state, 0);
    offsetsUsed[count] = getGlobalAssetPosition(rand, state);
    count++;

    uint[5] memory characterNumbers = GlobalNumbers.getCharacterNumberAndLeverNumber(rand, state, false);
    numbersUsed[count] = characterNumbers[0];
    count++;

    for (uint i = 1; i <= 2; ++i) {
      numbersUsed[count] = characterNumbers[i];
      offsetsUsed[count] = "03120180";
      count++;
    }

    numbersUsed[count] = characterNumbers[3];
    // offsetsUsed[count] = getCharacterPosition(characterNumbers[3], digits, state);
    offsetsUsed[count] = "03120180";
    count++;

    numbersUsed[count] = characterNumbers[4];
    count++;

    return (numbersUsed, offsetsUsed);
  }

  function getMachine(uint rand, uint state) external view returns (string memory) {

    string memory output = "";

    // get all numbers used, returns a uint[] and a string[] of offsets
    (uint[] memory allNumbers, string[] memory allOffsets) = getAllNumbersUsed(rand, state);

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