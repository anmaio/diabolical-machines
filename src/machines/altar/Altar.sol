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

  function getCube(bytes memory digits, uint state) internal view returns (string memory) {
    uint[] memory baseNumbersArray = GridHelper.setUintArrayFromString(BASE_NUMBERS, 3, 4);
    uint baseDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 12, 2));
    if (state == 2) { // has to be cube base because there will be stairs
      return _assetRetriever.getAsset(baseNumbersArray[0]);
    } else { // 3 possible bases, can appear in degraded/embellished
      if (baseDigits < (66 - (state*50))) { // basic == 16%, degraded == 66%
        return _assetRetriever.getAsset(baseNumbersArray[0]);
      } else if (baseDigits < (99 - (state*57))) { // basic == 42%, degraded == 33%
        return _assetRetriever.getAsset(baseNumbersArray[1]);
      } else { // basic == 42%, degraded == 1%
        return _assetRetriever.getAsset(baseNumbersArray[2]);
      }
    }
  }

  function getFrame(bytes memory digits, uint state) internal view returns (string memory) {
    uint[] memory frameNumbersArray = GridHelper.setUintArrayFromString(FRAME_NUMBERS, 6, 4);
    uint frameDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 14, 2));
    string memory output = "";
    if (state == 2) {
      if (frameDigits < 50) {
        output = string.concat(_assetRetriever.getAsset(frameNumbersArray[3]), _assetRetriever.getAsset(frameNumbersArray[0]));
        if (frameDigits < 25) {
          output = string.concat(output, _assetRetriever.getAsset(frameNumbersArray[4]));
        } else {
          output = string.concat(output, _assetRetriever.getAsset(frameNumbersArray[5]));
        }
      } else {
        output = _assetRetriever.getAsset(frameNumbersArray[2]);
        if (frameDigits < 75) {
          output = string.concat(output, _assetRetriever.getAsset(frameNumbersArray[4]));
        } else {
          output = string.concat(output, _assetRetriever.getAsset(frameNumbersArray[5]));
        }
      }
    } else {
      if (frameDigits < (state + 1) * 25) { // Big frame
        output = _assetRetriever.getAsset(frameNumbersArray[0]);
        if (frameDigits % 2 == 0 && state == 1) {
          output = string.concat(output, _assetRetriever.getAsset(frameNumbersArray[4])); // HOLE
        } else {
          output = string.concat(output, _assetRetriever.getAsset(frameNumbersArray[5])); // EYES
        }
      } else if (frameDigits < state * 100) { // Small frame
        output = _assetRetriever.getAsset(frameNumbersArray[1]);
        output = string.concat(output, _assetRetriever.getAsset(frameNumbersArray[5])); // HOLE
      } else {
        output = _assetRetriever.getAsset(frameNumbersArray[4]); // HOLE
      }
    }
    return output;
  }

  function getStepsRunner(bytes memory digits, uint state) internal view returns (string memory) {
    uint[] memory stepsRunnersNumbersArray = GridHelper.setUintArrayFromString(STEPS_RUNNERS_NUMBERS, 3, 4);
    uint stepsRunnersDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 20, 2));
    string memory stepsRunner = "";
    if (state == 2) {
      if (stepsRunnersDigits < 20) {
        stepsRunner = string.concat(stepsRunner, _assetRetriever.getAsset(stepsRunnersNumbersArray[2]));
      }
      stepsRunner = string.concat(stepsRunner, _assetRetriever.getAsset(stepsRunnersNumbersArray[0]));
      if (stepsRunnersDigits < 50) {
        stepsRunner = string.concat(stepsRunner, _assetRetriever.getAsset(stepsRunnersNumbersArray[1]));
      }
    }
    return stepsRunner;
  }

  function getRug(bytes memory digits, uint state) internal view returns (string memory) {
    uint[] memory rugNumbersArray = GridHelper.setUintArrayFromString(RUG_NUMBERS, 2, 4);
    uint rugDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 22, 2));
    if (state == 2) {
      if (rugDigits < 50) {
        return _assetRetriever.getAsset(rugNumbersArray[0]);
      } else {
        return _assetRetriever.getAsset(rugNumbersArray[1]);
      }
    }
  }

  function getOrbBases(bytes memory digits, uint state) internal view returns (string[] memory) {
    uint[] memory orbBaseNumbersArray = GridHelper.setUintArrayFromString(ORB_BASE_NUMBERS, 6, 4);
    uint orbBaseOneDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 16, 2));
    uint orbBaseTwoDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 18, 2));
    uint[2] memory orbBaseDigits = [orbBaseOneDigits, orbBaseTwoDigits];
    string[] memory orbBaseArray = new string[](2);
    for (uint i = 0; i < 2; ++i) {
      if (state == 2) {
        if (orbBaseDigits[i] < 10) { // 10% chance and must be embellished = very rare
          orbBaseArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbBaseNumbersArray[2]));
        }
      }
      if (state != 0) { // 1,2 = basic or embellished
        // 5 possible bases equally weighted
        if (orbBaseDigits[i] < 20) { // 20% chance in basic, 10% chance in embellished
          orbBaseArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbBaseNumbersArray[0]));
        } else if (orbBaseDigits[i] < 40) {
          orbBaseArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbBaseNumbersArray[1]));
        } else if (orbBaseDigits[i] < 60) {
          orbBaseArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbBaseNumbersArray[3]));
        } else if (orbBaseDigits[i] < 80) {
          orbBaseArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbBaseNumbersArray[4]));
        } else {
          orbBaseArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbBaseNumbersArray[5]));
        }
      }
    }
    return orbBaseArray;
  }

  function getOrbs(bytes memory digits, uint state) internal view returns (string[] memory) {
    uint[] memory orbNumbersArray = GridHelper.setUintArrayFromString(ORB_NUMBERS, 4, 4);
    uint orbOneDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 24, 2));
    uint orbTwoDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 26, 2));
    uint[2] memory orbDigits = [orbOneDigits, orbTwoDigits];
    string[] memory orbArray = new string[](2);
    for (uint i = 0; i < 2; ++i) {
      if (state == 0 && orbDigits[i] < 5) { // 5% chance of an orb in degraded = very rare
        orbArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbNumbersArray[0]));
      } else if (state == 1 && orbOneDigits != orbTwoDigits) { // in very rare cases basic will have no orbs
        if (orbDigits[i] < 50) {
          orbArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbNumbersArray[0]));
        } else {
          orbArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbNumbersArray[1]));
        }
      } else if (state == 2) {
        if (orbDigits[i] < 25) {
          orbArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbNumbersArray[0]));
        } else if (orbDigits[i] < 50) {
          orbArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbNumbersArray[1]));
        } else if (orbDigits[i] < 75) {
          orbArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbNumbersArray[2]));
        } else {
          orbArray[i] = GridHelper.groupTransform(string(GridHelper.slice(bytes(ORB_OFFSETS), 2*i*4, 4)), string(GridHelper.slice(bytes(ORB_OFFSETS), (2*i + 1)*4, 4)), _assetRetriever.getAsset(orbNumbersArray[3]));
        }
      }
    }
    return orbArray;
  }

  function getFloobAnimation() internal view returns (string memory) {
    uint[] memory floobNumbersArray = GridHelper.setUintArrayFromString(FLOOB_ANIMATION_NUMBERS, 3, 4);
    return string.concat(
      _assetRetriever.getAsset(floobNumbersArray[0]),
      _assetRetriever.getAsset(floobNumbersArray[1]),
      _assetRetriever.getAsset(floobNumbersArray[2])
    );
  }

  function getMachine(bytes memory digits, uint state) external view returns (string memory) {

    // uint state = 0;
    string[] memory orbBases = getOrbBases(digits, state);
    string[] memory orbs = getOrbs(digits, state);

    string memory output = string.concat(
      getFrame(digits, state),
      orbBases[1],
      orbs[1],
      getCube(digits, state),
      getFloobAnimation(),
      orbBases[0],
      orbs[0]
    );

    output = string.concat(
      output,
      getRug(digits, state),
      getStepsRunner(digits, state)
    );

    return output;
  }

  function getProductivityFromArray(string[] memory productivityArray) internal pure returns(string memory) {
    // There are 7 productivity levels: Depleted, Very Low, Low, Medium, High, Very High and Max
    // if the array contains depleted then it is depleted, similarly for Max
    // else we return the most common productivity level
    // if there is a tie we return the first one
    uint8[7] memory productivityCount = [0, 0, 0, 0, 0, 0, 0];
    for (uint i = 0; i < productivityArray.length; ++i) {
      if (keccak256(abi.encodePacked(productivityArray[i])) == keccak256(abi.encodePacked("Depleted"))) {
        return "Depleted";
      } else if (keccak256(abi.encodePacked(productivityArray[i])) == keccak256(abi.encodePacked("Very Low"))) {
        productivityCount[1] += 1;
      } else if (keccak256(abi.encodePacked(productivityArray[i])) == keccak256(abi.encodePacked("Low"))) {
        productivityCount[2] += 1;
      } else if (keccak256(abi.encodePacked(productivityArray[i])) == keccak256(abi.encodePacked("Medium"))) {
        productivityCount[3] += 1;
      } else if (keccak256(abi.encodePacked(productivityArray[i])) == keccak256(abi.encodePacked("High"))) {
        productivityCount[4] += 1;
      } else if (keccak256(abi.encodePacked(productivityArray[i])) == keccak256(abi.encodePacked("Very High"))) {
        productivityCount[5] += 1;
      } else if (keccak256(abi.encodePacked(productivityArray[i])) == keccak256(abi.encodePacked("Max"))) {
        return "Max";
      }
    }

    uint max = 0;
    uint maxIndex = 0;
    for (uint i = 0; i < productivityCount.length; ++i) {
      if (productivityCount[i] > max) {
        max = productivityCount[i];
        maxIndex = i;
      }
    }

    if (maxIndex == 1) {
      return "Low";
    } else if (maxIndex == 2) {
      return "Medium";
    } else if (maxIndex == 3) {
      return "High";
    } else if (maxIndex == 4) {
      return "Very High";
    } else if (maxIndex == 5) {
      return "Ultra";
    } else {
      return "Null"; // should never happen
    }
  }
}