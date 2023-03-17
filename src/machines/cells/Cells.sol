// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

import "../../Noise.sol";

contract Cells {
  
  AssetRetriever internal _assetRetriever;

  string internal constant SHELF_CUSHION_NUMBERS = "000000902609017";

  string internal constant CELL_NUMBERS = "09030090320903109021090190902009018";

  string internal constant POSSIBLE_CHARACTER_POSITIONS = "015600900312018000000180";

  string internal constant CELL_OFFSETS = "01560192015600000000028200000090";

  string internal constant GLOOP_NUMBERS = "0903401002010010100009035";

  string internal constant LARGE_MACHINE_NUMBERS = "090360901209013090140903709016";

  string internal constant FEEDBACK_NUMBERS = "00000040030400204001040000900109000";

  // Floor
  string internal constant FLOOR_OFFSETS = "046802700312036004680270";
  uint internal constant NUMBER_OF_FLOOR_POSITIONS = 3;

  // Wall
  string internal constant WALL_OFFSETS = "0000018000000360000005400156009003120000";
  uint internal constant NUMBER_OF_WALL_POSITIONS = 5;

  uint internal constant ALL_CELL_WRAPPER_NUMBER = 19011;

  uint internal constant CELL_HOLE_NUMBER = 9038;

  uint internal constant CELL_PIPE_NUMBER = 9003;

  uint internal constant MACHINE_PUMP_NUMBER = 9009;

  uint internal constant TOP_PIPE_NUMBER = 9006;

  uint internal constant SHADOW_NUMBER = 9033;

  uint internal constant FLIP_NUMBER = 19010;

  uint internal constant GROUP_CLOSE_NUMBER = 19000;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getShelfCushion(uint rand, int baseline, uint version) internal pure returns (uint) {
    uint shelfCushionDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12+version)] + baseline);

    // get the cell number
    uint cellNumber = getCell(rand, baseline, version);

    // these cells don't fit with the shelf cushion
    if (cellNumber == 9030 || cellNumber == 9031 || cellNumber == 9032) {
      return 0;
    }

    return GridHelper.getSingleObject(SHELF_CUSHION_NUMBERS, shelfCushionDigits, 3);
  }

  function getCell(uint rand, int baseline, uint version) internal pure returns (uint) {
    uint cellDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 16+version)] + baseline);

    uint[] memory cellPositions = getPositionOfCells(rand, baseline);

    if (cellPositions[version] == 0) {
      return 0;
    }

    return GridHelper.getSingleObject(CELL_NUMBERS, cellDigits, 7);
  }

  function getShadow(uint rand, int baseline) internal pure returns (uint) {
    // get the 0th and 2nd cell numbers
    // if both are not 0, then return shadow
    uint cellZero = getCell(rand, baseline, 0);
    uint cellTwo = getCell(rand, baseline, 2);
    if (cellZero != 0 && cellTwo != 0) {
      return SHADOW_NUMBER;
    } else {
      return 0;
    }
  }

  function getGloop(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint gloopDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 25)] + baseline);

    uint[] memory gloopNumbersArray = GridHelper.setUintArrayFromString(GLOOP_NUMBERS, 5, 5);

    uint[] memory numbersUsed = new uint[](4);

    uint[] memory gloopProbabilitiesArray = GridHelper.createEqualProbabilityArray(3);

    numbersUsed[0] = gloopNumbersArray[0];

    if (gloopDigits < gloopProbabilitiesArray[0]) {
      numbersUsed[1] = gloopNumbersArray[1];
    } else if (gloopDigits < gloopProbabilitiesArray[1]) {
      numbersUsed[1] = gloopNumbersArray[2];
    } else {
      numbersUsed[1] = gloopNumbersArray[3];
    }

    numbersUsed[2] = gloopNumbersArray[4];

    return numbersUsed;
  }

  function getLargeMachine(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint largeMachineDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 26)] + baseline);

    uint[] memory largeMachineNumbersArray = GridHelper.setUintArrayFromString(LARGE_MACHINE_NUMBERS, 6, 5);

    uint[] memory numbersUsed = new uint[](5);

    uint[] memory largeMachineProbabilitiesArray = GridHelper.createEqualProbabilityArray(3);

    numbersUsed[0] = largeMachineNumbersArray[0];

    if (largeMachineDigits < largeMachineProbabilitiesArray[0]) {
      numbersUsed[1] = largeMachineNumbersArray[1];
    } else if (largeMachineDigits < largeMachineProbabilitiesArray[1]) {
      numbersUsed[1] = largeMachineNumbersArray[2];
    } else {
      numbersUsed[1] = largeMachineNumbersArray[3];
    }

    numbersUsed[2] = largeMachineNumbersArray[4];

    numbersUsed[3] = largeMachineNumbersArray[5];

    numbersUsed[4] = getFeedback(rand, baseline);

    return numbersUsed;
  }

  function getFeedback(uint rand, int baseline) internal pure returns (uint) {
    uint feedbackDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 27)] + baseline);

    return GridHelper.getSingleObject(FEEDBACK_NUMBERS, feedbackDigits, 7);
  }

  function getPositionOfCells(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint numberOfCellsDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 28)] + baseline);

    uint[] memory numberOfCellsProbabilitiesArray = GridHelper.createEqualProbabilityArray(4);

    uint numOfCells;

    for (uint i = 0; i < 3; i++) {
      if (numberOfCellsDigits < numberOfCellsProbabilitiesArray[i]) {
        numOfCells = i + 1;
        break;
      }
    }

    if (numOfCells == 0) {
      numOfCells = 4;
    }

    // distribute the cells randomly
    uint[] memory cellNumbers = new uint[](4);
    for (uint i = 0; i < numOfCells; i++) {
      uint cellDigit = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 20+i)] + baseline) % 4;
      // check if the cell is already used and if so, find the next available one
      while (cellNumbers[cellDigit] != 0) {
        cellDigit = (cellDigit + 1) % 4;
      }
      cellNumbers[cellDigit] = 1;
    }

    return cellNumbers;
  }

  function getPipeOrMachine(uint rand, int baseline) internal pure returns (uint[] memory) {
    uint pipeOrMachineDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 24)] + baseline);
    // long pipe, machine a, machine b

    uint[] memory numbersUsed = new uint[](10);

    uint[] memory machineProbabilitiesArray = GridHelper.createEqualProbabilityArray(3);

    if (pipeOrMachineDigits < machineProbabilitiesArray[1]) {
      numbersUsed[0] = CELL_HOLE_NUMBER;
      uint[] memory gloopNumbers = getGloop(rand, baseline);
      numbersUsed[1] = gloopNumbers[0];
      numbersUsed[2] = gloopNumbers[1];
      numbersUsed[3] = gloopNumbers[2];
      if (pipeOrMachineDigits < machineProbabilitiesArray[0]) {
        numbersUsed[4] = CELL_PIPE_NUMBER;
      } else {
        numbersUsed[4] = MACHINE_PUMP_NUMBER;
        numbersUsed[5] = TOP_PIPE_NUMBER;
      }
      return numbersUsed;
    } else {
      uint[] memory largeMachine = getLargeMachine(rand, baseline);
      for (uint i = 0; i < 5; ++i) {
        numbersUsed[i] = largeMachine[i];
      }
      return numbersUsed;
    }
  }
 
  function getCharacterPosition(uint characterNumber, uint rand, int baseline) internal pure returns(string memory) {
    uint characterPositionDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 23)] + baseline);

    if (characterNumber == 20000 || characterNumber == 20004 || characterNumber == 20002) {
      string memory characterOffset = string(GridHelper.slice(bytes(POSSIBLE_CHARACTER_POSITIONS), 8*(characterPositionDigits % 3), 8));
      return characterOffset;
    } else {
      return "01560090";
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](80);
    string[] memory offsetsUsed = new string[](80);

    numbersUsed[count] = FLIP_NUMBER;
    count++;

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getExpansionPropPosition(rand, baseline, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS, WALL_OFFSETS, NUMBER_OF_WALL_POSITIONS);
    count++;

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    // get the shadow
    numbersUsed[count] = getShadow(rand, baseline);
    count++;

    numbersUsed[count] = ALL_CELL_WRAPPER_NUMBER;
    count++;

    // get up to 4 cells and shelf/cushions
    for (uint i = 0; i < 4; ++i) {
      numbersUsed[count] = getShelfCushion(rand, baseline, i);
      offsetsUsed[count] = string(GridHelper.slice(bytes(CELL_OFFSETS), 8*i, 8));
      count++;
      numbersUsed[count] = getCell(rand, baseline, i);
      offsetsUsed[count] = string(GridHelper.slice(bytes(CELL_OFFSETS), 8*i, 8));
      count++;
    }

    numbersUsed[count] = GROUP_CLOSE_NUMBER;
    count++;

    // get the pipe or machine
    uint[] memory pipeOrMachineNumbers = getPipeOrMachine(rand, baseline);
    for (uint i = 0; i < 10; ++i) {
      numbersUsed[count] = pipeOrMachineNumbers[i];
      if (i == 1 && pipeOrMachineNumbers[0] == 9036) {
        offsetsUsed[count] = "-312-100";
      }
      if (i == 4 && pipeOrMachineNumbers[0] == 9036) {
        offsetsUsed[count] = "-050-380";
      }
      count++;
    }

    uint[5] memory characterNumbers = GlobalNumbers.getCharacterNumberAndLeverNumber(rand, false, baseline);
    numbersUsed[count] = characterNumbers[0];
    count++;

    for (uint i = 1; i <= 2; ++i) {
      numbersUsed[count] = characterNumbers[i];
      offsetsUsed[count] = "01560090";
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