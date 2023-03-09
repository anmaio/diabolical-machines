// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

import "../../Noise.sol";

contract Drills {

  AssetRetriever internal _assetRetriever;

  Noise internal _noise;

  // Floor
  string internal constant FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_FLOOR_POSITIONS = 2;

  // Wall
  string internal constant WALL_OFFSETS = "01560090015602700312000003120180";
  uint internal constant NUMBER_OF_WALL_POSITIONS = 4;

  string internal constant DRILL_POSITION_NUMBERS = "190011900219003190041900519006";

  string internal constant HOLE_WRINKLE_NUMBERS = "1300813018";

  string internal constant HOLE_WRINKLE_WRAPPER_NUMBERS = "130191302013021130221302313024130251302613027130281302913030";

  string internal constant DRILL_PARTS_WRAPPER_NUMBERS = "130351303613037130381303913040";

  string internal constant TUBE_NUMBERS = "1304113003130021301413016";

  string internal constant BIT_NUMBERS = "09012090130901413010130111301213013";

  string internal constant CONNECTOR_NUMBERS = "1300413005130061300710026";

  string internal constant EYES_GAUGE_NUMBERS = "0402704029040300504404028";

  string internal constant HEAD_NUMBERS = "070080700913015";
  // uint internal constant HEAD_NUMBERS_TWO = 13015;

  uint internal constant HOLE_AND_WRINKLE_WRAPPER_NUMBER = 13031;

  uint internal constant ALL_DRILL_WRAPPER_NUMBER = 13032;

  uint internal constant FIXTURE_NUMBER = 13000;

  uint internal constant DRILL_MASK_WRAPPER_NUMBER = 13033;

  uint internal constant DRILL_MASK_NUMBER = 13034;

  uint internal constant GROUP_CLOSE_NUMBER = 19000;

  constructor(address assetRetriever, address noise) {
    _assetRetriever = AssetRetriever(assetRetriever);
    _noise = Noise(noise);
  }

  function getDrillPositionNumbers(uint rand, int baseline) internal view returns (uint[] memory, uint) {
    // 6 possible positions for the drill
    // Embellished should have more drills and degraded should have less
    // There must be at least one drill
    uint drillChance = 128; // 50%
    // uint positionsDigits = GridHelper.bytesToUint(GridHelper.slice(rand, 12, 14));

    uint[] memory drillPositions = new uint[](6);
    uint count;
    for (uint i = 0; i < 6; ++i) {
      uint positionsDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12+i)] + baseline);
      if ((positionsDigits < drillChance) || (count == 0 && i == 5)) {
        drillPositions[count] = GridHelper.stringToUint(string(GridHelper.slice(bytes(DRILL_POSITION_NUMBERS), i*5, 5)));
        count++;
      }
    }

    return (drillPositions, count);
  }

  function getDrillBitNumber(uint rand, uint version, int baseline) internal view returns (uint) {
    uint bitDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 18+version)] + baseline);

    return GridHelper.getSingleObject(BIT_NUMBERS, bitDigits, 7);
  }

  function getTubeNumbers(uint rand, uint version, int baseline) internal view returns (uint[2] memory) {
    uint tubeDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12+version)] + baseline);

    uint[] memory bitProbabilitiesArray = GridHelper.createEqualProbabilityArray(3);

    uint[] memory tubeNumbersArray = GridHelper.setUintArrayFromString(TUBE_NUMBERS, 5, 5);

    if (tubeDigits < bitProbabilitiesArray[0]) {
      return [tubeNumbersArray[0], 0];
    } else if (tubeDigits < bitProbabilitiesArray[1]) {
      return [tubeNumbersArray[1], tubeNumbersArray[2]];
    } else {
      return [tubeNumbersArray[3], tubeNumbersArray[4]];
    }
  }

  function getConnectorNumbers(uint rand, int baseline) internal view returns (uint[4] memory) {
    uint connectorDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 15)] + baseline);

    uint[] memory connectorprobabilitiesArray = GridHelper.createEqualProbabilityArray(5);

    uint[] memory connectorNumbersArray = GridHelper.setUintArrayFromString(CONNECTOR_NUMBERS, 5, 5);

    if (connectorDigits < connectorprobabilitiesArray[0]) {
      return [uint(0), 0, 0, 0];
    } else if (connectorDigits < connectorprobabilitiesArray[1]) {
      return [0, connectorNumbersArray[3], connectorNumbersArray[0], connectorNumbersArray[2]];
    } else if (connectorDigits < connectorprobabilitiesArray[2]) {
      return [0, connectorNumbersArray[3], connectorNumbersArray[1], connectorNumbersArray[2]];
    } else if (connectorDigits < connectorprobabilitiesArray[3]) {
      return [connectorNumbersArray[4], connectorNumbersArray[3], connectorNumbersArray[0], connectorNumbersArray[2]];
    } else {
      return [connectorNumbersArray[4], connectorNumbersArray[3], connectorNumbersArray[1], connectorNumbersArray[2]];
    }
  }

  function getEyesGaugeNumber(uint rand, uint version, int baseline) internal view returns (uint) {
    uint eyesDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 24+version)] + baseline);

    // This tube does not work with the heads
    if (getTubeNumbers(rand, version, baseline)[0] == 13041) {
      return 0;
    }

    return GridHelper.getSingleObject(EYES_GAUGE_NUMBERS, eyesDigits, 5);
  }

  function getHeadNumbers(uint rand, uint version, int baseline) internal view returns (uint[2] memory) {
    uint headDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 2+version)] + baseline);

    // This tube does not work with the heads
    if (getTubeNumbers(rand, version, baseline)[0] == 13041) {
      return [uint(0), 0];
    }

    uint[] memory headProbabilitiesArray = GridHelper.createEqualProbabilityArray(3);

    uint[] memory headNumbersArray = GridHelper.setUintArrayFromString(HEAD_NUMBERS, 3, 5);

    if (headDigits < headProbabilitiesArray[0]) {
      return [headNumbersArray[0], 0];
    } else if (headDigits < headProbabilitiesArray[1]) {
      return [headNumbersArray[1], 0];
    } else {
      return [headNumbersArray[0], headNumbersArray[2]];
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

  function getGlobalAssetPosition(uint rand) internal pure returns (string memory) {
    string memory globalAssetOffsets = FLOOR_OFFSETS;
    uint numberOfPositions = NUMBER_OF_FLOOR_POSITIONS;

    // uint globalAssetDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 21, 2));
    uint globalAssetDigits = GridHelper.getRandByte(rand, 21);

    string memory assetOffset = string(GridHelper.slice(bytes(globalAssetOffsets), (globalAssetDigits % numberOfPositions)*8, 8));

    return assetOffset;

  }

  function getExpansionPropPosition(uint rand, int baseline) internal pure returns (string memory) {
    string memory floorOffsets = FLOOR_OFFSETS;
    string memory wallOffsets = WALL_OFFSETS;
    uint numberOfFloorPositions = NUMBER_OF_FLOOR_POSITIONS;
    uint numberOfWallPositions = NUMBER_OF_WALL_POSITIONS;

    // uint expansionPropDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 23, 2));
    uint expansionPropDigits = GridHelper.getRandByte(rand, 23);
    uint expansionPropsNumber = GlobalNumbers.getExpansionPropsNumber(rand, baseline);
    if (expansionPropsNumber == 2000 || expansionPropsNumber == 2005 || expansionPropsNumber == 2006 || expansionPropsNumber == 2007) {
      return string(GridHelper.slice(bytes(wallOffsets), (expansionPropDigits % numberOfWallPositions)*8, 8));
    } else {
      // Need to check that the position is not already taken by the global asset
      string memory globalAssetOffset = getGlobalAssetPosition(rand);
      string memory expansionPropOffset = string(GridHelper.slice(bytes(floorOffsets), (expansionPropDigits % numberOfFloorPositions)*8, 8));
      if (keccak256(bytes(expansionPropOffset)) == keccak256(bytes(globalAssetOffset))) {
        return string(GridHelper.slice(bytes(floorOffsets), ((expansionPropDigits+1) % numberOfFloorPositions)*8, 8));
      } else {
        return expansionPropOffset;
      }
    }
  }

  function getCharacterPosition(uint characterNumber, uint rand, int baseline) internal view returns(string memory) {
    uint characterPositionDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 25)] + baseline);

    if ((characterNumber == 20000 || characterNumber == 20002 || characterNumber == 20004) && keccak256(bytes(getGlobalAssetPosition(rand))) != keccak256(bytes("04680270")) && keccak256(bytes(getExpansionPropPosition(rand, baseline))) != keccak256(bytes("04680270"))) {
      return "01560270";
    } else {
      return "03120180";
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public view returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](200);
    string[] memory offsetsUsed = new string[](200);

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, baseline);
    offsetsUsed[count] = getExpansionPropPosition(rand, baseline);
    count++;

    (uint[] memory drillPositions, uint numberOfDrills) = getDrillPositionNumbers(rand, baseline);
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

      numbersUsed[count] = getDrillBitNumber(rand, i, baseline);
      count++;

      uint[2] memory tubeNumbers = getTubeNumbers(rand, i, baseline);
      numbersUsed[count] = tubeNumbers[0];
      count++;

      uint[2] memory headNumbers = getHeadNumbers(rand, i, baseline);
      numbersUsed[count] = headNumbers[0];
      offsetsUsed[count] = "-312-190";
      count++;

      numbersUsed[count] = getEyesGaugeNumber(rand, i, baseline);
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

    uint[4] memory connectorPositions = getConnectorNumbers(rand, baseline);
    for (uint i = 0; i < connectorPositions.length; ++i) {
      numbersUsed[count] = connectorPositions[i];
      count++;
    }

    numbersUsed[count] = GlobalNumbers.getGlobalAssetNumber(rand, baseline);
    offsetsUsed[count] = getGlobalAssetPosition(rand);
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