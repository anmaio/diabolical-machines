// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "./TubesAdditional1.sol";
import "./TubesAdditional2.sol";
import "./TubesAdditional3.sol";
import "./TubesAdditional4.sol";

contract Tubes {

  string internal constant WRAP = "<g id='tbs_1-u-tbs_a' style='isolation:isolate'><g id='tbs_1-u-active'>";

  // 4 bytes for x, 4 bytes for y
  bytes internal constant SIDE_CONNECTOR_POSITIONS = "+000+000-156+532";

  // 4 bytes for x, 4 bytes for y
  bytes internal constant FLAT_CONNECTOR_POSITIONS = "+000+000+312-172";

  function selectGauges(bytes memory digits) internal pure returns (string memory) {
    string memory output = "";

    bytes memory entryBytes = GridHelper.slice(digits, 0, 2);
    uint entry = GridHelper.bytesToUint(entryBytes) % 2;

    if (entry == 0) {
      output = string.concat(output, TubesAdditional1.getEntryGauge1());
    } else {
      output = string.concat(output, TubesAdditional2.getEntryGauge2());
    }

    bytes memory exitBytes = GridHelper.slice(digits, 2, 2);
    uint exit = GridHelper.bytesToUint(exitBytes) % 2;

    if (exit == 0) {
      output = string.concat(output, TubesAdditional4.getExitGauge1());
    } else {
      output = string.concat(output, TubesAdditional4.getExitGauge2());
    }

    return output;
  }

  function getConnectors() internal pure returns (string memory) {
    string memory flat = GridHelper.repeatGivenObject(TubesAdditional2.getFlatConnector(), 2, FLAT_CONNECTOR_POSITIONS);

    string memory side = GridHelper.repeatGivenObject(TubesAdditional2.getSideConnector(), 2, SIDE_CONNECTOR_POSITIONS);
    return string.concat(flat, side);
  }

  // Used to wrap in correct tags for animation
  function wrapOutput() internal pure returns (string memory) {
    
  }

  function getMachine(bytes memory digits) external pure returns (string memory) {
  
    string memory output = string.concat(
      TubesAdditional1.getLever(),
      TubesAdditional1.getPumpEntry(),
      TubesAdditional2.getFeedbackMachine(),
      // needed to add separately for the render order
      CommonSVG.groupTransform("312", "140", TubesAdditional2.getFlatConnector()),
      TubesAdditional3.getMidTube(),
      selectGauges(digits),
      getConnectors(),
      TubesAdditional3.getExitTube(),
      TubesAdditional3.getEntryTube()
    );

    output = CommonSVG.groupTransform("-468", "-630", output);

    output = string.concat(WRAP, output, CommonSVG.G_END, CommonSVG.G_END);

    return output;
  }
}