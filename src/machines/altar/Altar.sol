// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

contract Altar {
  AssetRetriever internal _assetRetriever;

  // Each position is represented by 6 bytes, 3 for x and 3 for y
  string internal constant ORB_OFFSETS = "00000000-312-180";

  uint internal constant ORB_CHANCE = 50;

  uint internal constant CUBE_CHANCE = 100;
  uint internal constant STAIRS_CHANCE = 50;
  uint internal constant RUG_CHANCE = 50;

  string internal constant BASE_NUMBERS = "700070017002";
  string internal constant FRAME_NUMBERS = "700370047012701170185026";
  string internal constant ORB_BASE_NUMBERS = "700570067007700870097010";
  string internal constant STEPS_RUNNERS_NUMBERS = "701370147015";
  string internal constant RUG_NUMBERS = "70207021";
  string internal constant FLOOB_ANIMATION_NUMBERS = "701970161015";
  string internal constant ORB_NUMBERS = "4035403640374038";

  // Floor
  string internal constant DEGRADED_FLOOR_OFFSETS = "0156009003120360046802700312018006240180";
  uint internal constant NUMBER_OF_DEGRADED_FLOOR_POSITIONS = 5;
  string internal constant BASIC_FLOOR_OFFSETS = "01560090031203600468027003120180";
  uint internal constant NUMBER_OF_BASIC_FLOOR_POSITIONS = 4;
  string internal constant EMBELLISHED_FLOOR_OFFSETS = "015600900312036004680270";
  uint internal constant NUMBER_OF_EMBELLISHED_FLOOR_POSITIONS = 3;

  // Wall
  string internal constant DEGRADED_WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_DEGRADED_WALL_POSITIONS = 5;
  string internal constant BASIC_WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_BASIC_WALL_POSITIONS = 5;
  string internal constant EMBELLISHED_WALL_OFFSETS = "0000018001560090015602700312000003120180";
  uint internal constant NUMBER_OF_EMBELLISHED_WALL_POSITIONS = 5;

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getCubeNumber(bytes memory digits, uint state) internal pure returns (uint) {
    uint[] memory baseNumbersArray = GridHelper.setUintArrayFromString(BASE_NUMBERS, 3, 4);
    uint baseDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 12, 2));
    if (state == 2) { // has to be cube base because there will be stairs
      return baseNumbersArray[0];
    } else { // 3 possible bases, can appear in degraded/embellished
      if (baseDigits < (66 - (state*50))) { // basic == 16%, degraded == 66%
        return baseNumbersArray[0];
      } else if (baseDigits < (99 - (state*57))) { // basic == 42%, degraded == 33%
        return baseNumbersArray[1];
      } else { // basic == 42%, degraded == 1%
        return baseNumbersArray[2];
      }
    }
  }

  function getFrameNumber(bytes memory digits, uint state) internal pure returns (uint[] memory) {
    uint[] memory numbersUsed = new uint[](3);
    uint[] memory frameNumbersArray = GridHelper.setUintArrayFromString(FRAME_NUMBERS, 6, 4);
    uint frameDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 13, 2));
    if (state == 2) {
      if (frameDigits < 50) {
        numbersUsed[0] = frameNumbersArray[3];
        numbersUsed[1] = frameNumbersArray[0];
        if (frameDigits < 25) {
          numbersUsed[2] = frameNumbersArray[4];
        } else {
          numbersUsed[2] = frameNumbersArray[5];
        }
      } else {
        numbersUsed[0] = frameNumbersArray[2];
        if (frameDigits < 75) {
          numbersUsed[1] = frameNumbersArray[4];
        } else {
          numbersUsed[1] = frameNumbersArray[5];
        }
      }
    } else {
      if (frameDigits < (state + 1) * 25) { // Big frame
        numbersUsed[0] = frameNumbersArray[0];
        if (frameDigits % 2 == 0 && state == 1) {
          numbersUsed[1] = frameNumbersArray[4];
        } else {
          numbersUsed[1] = frameNumbersArray[5];
        }
      } else if (frameDigits < state * 100) { // Small frame
        numbersUsed[0] = frameNumbersArray[1];
        numbersUsed[1] = frameNumbersArray[5];
      } else {
        numbersUsed[0] = frameNumbersArray[4];
      }
    }
    return numbersUsed;
  }

  function getStepsRunnerNumber(bytes memory digits, uint state) internal pure returns (uint[] memory) {
    uint[] memory numbersUsed = new uint[](3);
    uint[] memory stepsRunnersNumbersArray = GridHelper.setUintArrayFromString(STEPS_RUNNERS_NUMBERS, 3, 4);
    uint stepsRunnersDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 16, 2));
    if (state == 2) {
      if (stepsRunnersDigits < 20) {
        numbersUsed[0] = stepsRunnersNumbersArray[2];
      }
      numbersUsed[1] = stepsRunnersNumbersArray[0];
      if (stepsRunnersDigits < 50) {
        numbersUsed[2] = stepsRunnersNumbersArray[1];
      }
    }
    return numbersUsed;
  }

  function getRugNumber(bytes memory digits, uint state) internal pure returns (uint) {
    uint[] memory rugNumbersArray = GridHelper.setUintArrayFromString(RUG_NUMBERS, 2, 4);
    uint rugDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 17, 2));
    if (state == 2) {
      if (rugDigits < 50) {
        return rugNumbersArray[0];
      } else {
        return rugNumbersArray[1];
      }
    } else {
      return 0;
    }
  }

  function getOrbBaseNumber(bytes memory digits, uint state, uint version) internal pure returns (uint) {
    uint[] memory orbBaseNumbersArray = GridHelper.setUintArrayFromString(ORB_BASE_NUMBERS, 6, 4);
    uint orbBaseDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 14+version, 2));
    
    if (state == 2) {
      if (orbBaseDigits < 10) { // 10% chance and must be embellished = very rare
        return orbBaseNumbersArray[2];
      }
    }
    if (state != 0) { // 1,2 = basic or embellished
      // 5 possible bases equally weighted
      if (orbBaseDigits < 20) { // 20% chance in basic, 10% chance in embellished
        return orbBaseNumbersArray[0];
      } else if (orbBaseDigits < 40) {
        return orbBaseNumbersArray[1];
      } else if (orbBaseDigits < 60) {
        return orbBaseNumbersArray[3];
      } else if (orbBaseDigits < 80) {
        return orbBaseNumbersArray[4];
      } else {
        return orbBaseNumbersArray[5];
      }
    }
    return 0;
  }

  function getOrbNumber(bytes memory digits, uint state, uint version) internal pure returns (uint) {
    uint[] memory orbNumbersArray = GridHelper.setUintArrayFromString(ORB_NUMBERS, 4, 4);
    uint orbDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 18+version, 2));
    
    if (state == 0 && orbDigits < 5) { // 5% chance of an orb in degraded = very rare
      return orbNumbersArray[0];
    } else if (state == 1 && orbDigits < 98) { // in very rare cases basic will have no orbs(2%)
      if (orbDigits < 50) {
        return orbNumbersArray[0];
      } else {
        return orbNumbersArray[1];
      }
    } else if (state == 2) {
      if (orbDigits < 25) {
        return orbNumbersArray[0];
      } else if (orbDigits < 50) {
        return orbNumbersArray[1];
      } else if (orbDigits < 75) {
        return orbNumbersArray[2];
      } else {
        return orbNumbersArray[3];
      }
    }
    return 0;
  }

  function getFloobAnimationNumber() internal pure returns (uint[] memory) {
    return GridHelper.setUintArrayFromString(FLOOB_ANIMATION_NUMBERS, 3, 4);
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

    string memory globalAssetOffset = string(GridHelper.slice(bytes(globalAssetOffsets), (globalAssetDigits % numberOfPositions)*8, 8));

    return globalAssetOffset;

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

  function getAllNumbersUsed(bytes memory digits, uint state) internal pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](32);
    string[] memory offsetsUsed = new string[](32);
    uint[] memory frame = getFrameNumber(digits, state);

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(digits, state);
    offsetsUsed[count] = getExpansionPropPosition(digits, state);
    count++;

    for (uint i = 0; i < frame.length; ++i) {
      numbersUsed[count] = frame[i];
      count++;
    }

    numbersUsed[count] = getOrbBaseNumber(digits, state, 1);
    offsetsUsed[count] = "-312-180";
    count++;
    numbersUsed[count] = getOrbNumber(digits, state, 1);
    offsetsUsed[count] = "-312-180";
    count++;
    numbersUsed[count] = getCubeNumber(digits, state);
    count++;
    uint[] memory floobAnimation = getFloobAnimationNumber();
    for (uint i = 0; i < floobAnimation.length; ++i) {
      numbersUsed[count] = floobAnimation[i];
      count++;
    }

    numbersUsed[count] = getOrbBaseNumber(digits, state, 0);
    count++;
    numbersUsed[count] = getOrbNumber(digits, state, 0);
    count++;

    numbersUsed[count] = getRugNumber(digits, state);
    count++;
    uint[] memory stepsRunner = getStepsRunnerNumber(digits, state);
    for (uint i = 0; i < stepsRunner.length; ++i) {
      numbersUsed[count] = stepsRunner[i];
      count++;
    }

    numbersUsed[count] = GlobalNumbers.getGlobalAssetNumber(digits, state, 0);
    offsetsUsed[count] = getGlobalAssetPosition(digits, state);
    count++;

    return (numbersUsed, offsetsUsed);
  }

  function getProductivityValue(bytes memory digits, uint state) external view returns (uint) {
    (uint[] memory numbersUsed,) = getAllNumbersUsed(digits, state);
    uint productivityValue = 0;
    for (uint i = 0; i < numbersUsed.length; ++i) {
      productivityValue += _assetRetriever.getProductivity(numbersUsed[i]);
    }
    return productivityValue;
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