// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";

contract SharedAssets {
    mapping(string => string[]) internal objectToSVG;

    // opening svg start tag and grid
    string internal constant SVG_START =
        "<svg xmlns='http://www.w3.org/2000/svg' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='936' height='1080'>";

    string internal constant STYLE = "<style>.g1,.g2,.g3{stroke-width:1;fill:#fff;stroke:rgb(0,0,0,1)}.g2,.g3{fill:#696969}.g3{fill:#d3d3d3}.hd,.hl,.hm,.hw{stroke:rgb(0,0,0,.12);stroke-width:1}.hd,.hm,.hw{stroke:rgb(0,0,0,.22)}.hd,.hw{stroke:rgb(0,0,0,.75)}.hw{stroke:rgb(255,255,255,.75)}.whi{fill:#fff}.floor,.wall-l,.wall-r{fill:#fff;stroke:#000;stroke-width:1}.wall-l,.wall-r{fill:#a9a9a9}.wall-r{fill:#d3d3d3}.bla{fill:#000;x:369;y:360;text-anchor:middle;font:700 1rem sans-serif}</style>";

    string internal constant SHELL = "<g id='shell'> <g id='shell-main' transform='translate(0,0)'> <g id='floor'> <svg height='1080' width='936'> <g> <polygon class='floor' points='0,810 468,1080 936,810 468,540' /> </g> <line class='hd' x1='156' y1='900' x2='624' y2='630'  /> <line class='hd' x1='312' y1='990' x2='780' y2='720'  /> <line class='hd' x1='156' y1='720' x2='624' y2='990'  /> <line class='hd' x1='312' y1='630' x2='780' y2='900'  /> </svg> </g> <g id='wall-l'> <svg class='wall-l' height='1080' width='936'> <polygon points='0,270 468,0 468,540 0,810' /> <line class='hd' x1='0' y1='630' x2='468' y2='360'  /> <line class='hd' x1='0' y1='450' x2='468' y2='180'  /> <line class='hd' x1='156' y1='180' x2='156' y2='720'  /> <line class='hd' x1='312' y1='90' x2='312' y2='630'  /> </svg> </g> <g id='wall-r'> <svg class='wall-r' height='1080' width='936'> <polygon points='468,540 468,0 936,270 936,810' /> <line class='hw' x1='468' y1='180' x2='936' y2='450'  /> <line class='hw' x1='468' y1='360' x2='936' y2='630'  /> <line class='hw' x1='624' y1='90' x2='624' y2='630'  /> <line class='hw' x1='780' y1='180' x2='780' y2='720'  /> </svg> </g> </g> </g>";

    // Floor Altar
    string internal constant ALTAR =
        "<g id='props0'> <g id='bu-t'><svg width='312' height='360'><polygon class='g1' points='156,0 312,90 156,180 0,90' /></svg></g> <g id='bu-l'><svg width='312' height='360'><polygon class='g2' points='156,180 312,90 312,270 156,360' /></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='g3' points='156,180 156,360 0,270 0,90' /></svg>";
    string internal constant ALTAR_TEXT_OPEN = "<text class='bla'  x='156' y='85'>";
    // string internal constant ALTAR_TEXT_CLOSE = "</text>";
    string internal constant ALTAR_END = "</g></g>";


    // Floor Props
    string internal constant PROPS =
        "<g id='props0'> <g id='bu-t'><svg width='312' height='360'><polygon class='g1' points='156,0 312,90 156,180 0,90' /></svg></g> <g id='bu-l'><svg width='312' height='360'><polygon class='g2' points='156,180 312,90 312,270 156,360' /></svg></g><g id='bu-r'><svg width='312' height='360'><polygon class='g3' points='156,180 156,360 0,270 0,90' /></svg>";
    string internal constant PROPS_TEXT_OPEN = "<text class='bla'  x='156' y='85'>";
    string internal constant PROPS_END = "</g></g>";


    string internal constant LEFT_FRAME =
        "<g id='frameL-2'> <g id='fr-t'> <svg width='312' height='360'> <polygon class='g1' points='156,0 181,18 25,108 0,90' /> <polygon class='g2' points='181,18 181,195 26,289 25,108' /> <polygon class='g3' points='0,90 25,108 26,289 0,270' /> </svg>";
    string internal constant LEFT_FRAME_TEXT_OPEN = "<text class='bla' x='110' y='155'>";
    string internal constant LEFT_FRAME_END = "</g></g>";


    string internal constant RIGHT_FRAME =
        "<g id='frameR-0'> <g id='bu-t'><svg width='312' height='360'> <polygon class='g3' points='156,180 156,0 312,90 312,270' /></svg></g>";
    string internal constant RIGHT_FRAME_TEXT_OPEN = "<text class='bla' x='235' y='145'>";
    string internal constant RIGHT_FRAME_END = "</g>";


    string internal constant RIGHT_CLOCK =
        "<g id='frameR-0'> <g id='bu-t'><svg width='312' height='360'> <polygon class='g3' points='156,180 156,0 312,90 312,270' /></svg></g>";
    string internal constant RIGHT_CLOCK_TEXT_OPEN = "<text class='bla' x='235' y='145'>";
    string internal constant RIGHT_CLOCK_END = "</g>";


    // closing svg tag
    string internal constant SVG_END = "</svg>";

    string internal constant TEXT_CLOSE = "</text>";

    string internal constant G_START = "<g>";
    string internal constant G_TRANSFORM = "  <g transform='translate(";
    string internal constant G_MID = ")'>";
    string internal constant G_END = "</g>";

    constructor() {
        objectToSVG["altar"] = [ALTAR, ALTAR_TEXT_OPEN, ALTAR_END];
        objectToSVG["props"] = [PROPS, PROPS_TEXT_OPEN, PROPS_END];
        objectToSVG["lFrame"] = [LEFT_FRAME, LEFT_FRAME_TEXT_OPEN, LEFT_FRAME_END];
        objectToSVG["rFrame"] = [RIGHT_FRAME, RIGHT_FRAME_TEXT_OPEN, RIGHT_FRAME_END];
        objectToSVG["rClock"] = [RIGHT_CLOCK, RIGHT_CLOCK_TEXT_OPEN, RIGHT_CLOCK_END];
    }

    // EXTERNAL FUNCTIONS

    function getSvgStart() external pure returns (string memory) {
        return SVG_START;
    }

    function getStyle() external pure returns (string memory) {
        return STYLE;
    }

    function getShell() external pure returns (string memory) {
        return SHELL;
    }

    function getSvgEnd() external pure returns (string memory) {
        return SVG_END;
    }

    function getGTransform() external pure returns (string memory) {
        return G_TRANSFORM;
    }

    function getGMid() external pure returns (string memory) {
        return G_MID;
    }

    function getGEnd() external pure returns (string memory) {
        return G_END;
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
    function getObject(string memory object, uint position) external view returns (string memory) {
      string memory svg = string.concat(
          objectToSVG[object][0],
          objectToSVG[object][1], // open text
          positionText(object, position),
          TEXT_CLOSE,
          objectToSVG[object][2]
      );
      return svg;
    }
}
