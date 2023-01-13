// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../CommonSVG.sol";
import "./BeastAdditional1.sol";
import "./BeastAdditional2.sol";
import "./BeastAdditional3.sol";
import "./BeastAdditional4.sol";

contract Beast {

  function getMineralEyes(uint eyes) internal pure returns (string memory) {
    if (eyes == 0) {
      return BeastAdditional2.getMineralEyes1();
    } else if (eyes == 1) {
      return BeastAdditional2.getMineralEyes2();
    } else {
      return "";
    }
  }

  function getMConnector(uint connector) internal pure returns (string memory) {
    if (connector == 0) {
      return string.concat(
        BeastAdditional1.getBaseConnector1(),
        BeastAdditional1.getMainPipe1(),
        BeastAdditional1.getPipeShadow1()
      );
    } else if (connector == 1) {
      return string.concat(
        BeastAdditional2.getBaseConnector2(),
        BeastAdditional2.getMainPipe2(),
        BeastAdditional2.getPipeShadow2()
      );
    } else {
      return "";
    }
  }

  function getMineralConnector(bytes memory digits) internal pure returns (string memory) {
    // need to determine which connector to use and which eyes to use

    // 1st digit is the connector
    bytes memory connectorBytes = GridHelper.slice(digits, 0, 1);
    uint connector = GridHelper.stringToUint(string(connectorBytes)) % 2;

    // 2nd digit is the eyes
    bytes memory eyesBytes = GridHelper.slice(digits, 1, 1);
    uint eyes = GridHelper.stringToUint(string(eyesBytes)) % 2;

    return string.concat(
      "<g id='bst_1-u-c-mineral-face-a' style='display: inline-block;'>",
      BeastAdditional4.getMineralBody(),
      BeastAdditional4.getSurfaceConnector(),
      getMConnector(connector),
      getMineralEyes(eyes),
      "</g>"
    );
  }

  function getFace(bytes memory digits) internal pure returns (string memory) {
    bytes memory mouthBytes = GridHelper.slice(digits, 2, 1);
    uint mouth = GridHelper.stringToUint(string(mouthBytes)) % 2;
    // TESTING
    mouth = 1;
    string memory output = "";
    
    if (mouth == 0) {
      output = BeastAdditional3.getFaceMouth1();
    } else if (mouth == 1) {
      output = BeastAdditional3.getFaceMouth2();
    }

    return string.concat(
      output,
      BeastAdditional3.getFaceEyes(),
      BeastAdditional3.getFaceNose()
    );
  }

  function getCylinderTop(bytes memory digits) internal pure returns (string memory) {
    bytes memory topBytes = GridHelper.slice(digits, 3, 1);
    uint top = GridHelper.stringToUint(string(topBytes)) % 2;
    // TESTING
    top = 0;
    string memory output = string.concat(
      "<g id='bst_1-u-c-excretion-face-a' style='display: inline-block;'>",
      BeastAdditional3.getTopTube()
    );

    if (top == 0) {
      return string.concat(
        output,
        BeastAdditional4.getTopEyes1(),
        "</g>"
      );
    } else if (top == 1) {
      return string.concat(
        output,
        BeastAdditional4.getTopEyes2(),
        "</g>"
      );
    } else {
      return output;
    }

  }

  function getMachine(bytes memory digits) external pure returns (string memory) {

    return CommonSVG.groupTransform("-624", "-540", 
      string.concat(
        BeastAdditional1.getCylinder(),
        BeastAdditional1.getWallHatch(),
        BeastAdditional1.getPlatform(),
        getMineralConnector(digits),
        getFace(digits),
        getCylinderTop(digits),
        BeastAdditional3.getExcretionFloob()
      )
    );
  }
}