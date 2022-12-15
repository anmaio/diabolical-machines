// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "../../GridHelper.sol";
import "../../CommonSVG.sol";
import "./NoseAdditional1.sol";
import "./NoseAdditional2.sol";

contract Nose {
  
  string internal constant HOLES_OFFSET = "-156-630-312-540-468-450+000-540-156-450-312-360";

  string internal constant HOLES_5 = "+00+00+00-55+00+55-90+00+90+00";
  string internal constant HOLES_4 = "+50+35+50-35-50+35-50-35";

  // get the eyes from the eye number
  function getEyes(uint eyeNumber) internal pure returns (string memory) {
    if (eyeNumber == 0) {
      return NoseAdditional2.getEyes1();
    } else if (eyeNumber == 1) {
      return NoseAdditional2.getEyes2();
    } else {
      return NoseAdditional2.getEyes3();
    }
  }

  // get the nose from the nose number
  function getNose(uint noseNumber) internal pure returns (string memory) {

    if (noseNumber == 0) {
      return NoseAdditional1.getNose1();
    } else if (noseNumber == 1) {
      return NoseAdditional1.getNose2();
    } else if (noseNumber == 2) {
      return NoseAdditional1.getNose3();
    } else if (noseNumber == 3) {
      return NoseAdditional1.getNose4();
    } else {
      return NoseAdditional1.getNose5();
    }
  }

  // get the holes
  function getHoles(uint[6] memory holeDistribution) internal pure returns (string memory) {

    // string[12] memory HOLE_OFFSET = ["-156", "-630", "-312", "-540", "-468", "-450", "0", "-540", "-156", "-450", "-312", "-360"];
    // string[10] memory holes4 = ["0", "0", "0", "-55", "0", "55", "-90", "0", "90", "0"];
    // string[10] memory holes5 = ["50", "35", "50", "-35", "-50", "35", "-50", "-35", "null", "null"];

    string memory output = "";

    // call the function for the given number of holes - possible values = 4, 5 and 0 if empty
    for (uint i = 0; i < holeDistribution.length; i++) {
      // get the x and y offset for the hole distribution
      string memory xOffset = string(GridHelper.slice(bytes(HOLES_OFFSET), 2*i*4, 4));
      string memory yOffset = string(GridHelper.slice(bytes(HOLES_OFFSET), (2*i + 1)*4, 4));

      // string memory xOffset = HOLE_OFFSET[i * 2];
      // string memory yOffset = HOLE_OFFSET[i * 2 + 1];
      // 5 holes
      if (holeDistribution[i] == 0) {
        output = string.concat(output, CommonSVG.groupTransform(xOffset, yOffset, GridHelper.repeatGivenObject(NoseAdditional1.getHole(), 5, bytes(HOLES_5))));
        // output = string.concat(output, getArrangement(xOffset, yOffset, bytes(HOLES_5)));
      // 4 holes
      } else if (holeDistribution[i] == 1) {
        output = string.concat(output, CommonSVG.groupTransform(xOffset, yOffset, GridHelper.repeatGivenObject(NoseAdditional1.getHole(), 4, bytes(HOLES_4))));
        // output = string.concat(output, getArrangement(xOffset, yOffset, bytes(HOLES_4)));
      }
    }
    return output;
  }

  function getMachine(uint[6] memory holeDistribution, bytes memory digits) external pure returns (string memory) {
    // get the eyes
    bytes memory eyesBytes = GridHelper.slice(digits, 0, 2);
    uint eyesVersion = GridHelper.stringToUint(string(eyesBytes)) % 3;
    string memory eyes = getEyes(eyesVersion);
    // wrap the eyes
    eyes = string.concat(
      "<g id='m_a_limit33-u-eyes' transform='translate(-900,-1200)'>",
      eyes,
      "</g>"
    );

    // get the nose
    bytes memory noseBytes = GridHelper.slice(digits, 2, 2);
    uint noseVersion = GridHelper.stringToUint(string(noseBytes)) % 5;
    string memory nose = getNose(noseVersion);
    // wrap the nose
    nose = string.concat(
      "<g id='m_a_limit33-u-nose_to' style='animation-play-state: running; display: inline-block;'><g id='m_a_limit33-u-nose'>",
      nose,
      "</g></g>"
    );

    string memory output = string.concat("<g id='m_a_limit33-u-a_to' style='animation-play-state: running;'><g id='m_a_limit33-u-a' style='transform: transform-origin: center center;'>", NoseAdditional1.getMovingPanel(), eyes, nose, "</g></g>");
    return string.concat(CommonSVG.groupTransform("-212", "-240", getHoles(holeDistribution)), output);
  }
}