// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./Environment.sol";
import "./GridHelper.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library CommonSVG {

  // opening svg start tag
  string internal constant SVG_START = "<svg xmlns='http://www.w3.org/2000/svg' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='936' height='1080' xmlns:xlink='http://www.w3.org/1999/xlink'>";

  string internal constant DEFS = "<defs><clipPath id='clipPathShell'><polygon points='0,270 468,0 936,270 936,810 468,1080 0,810'></polygon></clipPath><pattern id='floor-pattern-0' patternUnits='userSpaceOnUse' x='110' y='110' width='220' height='220' patternTransform='scale(1,0.576923) rotate(45) skewX(0) skewY(0)'><rect id='floor-shapes-s-rect0' width='220' height='220' rx='1' ry='1' fill='none' stroke='rgba(0,0,0,0.25)' stroke-width='0.5' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15'></rect></pattern><pattern id='floor-pattern-1' patternUnits='userSpaceOnUse' x='140' y='140' width='220' height='220' patternTransform='scale(1,0.576923) rotate(45) skewX(0) skewY(0)'><rect id='floor-shapes-s-rect1' width='160' height='160' rx='1' ry='1' fill='none' stroke='rgba(0,0,0,0.25)' stroke-width='0.5' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15'></rect></pattern><pattern id='floor-pattern-2' patternUnits='userSpaceOnUse' x='170' y='170' width='220' height='220' patternTransform='scale(1,0.576923) rotate(45) skewX(0) skewY(0)'><rect id='floor-shapes-s-rect2' width='100' height='100' rx='1' ry='1' fill='none' stroke='rgba(0,0,0,0.25)' stroke-width='0.5' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15'></rect></pattern><pattern id='leftWall-pattern-0' patternUnits='userSpaceOnUse' x='0' y='270' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(-30)'><rect id='leftWall-shapes-s-rect0' width='156' height='179.16666666666666' rx='1' ry='1' fill='none' stroke='rgba(255,251,246,0.25)' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15' stroke-width='0.45'></rect></pattern><pattern id='leftWall-pattern-1' patternUnits='userSpaceOnUse' x='27.5' y='297.5' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(-30)'><rect id='leftWall-shapes-s-rect1' width='101' height='124.16666666666666' rx='1' ry='1' fill='none' stroke='rgba(255,251,246,0.25)' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15' stroke-width='0.45'></rect></pattern><pattern id='leftWall-pattern-2' patternUnits='userSpaceOnUse' x='55' y='325' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(-30)'><rect id='leftWall-shapes-s-rect2' width='46' height='69.16666666666666' rx='1' ry='1' fill='none' stroke='rgba(255,251,246,0.25)' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15' stroke-width='0.45'></rect></pattern><pattern id='rightWall-pattern-0' patternUnits='userSpaceOnUse' x='0' y='270' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(30)'><rect id='rightWall-shapes-s-rect0' width='155.16666666666666' height='179.16666666666666' rx='0' ry='0' fill='none' stroke='rgba(0,0,0,0.5)' stroke-width='0.45' stroke-dasharray='1,2,1,4,1,3,1,6,1'></rect></pattern><pattern id='rightWall-pattern-1' patternUnits='userSpaceOnUse' x='27.5' y='297.5' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(30)'><rect id='rightWall-shapes-s-rect1' width='100.16666666666666' height='124.16666666666666' rx='0' ry='0' fill='none' stroke='rgba(0,0,0,0.5)' stroke-width='0.45' stroke-dasharray='1,2,1,4,1,3,1,6,1'></rect></pattern><pattern id='rightWall-pattern-2' patternUnits='userSpaceOnUse' x='55' y='325' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(30)'><rect id='rightWall-shapes-s-rect2' width='45.16666666666666' height='69.16666666666666' rx='0' ry='0' fill='none' stroke='rgba(0,0,0,0.5)' stroke-width='0.45' stroke-dasharray='1,2,1,4,1,3,1,6,1'></rect></pattern></defs>";

  string internal constant DUOTONE_DEFS = "<linearGradient id='lDT' gradientTransform='rotate(45)'><stop offset='0.5' stop-color='hsla(0, 0%, 0%, 0)'></stop><stop offset='1' stop-color='hsla(0, 0%, 0%, 0.75)'></stop></linearGradient><linearGradient id='rDT' gradientTransform='rotate(0)'><stop offset='0' stop-color='hsla(0, 0%, 0%, 0.75)'></stop><stop offset='1' stop-color='hsla(0, 0%, 0%, 0)'></stop></linearGradient><linearGradient id='fDT' gradientTransform='rotate(90)'><stop offset='0' stop-color='hsla(0, 0%, 0%, 1)'></stop><stop offset='0.5' stop-color='hsla(0, 0%, 0%, 0.25)'></stop></linearGradient>";

  string internal constant SCRIPT = "<script type='text/javascript' href='https://demowebdevukssa2.z33.web.core.windows.net/html-svg/pocs/0311/anma.js' xlink:actuate='onLoad' xlink:show='other' xlink:type='simple' />";
  // string internal constant SCRIPT = "";

  string internal constant STYLE = "<style>";

  string internal constant STYLE_CLOSE = "</style>";

  // string internal constant TEXT_CLOSE = "</text>";

  string internal constant G_START = "<g>";

  string internal constant FLIPPED = "<g style='transform:scaleX(-1);transform-origin:50% 50%;'>";

  string internal constant NOT_FLIPPED = "<g style='transform:scaleX(1);transform-origin:50% 50%;'>";

  // string internal constant G_END = "</g>";

  // string internal constant G_TRANSFORM = "<g transform='translate(";

  // string internal constant G_MID = ")'>";

  string internal constant SHELL_OPEN = "<g style='transform:scaleX(";

  string internal constant SHELL_CLOSE = ");transform-origin:50% 50%;' id='shell' clip-path='url(#clipPathShell)'><g id='leftWall'><polygon points='0,270 468,0 468,540 0,810' fill='url(#s0)' stroke='black'></polygon><polygon points='0,270 468,0 468,540 0,810' fill='url(#lDT)' stroke='black'></polygon></g><g id='rightWall'><polygon points='468,540 468,0 936,270 936,810' fill='url(#s1)' stroke='black'></polygon><polygon points='468,540 468,0 936,270 936,810' fill='url(#rDT)' stroke='black'></polygon></g><g id='floor'><polygon id='polygon-floor-border' points='0,810 468,1080 936,810 468,540' fill='url(#s2)' stroke='black'></polygon><polygon id='polygon-floor-border-DT' points='0,810 468,1080 936,810 468,540' fill='url(#fDT)' stroke='black'></polygon></g>";

  // closing svg tag
  // string internal constant SVG_END = "</svg>";

  string internal constant SHELL_GRADIENT_IDS = "lwgrwgflg";

  string internal constant ROTATIONS = "-40-45-45";

  // 18 colours: light, base and dark for each of the 6 gradients
  string internal constant OBJECT_GRADIENTS_IDS = "c0lc0bc0dc1lc1bc1dc2lc2bc2dc3lc3bc3dc4lc4bc4dc5lc5bc5d";

  string internal constant LIGHTEN_PERCENTAGES = "025000025"; // 25% lighter, 0% base, 25% darker

  string internal constant GRADIENT_STYLE_OPEN = "<style id='gradient-colors'> :root { ";

  string internal constant GRADIENT_STYLE_CLOSE = " } </style>";

  string internal constant GLOBAL_COLOURS = "085092060082067051";

  string internal constant GLOBAL_COLOURS_IDS = "g0g1g2g3g4g5";

  string internal constant SHELL_COLOUR_IDS = "s0s1s2";

  string internal constant CHARACTER_COLOUR_IDS = "r0";

  string internal constant CHARACTER_COLOURS = "206031090";

  function createShellGradient(uint[6] memory colours, string memory id, string memory rotation) internal pure returns (string memory) {
    string memory output = string.concat(
      "<linearGradient id='",
      id,
      "' gradientTransform='rotate(",
      rotation,
      ")'><stop offset='0' stop-color='hsl(",
      Strings.toString(colours[0]),
      ",",
      Strings.toString(colours[1]),
      "%,"
    );

    output = string.concat(
      output,
      Strings.toString(colours[2]),
      "%)'/><stop offset='1' stop-color='hsl(",
      Strings.toString(colours[3]),
      ",",
      Strings.toString(colours[4]),
      "%,",
      Strings.toString(colours[5]),
      "%)'/></linearGradient>"
    );

    return output;
  }

  function createObjectGradient(uint[6] memory colours, string memory id) internal pure returns (string memory) {
    string memory output = string.concat(
      "<linearGradient id='",
      id,
      "' x1='0%' y1='0%' x2='100%' y2='0%'><stop offset='0%' stop-color='hsl(",
      Strings.toString(colours[0]),
      ",",
      Strings.toString(colours[1]),
      "%,"
    );

    output = string.concat(
      output,
      Strings.toString(colours[2]),
      "%)'/><stop offset='100%' stop-color='hsl(",
      Strings.toString(colours[3]),
      ",",
      Strings.toString(colours[4]),
      "%,",
      Strings.toString(colours[5]),
      "%)'/></linearGradient>"
    );

    return output;
  }

  function appendToGradientStyle(string memory gradientStyle, string memory id, uint h, uint s, uint l) internal pure returns (string memory) {
    return string.concat(
      gradientStyle,
      "--",
      id,
      ": hsl(",
      Strings.toString(h),
      ",",
      Strings.toString(s),
      "%,",
      Strings.toString(l),
      "%); "
    );
  }

  function getshellColours(string memory machine, uint rand, uint state) external pure returns(string memory) {
    uint[] memory baseColours = Environment.getColours(machine, rand, state); // 12 colours, 3 values for each
    // string[] memory shellGradients = new string[](3);
    // for (uint i = 0; i < 3; ++i) { // lw, rw, fl
    //   shellGradients[i] = createShellGradient([baseColours[i*6], baseColours[i*6+1], baseColours[i*6+2], baseColours[i*6+3], baseColours[i*6+4], baseColours[i*6+5]], string(GridHelper.slice(bytes(SHELL_GRADIENT_IDS), i*3, 3)), string(GridHelper.slice(bytes(ROTATIONS), i*3, 3)));
    // }

    string memory gradientStyle = GRADIENT_STYLE_OPEN;
    // uint[] memory lightenBy = GridHelper.setUintArrayFromString(LIGHTEN_PERCENTAGES, 3, 3);
    string[] memory objectGradients = new string[](18);
    for (uint i = 0; i < 6; ++i) {
      for (uint j = 0; j < 3; ++j) {
        // uint colourOneToLighten;
        // uint colourTwoToLighten;
        // // This if statement really shouldn't be necessary, but it is because I can't find a reliable string to int function
        // if (j == 0) {
        //   colourOneToLighten = Environment.increaseColourLightness(baseColours[i*6+2], lightenBy[j]);
        //   colourTwoToLighten = Environment.increaseColourLightness(baseColours[i*6+5], lightenBy[j]);
        // } else {
        //   colourOneToLighten = Environment.decreaseColourLightness(baseColours[i*6+2], lightenBy[j]);
        //   colourTwoToLighten = Environment.decreaseColourLightness(baseColours[i*6+5], lightenBy[j]);
        // }

        objectGradients[i*3+j] = createObjectGradient([baseColours[i*6], baseColours[i*6+1], baseColours[i*6+2], baseColours[i*6+3], baseColours[i*6+4], baseColours[i*6+5]], string(GridHelper.slice(bytes(OBJECT_GRADIENTS_IDS), i*9+3*j, 3)));
        if (j == 1) {
          gradientStyle = appendToGradientStyle(gradientStyle, string(GridHelper.slice(bytes(OBJECT_GRADIENTS_IDS), i*9+3*j, 3)), baseColours[i*6], baseColours[i*6+1], baseColours[i*6+2]);
        } else {
          gradientStyle = appendToGradientStyle(gradientStyle, string(GridHelper.slice(bytes(OBJECT_GRADIENTS_IDS), i*9+3*j, 3)), baseColours[i*6+3], baseColours[i*6+4], baseColours[i*6+5]);
        }
      }
    }

    // SHELL COLOURS
    string[] memory shellColours = new string[](3);
    for (uint i = 0; i < 3; ++i) {
      shellColours[i] = createObjectGradient([baseColours[i*6], baseColours[i*6+1], baseColours[i*6+2], baseColours[i*6+3], baseColours[i*6+4], baseColours[i*6+5]], string(GridHelper.slice(bytes(SHELL_COLOUR_IDS), i*2, 2)));
    }

    // GLOBAL COLOURS
    uint[] memory globalColours = GridHelper.setUintArrayFromString(GLOBAL_COLOURS, 6, 3);
    for (uint i = 0; i < 2; ++i) {
      gradientStyle = appendToGradientStyle(gradientStyle, string(GridHelper.slice(bytes(GLOBAL_COLOURS_IDS), i*2, 2)), globalColours[i*3], globalColours[i*3+1], globalColours[i*3+2]);
    }

    // CHARACTER COLOUR
    uint[] memory characterColour = GridHelper.setUintArrayFromString(CHARACTER_COLOURS, 3, 3);
    gradientStyle = appendToGradientStyle(gradientStyle, string(GridHelper.slice(bytes(CHARACTER_COLOUR_IDS), 0, 2)), characterColour[0], characterColour[1], characterColour[2]);

    gradientStyle = string.concat(gradientStyle, GRADIENT_STYLE_CLOSE);

    string memory returnDefs = string.concat(
      gradientStyle,
      "<defs>",
      DUOTONE_DEFS
    );

    for (uint i = 0; i < 18; ++i) {
      returnDefs = string.concat(returnDefs, objectGradients[i]);
    }

    for (uint i = 0; i < 3; ++i) {
      returnDefs = string.concat(returnDefs, shellColours[i]);
    }

    returnDefs = string.concat(returnDefs, "</defs>");

    return returnDefs;
  }
}