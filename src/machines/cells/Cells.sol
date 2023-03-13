// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

import "../../Noise.sol";

contract Cells {
  
  AssetRetriever internal _assetRetriever;

  Noise internal _noise;

  string internal constant SHELF_CUSHION_NUMBERS = "000000902609017";

  string internal constant CELL_NUMBERS = "0000009030090320903109021090190902009018";

  string internal constant POSSIBLE_CHARACTER_POSITIONS = "00000000-1560090-3120180";

  string internal constant CELL_OFFSETS = "01560192015600000000028200000090";

  // Floor
  string internal constant FLOOR_OFFSETS = "0312036004680270";
  uint internal constant NUMBER_OF_FLOOR_POSITIONS = 2;

  // Wall
  string internal constant WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_WALL_POSITIONS = 5;

  uint internal constant ALL_CELL_WRAPPER_NUMBER = 19011;

  uint internal constant GROUP_CLOSE_NUMBER = 19000;

  constructor(address assetRetriever, address noise) {
    _assetRetriever = AssetRetriever(assetRetriever);
    _noise = Noise(noise);
  }

  function getShelfCushion(uint rand, int baseline, uint version) internal view returns (uint) {
    uint shelfCushionDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 12+version)] + baseline);

    // get the cell number
    uint cellNumber = getCell(rand, baseline, version);

    // these cells don't fit with the shelf cushion
    if (cellNumber == 9030 || cellNumber == 9031 || cellNumber == 9032) {
      return 0;
    }

    return GridHelper.getSingleObject(SHELF_CUSHION_NUMBERS, shelfCushionDigits, 3);
  }

  function getCell(uint rand, int baseline, uint version) internal view returns (uint) {
    uint cellDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 16+version)] + baseline);

    return GridHelper.getSingleObject(CELL_NUMBERS, cellDigits, 8);
  }
 
  function getCharacterPosition(uint characterNumber, uint rand, int baseline) internal view returns(string memory) {
    uint characterPositionDigits = GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 25)] + baseline);

    if (characterNumber == 20000 || characterNumber == 20004 ) {
      string memory characterOffset = string(GridHelper.slice(bytes(POSSIBLE_CHARACTER_POSITIONS), 8*(characterPositionDigits % 1), 8));
      return characterOffset;
    } else if (characterNumber == 20002) {
      return "01560090";
    } else {
      return "01560090";
    }
  }

  function getAllNumbersUsed(uint rand, int baseline) public view returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](80);
    string[] memory offsetsUsed = new string[](80);

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, baseline);
    offsetsUsed[count] = GlobalNumbers.getExpansionPropPosition(rand, baseline, FLOOR_OFFSETS, NUMBER_OF_FLOOR_POSITIONS, WALL_OFFSETS, NUMBER_OF_WALL_POSITIONS);
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