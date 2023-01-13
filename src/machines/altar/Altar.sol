// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "./AltarAdditional1.sol";
import "./AltarAdditional2.sol";
import "./AltarAdditional3.sol";

contract Altar {

  // Each position is represented by 6 bytes, 3 for x and 3 for y
  string internal constant ORB_POSITIONS = "000000312180";

  uint internal constant ORB_CHANCE = 50;

  uint internal constant CUBE_CHANCE = 100;
  uint internal constant STAIRS_CHANCE = 50;
  uint internal constant RUG_CHANCE = 50;

  function getSingleVariations(bytes memory digits) internal pure returns (string memory) {
    uint cubeDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 6, 2));
    uint stairsDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 8, 2));
    uint rugDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 10, 2));

    string memory output = "";

    if (cubeDigits < CUBE_CHANCE) {
      output = string.concat(output, AltarAdditional2.getCube());
    }
    if (stairsDigits < STAIRS_CHANCE) {
      output = string.concat(output, AltarAdditional2.getStairs());
    }
    if (rugDigits < RUG_CHANCE) {
      output = string.concat(output, AltarAdditional3.getRug());
    }
    return output;
  }

  function getFrame(bytes memory digits) internal pure returns (string memory) {
    uint frameDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 0, 2));

    if (frameDigits < 50) {
      return AltarAdditional3.getFrame1();
    } else {
      return AltarAdditional3.getFrame2();
    }
  }

  // determine if there is an orb is either position, if so select an orb
  function getOrbs(bytes memory digits) internal pure returns (string[] memory) {
    uint orb1Digits = GridHelper.bytesToUint(GridHelper.slice(digits, 2, 2));
    uint orb2Digits = GridHelper.bytesToUint(GridHelper.slice(digits, 4, 2));

    uint[2] memory orbs = [orb1Digits, orb2Digits];

    string[] memory orbArray = new string[](2);
    for (uint i = 0; i < 2; i++) {
      if (orbs[i] < ORB_CHANCE) {
        if (orbs[i] % 2 == 0) {
          orbArray[i] = CommonSVG.groupTransform(string(GridHelper.slice(bytes(ORB_POSITIONS), 2*i*3, 3)), string(GridHelper.slice(bytes(ORB_POSITIONS), (2*i + 1)*3, 3)), AltarAdditional1.getOrb1());
        } else {
          orbArray[i] = CommonSVG.groupTransform(string(GridHelper.slice(bytes(ORB_POSITIONS), 2*i*3, 3)), string(GridHelper.slice(bytes(ORB_POSITIONS), (2*i + 1)*3, 3)), AltarAdditional1.getOrb2());
        }
      }
    }
    return orbArray;
  }

  function getMachine(bytes memory digits) external pure returns (string memory) {
    string[] memory orbs = getOrbs(digits);
    return CommonSVG.groupTransform("-312", "-720", string.concat(getFrame(digits), orbs[0], getSingleVariations(digits), orbs[1]));
  }
}