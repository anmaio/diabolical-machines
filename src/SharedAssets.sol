// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./CommonSVG.sol";

contract SharedAssets {
  mapping(string => uint[]) internal objectToSVGIndex;
  mapping(string => uint) internal numObjectParts;
  mapping(string => string[]) internal partXOffset;
  mapping(string => string[]) internal partYOffset;

  // TESTING labels index of objects position
  mapping(string => string) internal objectText;

  string internal constant SHELL = "<g id='shell-clip' clip-path='url(#shell-clip)'><g id='diorama-filters' filter='url(#chromatic-aberration)'><g id='shell'> <g id='shell-main' transform='translate(0,0)'> <g id='floor'> <svg height='1080' width='936'> <g> <polygon class='floor' points='0,810 468,1080 936,810 468,540' /> </g> <line class='hd' x1='156' y1='900' x2='624' y2='630'  /> <line class='hd' x1='312' y1='990' x2='780' y2='720'  /> <line class='hd' x1='156' y1='720' x2='624' y2='990'  /> <line class='hd' x1='312' y1='630' x2='780' y2='900'  /> </svg> </g> <g id='wall-l'> <svg class='wall-l' height='1080' width='936'> <polygon points='0,270 468,0 468,540 0,810' /> <line class='hd' x1='0' y1='630' x2='468' y2='360'  /> <line class='hd' x1='0' y1='450' x2='468' y2='180'  /> <line class='hd' x1='156' y1='180' x2='156' y2='720'  /> <line class='hd' x1='312' y1='90' x2='312' y2='630'  /> </svg> </g> <g id='wall-r'> <svg class='wall-r' height='1080' width='936'> <polygon points='468,540 468,0 936,270 936,810' /> <line class='hw' x1='468' y1='180' x2='936' y2='450'  /> <line class='hw' x1='468' y1='360' x2='936' y2='630'  /> <line class='hw' x1='624' y1='90' x2='624' y2='630'  /> <line class='hw' x1='780' y1='180' x2='780' y2='720'  /> </svg> </g> </g> </g>";

  // Floor Altar
  // string internal constant ALTAR =
  //     "<g id='props0'> <g id='bu-t'><svg width='312' height='360'><polygon class='g1' points='156,0 312,90 156,180 0,90' /></svg></g> <g id='bu-l'><svg width='312' height='360'><polygon class='g2' points='156,180 312,90 312,270 156,360' /></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='g3' points='156,180 156,360 0,270 0,90' /></svg>";
  // string internal constant ALTAR_TEXT_OPEN = "<text class='bla'  x='156' y='85'>";
  // string internal ALTAR_END = CommonSVG.G2_END;


  // // Floor Props
  // string internal constant PROPS =
  //     "<g id='props0'> <g id='bu-t'><svg width='312' height='360'><polygon class='g1' points='156,0 312,90 156,180 0,90' /></svg></g> <g id='bu-l'><svg width='312' height='360'><polygon class='g2' points='156,180 312,90 312,270 156,360' /></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='g3' points='156,180 156,360 0,270 0,90' /></svg>";
  // string internal constant PROPS_TEXT_OPEN = "<text class='bla'  x='156' y='85'>";
  // string internal PROPS_END = CommonSVG.G2_END;


  // string internal constant LEFT_FRAME =
  //     "<g id='frameL-2'> <g id='fr-t'> <svg width='312' height='360'> <polygon class='g1' points='156,0 181,18 25,108 0,90' /> <polygon class='g2' points='181,18 181,195 26,289 25,108' /> <polygon class='g3' points='0,90 25,108 26,289 0,270' /> </svg>";
  // string internal constant LEFT_FRAME_TEXT_OPEN = "<text class='bla' x='110' y='155'>";
  // string internal LEFT_FRAME_END = CommonSVG.G2_END;


  // string internal constant RIGHT_FRAME =
  //     "<g id='frameR'><g id='frameRL'><svg width='312' height='360'><polygon points='312,90 312,270 300,276 300,96' class='g2'></polygon></svg></g><g id='frameRR'><svg width='312' height='360'><polygon points='300,96 300,276 144,186 144,6' class='g3'></polygon></svg></g><g id='frameRT'><svg width='312' height='360'><polygon points='156,0,312,90,300,96,144,6' class='g1'></polygon></svg>";
  // string internal constant RIGHT_FRAME_TEXT_OPEN = "<text y='150' x='200' class='bla2'>";
  // string internal RIGHT_FRAME_END = CommonSVG.G2_END;


  // string internal constant RIGHT_CLOCK =
  //     "<g id='frameR'><g id='frameRL'><svg width='312' height='360'><polygon points='312,90 312,270 300,276 300,96' class='g2'></polygon></svg></g><g id='frameRR'><svg width='312' height='360'><polygon points='300,96 300,276 144,186 144,6' class='g3'></polygon></svg></g><g id='frameRT'><svg width='312' height='360'><polygon points='156,0,312,90,300,96,144,6' class='g1'></polygon></svg>";
  // string internal constant RIGHT_CLOCK_TEXT_OPEN = "<text y='150' x='200' class='bla2'>";
  // string internal RIGHT_CLOCK_END = CommonSVG.G2_END;

  string[] internal objectParts = [
    // ALTAR
    "<g id='props0'> <g id='bu-t'><svg width='312' height='360'><polygon class='g1' points='156,0 312,90 156,180 0,90' /></svg></g> <g id='bu-l'><svg width='312' height='360'><polygon class='g2' points='156,180 312,90 312,270 156,360' /></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='g3' points='156,180 156,360 0,270 0,90' /></svg>",
    // PROPS
    "<g id='props0'> <g id='bu-t'><svg width='312' height='360'><polygon class='g1' points='156,0 312,90 156,180 0,90' /></svg></g> <g id='bu-l'><svg width='312' height='360'><polygon class='g2' points='156,180 312,90 312,270 156,360' /></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='g3' points='156,180 156,360 0,270 0,90' /></svg>",
    // LEFT_FRAME
    "<g id='frameL-2'> <g id='fr-t'> <svg width='312' height='360'> <polygon class='g1' points='156,0 181,18 25,108 0,90' /> <polygon class='g2' points='181,18 181,195 26,289 25,108' /> <polygon class='g3' points='0,90 25,108 26,289 0,270' /> </svg>",
    // RIGHT_FRAME
    "<g id='frameR'><g id='frameRL'><svg width='312' height='360'><polygon points='312,90 312,270 300,276 300,96' class='g2'></polygon></svg></g><g id='frameRR'><svg width='312' height='360'><polygon points='300,96 300,276 144,186 144,6' class='g3'></polygon></svg></g><g id='frameRT'><svg width='312' height='360'><polygon points='156,0,312,90,300,96,144,6' class='g1'></polygon></svg>",
    // RIGHT_CLOCK
    "<g id='frameR'><g id='frameRL'><svg width='312' height='360'><polygon points='312,90 312,270 300,276 300,96' class='g2'></polygon></svg></g><g id='frameRR'><svg width='312' height='360'><polygon points='300,96 300,276 144,186 144,6' class='g3'></polygon></svg></g><g id='frameRT'><svg width='312' height='360'><polygon points='156,0,312,90,300,96,144,6' class='g1'></polygon></svg>"
  ];

  constructor() {
      objectToSVGIndex["altar"] = [0, 0];
      numObjectParts["altar"] = 1;
      objectText["altar"] = "<text class='bla'  x='156' y='85'>";

      objectToSVGIndex["props"] = [1, 1];
      numObjectParts["props"] = 1;
      objectText["props"] = "<text class='bla'  x='156' y='85'>";

      objectToSVGIndex["lFrame"] = [2, 3];
      numObjectParts["lFrame"] = 1;
      objectText["lFrame"] = "<text class='bla' x='110' y='155'>";

      objectToSVGIndex["rFrame"] = [3, 2];
      numObjectParts["rFrame"] = 1;
      objectText["rFrame"] = "<text class='bla2' y='150' x='200'>";

      objectToSVGIndex["rClock"] = [4, 2];
      numObjectParts["rClock"] = 1;
      objectText["rClock"] = "<text class='bla2' y='150' x='200'>";
  }

  // EXTERNAL FUNCTIONS

  function getShell() external pure returns (string memory) {
      return SHELL;
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

  // // Get an object's SVG
  // function getObject(string memory object, uint position, bool leftAlign) external view returns (string memory) {
  //   string memory svg = "";
  //   if (leftAlign) {
  //     svg = string.concat(objectToSVGIndex[object][0], objectToSVGIndex[object][2]);
  //   } else {
  //     svg = string.concat(objectToSVGIndex[object][1], objectToSVGIndex[object][3]);
  //   }
  //   svg = string.concat(
  //     svg,
  //     positionText(object, position),
  //     CommonSVG.TEXT_CLOSE,
  //     objectToSVGIndex[object][4]
  //   );
  //   return svg;
  // }


  function getObjectSVG(string memory object, uint position, bool leftAlign) external view returns (string memory) {
    // get the number of parts the main svg is split into
    uint numParts = numObjectParts[object];
    uint offset = 0;
    string memory svg = "";
    if (!leftAlign) {
      offset = numParts;
    }
    // get the svg for each part given the alignment
    for (uint i = 0; i < numParts; i++) {
      string memory tempSvg = "";
      tempSvg = string.concat(
        objectParts[objectToSVGIndex[object][i + offset]],
        // machineToSVG[machine][i + offset],
        // Testing text
        objectText[object], // open text
        // machineToSVG[machine][numParts * 2], // open text
        positionText(object, position),
        CommonSVG.TEXT_CLOSE,
        CommonSVG.G2_END
      );
      if (numParts > 1) {
        // get the x offset for the part
        string memory xOffset = partXOffset[object][i];
        // get the y offset for the part
        string memory yOffset = partYOffset[object][i];
        tempSvg = CommonSVG.groupTransform(xOffset, yOffset, tempSvg);
      }
      svg = string.concat(svg, tempSvg);
    }

    return svg;
  }
}
