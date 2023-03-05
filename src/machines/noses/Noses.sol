// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

import "../../Noise.sol";

contract Noses {
  
  AssetRetriever internal _assetRetriever;

  Noise internal _noise;

  // Floor
  string internal constant FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_FLOOR_POSITIONS = 2;

  // Wall
  string internal constant WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_WALL_POSITIONS = 5;

  string internal constant NOSE_NUMBERS = "160021600316001";
  // string internal constant NOSE_PROBABILITIES = "15 32 42 08 41 68 02 61 79";

  // c-gauge-a
  // c-feedback-c
  // c-feedback-a
  // c-feedback-d
  // c-feedback-b

  string internal constant GAUGE_NUMBERS = "0400904002040000400304001";

  // string internal constant GAUGE_PROBABILITIES = "077128153166179051102140204230013051102166252";

  string internal constant MID_EYE_NUMBERS = "000000500205006";
  // string internal constant MID_EYE_PROBABILITIES = "077102102153102230";

  string internal constant TOP_EYE_NUMBERS = "000000500005004";
  // string internal constant TOP_EYE_PROBABILITIES = "077102102153102230";

  // None
  // C-HOLE-A
  // C-HOLE-FX-A
  // C-HOLE-FX-B
  // C-HOLE-FX-C
  // C-HOLE-FX-D

  string internal constant HOLE_NUMBERS = "000000801116004160051600616007";

  // string internal constant HOLE_PROBABILITIES = "051071082087089051089128166179020064110179252";

  string internal constant HOLE_TRANSFORM_NUMBERS = "190011900219003190041900519006";

  uint internal constant PANEL_NUMBER = 16000;

  uint internal constant FLIP_WRAPPER_NUMBER = 19010;

  uint internal constant ALL_NOSES_WRAPPER_NUMBER = 16012;
  uint internal constant JUST_NOSES_WRAPPER_NUMBER = 16013;

  uint internal constant GROUP_CLOSE_NUMBER = 19000;

  constructor(address assetRetriever, address noise) {
    _assetRetriever = AssetRetriever(assetRetriever);
    _noise = Noise(noise);
  }

  function getNoseNumbers(uint rand, int baseline) internal view returns (uint) {
    uint noseDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12)] + baseline);

    return GridHelper.getSingleObject(NOSE_NUMBERS, noseDigits, 3);
  }

  function getGaugeNumber(uint rand, int baseline) internal view returns (uint) {
    uint gaugeDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 14)] + baseline);

    return GridHelper.getSingleObject(GAUGE_NUMBERS, gaugeDigits, 5);
  }

  function getMidEyesNumber(uint rand, int baseline) internal view returns (uint) {
    uint midEyesDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 15)] + baseline);

    uint noseNumber = getNoseNumbers(rand, baseline);

    // this nose does not work with midEyesNumbersArray[0]
    if (noseNumber == 16001) {
      return 0;
    }

    return GridHelper.getSingleObject(MID_EYE_NUMBERS, midEyesDigits, 3);
  }

  function getTopEyesNumber(uint rand, int baseline) internal view returns (uint) {
    uint topEyesDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 16)] + baseline);

    return GridHelper.getSingleObject(TOP_EYE_NUMBERS, topEyesDigits, 3);
  }

  function getHoleNumbers(uint rand, uint version, int baseline) internal view returns (uint, string memory, uint count) {
    uint holeDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 24+version)] + baseline);

    uint holeNumber = GridHelper.getSingleObject(HOLE_NUMBERS, holeDigits, 6);

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

  function getAllNumbersUsed(uint rand, int baseline) public view returns (uint[] memory, string[] memory) {
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

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, baseline);
    offsetsUsed[count] = getExpansionPropPosition(rand, baseline);
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
    // offsetsUsed[count] = getCharacterPosition(characterNumbers[3], digits, state);
    offsetsUsed[count] = "03120180";
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