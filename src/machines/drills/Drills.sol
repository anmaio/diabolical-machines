// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../CommonSVG.sol";
import "../../GridHelper.sol";
import "./DrillsAdditional1.sol";
import "./DrillsAdditional2.sol";

contract Drills {

  string internal constant WRAPPER_START = "<g id='m_d_6_2-u-m-dr_05' transform='translate(0, 0)' style='display: inline-block;'><g id='m_d_6_2-u-mskz-g6' mask='url(#m_d_6_2-u-mskz6)'><g id='m_d_6_2-u-c-head-all6_to' transform='translate(468.095002,512.595002)'><g id='m_d_6_2-u-c-head-all6' transform='translate(-468.095002,-632.595001)'>";

  string internal constant WRAPPER_CLOSE = "</g></g></g></g>";

  // getters 

  
  uint internal constant HEAD_ADDITIONAL_CHANCE = 50;

  function getDrillBit(bytes memory digits) internal pure returns (string memory) {
    uint drillDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 0, 2));

    if (drillDigits < 50) {
      return DrillsAdditional2.getDrillBit1();
    } else {
      return DrillsAdditional2.getDrillBit2();
    }
  }

  function getHead(bytes memory digits) internal pure returns (string memory) {
    uint headDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 2, 2));

    if (headDigits < 50) {
      return DrillsAdditional1.getHeadBase();
    } else {
      return string.concat(DrillsAdditional1.getHeadBase(), DrillsAdditional1.getHeadAdditional());
    }
  }

  function getMachine(bytes memory digits) external pure returns (string memory) {
    string memory output = string.concat(DrillsAdditional1.getLowerTube(), getDrillBit(digits), getHead(digits), DrillsAdditional1.getEyes());
    return CommonSVG.groupTransform("-312", "-360", string.concat(DrillsAdditional1.getUpperTube(), DrillsAdditional1.getTopRing(), DrillsAdditional2.getHole(), WRAPPER_START, output, WRAPPER_CLOSE));
  }
}