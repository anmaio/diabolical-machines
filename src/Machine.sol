// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";

contract Machine {
  // GRIDS
  string[9] public noRow1Grid = ["x", "x", "x", "", "", "", "", "", ""];

  // conveyor belt
  string[] public machines = ["conveyorBelt"];
  uint[][] public conveyorBeltPositions = [[0,1,2], [3,4,5], [6,7,8]];
  uint[] public machineHeightPW = [1]; // Primary Wall
  uint[] public machineHeightSW = [1]; // Secondary Wall
  mapping(string => uint[][]) internal machineToPosition;
  mapping(string => uint) internal machineToHeight;
  mapping(string => string[]) internal machineToSVG;
  mapping(string => string[9]) internal machineToLWGrid;

  string internal constant CONVEYOR_BELT = "<g id='machine' class='ma' transform='translate(-312,180)'><g id='ma-mo-c' transform='translate(312,-180)'><g id='bu-t'><svg width='312' height='360'><polygon  class='ma-mo-t' points='156,0 312,90 156,180 0,90'></polygon></svg></g><g id='bu-l'><svg width='312' height='360'><polygon class='ma-g2' points='156,180 312,90 312,270 156,360'></polygon></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='ma-g3' points='156,180 156,360 0,270 0,90'></polygon></svg></g><text class='bla' x='156' y='85'><tspan>Ma 0 C</tspan></text></g><g id='ma-mo-b' transform='translate(156,-90)'><g id='bu-t'><svg width='312' height='360'><polygon  class='ma-mo' points='156,0 312,90 156,180 0,90'></polygon></svg></g><g id='bu-l'><svg width='312' height='360'><polygon class='ma-g2' points='156,180 312,90 312,270 156,360'></polygon></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='ma-g3' points='156,180 156,360 0,270 0,90'></polygon></svg></g><text class='bla' x='156' y='85'><tspan>Ma 0 B</tspan></text></g><g id='ma-mo-a'><g id='bu-t'><svg width='312' height='360'><polygon  class='ma-mo' points='156,0 312,90 156,180 0,90'></polygon></svg></g><g id='bu-l'><svg width='312' height='360'><polygon class='ma-g2' points='156,180 312,90 312,270 156,360'></polygon></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='ma-g3' points='156,180 156,360 0,270 0,90'></polygon></svg></g>";
  string internal constant CONVEYOR_BELT_TEXT_OPEN = "<text class='bla' x='156' y='85'>";
  string internal constant CONVEYOR_BELT_END = "</g></g>";

  string internal constant TEXT_CLOSE = "</text>";

  constructor() {
    machineToPosition["conveyorBelt"] = conveyorBeltPositions;
    machineToHeight["conveyorBelt"] = machineHeightSW[0];
    machineToSVG["conveyorBelt"] = [CONVEYOR_BELT, CONVEYOR_BELT_TEXT_OPEN, CONVEYOR_BELT_END];
    machineToLWGrid["conveyorBelt"] = noRow1Grid;
  }

  function selectMachine(uint rand) public view returns (string memory) {
    return machines[rand % machines.length];
  }

  function getMachinePosition (string memory machine, uint rand) public view returns (uint[] memory) {
    return machineToPosition[machine][rand % machineToPosition[machine].length];
  }

  function getMachineSWHeight(string memory machine) public view returns (uint) {
    return machineToHeight[machine];
  }

  function getMachineLWGrid(string memory machine) public view returns (string[9] memory) {
    return machineToLWGrid[machine];
  }

  // INTERNAL FUNCTIONS

  function positionText(string memory name, uint position) internal pure returns (string memory) {
      string memory text = string.concat(
          "<tspan>",
          name,
          Strings.toString(position),
          "</tspan>"
      );
      return text;
  }

  // Get an object's SVG
  function getMachineSVG(string memory machine, uint position) external view returns (string memory) {
    string memory svg = string.concat(
        machineToSVG[machine][0],
        machineToSVG[machine][1], // open text
        positionText(machine, position),
        TEXT_CLOSE,
        machineToSVG[machine][2]
    );
    return svg;
  }
}