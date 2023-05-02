// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

import "../../Noise.sol";

contract Drills {

  AssetRetriever internal _assetRetriever;

  // Floor
  string internal constant SMALL_OFFSETS = "06240210";
  string internal constant LARGE_OFFSETS = "0468027003120360";
  string internal constant OUT_WALL_OFFSETS = "00000180";
  string internal constant FLAT_WALL_OFFSETS = "03120000015600900000036000000540";
  uint internal constant NUMBER_OF_FLAT_WALL_POSITIONS = 4;

  string internal constant DRILL_POSITION_NUMBERS = "130011300213003130041300513006";

  string internal constant HOLE_WRINKLE_NUMBERS = "1500815018";

  string internal constant HOLE_WRINKLE_WRAPPER_NUMBERS = "150191502015021150221502315024150251502615027150281502915030";

  string internal constant DRILL_PARTS_WRAPPER_NUMBERS = "150351503615037150381503915040";

  string internal constant TUBE_NUMBERS = "1504115003150021501415016";

  string internal constant BIT_NUMBERS = "09012090150901415010150111501215013";

  string internal constant CONNECTOR_NUMBERS = "1500415005150061500710026";

  string internal constant EYES_GAUGE_NUMBERS = "0402704029040300504404028";

  string internal constant HEAD_NUMBERS = "070080700915015";

  uint internal constant HOLE_AND_WRINKLE_WRAPPER_NUMBER = 15031;

  uint internal constant ALL_DRILL_WRAPPER_NUMBER = 15032;

  uint internal constant FIXTURE_NUMBER = 15000;

  uint internal constant DRILL_MASK_WRAPPER_NUMBER = 15033;

  uint internal constant DRILL_MASK_NUMBER = 15034;

  uint internal constant GROUP_CLOSE_NUMBER = 13000;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getDrillPositionNumbers(uint rand, int baseline) internal pure returns (uint[] memory, uint) {
    // 6 possible positions for the drill
    // Embellished should have more drills and degraded should have less
    // There must be at least one drill
    uint[] memory drillPositions = getPositionOfDrills(rand, baseline);

    uint[] memory drillNumbers = new uint[](6);

    uint count;
    for (uint i = 0; i < 6; ++i) {
      if (drillPositions[i] != 0) {
        drillNumbers[count] = GridHelper.stringToUint(string(GridHelper.slice(bytes(DRILL_POSITION_NUMBERS), i*5, 5)));
        count++;
      }
    }

    return (drillNumbers, count);
  }

  function getDrillBitNumber(uint rand, uint version, int baseline) internal pure returns (uint) {
    uint bitDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 18+version)] + baseline);

    return GridHelper.getSingleObject(BIT_NUMBERS, bitDigits, 7, 5);
  }

  function getTubeNumbers(uint rand, uint version, int baseline) internal pure returns (uint[2] memory) {
    uint tubeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12+version)] + baseline);

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

  function getConnectorNumbers(uint rand, int baseline) internal pure returns (uint[4] memory) {
    uint connectorDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 15)] + baseline);

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

  function getEyesGaugeNumber(uint rand, uint version, int baseline) internal pure returns (uint) {
    uint eyesDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 24+version)] + baseline);

    // This tube does not work with the heads
    if (getTubeNumbers(rand, version, baseline)[0] == 15041) {
      return 0;
    }

    return GridHelper.getSingleObject(EYES_GAUGE_NUMBERS, eyesDigits, 5, 5);
  }

  function getHeadNumbers(uint rand, uint version, int baseline) internal pure returns (uint[2] memory) {
    uint headDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 2+version)] + baseline);

    // This tube does not work with the heads
    if (getTubeNumbers(rand, version, baseline)[0] == 15041) {
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

  function getPositionOfDrills(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint numberOfDrillsDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 28)] + baseline);

    uint[] memory numberOfDrillsProbabilitiesArray = GridHelper.createEqualProbabilityArray(6);

    uint numOfDrills;

    for (uint i = 0; i < 5; i++) {
      if (numberOfDrillsDigits < numberOfDrillsProbabilitiesArray[i]) {
        numOfDrills = i + 1;
        break;
      }
    }

    if (numOfDrills == 0) {
      numOfDrills = 6;
    }

    // distribute the drills randomly
    uint[] memory drillNumbers = new uint[](6);
    for (uint i = 0; i < numOfDrills; i++) {
      uint drillDigit = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12+i)] + baseline) % 6;
      // check if the drill is already used and if so, find the next available one
      while (drillNumbers[drillDigit] != 0) {
        drillDigit = (drillDigit + 1) % 6;
      }
      drillNumbers[drillDigit] = 1;
    }

    return drillNumbers;
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

  function getCharacterPosition(uint characterNumber) internal pure returns(string memory) {
    if (characterNumber == 14000 || characterNumber == 14002 || characterNumber == 14004) {
      return "03120180";
    } else {
      return "00000000";
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](200);
    string[] memory offsetsUsed = new string[](200);

    numbersUsed[count] = GlobalNumbers.getFlatWallNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getSingleOffset(rand, baseline, FLAT_WALL_OFFSETS, NUMBER_OF_FLAT_WALL_POSITIONS);
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