// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../GlobalNumbers.sol";

import "../../AssetRetriever.sol";

contract Altar {
  AssetRetriever internal _assetRetriever;

  // Each position is represented by 6 bytes, 3 for x and 3 for y
  string internal constant ORB_OFFSETS = "00000000-312-180";

  string internal constant BASE_NUMBERS = "700070017002";
  string internal constant FRAME_NUMBERS = "700370047012701170185026";
  string internal constant ORB_BASE_NUMBERS = "700570067007700870097010";
  string internal constant STEPS_RUNNERS_NUMBERS = "701370147015";
  string internal constant RUG_NUMBERS = "70207021";
  string internal constant FLOOB_ANIMATION_NUMBERS = "70197016";
  string internal constant WRAPPER_NUMBERS = "70237024";

  string internal constant FLOOB_NUMBERS = "10101005101310041008100910201017101910161015";
  string internal constant ORB_NUMBERS = "4035403640374038";
  string internal constant TOP_ROW_NUMBERS = "601460166012";

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

  function getCubeNumber(uint rand, uint state) internal pure returns (uint) {
    uint[] memory baseNumbersArray = GridHelper.setUintArrayFromString(BASE_NUMBERS, 3, 4);
    // uint baseDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 12, 2));
    uint baseDigits = GridHelper.getRandByte(rand, 12);
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

  function getFrameNumber(uint rand, uint state) internal pure returns (uint[] memory) {
    uint[] memory numbersUsed = new uint[](3);
    uint[] memory frameNumbersArray = GridHelper.setUintArrayFromString(FRAME_NUMBERS, 6, 4);
    // uint frameDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 13, 2));
    uint frameDigits = GridHelper.getRandByte(rand, 13);

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

  function getStepsRunnerNumber(uint rand, uint state) internal pure returns (uint[] memory) {
    uint[] memory numbersUsed = new uint[](3);
    uint[] memory stepsRunnersNumbersArray = GridHelper.setUintArrayFromString(STEPS_RUNNERS_NUMBERS, 3, 4);
    // uint stepsRunnersDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 16, 2));
    uint stepsRunnersDigits = GridHelper.getRandByte(rand, 16);

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

  function getRugNumber(uint rand, uint state) internal pure returns (uint) {
    uint[] memory rugNumbersArray = GridHelper.setUintArrayFromString(RUG_NUMBERS, 2, 4);
    // uint rugDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 17, 2));
    uint rugDigits = GridHelper.getRandByte(rand, 17);

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

  function getOrbBaseNumber(uint rand, uint state, uint version) internal pure returns (uint) {
    uint[] memory orbBaseNumbersArray = GridHelper.setUintArrayFromString(ORB_BASE_NUMBERS, 6, 4);
    // uint orbBaseDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 14+version, 2));
    uint orbBaseDigits = GridHelper.getRandByte(rand, 14+version);
    
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

  function getOrbNumber(uint rand, uint state, uint version) internal pure returns (uint) {
    uint[] memory orbNumbersArray = GridHelper.setUintArrayFromString(ORB_NUMBERS, 4, 4);
    // uint orbDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 18+version, 2));
    uint orbDigits = GridHelper.getRandByte(rand, 18+version);
    
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

  function getFloobAnimationNumbers(uint rand) internal pure returns (uint[] memory) {
    uint[] memory numbersUsed = new uint[](5);
    uint[] memory floobAnimationNumbersArray = GridHelper.setUintArrayFromString(FLOOB_ANIMATION_NUMBERS, 2, 4);
    uint[] memory floobNumbersArray = GridHelper.setUintArrayFromString(FLOOB_NUMBERS, 11, 4);
    uint[] memory wrapperNumbersArray = GridHelper.setUintArrayFromString(WRAPPER_NUMBERS, 2, 4);
    // uint floobDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 25, 2));
    uint floobDigits = GridHelper.getRandByte(rand, 25);
    numbersUsed[0] = floobAnimationNumbersArray[0];
    numbersUsed[1] = floobAnimationNumbersArray[1];
    numbersUsed[2] = wrapperNumbersArray[0];
    numbersUsed[3] = floobNumbersArray[floobDigits % 11];
    numbersUsed[4] = wrapperNumbersArray[1];
    return numbersUsed;
  }

  function getTopRowItemNumber(uint rand, uint state) internal pure returns (uint) {
    uint[] memory topRowNumbersArray = GridHelper.setUintArrayFromString(TOP_ROW_NUMBERS, 3, 4);
    // uint topRowDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 24, 2));
    uint topRowDigits = GridHelper.getRandByte(rand, 24);

    string memory expansionPropPosition = getExpansionPropPosition(rand, state);
    bool canFit;
    if (keccak256(abi.encodePacked(expansionPropPosition)) == keccak256(abi.encodePacked("01560270")) || keccak256(abi.encodePacked(expansionPropPosition)) == keccak256(abi.encodePacked("03120180"))) {
      canFit = true;
    }

    if (state == 2 && canFit) {
      if (topRowDigits < 5) {
        return topRowNumbersArray[2];
      } else if (topRowDigits < 20) {
        return topRowNumbersArray[0];
      } else {
        return topRowNumbersArray[1];
      }
    } else if (state == 1 && topRowDigits < 80 && canFit) {
      if (topRowDigits < 40) {
        return topRowNumbersArray[0];
      } else {
        return topRowNumbersArray[2];
      }
    } else {
      return 0;
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

  function getCharacterPosition(uint characterNumber, uint rand, uint state) internal pure returns(string memory) {
    if (characterNumber != 20000 && characterNumber != 20004) {
      return "03120180";
    } else {
      uint orbNumber = getOrbNumber(rand, state, 0);
      string memory globalAssetPossition = getGlobalAssetPosition(rand, state);
      string memory expansionPropPosition = getExpansionPropPosition(rand, state);
      if (orbNumber == 0 && keccak256(bytes(globalAssetPossition)) != keccak256(bytes("06240180")) && keccak256(bytes(expansionPropPosition)) != keccak256(bytes("06240180"))) {
        return "-3120180";
      } else if (state == 1 && keccak256(bytes(globalAssetPossition)) != keccak256(bytes("03120180")) && keccak256(bytes(expansionPropPosition)) != keccak256(bytes("03120180")) && keccak256(bytes(globalAssetPossition)) != keccak256(bytes("03120360"))) {
        return "00000180";
      } else if (keccak256(bytes(globalAssetPossition)) != keccak256(bytes("03120360")) && keccak256(bytes(expansionPropPosition)) != keccak256(bytes("03120360"))) {
        return "00000360";
      } else {
        return "03120180";
      }
    }
  }

  function getAllNumbersUsed(uint rand, uint state) public pure returns (uint[] memory, string[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](32);
    string[] memory offsetsUsed = new string[](32);

    numbersUsed[count] = GlobalNumbers.getExpansionPropsNumber(rand, state);
    offsetsUsed[count] = getExpansionPropPosition(rand, state);
    count++;

    numbersUsed[count] = getTopRowItemNumber(rand, state);
    count++;

    uint[] memory frame = getFrameNumber(rand, state);
    for (uint i = 0; i < frame.length; ++i) {
      numbersUsed[count] = frame[i];
      count++;
    }

    numbersUsed[count] = getOrbBaseNumber(rand, state, 1);
    offsetsUsed[count] = "-312-180";
    count++;
    numbersUsed[count] = getOrbNumber(rand, state, 1);
    offsetsUsed[count] = "-312-180";
    count++;
    numbersUsed[count] = getCubeNumber(rand, state);
    count++;
    uint[] memory floobAnimation = getFloobAnimationNumbers(rand);
    for (uint i = 0; i < floobAnimation.length; ++i) {
      numbersUsed[count] = floobAnimation[i];
      count++;
    }

    numbersUsed[count] = getOrbBaseNumber(rand, state, 0);
    count++;
    numbersUsed[count] = getOrbNumber(rand, state, 0);
    count++;

    numbersUsed[count] = getRugNumber(rand, state);
    count++;
    uint[] memory stepsRunner = getStepsRunnerNumber(rand, state);
    for (uint i = 0; i < stepsRunner.length; ++i) {
      numbersUsed[count] = stepsRunner[i];
      count++;
    }

    numbersUsed[count] = GlobalNumbers.getGlobalAssetNumber(rand, state, 0);
    offsetsUsed[count] = getGlobalAssetPosition(rand, state);
    count++;

    uint[5] memory characterNumbers = GlobalNumbers.getCharacterNumberAndLeverNumber(rand, state, true);
    numbersUsed[count] = characterNumbers[0];
    count++;

    for (uint i = 1; i <= 2; ++i) {
      numbersUsed[count] = characterNumbers[i];
      offsetsUsed[count] = "03120180";
      count++;
    }

    numbersUsed[count] = characterNumbers[3];
    offsetsUsed[count] = getCharacterPosition(characterNumbers[3], rand, state);
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