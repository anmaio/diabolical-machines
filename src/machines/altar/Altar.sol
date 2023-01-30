// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";

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
    uint frameDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 14, 2));
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
    uint stepsRunnersDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 20, 2));
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
    uint rugDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 22, 2));
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
    uint orbBaseDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 16+(version*2), 2));
    
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
    uint orbDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 24+(version*2), 2));
    uint orbOneDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 24, 2));
    uint orbTwoDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 26, 2));
    
    if (state == 0 && orbDigits < 5) { // 5% chance of an orb in degraded = very rare
      return orbNumbersArray[0];
    } else if (state == 1 && orbOneDigits != orbTwoDigits) { // in very rare cases basic will have no orbs
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
    uint[] memory floobNumbersArray = GridHelper.setUintArrayFromString(FLOOB_ANIMATION_NUMBERS, 3, 4);
    return floobNumbersArray;
  }

  function getAllNumbersUsed(bytes memory digits, uint state) internal pure returns (uint[] memory) {
    uint count;
    uint[] memory numbersUsed = new uint[](32);
    uint[] memory frame = getFrameNumber(digits, state);
    for (uint i = 0; i < frame.length; ++i) {
      numbersUsed[count] = frame[i];
      count++;
    }
    numbersUsed[count] = getOrbBaseNumber(digits, state, 0);
    count++;
    numbersUsed[count] = getOrbNumber(digits, state, 0);
    count++;
    numbersUsed[count] = getCubeNumber(digits, state);
    count++;
    uint[] memory floobAnimation = getFloobAnimationNumber();
    for (uint i = 0; i < floobAnimation.length; ++i) {
      numbersUsed[count] = floobAnimation[i];
      count++;
    }
    numbersUsed[count] = getOrbBaseNumber(digits, state, 1);
    count++;
    numbersUsed[count] = getOrbNumber(digits, state, 1);
    count++;
    numbersUsed[count] = getRugNumber(digits, state);
    count++;
    uint[] memory stepsRunner = getStepsRunnerNumber(digits, state);
    for (uint i = 0; i < stepsRunner.length; ++i) {
      numbersUsed[count] = stepsRunner[i];
      count++;
    }
    return numbersUsed;
  }

  function getProductivityValue(bytes memory digits, uint state) external view returns (uint) {
    uint[] memory numbersUsed = getAllNumbersUsed(digits, state);
    uint productivityValue = 0;
    for (uint i = 0; i < numbersUsed.length; ++i) {
      productivityValue += _assetRetriever.getProductivity(numbersUsed[i]);
    }
    return productivityValue;
  }

  function getMachine(bytes memory digits, uint state) external view returns (string memory) {

    string memory output = "";
    uint[] memory frame = getFrameNumber(digits, state);
    for (uint i = 0; i < frame.length; ++i) {
      output = string.concat(output, _assetRetriever.getAsset(frame[i]));
    }

    output = string.concat(output, GridHelper.groupTransform("-312", "-180", _assetRetriever.getAsset(getOrbBaseNumber(digits, state, 1))));

    output = string.concat(output, GridHelper.groupTransform("-312", "-180", _assetRetriever.getAsset(getOrbNumber(digits, state, 1))));

    output = string.concat(output, _assetRetriever.getAsset(getCubeNumber(digits, state)));

    uint[] memory floobAnimation = getFloobAnimationNumber();
    for (uint i = 0; i < floobAnimation.length; ++i) {
      output = string.concat(output, _assetRetriever.getAsset(floobAnimation[i]));
    }

    output = string.concat(output, _assetRetriever.getAsset(getOrbBaseNumber(digits, state, 0)));

    output = string.concat(output, _assetRetriever.getAsset(getOrbNumber(digits, state, 0)));

    output = string.concat(output, _assetRetriever.getAsset(getRugNumber(digits, state)));

    uint[] memory stepsRunner = getStepsRunnerNumber(digits, state);
    for (uint i = 0; i < stepsRunner.length; ++i) {
      output = string.concat(output, _assetRetriever.getAsset(stepsRunner[i]));
    }

    return output;
  }
}