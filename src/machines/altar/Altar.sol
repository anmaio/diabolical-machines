// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "./AltarAdditional1.sol";
import "./AltarAdditional2.sol";
import "./AltarAdditional3.sol";

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
  string internal constant FRAME_NUMBERS = "700370047012";
  string internal constant ORB_BASE_NUMBERS = "700570067007700870097010";
  string internal constant STEPS_RUNNERS_NUMBERS = "701370147015";

  constructor(address assetRetriever) {
    _assetRetriever = AssetRetriever(assetRetriever);
  }

  function getCube(bytes memory digits) internal view returns (string memory) {
    uint[] memory baseNumbersArray = GridHelper.setUintArrayFromString(BASE_NUMBERS, 3, 4);
    uint baseDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 12, 2));
    // 3 possible bases, can appear in any state
    if (baseDigits < 33) {
      return _assetRetriever.getAsset(baseNumbersArray[0]);
    } else if (baseDigits < 66) {
      return _assetRetriever.getAsset(baseNumbersArray[1]);
    } else {
      return _assetRetriever.getAsset(baseNumbersArray[2]);
    }
  }

  function getFrame(bytes memory digits, uint state) internal view returns (string memory) {
    uint[] memory frameNumbersArray = GridHelper.setUintArrayFromString(FRAME_NUMBERS, 3, 4);
    uint frameDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 14, 2));
    if (state == 2) {
      return _assetRetriever.getAsset(frameNumbersArray[2]);
    } else {
      if (frameDigits < 50) {
        return _assetRetriever.getAsset(frameNumbersArray[0]);
      } else {
        return _assetRetriever.getAsset(frameNumbersArray[1]);
      }
    }
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

  function getMachine(bytes memory digits) external view returns (string memory) {
    // uint state = GridHelper.bytesToUint(GridHelper.slice(digits, 0, 2)) % 3;
    uint state = 2;
    string[] memory orbBases = getOrbBases(digits, state);
    return GridHelper.groupTransform("-312", "-720", string.concat(
      getFrame(digits, state),
      orbBases[1],
      getCube(digits),
      orbBases[0],
      getStepsRunner(digits, state)
    ));
  }
}