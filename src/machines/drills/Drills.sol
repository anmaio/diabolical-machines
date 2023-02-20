// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

contract Drills {
  AssetRetriever internal _assetRetriever;

  // Floor
  string internal constant DEGRADED_FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_DEGRADED_FLOOR_POSITIONS = 2;
  string internal constant BASIC_FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_BASIC_FLOOR_POSITIONS = 2;
  string internal constant EMBELLISHED_FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_EMBELLISHED_FLOOR_POSITIONS = 2;

  // Wall
  string internal constant DEGRADED_WALL_OFFSETS = "01560090015602700312000003120180";
  uint internal constant NUMBER_OF_DEGRADED_WALL_POSITIONS = 4;
  string internal constant BASIC_WALL_OFFSETS = "01560090015602700312000003120180";
  uint internal constant NUMBER_OF_BASIC_WALL_POSITIONS = 4;
  string internal constant EMBELLISHED_WALL_OFFSETS = "01560090015602700312000003120180";
  uint internal constant NUMBER_OF_EMBELLISHED_WALL_POSITIONS = 4;

  string internal constant DRILL_POSITION_NUMBERS = "190011900219003190041900519006";

  string internal constant HOLE_WRINKLE_NUMBERS = "1300813018";

  string internal constant HOLE_WRINKLE_WRAPPER_NUMBERS = "130191302013021130221302313024130251302613027130281302913030";

  string internal constant DRILL_PARTS_WRAPPER_NUMBERS = "130351303613037130381303913040";

  string internal constant TUBE_NUMBERS = "1304113003130021301413016";

  string internal constant BIT_NUMBERS_ONE = "901290139014";
  string internal constant BIT_NUMBERS_TWO = "13010130111301213013";

  string internal constant BIT_PROBABILITIES = "010203183366051530507085103060759095";

  string internal constant CONNECTOR_NUMBERS = "1300413005130061300710026";

  string internal constant EYES_GAUGE_NUMBERS = "50444027402840294030";

  string internal constant HEAD_NUMBERS_ONE = "70087009";
  uint internal constant HEAD_NUMBERS_TWO = 13015;

  uint internal constant HOLE_AND_WRINKLE_WRAPPER_NUMBER = 13031;

  uint internal constant ALL_DRILL_WRAPPER_NUMBER = 13032;

  uint internal constant FIXTURE_NUMBER = 13000;

  uint internal constant DRILL_MASK_WRAPPER_NUMBER = 13033;

  uint internal constant DRILL_MASK_NUMBER = 13034;

  uint internal constant GROUP_CLOSE_NUMBER = 19000;

  // likelyhood of a drill appearing in a position for a given state
  string internal constant DRILL_CHANCE = "123";

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getDrillPositionNumbers(bytes memory digits, uint state) internal pure returns (uint[] memory, uint) {
    // 6 possible positions for the drill
    // Embellished should have more drills and degraded should have less
    // There must be at least one drill
    uint[] memory drillChancesArray = GridHelper.setUintArrayFromString(DRILL_CHANCE, 3, 1);
    uint drillChance = drillChancesArray[state];
    uint positionsDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 12, 14));

    uint[] memory drillPositions = new uint[](6);
    uint count;
    for (uint i = 0; i < 6; ++i) {
      if ((positionsDigits % 4 < drillChance) || (count == 0 && i == 5)) {
        drillPositions[count] = GridHelper.stringToUint(string(GridHelper.slice(bytes(DRILL_POSITION_NUMBERS), i*5, 5)));
        count++;
      }
      positionsDigits /= 100;
    }

    return (drillPositions, count);
  }

  function getDrillBitNumber(bytes memory digits, uint state, uint version) internal pure returns (uint) {
    uint[] memory bitNumbersArrayOne = GridHelper.setUintArrayFromString(BIT_NUMBERS_ONE, 3, 4);
    uint[] memory bitNumbersArrayTwo = GridHelper.setUintArrayFromString(BIT_NUMBERS_TWO, 4, 5);
    uint bitDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 18+version, 2));

    // 01 02 03 18 33 66
    // 05 15 30 50 70 85
    // 10 30 60 75 90 95
    // 010203183366051530507085103060759095

    string memory bitProbabilitiesPart = string(GridHelper.slice(bytes(BIT_PROBABILITIES), state*12, 12));
    uint[] memory bitProbabilitiesArray = GridHelper.setUintArrayFromString(bitProbabilitiesPart, 6, 2);

    if (bitDigits < bitProbabilitiesArray[0]) {
      return bitNumbersArrayTwo[1];
    } else if (bitDigits < bitProbabilitiesArray[1]) {
      return bitNumbersArrayTwo[2];
    } else if (bitDigits < bitProbabilitiesArray[2]) {
      return bitNumbersArrayTwo[3];
    } else if (bitDigits < bitProbabilitiesArray[3]) {
      return bitNumbersArrayOne[1];
    } else if (bitDigits < bitProbabilitiesArray[4]) {
      return bitNumbersArrayOne[2];
    } else if (bitDigits < bitProbabilitiesArray[5]) {
      return bitNumbersArrayOne[0];
    } else {
      return bitNumbersArrayTwo[0];
    }

  }

  function getTubeNumbers(bytes memory digits, uint state, uint version) internal pure returns (uint[2] memory) {
    uint[] memory tubeNumbersArray = GridHelper.setUintArrayFromString(TUBE_NUMBERS, 5, 5);
    uint tubeDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 12+version, 2));

    if (state == 0) {
      return [tubeNumbersArray[0], 0];
    } else if (state == 1) {
      if (tubeDigits < 70) {
        return [tubeNumbersArray[1], tubeNumbersArray[2]];
      } else {
        return [tubeNumbersArray[3], tubeNumbersArray[4]];
      }
    } else {
      if (tubeDigits < 30) {
        return [tubeNumbersArray[1], tubeNumbersArray[2]];
      } else {
        return [tubeNumbersArray[3], tubeNumbersArray[4]];
      }
    }
  }

  function getConnectorNumbers(bytes memory digits, uint state) internal pure returns (uint[] memory) {
    uint[] memory connectorNumbersArray = GridHelper.setUintArrayFromString(CONNECTOR_NUMBERS, 5, 5);
    uint connectorDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 15, 2));

    uint[] memory connectorNumbers = new uint[](4);

    if (state == 0 && connectorDigits % 7 != 0 || state == 1 && connectorDigits % 2 != 0 || state == 2 && connectorDigits == 99) {
      return connectorNumbers;
    }

    connectorNumbers[3] = connectorNumbersArray[2];
    connectorNumbers[1] = connectorNumbersArray[3];

    if (connectorDigits < 50) {
      connectorNumbers[2] = connectorNumbersArray[0];
    } else {
      connectorNumbers[2] = connectorNumbersArray[1];
    }

    if (state == 0 && connectorDigits % 50 == 0) {
      connectorNumbers[0] = connectorNumbersArray[4];
    } else if (state == 1 && connectorDigits % 5 == 0) {
      connectorNumbers[0] = connectorNumbersArray[4];
    } else if (state == 2 && connectorDigits % 2 == 0) {
      connectorNumbers[0] = connectorNumbersArray[4];
    }

    return connectorNumbers;
  }

  function getEyesGaugeNumber(bytes memory digits, uint state, uint version) internal pure returns (uint) {
    uint[] memory eyesGaugeNumbersArray = GridHelper.setUintArrayFromString(EYES_GAUGE_NUMBERS, 5, 4);
    uint eyesDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 24+version, 2));

    if (state == 0) {
      return 0;
    }

    if (eyesDigits < 20) {
      return eyesGaugeNumbersArray[0];
    }

    if (state == 1) {
      if (eyesDigits < 30) {
        return eyesGaugeNumbersArray[1];
      } else if (eyesDigits < 40) {
        return eyesGaugeNumbersArray[2];
      } else if (eyesDigits < 70) {
        return eyesGaugeNumbersArray[3];
      } else {
        return eyesGaugeNumbersArray[4];
      }
    } else {
      if (eyesDigits < 30) {
        return eyesGaugeNumbersArray[4];
      } else if (eyesDigits < 40) {
        return eyesGaugeNumbersArray[3];
      } else if (eyesDigits < 70) {
        return eyesGaugeNumbersArray[2];
      } else {
        return eyesGaugeNumbersArray[1];
      }
    }
  }

  function getHeadNumbers(bytes memory digits, uint state, uint version) internal pure returns (uint[2] memory) {
    uint[] memory headNumbersArray = GridHelper.setUintArrayFromString(HEAD_NUMBERS_ONE, 2, 4);
    uint headDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 2+version, 2));

    if (state == 0) {
      return [uint(0), 0];
    }

    if (headDigits < 50) {
      if ((state == 2 && headDigits % 2 == 0) || (state == 1 && headDigits % 10 == 0)) {
        return [headNumbersArray[0], HEAD_NUMBERS_TWO];
      } else {
        return [headNumbersArray[0], 0];
      }
    } else {
      return [headNumbersArray[1], 0];
    }
  }

  function getHoleAndWrinkleNumbers(uint version) internal pure returns (uint[] memory) {
    uint[] memory holeWrinkleNumbersArray = GridHelper.setUintArrayFromString(HOLE_WRINKLE_NUMBERS, 2, 5);
    uint[] memory holeWrinkleWrapperNumbersArray = GridHelper.setUintArrayFromString(HOLE_WRINKLE_WRAPPER_NUMBERS, 12, 5);

    uint[] memory numbersUsed = new uint[](6);

    // wrinkle
    numbersUsed[0] = holeWrinkleWrapperNumbersArray[version+6]; 
    numbersUsed[1] = holeWrinkleNumbersArray[1];
    numbersUsed[2] = GROUP_CLOSE_NUMBER;

    // hole
    numbersUsed[3] = holeWrinkleWrapperNumbersArray[version];
    numbersUsed[4] = holeWrinkleNumbersArray[0];
    numbersUsed[5] = GROUP_CLOSE_NUMBER;

    return numbersUsed;
  }

  function getDrillPartsWrapperNumber(uint version) internal pure returns (uint) {
    uint[] memory drillPartsWrapperNumbersArray = GridHelper.setUintArrayFromString(DRILL_PARTS_WRAPPER_NUMBERS, 6, 5);
    return drillPartsWrapperNumbersArray[version];
  }

  function getGlobalAssetPosition(bytes memory digits, uint state) internal pure returns (string memory) {
    string memory globalAssetOffsets = DEGRADED_FLOOR_OFFSETS;
    uint numberOfPositions = NUMBER_OF_DEGRADED_FLOOR_POSITIONS;
    if (state == 1) {
      globalAssetOffsets = BASIC_FLOOR_OFFSETS;
      numberOfPositions = NUMBER_OF_BASIC_FLOOR_POSITIONS;
    } else if (state == 2) {
      globalAssetOffsets = EMBELLISHED_FLOOR_OFFSETS;
      numberOfPositions = NUMBER_OF_EMBELLISHED_FLOOR_POSITIONS;
    }

    uint globalAssetDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 21, 2));

    string memory assetOffset = string(GridHelper.slice(bytes(globalAssetOffsets), (globalAssetDigits % numberOfPositions)*8, 8));

    return assetOffset;

  }

  function getExpansionPropPosition(bytes memory digits, uint state) internal pure returns (string memory) {
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

    uint expansionPropDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 23, 2));
    uint expansionPropsNumber = GlobalNumbers.getExpansionPropsNumber(digits, state);
    if (expansionPropsNumber == 2000 || expansionPropsNumber == 2005 || expansionPropsNumber == 2006 || expansionPropsNumber == 2007) {
      return string(GridHelper.slice(bytes(wallOffsets), (expansionPropDigits % numberOfWallPositions)*8, 8));
    } else {
      // Need to check that the position is not already taken by the global asset
      string memory globalAssetOffset = getGlobalAssetPosition(digits, state);
      string memory expansionPropOffset = string(GridHelper.slice(bytes(floorOffsets), (expansionPropDigits % numberOfFloorPositions)*8, 8));
      if (keccak256(bytes(expansionPropOffset)) == keccak256(bytes(globalAssetOffset))) {
        return string(GridHelper.slice(bytes(floorOffsets), ((expansionPropDigits+1) % numberOfFloorPositions)*8, 8));
      } else {
        return expansionPropOffset;
      }
    }

  }

  function getAllNumbersUsed(bytes memory digits, uint state) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](200);
    string[] memory offsetsUsed = new string[](200);

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(digits, state);
    offsetsUsed[count] = getExpansionPropPosition(digits, state);
    count++;

    (uint[] memory drillPositions, uint numberOfDrills) = getDrillPositionNumbers(digits, state);
    for (uint i = 0; i < numberOfDrills; ++i) {
      numbersUsed[count] = drillPositions[i];
      count++;

      numbersUsed[count] = ALL_DRILL_WRAPPER_NUMBER;
      count++;

      numbersUsed[count] = HOLE_AND_WRINKLE_WRAPPER_NUMBER;
      count++;
      uint[] memory holeAndWrinkleNumbers = getHoleAndWrinkleNumbers(i);
      for (uint j = 0; j < holeAndWrinkleNumbers.length; ++j) {
        numbersUsed[count] = holeAndWrinkleNumbers[j];
        count++;
      }
      numbersUsed[count] = GROUP_CLOSE_NUMBER;
      count++;
      numbersUsed[count] = GROUP_CLOSE_NUMBER;
      count++;

      numbersUsed[count] = DRILL_MASK_WRAPPER_NUMBER;
      count++;

      numbersUsed[count] = getDrillPartsWrapperNumber(i);
      count++;

      numbersUsed[count] = getDrillBitNumber(digits, state, i);
      count++;

      uint[2] memory tubeNumbers = getTubeNumbers(digits, state, i);
      numbersUsed[count] = tubeNumbers[0];
      count++;

      uint[2] memory headNumbers = getHeadNumbers(digits, state, i);
      numbersUsed[count] = headNumbers[0];
      offsetsUsed[count] = "-312-190";
      count++;

      numbersUsed[count] = getEyesGaugeNumber(digits, state, i);
      offsetsUsed[count] = "0000-015";
      count++;

      numbersUsed[count] = headNumbers[1];
      count++;

      numbersUsed[count] = tubeNumbers[1];
      count++;

      numbersUsed[count] = GROUP_CLOSE_NUMBER;
      count++;

      numbersUsed[count] = GROUP_CLOSE_NUMBER;
      count++;

      numbersUsed[count] = DRILL_MASK_NUMBER;
      count++;

      numbersUsed[count] = GROUP_CLOSE_NUMBER;
      count++;

      numbersUsed[count] = FIXTURE_NUMBER;
      count++;
      numbersUsed[count] = GROUP_CLOSE_NUMBER;
      count++;

      numbersUsed[count] = GROUP_CLOSE_NUMBER;
      count++;
    }

    uint[] memory connectorPositions = getConnectorNumbers(digits, state);
    for (uint i = 0; i < connectorPositions.length; ++i) {
      numbersUsed[count] = connectorPositions[i];
      count++;
    }

    numbersUsed[count] = GlobalNumbers.getGlobalAssetNumber(digits, state, 0);
    offsetsUsed[count] = getGlobalAssetPosition(digits, state);
    count++;

    uint[5] memory characterNumbers = GlobalNumbers.getCharacterNumberAndLeverNumber(digits, state, false);
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

  function getMachine(bytes memory digits, uint state) external view returns (string memory) {

    string memory output = "";

    // get all numbers used, returns a uint[] and a string[] of offsets
    (uint[] memory allNumbers, string[] memory allOffsets) = getAllNumbersUsed(digits, state);

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