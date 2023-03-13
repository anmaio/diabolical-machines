// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

import "../../Noise.sol";

contract Apparatus {
  
  AssetRetriever internal _assetRetriever;

  Noise internal _noise;

  // 1,2,3 and 4,5
  string internal constant SUBJECT_WRAPPER_NUMBERS = "0802608027080280802908030";

  string internal constant SUBJECT_NUMBERS = "0801208000080220802308024";

  string internal constant RIGHT_BASE_NUMBERS = "000000803708008";

  string internal constant MID_BASE_NUMBERS = "08039080380800508040";

  string internal constant LEFT_BASE_NUMBERS = "08039080380800508040070070403504037";

  string internal constant BOX_NUMBERS = "080310803208033080340803608035";

  string internal constant BASE_RUNNER_NUMBERS = "0802008021";

  string internal constant MID_TOP_OBJECT_NUMBERS = "080160801308017080180801905038";

  string internal constant LEFT_TOP_OBJECT_NUMBERS = "000000400304000040010400408041";

  string internal constant POSSIBLE_CHARACTER_POSITIONS = "00000000-1560090-3120180";

  // Floor
  string internal constant FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_FLOOR_POSITIONS = 2;

  // Wall
  string internal constant WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_WALL_POSITIONS = 5;

  uint internal constant ALL_DRILL_WRAPPER_NUMBER = 8037;

  constructor(address assetRetriever, address noise) {
    _assetRetriever = AssetRetriever(assetRetriever);
    _noise = Noise(noise);
  }

  function getSubject(uint rand, int baseline) internal view returns (uint[] memory) {
    uint subjectDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12)] + baseline);

    uint[] memory numbersUsed = new uint[](5);

    uint[] memory subjectWrapperNumbersArray = GridHelper.setUintArrayFromString(SUBJECT_WRAPPER_NUMBERS, 5, 5);

    uint rightCubeNumber = getRightBase(rand, baseline);

    if (rightCubeNumber == 0) {
      numbersUsed[0] = subjectWrapperNumbersArray[0];
      numbersUsed[1] = subjectWrapperNumbersArray[1];
      numbersUsed[2] = GridHelper.getSingleObject(SUBJECT_NUMBERS, subjectDigits, 5);
      numbersUsed[3] = subjectWrapperNumbersArray[2];
    } else {
      numbersUsed[0] = subjectWrapperNumbersArray[3];
      numbersUsed[1] = GridHelper.getSingleObject(SUBJECT_NUMBERS, subjectDigits, 5);
      numbersUsed[2] = subjectWrapperNumbersArray[4];
      numbersUsed[3] = 0;
    }

    return numbersUsed;
  }

  function getRightBase(uint rand, int baseline) internal view returns (uint) {
    uint rightBaseDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 13)] + baseline);

    return GridHelper.getSingleObject(RIGHT_BASE_NUMBERS, rightBaseDigits, 3);
  }

  function getMidBase(uint rand, int baseline) internal view returns (uint) {
    uint midBaseDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 14)] + baseline);

    return GridHelper.getSingleObject(MID_BASE_NUMBERS, midBaseDigits, 4);
  }

  function getLeftBase(uint rand, int baseline) internal view returns (uint[2] memory) {
    uint leftBaseDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 15)] + baseline);

    uint[] memory leftBaseProbabilitiesArray = GridHelper.createEqualProbabilityArray(7);

    uint[] memory leftBaseNumbersArray = GridHelper.setUintArrayFromString(LEFT_BASE_NUMBERS, 7, 5);

    if (leftBaseDigits < leftBaseProbabilitiesArray[0]) {
      return [uint(0), 0];
    } else if (leftBaseDigits < leftBaseProbabilitiesArray[1]) {
      return [leftBaseNumbersArray[0], 0];
    } else if (leftBaseDigits < leftBaseProbabilitiesArray[2]) {
      return [leftBaseNumbersArray[1], 0];
    } else if (leftBaseDigits < leftBaseProbabilitiesArray[3]) {
      return [leftBaseNumbersArray[2], 0];
    } else if (leftBaseDigits < leftBaseProbabilitiesArray[4]) {
      return [leftBaseNumbersArray[3], 0];
    } else if (leftBaseDigits < leftBaseProbabilitiesArray[5]) {
      return [leftBaseNumbersArray[4], leftBaseNumbersArray[5]];
    } else {
      return [leftBaseNumbersArray[4], leftBaseNumbersArray[6]];
    }
  }

  function getBox(uint rand, int baseline) internal view returns (uint[3] memory) {
    uint boxDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 16)] + baseline);

    uint rightCubeNumber = getRightBase(rand, baseline);
    if (rightCubeNumber == 0) {
      return [uint(0), 0, 0];
    }

    uint[] memory boxProbabilitiesArray = GridHelper.createEqualProbabilityArray(5);

    uint[] memory boxNumbersArray = GridHelper.setUintArrayFromString(BOX_NUMBERS, 6, 5);

    if (boxDigits < boxProbabilitiesArray[0]) {
      return [uint(0), 0, 0];
    } else if (boxDigits < boxProbabilitiesArray[1]) {
      return [0, boxNumbersArray[1], 0];
    } else if (boxDigits < boxProbabilitiesArray[2]) {
      return [0, 0, boxNumbersArray[5]];
    } else if (boxDigits < boxProbabilitiesArray[3]) {
      return [boxNumbersArray[0], boxNumbersArray[1], boxNumbersArray[2]];
    } else {
      return [boxNumbersArray[3], boxNumbersArray[4], boxNumbersArray[5]];
    }
  }

  function getBaseRunner(uint rand, int baseline) internal view returns (uint[2] memory) {
    uint baseRunnerDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 17)] + baseline);

    uint[] memory baseRunnerProbabilitiesArray = GridHelper.createEqualProbabilityArray(4);

    uint[] memory baseRunnerNumbersArray = GridHelper.setUintArrayFromString(BASE_RUNNER_NUMBERS, 2, 5);

    if (baseRunnerDigits < baseRunnerProbabilitiesArray[0]) {
      return [uint(0), 0];
    } else if (baseRunnerDigits < baseRunnerProbabilitiesArray[1]) {
      return [baseRunnerNumbersArray[0], 0];
    } else if (baseRunnerDigits < baseRunnerProbabilitiesArray[2]) {
      return [baseRunnerNumbersArray[1], 0];
    } else {
      return [baseRunnerNumbersArray[0], baseRunnerNumbersArray[1]];
    }
  }

  function getMidTopObject(uint rand, int baseline) internal view returns (uint[2] memory) {
    uint midTopObjectDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 18)] + baseline);

    // box number
    uint[3] memory boxNumbers = getBox(rand, baseline);
    // if box number is 8032 or 8035, then no mid top object
    // because there is nothing to attach the mid top object to
    if (boxNumbers[1] != 8032 && boxNumbers[2] != 8035) {
      return [uint(0), 0];
    }

    uint[] memory midTopObjectProbabilitiesArray = GridHelper.createEqualProbabilityArray(9);

    uint[] memory midTopObjectNumbersArray = GridHelper.setUintArrayFromString(MID_TOP_OBJECT_NUMBERS, 6, 5);

    if (midTopObjectDigits < midTopObjectProbabilitiesArray[0]) {
      return [uint(0), 0];
    } else if (midTopObjectDigits < midTopObjectProbabilitiesArray[1]) {
      return [midTopObjectNumbersArray[1], 0];
    } else if (midTopObjectDigits < midTopObjectProbabilitiesArray[2]) {
      return [midTopObjectNumbersArray[0], midTopObjectNumbersArray[1]];
    } else if (midTopObjectDigits < midTopObjectProbabilitiesArray[3]) {
      return [midTopObjectNumbersArray[2], 0];
    } else if (midTopObjectDigits < midTopObjectProbabilitiesArray[4]) {
      return [midTopObjectNumbersArray[3], 0];
    } else if (midTopObjectDigits < midTopObjectProbabilitiesArray[5]) {
      return [midTopObjectNumbersArray[4], 0];
    } else if (midTopObjectDigits < midTopObjectProbabilitiesArray[6]) {
      return [midTopObjectNumbersArray[2], midTopObjectNumbersArray[5]];
    } else if (midTopObjectDigits < midTopObjectProbabilitiesArray[7]) {
      return [midTopObjectNumbersArray[3], midTopObjectNumbersArray[5]];
    } else {
      return [midTopObjectNumbersArray[4], midTopObjectNumbersArray[5]];
    }
  }

  function getLeftTopObject(uint rand, int baseline) internal view returns (uint) {
    uint leftTopDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 19)] + baseline);

    // left base numbers
    uint[2] memory leftBaseNumbers = getLeftBase(rand, baseline);
    if (leftBaseNumbers[0] == 7007 || leftBaseNumbers[0] == 0) {
      return 0;
    }

    return GridHelper.getSingleObject(LEFT_TOP_OBJECT_NUMBERS, leftTopDigits, 6);
  }

  function getLeftTopOffset(uint objectNumber) internal pure returns (string memory) {

    // 04003 feedback-d, 04000 C-FEEDBACK-A, 04001 feedback-b
    if (objectNumber == 4003) {
      return "0100-060";
    } else if (objectNumber == 4000) {
      return "0100-060";
    } else if (objectNumber == 4001) {
      return "0100-060";
    } else {
      return "00000000";
    }
  }
 
  function getCharacterPosition(uint characterNumber, uint rand, int baseline) internal view returns(string memory) {
    uint characterPositionDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 25)] + baseline);

    if (characterNumber == 20000 || characterNumber == 20004 ) {
      string memory characterOffset = string(GridHelper.slice(bytes(POSSIBLE_CHARACTER_POSITIONS), 8*(characterPositionDigits % 3), 8));
      return characterOffset;
    } else if (characterNumber == 20002) {
      return "03120180";
    } else {
      return "00000000";
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public view returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](80);
    string[] memory offsetsUsed = new string[](80);

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getExpansionPropPosition(rand, baseline, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS, WALL_OFFSETS, NUMBER_OF_WALL_POSITIONS);
    count++;

    uint[5] memory characterNumbers = GlobalNumbers.getCharacterNumberAndLeverNumber(rand, false, baseline);

    for (uint i = 0; i < 3; ++i) {
      numbersUsed[count] = characterNumbers[i];
      count++;
    }

    numbersUsed[count] = characterNumbers[3];
    offsetsUsed[count] = getCharacterPosition(characterNumbers[3], rand, baseline);
    count++;

    numbersUsed[count] = characterNumbers[4];
    count++;

    uint[] memory subjectNumbers = getSubject(rand, baseline);

    if (subjectNumbers[3] != 0) {
      for (uint i = 0; i < 5; ++i) {
        numbersUsed[count] = subjectNumbers[i];
        count++;
      }
    }

    // right base
    numbersUsed[count] = getRightBase(rand, baseline);
    count++;
    
    uint[3] memory boxNumbers = getBox(rand, baseline);
    // box back
    numbersUsed[count] = boxNumbers[0];
    count++;

    if (subjectNumbers[3] == 0) {
      for (uint i = 0; i < 4; ++i) {
        numbersUsed[count] = subjectNumbers[i];
        count++;
      }
    }

    // box front and top right
    numbersUsed[count] = boxNumbers[1];
    count++;
    numbersUsed[count] = boxNumbers[2];
    count++;

    // mid base
    numbersUsed[count] = getMidBase(rand, baseline);
    count++;

    // base runner
    uint[2] memory baseRunnerNumbers = getBaseRunner(rand, baseline);
    numbersUsed[count] = baseRunnerNumbers[0];
    count++;
    numbersUsed[count] = baseRunnerNumbers[1];
    count++;

    // left base
    uint[2] memory leftBaseNumbers = getLeftBase(rand, baseline);

    if (leftBaseNumbers[0] == 7007) {
      numbersUsed[count] = leftBaseNumbers[0];
      offsetsUsed[count] = "-4680090";
      count++;
      numbersUsed[count] = leftBaseNumbers[1];
      offsetsUsed[count] = "-4680090";
      count++;
    } else {
      numbersUsed[count] = leftBaseNumbers[0];
      offsetsUsed[count] = "-1560090";
      count++;
      numbersUsed[count] = leftBaseNumbers[1];
      count++;
    }

    // mid top
    uint[2] memory midTopObjectNumbers = getMidTopObject(rand, baseline);
    numbersUsed[count] = midTopObjectNumbers[0];
    count++;
    numbersUsed[count] = midTopObjectNumbers[1];
    count++;

    // left top
    uint leftTopObjectNumber = getLeftTopObject(rand, baseline);
    numbersUsed[count] = leftTopObjectNumber;
    offsetsUsed[count] = getLeftTopOffset(leftTopObjectNumber);
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