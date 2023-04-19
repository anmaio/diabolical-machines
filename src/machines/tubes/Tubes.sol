// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

import "../../Noise.sol";

contract Tubes {
  
  AssetRetriever internal _assetRetriever;

  string internal constant DEGRADED_PIPE_NUMBERS = "10040100431004110044";

  string internal constant MACHINE_ONE_NUMBERS = "1001210024";

  string internal constant MACHINE_ONE_FEEDBACK_NUMBERS = "0000004018040170402604025";

  string internal constant MACHINE_ONE_EYES_NUMBERS = "0000005016";

  uint internal constant PIPE_BOTTOM_LEFT = 10039;

  string internal constant PIPE_MIDDLE_NUMBERS = "1003510038";

  string internal constant PIPE_BOTTOM_RIGHT_NUMBERS = "1003410037";

  string internal constant PIPE_TOP_RIGHT_NUMBERS = "1003310036";

  string internal constant MACHINE_ONE_TASSLE_NUMBERS = "1001710018";

  string internal constant MACHINE_TWO_TASSLE_NUMBERS = "1002110022";

  string internal constant MACHINE_FOUR_TASSLE_NUMBERS = "1002310027";

  string internal constant MACHINE_FOUR_NUMBERS = "100001001310052";

  uint internal constant JUMPER_CUFF = 10028;

  uint internal constant MACHINE_TWO = 10019;

  uint internal constant CLEAR_PIPE_BOTTOM_RIGHT = 10037;

  // Floor
  string internal constant FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_FLOOR_POSITIONS = 2;

  // Wall
  string internal constant WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_WALL_POSITIONS = 5;

  uint internal constant NO_TRANSFORM = 13012;
  uint internal constant TRANSFORM_ONE = 13002;

  uint internal constant GROUP_CLOSE_NUMBER = 13000;

  uint internal constant C_CONNECTOR7 = 10046;
  uint internal constant C_CONNECTOR8 = 10047;
  uint internal constant C_CONNECTOR9 = 10048;
  uint internal constant C_CONNECTOR10 = 10049;

  uint internal constant C_CONNECTORR3 = 10050;
  uint internal constant C_CONNECTORR4 = 10051;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getMachineOneTassles(uint rand, int baseline, uint version) public pure returns (uint[2] memory) {
    uint machineOneTassleDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 26+version)] + baseline);

    uint[] memory machineOneTasslesArray = GridHelper.setUintArrayFromString(MACHINE_ONE_TASSLE_NUMBERS, 2, 5);

    uint[] memory tasslesProbabilitiesArray = GridHelper.createEqualProbabilityArray(3);

    if (machineOneTassleDigits < tasslesProbabilitiesArray[0]) {
      return [uint(0), 0];
    } else if (machineOneTassleDigits < tasslesProbabilitiesArray[1]) {
      return [machineOneTasslesArray[0], 0];
    } else {
      return [machineOneTasslesArray[0], machineOneTasslesArray[1]];
    }
  }

  function getMachineTwoTassles(uint rand, int baseline, uint version) public pure returns (uint[2] memory) {
    uint machineTwoTassleDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 27+version)] + baseline);

    uint[] memory machineTwoTasslesArray = GridHelper.setUintArrayFromString(MACHINE_TWO_TASSLE_NUMBERS, 2, 5);

    uint[] memory tasslesProbabilitiesArray = GridHelper.createEqualProbabilityArray(3);

    if (machineTwoTassleDigits < tasslesProbabilitiesArray[0]) {
      return [uint(0), 0];
    } else if (machineTwoTassleDigits < tasslesProbabilitiesArray[1]) {
      return [machineTwoTasslesArray[0], 0];
    } else {
      return [machineTwoTasslesArray[0], machineTwoTasslesArray[1]];
    }
  }

  function getMachineFourTassles(uint rand, int baseline, uint version) public pure returns (uint[2] memory) {
    uint machineFourTassleDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 28+version)] + baseline);

    uint[] memory machineFourTasslesArray = GridHelper.setUintArrayFromString(MACHINE_FOUR_TASSLE_NUMBERS, 2, 5);

    uint[] memory tasslesProbabilitiesArray = GridHelper.createEqualProbabilityArray(3);

    if (machineFourTassleDigits < tasslesProbabilitiesArray[0]) {
      return [uint(0), 0];
    } else if (machineFourTassleDigits < tasslesProbabilitiesArray[1]) {
      return [machineFourTasslesArray[0], 0];
    } else {
      return [machineFourTasslesArray[0], machineFourTasslesArray[1]];
    }
  }

  function getMachineFour(uint rand, int baseline, uint version) public pure returns (uint) {
    uint machineFourDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 25+version)] + baseline);

    return GridHelper.getSingleObject(MACHINE_FOUR_NUMBERS, machineFourDigits, 3, 5);
  }

  function getTopRightPipe(uint rand, int baseline, uint version) internal pure returns (uint) {
    uint topRightPipeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 19+version)] + baseline);

    return GridHelper.getSingleObject(PIPE_TOP_RIGHT_NUMBERS, topRightPipeDigits, 2, 5);
  }

  function getBottomRightPipe(uint rand, int baseline, uint version) internal pure returns (uint) {
    uint bottomRightPipeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 18+version)] + baseline);

    return GridHelper.getSingleObject(PIPE_BOTTOM_RIGHT_NUMBERS, bottomRightPipeDigits, 2, 5);
  }

  function getMiddlePipe(uint rand, int baseline, uint version) internal pure returns (uint) {
    uint middlePipeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 17+version)] + baseline);

    return GridHelper.getSingleObject(PIPE_MIDDLE_NUMBERS, middlePipeDigits, 2, 5);
  }

  function getMachineOneEyes(uint rand, int baseline, uint version) internal pure returns (uint) {
    if (getMachineOneFeedback(rand, baseline, version) == 4017) {
      return 0;
    }
    uint machineOneEyeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 16+version)] + baseline);

    return GridHelper.getSingleObject(MACHINE_ONE_EYES_NUMBERS, machineOneEyeDigits, 2, 5);
  }

  function getMachineOneFeedback(uint rand, int baseline, uint version) internal pure returns (uint) {
    uint machineOneFeedbackDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 15+version)] + baseline);

    return GridHelper.getSingleObject(MACHINE_ONE_FEEDBACK_NUMBERS, machineOneFeedbackDigits, 5, 5);
  }

  function getMachineOne(uint rand, int baseline, uint version) internal pure returns (uint) {
    uint machineOneDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 14+version)] + baseline);

    return GridHelper.getSingleObject(MACHINE_ONE_NUMBERS, machineOneDigits, 2, 5);
  }

  function getNormalPipe(uint rand, int baseline, uint version) internal pure returns (uint[] memory) {
    uint[] memory numbersUsed = new uint[](23);

    if (version == 0) {
      numbersUsed[0] = NO_TRANSFORM;
    } else {
      numbersUsed[0] = TRANSFORM_ONE;
    }

    numbersUsed[1] = PIPE_BOTTOM_LEFT;

    numbersUsed[2] = getMachineOne(rand, baseline, version);

    uint[2] memory tasslesOne = getMachineOneTassles(rand, baseline, version);

    numbersUsed[3] = tasslesOne[0];
    numbersUsed[4] = tasslesOne[1];

    numbersUsed[5] = MACHINE_TWO;

    numbersUsed[6] = getMachineOneEyes(rand, baseline, version);

    numbersUsed[7] = getMachineOneFeedback(rand, baseline, version);

    uint[2] memory tasslesTwo = getMachineTwoTassles(rand, baseline, version);

    numbersUsed[8] = tasslesTwo[0];

    numbersUsed[9] = C_CONNECTORR3;

    numbersUsed[11] = getMiddlePipe(rand, baseline, version);

    // strange render order
    if (numbersUsed[2] == 10012) {
      numbersUsed[10] = C_CONNECTOR7;
    } else {
      numbersUsed[12] = JUMPER_CUFF;
    }

    numbersUsed[13] = C_CONNECTOR8;

    numbersUsed[14] = tasslesTwo[1];

    uint machineFour = getMachineFour(rand, baseline, version);

    uint[2] memory tasslesFour = getMachineFourTassles(rand, baseline, version);

    if (machineFour == 10000) {
      numbersUsed[15] = CLEAR_PIPE_BOTTOM_RIGHT;
      numbersUsed[16] = C_CONNECTOR9;
      numbersUsed[17] = machineFour;
    } else {
      numbersUsed[15] = getBottomRightPipe(rand, baseline, version);
      numbersUsed[16] = machineFour;
      numbersUsed[17] = tasslesFour[0];
      numbersUsed[18] = tasslesFour[1];
    }

    numbersUsed[19] = C_CONNECTORR4;

    numbersUsed[20] = C_CONNECTOR10;

    numbersUsed[21] = getTopRightPipe(rand, baseline, version);

    numbersUsed[22] = GROUP_CLOSE_NUMBER;

    return numbersUsed;
  }

  function getDegradedPipe(uint rand, int baseline, uint positionAlreadyTaken) internal pure returns (uint[] memory) {
    uint degradedDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 13)] + baseline);

    uint[] memory degradedNumbersArray = GridHelper.setUintArrayFromString(DEGRADED_PIPE_NUMBERS, 4, 5);

    uint[] memory numbersUsed = new uint[](3);

    // no positions already taken
    if (positionAlreadyTaken == 9) {
      uint[] memory pipeProbabilitiesArray = GridHelper.createEqualProbabilityArray(3);

      if (degradedDigits < pipeProbabilitiesArray[0]) {
        numbersUsed[0] = degradedNumbersArray[0+degradedDigits%2];
      } else if (degradedDigits < pipeProbabilitiesArray[1]) {
        numbersUsed[0] = degradedNumbersArray[2+degradedDigits%2];
      } else {
        numbersUsed[0] = degradedNumbersArray[0+degradedDigits%2];
        numbersUsed[1] = degradedNumbersArray[2+degradedDigits%2];
      }
    } else {
      numbersUsed[0] = degradedNumbersArray[3 - 2*positionAlreadyTaken - degradedDigits%2];
    }

    return numbersUsed;
  }

  function getAllPipes(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint pipeDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12)] + baseline);

    uint[] memory pipeProbabilitiesArray = GridHelper.createEqualProbabilityArray(4);

    uint[] memory numbersUsed = new uint[](46);

    // degraded, single normal, single normal + single degraded, double normal
    if (pipeDigits < pipeProbabilitiesArray[0]) {
      numbersUsed = getDegradedPipe(rand, baseline, 9);
    } else if (pipeDigits < pipeProbabilitiesArray[1]) {
      numbersUsed = getNormalPipe(rand, baseline, pipeDigits%2);
    } else if (pipeDigits < pipeProbabilitiesArray[2]) {
      uint[] memory normalPipe = getNormalPipe(rand, baseline, pipeDigits%2);

      uint[] memory degradedPipe = getDegradedPipe(rand, baseline, pipeDigits%2);

      if (pipeDigits % 2 == 0) {
        for (uint i = 0; i < normalPipe.length; ++i) {
          numbersUsed[i] = normalPipe[i];
        }

        for (uint i = 0; i < degradedPipe.length; ++i) {
          numbersUsed[normalPipe.length + i] = degradedPipe[i];
        }
      } else {
        for (uint i = 0; i < degradedPipe.length; ++i) {
          numbersUsed[i] = degradedPipe[i];
        }

        for (uint i = 0; i < normalPipe.length; ++i) {
          numbersUsed[degradedPipe.length + i] = normalPipe[i];
        }
      }
    } else {
      uint[] memory normalPipeOne = getNormalPipe(rand, baseline, 0);
      uint[] memory normalPipeTwo = getNormalPipe(rand, baseline, 1);

      for (uint i = 0; i < normalPipeOne.length; i++) {
        numbersUsed[i] = normalPipeOne[i];
      }

      for (uint i = 0; i < normalPipeTwo.length; i++) {
        numbersUsed[normalPipeOne.length + i] = normalPipeTwo[i];
      }
    }

    return numbersUsed;
  }

  function getCharacterPosition(uint characterNumber, uint rand, int baseline) internal pure returns(string memory) {

    if ((characterNumber == 14000 || characterNumber == 14002 || characterNumber == 14004) && keccak256(bytes(GlobalNumbers.getGlobalAssetPosition(rand, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS))) != keccak256(bytes("04680270")) && keccak256(bytes(GlobalNumbers.getExpansionPropPosition(rand, baseline, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS, WALL_OFFSETS, NUMBER_OF_WALL_POSITIONS))) != keccak256(bytes("04680270"))) {
      return "01560270";
    } else {
      return "03120180";
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](80);
    string[] memory offsetsUsed = new string[](80);

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getExpansionPropPosition(rand, baseline, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS, WALL_OFFSETS, NUMBER_OF_WALL_POSITIONS);
    count++;

    // get main pipes
    uint[] memory mainPipes = getAllPipes(rand, baseline);

    for (uint i = 0; i < mainPipes.length; ++i) {
      if (mainPipes[i] != 0) {
        numbersUsed[count] = mainPipes[i];
        count++;
      }
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
    offsetsUsed[count] = getCharacterPosition(characterNumbers[3], rand, baseline);
    count++;

    numbersUsed[count] = characterNumbers[4];
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