// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";

contract Machine {
  // GRIDS
  string[9] public noRow1Grid = ["x", "x", "x", "", "", "", "", "", ""];
  string[9] public fullGrid = ["x", "x", "x", "x", "x", "x", "x", "x", "x"];

  // conveyor belt
  string[] public machines = ["conveyorBelt"];
  mapping(string => uint[][]) internal machineToPosition;
  mapping(string => uint) internal machineToSWHeight;
  mapping(string => string[]) internal machineToSVG;
  mapping(string => string[9]) internal machineToLWGrid;

  string internal constant CONVEYOR_BELT = "<g id='machine' class='ma' transform='translate(-312,180)'><g id='ma-mo-c' transform='translate(312,-180)'><g id='bu-t'><svg width='312' height='360'><polygon  class='ma-mo-t' points='156,0 312,90 156,180 0,90'></polygon></svg></g><g id='bu-l'><svg width='312' height='360'><polygon class='ma-g2' points='156,180 312,90 312,270 156,360'></polygon></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='ma-g3' points='156,180 156,360 0,270 0,90'></polygon></svg></g><text class='bla' x='156' y='85'><tspan>Ma 0 C</tspan></text></g><g id='ma-mo-b' transform='translate(156,-90)'><g id='bu-t'><svg width='312' height='360'><polygon  class='ma-mo' points='156,0 312,90 156,180 0,90'></polygon></svg></g><g id='bu-l'><svg width='312' height='360'><polygon class='ma-g2' points='156,180 312,90 312,270 156,360'></polygon></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='ma-g3' points='156,180 156,360 0,270 0,90'></polygon></svg></g><text class='bla' x='156' y='85'><tspan>Ma 0 B</tspan></text></g><g id='ma-mo-a'><g id='bu-t'><svg width='312' height='360'><polygon  class='ma-mo' points='156,0 312,90 156,180 0,90'></polygon></svg></g><g id='bu-l'><svg width='312' height='360'><polygon class='ma-g2' points='156,180 312,90 312,270 156,360'></polygon></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='ma-g3' points='156,180 156,360 0,270 0,90'></polygon></svg></g>";
  string internal constant CONVEYOR_BELT_FLIPPED = "<g id='machine-CB2-MaB5-MaA8' class='ma' transform='translate(0,-540)'><g id='CB 2' transform='translate(0,540)'><g id='CB 2L'><svg width='312' height='360'><polygon points='156,180 312,90 312,270 156,360' class='ma-g2'></polygon></svg></g><g id='CB 2R'><svg width='312' height='360'><polygon points='156,180 156,360 0,270 0,90' class='ma-g3'></polygon></svg></g><g id='CB 2T'><svg width='312' height='360'><polygon points='156,0 312,90 156,180 0,90' class='ma-g1'></polygon></svg></g><text y='90' x='125' class='bla'><tspan>CB 2</tspan></text></g><g id='Ma B 5' transform='translate(156,630)'><g id='Ma B 5L'><svg width='312' height='360'><polygon points='156,180 312,90 312,270 156,360' class='ma-g2'></polygon></svg></g><g id='Ma B 5R'><svg width='312' height='360'><polygon points='156,180 156,360 0,270 0,90' class='ma-g3'></polygon></svg></g><g id='Ma B 5T'><svg width='312' height='360'><polygon points='156,0 312,90 156,180 0,90' class='ma-g1'></polygon></svg></g><text y='90' x='125' class='bla'><tspan>Ma B 5</tspan></text></g><g id='Ma A 8' transform='translate(312,720)'><g id='Ma A 8L'><svg width='312' height='360'><polygon points='156,180 312,90 312,270 156,360' class='ma-g2'></polygon></svg></g><g id='Ma A 8R'><svg width='312' height='360'><polygon points='156,180 156,360 0,270 0,90' class='ma-g3'></polygon></svg></g><g id='Ma A 8T'><svg width='312' height='360'><polygon points='156,0 312,90 156,180 0,90' class='ma-g1'></polygon></svg></g>";
  string internal constant CONVEYOR_BELT_TEXT_OPEN = "<text class='bla' x='156' y='85'>";
  string internal constant CONVEYOR_BELT_END = "</g></g>";
  uint internal constant CONVEYOR_BELT_SW_HEIGHT = 1;
  uint[][] public conveyorBeltPositions = [[0,1,2], [3,4,5], [6,7,8]];

  string internal constant DRILLS = "";
  string internal constant DRILLS_FLIPPED = "";
  string internal constant DRILLS_TEXT_OPEN = "";
  string internal constant DRILLS_END = "";
  uint internal constant DRILLS_SW_HEIGHT = 3;
  uint[][] public drillsPositions = [[0,1,2], [3,4,5], [6,7,8]];

  string internal constant TEXT_CLOSE = "</text>";

  constructor() {
    // conveyor belt
    machineToPosition["conveyorBelt"] = conveyorBeltPositions;
    machineToSWHeight["conveyorBelt"] = CONVEYOR_BELT_SW_HEIGHT;
    machineToSVG["conveyorBelt"] = [CONVEYOR_BELT, CONVEYOR_BELT_FLIPPED, CONVEYOR_BELT_TEXT_OPEN, CONVEYOR_BELT_END];
    machineToLWGrid["conveyorBelt"] = noRow1Grid;

    // drills
    machineToPosition["drills"] = drillsPositions;
    machineToSWHeight["drills"] = DRILLS_SW_HEIGHT;
    machineToSVG["drills"] = [DRILLS, DRILLS_TEXT_OPEN, DRILLS_END];
    machineToLWGrid["drills"] = fullGrid;
  }

  function selectMachine(uint rand) public view returns (string memory) {
      return machines[rand % machines.length];
  }

  function getMachinePosition (string memory machine, uint rand) public view returns (uint[] memory) {
    return machineToPosition[machine][rand % machineToPosition[machine].length];
  }

  function getMachineSWHeight(string memory machine) public view returns (uint) {
    return machineToSWHeight[machine];
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
  function getMachineSVG(string memory machine, uint position, bool leftAlign) external view returns (string memory) {
    string memory svg = "";
    if (leftAlign) {
      svg = machineToSVG[machine][0];
    } else {
      svg = machineToSVG[machine][1];
    }
    svg = string.concat(
        svg,
        machineToSVG[machine][2], // open text
        positionText(machine, position),
        TEXT_CLOSE,
        machineToSVG[machine][3]
    );
    return svg;
  }
}