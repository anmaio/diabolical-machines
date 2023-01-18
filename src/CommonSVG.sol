// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./Environment.sol";
import "./GridHelper.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library CommonSVG {

  // opening svg start tag
  string internal constant SVG_START = "<svg xmlns='http://www.w3.org/2000/svg' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='936' height='1080' xmlns:xlink='http://www.w3.org/1999/xlink'>";

  // Will probably need to be extracted to individual files due to size
  // string internal constant DEFS = "<defs><clipPath id='shell'><polygon points='0,270 468,0 936,270 936,810 468,1080 0,810'/></clipPath><clipPath id='floor-clip'><polygon points='0,810 468,1080 936,810 468,540'/></clipPath><clipPath id='wall-l-clip'><polygon points='0,270 468,0 468,540 0,810'/></clipPath><clipPath id='wall-r-clip'><polygon points='468,540 468,0 936,270 936,810'/></clipPath><pattern id='pattern-x' x='0' y='0' width='.25' height='.25' patternTransform='rotate(30 0 0)'><rect x='0' y='0' width='50' height='50' fill='skyblue'/><rect x='0' y='0' width='25' height='25' fill='url(#Gradient2)'/><circle cx='25' cy='25' r='20' fill='url(#Gradient1)' fill-opacity='0.5'/></pattern><pattern id='floor-pattern1' viewBox='0,0,150,30' width='50%' height='50%' patternTransform='rotate(30 0 0)'><line x1='0' y1='0' x2='900' y2='0' stroke='black' stroke-width='0.5'/><polygon points='0,0 2,5 0,10 5,8 10,10 8,5 10,0 5,2'/></pattern><pattern id='wall-l-pattern' viewBox='0,0,50,50' width='10%' height='10%' patternTransform='rotate(30 0 0)'><line x1='0' y1='0' x2='900' y2='0' stroke='black' stroke-width='2'/></pattern><pattern id='wall-r-pattern' viewBox='0,0,70,70' width='10%' height='10%' patternTransform='rotate(-30 0 0)'><line x1='0' y1='0' x2='900' y2='0' stroke='black' stroke-width='0.5'/></pattern><linearGradient id='gradient-1'><stop offset='0' stop-color='red'/><stop offset='1' stop-color='blue'/></linearGradient><linearGradient id='Gradient1'><stop offset='5%' stop-color='white'/><stop offset='95%' stop-color='blue'/></linearGradient><linearGradient id='Gradient2' x1='0' x2='0' y1='0' y2='1'><stop offset='5%' stop-color='red'/><stop offset='95%' stop-color='orange'/></linearGradient><radialGradient id='eGDz6oBhJeT558-fill' cx='0' cy='0' r='8.7416' spreadMethod='pad' gradientUnits='userSpaceOnUse' gradientTransform='matrix(1 0 0 0.72172 362.44 566.613769)'><stop id='eGDz6oBhJeT558-fill-0' offset='0%' stop-color='#b3b3b3'/><stop id='eGDz6oBhJeT558-fill-1' offset='100%' stop-color='rgba(179,179,179,0)'/></radialGradient></defs>";
  string internal constant DEFS = "<defs><clipPath id='clipPathShell'><polygon points='0,270 468,0 936,270 936,810 468,1080 0,810'></polygon></clipPath><pattern id='floor-pattern-0' patternUnits='userSpaceOnUse' x='110' y='110' width='220' height='220' patternTransform='scale(1,0.576923) rotate(45) skewX(0) skewY(0)'><rect id='floor-shapes-s-rect0' width='220' height='220' rx='1' ry='1' fill='none' stroke='rgba(0,0,0,0.25)' stroke-width='0.5' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15'></rect></pattern><pattern id='floor-pattern-1' patternUnits='userSpaceOnUse' x='140' y='140' width='220' height='220' patternTransform='scale(1,0.576923) rotate(45) skewX(0) skewY(0)'><rect id='floor-shapes-s-rect1' width='160' height='160' rx='1' ry='1' fill='none' stroke='rgba(0,0,0,0.25)' stroke-width='0.5' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15'></rect></pattern><pattern id='floor-pattern-2' patternUnits='userSpaceOnUse' x='170' y='170' width='220' height='220' patternTransform='scale(1,0.576923) rotate(45) skewX(0) skewY(0)'><rect id='floor-shapes-s-rect2' width='100' height='100' rx='1' ry='1' fill='none' stroke='rgba(0,0,0,0.25)' stroke-width='0.5' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15'></rect></pattern><pattern id='leftWall-pattern-0' patternUnits='userSpaceOnUse' x='0' y='270' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(-30)'><rect id='leftWall-shapes-s-rect0' width='156' height='179.16666666666666' rx='1' ry='1' fill='none' stroke='rgba(255,251,246,0.25)' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15' stroke-width='0.45'></rect></pattern><pattern id='leftWall-pattern-1' patternUnits='userSpaceOnUse' x='27.5' y='297.5' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(-30)'><rect id='leftWall-shapes-s-rect1' width='101' height='124.16666666666666' rx='1' ry='1' fill='none' stroke='rgba(255,251,246,0.25)' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15' stroke-width='0.45'></rect></pattern><pattern id='leftWall-pattern-2' patternUnits='userSpaceOnUse' x='55' y='325' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(-30)'><rect id='leftWall-shapes-s-rect2' width='46' height='69.16666666666666' rx='1' ry='1' fill='none' stroke='rgba(255,251,246,0.25)' stroke-dasharray='1, 2, 12, 4, 2, 1, 4, 2, 10, 5, 10, 15' stroke-width='0.45'></rect></pattern><pattern id='rightWall-pattern-0' patternUnits='userSpaceOnUse' x='0' y='270' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(30)'><rect id='rightWall-shapes-s-rect0' width='155.16666666666666' height='179.16666666666666' rx='0' ry='0' fill='none' stroke='rgba(0,0,0,0.5)' stroke-width='0.45' stroke-dasharray='1,2,1,4,1,3,1,6,1'></rect></pattern><pattern id='rightWall-pattern-1' patternUnits='userSpaceOnUse' x='27.5' y='297.5' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(30)'><rect id='rightWall-shapes-s-rect1' width='100.16666666666666' height='124.16666666666666' rx='0' ry='0' fill='none' stroke='rgba(0,0,0,0.5)' stroke-width='0.45' stroke-dasharray='1,2,1,4,1,3,1,6,1'></rect></pattern><pattern id='rightWall-pattern-2' patternUnits='userSpaceOnUse' x='55' y='325' width='156' height='180' patternTransform='scale(1) rotate(0) skewX(0) skewY(30)'><rect id='rightWall-shapes-s-rect2' width='45.16666666666666' height='69.16666666666666' rx='0' ry='0' fill='none' stroke='rgba(0,0,0,0.5)' stroke-width='0.45' stroke-dasharray='1,2,1,4,1,3,1,6,1'></rect></pattern></defs>";
  string internal constant FILTERS = "<filters><filter id='chromatic-aberration'><feOffset dx='-2' dy='0' in='SourceGraphic' result='result1' id='feOffset1019'/><feOffset dx='0' dy='0' in='SourceGraphic' result='result2' id='feOffset1021'/><feOffset dx='2' dy='0' in='SourceGraphic' result='result3' id='feOffset1023'/><feColorMatrix in='result1' values='1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0' result='result4' id='feColorMatrix1025'/><feColorMatrix in='result2' values='0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0' result='result5' id='feColorMatrix1027'/><feColorMatrix in='result3' values='0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0' result='result6' id='feColorMatrix1029'/><feBlend mode='screen' in='result4' in2='result5' result='result7' id='feBlend1031'/><feBlend mode='screen' in='result6' in2='result7' id='feBlend1033'/></filter><filter id='noise'><feTurbulence type='fractalNoise' baseFrequency='20' result='noisy'/><feColorMatrix type='saturate' values='0'/><feBlend in='SourceGraphic' in2='noisy' mode='screen'/></filter><filter id='shell-filter-sepia'><feColorMatrix type='matrix' values='.343 .669 .119 0 0 .249 .626 .130 0 0 .172 .334 .111 0 0 .000 .000 .000 1 0'/></filter><filter id='shell-filter-bw'><feColorMatrix type='matrix' values='0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 1 0'/></filter><filter id='shell-filter-normal'><feColorMatrix type='matrix' values='1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0'/></filter><filter id='vignette'><feFlood id='vignette-flood' x='0' y='0' result='blackfield' flood-color='#000000' flood-opacity='1'/><feSpecularLighting id='vignette-specular' result='spotlight' lighting-color='#FFFFFF' surfaceScale='1' specularConstant='1' specularExponent='120'><fePointLight id='vignette-pointlight' x='450' y='400' z='800'/></feSpecularLighting><feBlend id='vignette-mask' result='mask' in='blackfield' in2='spotlight' mode='lighten'/><feBlend id='vignette-mask-multiply' in='mask' in2='SourceGraphic' mode='multiply' result='vignette-result'/></filter><filter id='emboss' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 0 0 0 -3 0 0 0 4' divisor='1' bias='0.8' targetX='0' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/></filter><filter id='vertBlur10' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feGaussianBlur stdDeviation='1 10' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' edgeMode='wrap' result='blur'/></filter><filter id='vertBlur5' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feGaussianBlur stdDeviation='1 5' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' edgeMode='wrap' result='blur'/></filter><filter id='negative' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feColorMatrix type='luminanceToAlpha' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='colormatrix'/></filter><filter id='convolve' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-3 0 0 0 -3 0 0 0 4' divisor='1' bias='1' targetX='0' targetY='0' edgeMode='duplicate' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/></filter><filter id='x-rays' x='-10%' y='-10%' width='120%' height='120%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='sRGB'><feColorMatrix type='matrix' values='1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 1 0' in='SourceGraphic' result='colormatrix'/><feComponentTransfer in='colormatrix' result='componentTransfer'><feFuncR type='table' tableValues='1 0.58 0'/><feFuncG type='table' tableValues='1 0.58 0'/><feFuncB type='table' tableValues='1 0.58 0'/><feFuncA type='table' tableValues='0 1'/></feComponentTransfer><feBlend mode='normal' in='componentTransfer' in2='SourceGraphic' result='blend'/></filter><filter id='tapbrush' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 0 0 0 -3 0 0 0 4' divisor='1' bias='0.8' targetX='0' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/><feMorphology operator='erode' radius='3 3' x='0%' y='0%' width='100%' height='100%' in='convolveMatrix' result='morphology'/></filter><filter id='lines-vert' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 0 0 0 -3 0 0 0 4' divisor='1' bias='0.8' targetX='0' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/><feMorphology operator='erode' radius='0 17' x='0%' y='0%' width='100%' height='100%' in='convolveMatrix' result='morphology'/></filter><filter id='pixels1' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 1 0 0 -4 0 0 0 4' divisor='1' bias='1' targetX='2' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/><feMorphology operator='erode' radius='4 4' x='0%' y='0%' width='100%' height='100%' in='convolveMatrix' result='morphology'/></filter><filter id='dalee' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 0 0 0 0 0 0 0 0' divisor='1' bias='1' targetX='0' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/><feMorphology operator='erode' radius='60 2' x='0%' y='0%' width='100%' height='100%' in='convolveMatrix' result='morphology'/></filter><filter id='neg-red'><feColorMatrix type='matrix' values='1.000 1.000 1.000 0.000 0.000 -5.000 1.000 1.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 1.000 1.000 1.000 -0.500 0.000'/></filter><filter id='cloud9'><feColorMatrix type='matrix' values='1.000 0.000 0.000 0.000 0.000 2.000 2.000 0.900 0.000 0.000 0.000 0.000 0.000 2.200 0.000 1.000 1.000 1.000 -0.400 0.000'/></filter></filters>";

  string internal constant DUOTONE_DEFS = "<linearGradient id='lDT' gradientTransform='rotate(45)'><stop offset='0.5' stop-color='hsla(0, 0%, 0%, 0)'></stop><stop offset='1' stop-color='hsla(0, 0%, 0%, 0.75)'></stop></linearGradient><linearGradient id='rDT' gradientTransform='rotate(0)'><stop offset='0' stop-color='hsla(0, 0%, 0%, 0.75)'></stop><stop offset='1' stop-color='hsla(0, 0%, 0%, 0)'></stop></linearGradient><linearGradient id='fDT' gradientTransform='rotate(90)'><stop offset='0' stop-color='hsla(0, 0%, 0%, 1)'></stop><stop offset='0.5' stop-color='hsla(0, 0%, 0%, 0.25)'></stop></linearGradient>";

  string internal constant SCRIPT = "<script type='text/javascript' href='https://demowebdevukssa2.z33.web.core.windows.net/html-svg/pocs/3110/anma.js' xlink:actuate='onLoad' xlink:show='other' xlink:type='simple' />";

  string internal constant STYLE = "<style>";

  string internal constant STYLE_CLOSE = "</style>";

  string internal constant TEXT_CLOSE = "</text>";

  string internal constant G_START = "<g>";

  string internal constant FLIPPED = "<g style='transform:scaleX(-1);transform-origin:50% 50%;'>";

  string internal constant NOT_FLIPPED = "<g style='transform:scaleX(1);transform-origin:50% 50%;'>";

  string internal constant G_END = "</g>";

  string internal constant G_TRANSFORM = "<g transform='translate(";

  string internal constant G_MID = ")'>";

  string internal constant SHELL_OPEN = "<g style='transform:scaleX(";

  // string internal constant SHELL_CLOSE = ");transform-origin:50% 50%;' id='shell-clip' clip-path='url(#shell-clip)'><g id='diorama-filters' filter='url(#zzzzzchromaticzzzzz-aberration)'><g id='shell'> <g id='shell-main' transform='translate(0,0)'> <g id='floor'> <svg height='1080' width='936'> <g> <polygon class='floor' points='0,810 468,1080 936,810 468,540' /> </g> <line class='hd' x1='156' y1='900' x2='624' y2='630'  /> <line class='hd' x1='312' y1='990' x2='780' y2='720'  /> <line class='hd' x1='156' y1='720' x2='624' y2='990'  /> <line class='hd' x1='312' y1='630' x2='780' y2='900'  /> </svg> </g> <g id='wall-l'> <svg class='wall-l' height='1080' width='936'> <polygon points='0,270 468,0 468,540 0,810' /> <line class='hd' x1='0' y1='630' x2='468' y2='360'  /> <line class='hd' x1='0' y1='450' x2='468' y2='180'  /> <line class='hd' x1='156' y1='180' x2='156' y2='720'  /> <line class='hd' x1='312' y1='90' x2='312' y2='630'  /> </svg> </g> <g id='wall-r'> <svg class='wall-r' height='1080' width='936'> <polygon points='468,540 468,0 936,270 936,810' /> <line class='hw' x1='468' y1='180' x2='936' y2='450'  /> <line class='hw' x1='468' y1='360' x2='936' y2='630'  /> <line class='hw' x1='624' y1='90' x2='624' y2='630'  /> <line class='hw' x1='780' y1='180' x2='780' y2='720'  /> </svg> </g> </g> </g>";

  string internal constant SHELL_CLOSE = ");transform-origin:50% 50%;' id='shell' clip-path='url(#clipPathShell)'><g id='leftWall'><polygon points='0,270 468,0 468,540 0,810' fill='url(#lwg)' stroke='black'></polygon><polygon points='0,270 468,0 468,540 0,810' fill='url(#lDT)' stroke='black'></polygon></g><g id='rightWall'><polygon points='468,540 468,0 936,270 936,810' fill='url(#rwg)' stroke='black'></polygon><polygon points='468,540 468,0 936,270 936,810' fill='url(#rDT)' stroke='black'></polygon></g><g id='floor'><polygon id='polygon-floor-border' points='0,810 468,1080 936,810 468,540' fill='url(#flg)' stroke='black'></polygon><polygon id='polygon-floor-border-DT' points='0,810 468,1080 936,810 468,540' fill='url(#fDT)' stroke='black'></polygon></g>";

  // closing svg tag
  string internal constant SVG_END = "</svg>";

  string internal constant IDS = "lwgrwgflg";

  string internal constant ROTATIONS = "-40-45-45";

  function groupTransform(string memory x, string memory y, string memory data) external pure returns (string memory) {
    return string.concat(G_TRANSFORM, x, ",", y, G_MID, data, G_END);
  }

  function createLinearGradient(int[6] memory colours, string memory id, string memory rotation) internal pure returns (string memory) {
    string memory output = string.concat(
      "<linearGradient id='",
      id,
      "' gradientTransform='rotate(",
      rotation,
      ")'><stop offset='0' stop-color='hsl(",
      Strings.toString(uint(colours[0])),
      ",",
      Strings.toString(uint(colours[1])),
      "%,"
    );

    output = string.concat(
      output,
      Strings.toString(uint(colours[2])),
      "%)'/><stop offset='1' stop-color='hsl(",
      Strings.toString(uint(colours[3])),
      ",",
      Strings.toString(uint(colours[4])),
      "%,",
      Strings.toString(uint(colours[5])),
      "%)'/></linearGradient>"
    );

    return output;
  }

  function getshellColours(string memory machine, bytes memory digits) external pure returns(string memory) {
    // Will get 6 colours: 2 for each wall and 2 for the floor
    int[] memory shellColours = Environment.getShellColours(machine, digits); // 6 colours, 3 values for each
    string[] memory gradients = new string[](3);
    for (uint i = 0; i < 3; i++) {
      gradients[i] = createLinearGradient([shellColours[i*6], shellColours[i*6+1], shellColours[i*6+2], shellColours[i*6+3], shellColours[i*6+4], shellColours[i*6+5]], string(GridHelper.slice(bytes(IDS), i*3, 3)), string(GridHelper.slice(bytes(ROTATIONS), i*3, 3)));
    }
    return string.concat(
      "<defs>",
      gradients[0],
      gradients[1],
      gradients[2],
      DUOTONE_DEFS,
      "</defs>"
    );
  }
}