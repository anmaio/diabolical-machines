// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

library CommonSVG {

  // opening svg start tag
  string internal constant SVG_START = "<svg xmlns='http://www.w3.org/2000/svg' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='936' height='1080' xmlns:xlink='http://www.w3.org/1999/xlink'><defs><clipPath id='shell-clip'><polygon points='0,270 468,0 936,270 936,810 468,1080 0,810'/></clipPath><clipPath id='floor-clip'><polygon points='0,810 468,1080 936,810 468,540'/></clipPath><clipPath id='wall-l-clip'><polygon points='0,270 468,0 468,540 0,810'/></clipPath><clipPath id='wall-r-clip'><polygon points='468,540 468,0 936,270 936,810'/></clipPath><pattern id='pattern-x' x='0' y='0' width='.25' height='.25' patternTransform='rotate(30 0 0)'><rect x='0' y='0' width='50' height='50' fill='skyblue'/><rect x='0' y='0' width='25' height='25' fill='url(#Gradient2)'/><circle cx='25' cy='25' r='20' fill='url(#Gradient1)' fill-opacity='0.5'/></pattern><pattern id='floor-pattern1' viewBox='0,0,150,30' width='50%' height='50%' patternTransform='rotate(30 0 0)'><line x1='0' y1='0' x2='900' y2='0' stroke='black' stroke-width='0.5'/><polygon points='0,0 2,5 0,10 5,8 10,10 8,5 10,0 5,2'/></pattern><pattern id='wall-l-pattern' viewBox='0,0,50,50' width='10%' height='10%' patternTransform='rotate(30 0 0)'><line x1='0' y1='0' x2='900' y2='0' stroke='black' stroke-width='2'/></pattern><pattern id='wall-r-pattern' viewBox='0,0,70,70' width='10%' height='10%' patternTransform='rotate(-30 0 0)'><line x1='0' y1='0' x2='900' y2='0' stroke='black' stroke-width='0.5'/></pattern><linearGradient id='gradient-1'><stop offset='0' stop-color='red'/><stop offset='1' stop-color='blue'/></linearGradient><linearGradient id='Gradient1'><stop offset='5%' stop-color='white'/><stop offset='95%' stop-color='blue'/></linearGradient><linearGradient id='Gradient2' x1='0' x2='0' y1='0' y2='1'><stop offset='5%' stop-color='red'/><stop offset='95%' stop-color='orange'/></linearGradient><radialGradient id='eGDz6oBhJeT558-fill' cx='0' cy='0' r='8.7416' spreadMethod='pad' gradientUnits='userSpaceOnUse' gradientTransform='matrix(1 0 0 0.72172 362.44 566.613769)'><stop id='eGDz6oBhJeT558-fill-0' offset='0%' stop-color='#b3b3b3'/><stop id='eGDz6oBhJeT558-fill-1' offset='100%' stop-color='rgba(179,179,179,0)'/></radialGradient></defs><filters><filter id='chromatic-aberration'><feOffset dx='-2' dy='0' in='SourceGraphic' result='result1' id='feOffset1019'/><feOffset dx='0' dy='0' in='SourceGraphic' result='result2' id='feOffset1021'/><feOffset dx='2' dy='0' in='SourceGraphic' result='result3' id='feOffset1023'/><feColorMatrix in='result1' values='1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0' result='result4' id='feColorMatrix1025'/><feColorMatrix in='result2' values='0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0' result='result5' id='feColorMatrix1027'/><feColorMatrix in='result3' values='0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0' result='result6' id='feColorMatrix1029'/><feBlend mode='screen' in='result4' in2='result5' result='result7' id='feBlend1031'/><feBlend mode='screen' in='result6' in2='result7' id='feBlend1033'/></filter><filter id='noise'><feTurbulence type='fractalNoise' baseFrequency='20' result='noisy'/><feColorMatrix type='saturate' values='0'/><feBlend in='SourceGraphic' in2='noisy' mode='screen'/></filter><filter id='shell-filter-sepia'><feColorMatrix type='matrix' values='.343 .669 .119 0 0 .249 .626 .130 0 0 .172 .334 .111 0 0 .000 .000 .000 1 0'/></filter><filter id='shell-filter-bw'><feColorMatrix type='matrix' values='0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 1 0'/></filter><filter id='shell-filter-normal'><feColorMatrix type='matrix' values='1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0'/></filter><filter id='vignette'><feFlood id='vignette-flood' x='0' y='0' result='blackfield' flood-color='#000000' flood-opacity='1'/><feSpecularLighting id='vignette-specular' result='spotlight' lighting-color='#FFFFFF' surfaceScale='1' specularConstant='1' specularExponent='120'><fePointLight id='vignette-pointlight' x='450' y='400' z='800'/></feSpecularLighting><feBlend id='vignette-mask' result='mask' in='blackfield' in2='spotlight' mode='lighten'/><feBlend id='vignette-mask-multiply' in='mask' in2='SourceGraphic' mode='multiply' result='vignette-result'/></filter><filter id='emboss' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 0 0 0 -3 0 0 0 4' divisor='1' bias='0.8' targetX='0' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/></filter><filter id='vertBlur10' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feGaussianBlur stdDeviation='1 10' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' edgeMode='wrap' result='blur'/></filter><filter id='vertBlur5' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feGaussianBlur stdDeviation='1 5' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' edgeMode='wrap' result='blur'/></filter><filter id='negative' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feColorMatrix type='luminanceToAlpha' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='colormatrix'/></filter><filter id='convolve' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-3 0 0 0 -3 0 0 0 4' divisor='1' bias='1' targetX='0' targetY='0' edgeMode='duplicate' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/></filter><filter id='x-rays' x='-10%' y='-10%' width='120%' height='120%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='sRGB'><feColorMatrix type='matrix' values='1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 1 0' in='SourceGraphic' result='colormatrix'/><feComponentTransfer in='colormatrix' result='componentTransfer'><feFuncR type='table' tableValues='1 0.58 0'/><feFuncG type='table' tableValues='1 0.58 0'/><feFuncB type='table' tableValues='1 0.58 0'/><feFuncA type='table' tableValues='0 1'/></feComponentTransfer><feBlend mode='normal' in='componentTransfer' in2='SourceGraphic' result='blend'/></filter><filter id='tapbrush' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 0 0 0 -3 0 0 0 4' divisor='1' bias='0.8' targetX='0' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/><feMorphology operator='erode' radius='3 3' x='0%' y='0%' width='100%' height='100%' in='convolveMatrix' result='morphology'/></filter><filter id='lines-vert' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 0 0 0 -3 0 0 0 4' divisor='1' bias='0.8' targetX='0' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/><feMorphology operator='erode' radius='0 17' x='0%' y='0%' width='100%' height='100%' in='convolveMatrix' result='morphology'/></filter><filter id='pixels1' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 1 0 0 -4 0 0 0 4' divisor='1' bias='1' targetX='2' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/><feMorphology operator='erode' radius='4 4' x='0%' y='0%' width='100%' height='100%' in='convolveMatrix' result='morphology'/></filter><filter id='dalee' x='-20%' y='-20%' width='140%' height='140%' filterUnits='objectBoundingBox' primitiveUnits='userSpaceOnUse' color-interpolation-filters='linearRGB'><feConvolveMatrix order='3 3' kernelMatrix='-1 0 0 0 0 0 0 0 0' divisor='1' bias='1' targetX='0' targetY='0' edgeMode='none' preserveAlpha='true' x='0%' y='0%' width='100%' height='100%' in='SourceGraphic' result='convolveMatrix'/><feMorphology operator='erode' radius='60 2' x='0%' y='0%' width='100%' height='100%' in='convolveMatrix' result='morphology'/></filter><filter id='neg-red'><feColorMatrix type='matrix' values='1.000 1.000 1.000 0.000 0.000 -5.000 1.000 1.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 1.000 1.000 1.000 -0.500 0.000'/></filter><filter id='cloud9'><feColorMatrix type='matrix' values='1.000 0.000 0.000 0.000 0.000 2.000 2.000 0.900 0.000 0.000 0.000 0.000 0.000 2.200 0.000 1.000 1.000 1.000 -0.400 0.000'/></filter></filters>";

  string internal constant STYLE = "<style>.hd,.hl,.hm,.hw{stroke:rgb(0,0,0,.12);stroke-width:1}.hd,.hm,.hw{stroke:rgb(0,0,0,.22)}.hd,.hw{stroke:rgb(0,0,0,.75)}.hw{stroke:rgb(255,255,255,.75)}.whi{fill:#fff}.floor,.wall-l,.wall-r{fill:#fff;stroke:#000;stroke-width:1}.wall-l,.wall-r{fill:#a9a9a9}.wall-r{fill:#d3d3d3}.cb{fill:orange}.g1,.g2,.g3{stroke-width:1;fill:#fff;stroke:rgb(0,0,0,.9)}.g2,.g3{fill:#696969}.g3{fill:#d3d3d3}.ma-g1,.ma-mo,.ma-mo-t{fill:pink}.ma-g1{stroke:#fff}.ma-g2,.ma-g3{fill:gray;stroke:pink}.ma-g3{fill:silver}.bla{fill:#000;x:369;y:360;text-anchor:middle}.bla,.bla2,.bla3{font:700 1rem sans-serif}.bla2{fill:#000;text-anchor:left;opacity:.5}.bla3{fill:#fff;x:369;y:360;text-anchor:middle}.fs-wb{fill:#fff;stroke:#000}<![CDATA[#m-drill-312x720_hole-u-c-drill-btm_to {animation: m-drill-312x720_hole-u-c-drill-btm_to__to 1000ms linear infinite normal forwards}@keyframes m-drill-312x720_hole-u-c-drill-btm_to__to { 0% {transform: translate(59.535004px,156.514992px);animation-timing-function: cubic-bezier(0,0,0.58,1)} 30% {transform: translate(59.535004px,207.797042px)} 100% {transform: translate(59.535004px,156.514992px)}} #m-drill-312x720_hole-u-c-head-a-holder_to {animation: m-drill-312x720_hole-u-c-head-a-holder_to__to 1000ms linear infinite normal forwards}@keyframes m-drill-312x720_hole-u-c-head-a-holder_to__to { 0% {transform: translate(58.860001px,96.834999px);animation-timing-function: cubic-bezier(0,0,0.58,1)} 30% {transform: translate(58.860001px,153.245254px)} 100% {transform: translate(58.860001px,96.834999px)}} #m-drill-312x720_hole-u-c-tube3_to {animation: m-drill-312x720_hole-u-c-tube3_to__to 1000ms linear infinite normal forwards}@keyframes m-drill-312x720_hole-u-c-tube3_to__to { 0% {transform: translate(58.549999px,33.875001px);animation-timing-function: cubic-bezier(0,0,0.58,1)} 30% {transform: translate(58.549999px,85.157051px)} 100% {transform: translate(58.549999px,33.875001px)}} #m-drill-312x720_hole-u-c-expander_to {animation: m-drill-312x720_hole-u-c-expander_to__to 1000ms linear infinite normal forwards}@keyframes m-drill-312x720_hole-u-c-expander_to__to { 0% {transform: translate(58.619999px,11.055px);animation-timing-function: cubic-bezier(0,0,0.58,1)} 30% {transform: translate(58.619999px,52.08064px)} 100% {transform: translate(58.619999px,11.055px)}}]]><![CDATA[#conveyor-all-2-s-path63_to {animation: conveyor-all-2-s-path63_to__to 10000ms linear infinite normal forwards}@keyframes conveyor-all-2-s-path63_to__to { 0% {transform: translate(705.573364px,216.065804px)} 30% {transform: translate(705.573364px,216.065804px)} 35% {transform: translate(705.573364px,366.065804px)} 40% {transform: translate(705.573364px,216.065804px)} 100% {transform: translate(705.573364px,216.065804px)}} #conveyor-all-2-s-path64_to {animation: conveyor-all-2-s-path64_to__to 10000ms linear infinite normal forwards}@keyframes conveyor-all-2-s-path64_to__to { 0% {transform: translate(705.409729px,216.288437px)} 30% {transform: translate(705.409729px,216.288437px)} 35% {transform: translate(705.450638px,366.232779px)} 40% {transform: translate(705.573364px,216.065804px)} 100% {transform: translate(705.573364px,216.065804px)}} #conveyor-all-2-u-p-cube_to {animation: conveyor-all-2-u-p-cube_to__to 10000ms linear infinite normal forwards}@keyframes conveyor-all-2-u-p-cube_to__to { 0% {transform: translate(513.550101px,113.193444px)} 35% {transform: translate(513.550101px,113.193444px)} 72% {transform: translate(513.550101px,113.193444px)} 76% {transform: translate(459.550101px,142.193444px)} 100% {transform: translate(459.550101px,142.193444px)}} #conveyor-all-2-u-c-hole_ts {animation: conveyor-all-2-u-c-hole_ts__ts 10000ms linear infinite normal forwards}@keyframes conveyor-all-2-u-c-hole_ts__ts { 0% {transform: translate(298.5px,898.309998px) scale(1,1)} 60% {transform: translate(298.5px,898.309998px) scale(1,1)} 68% {transform: translate(298.5px,898.309998px) scale(6,6)} 76% {transform: translate(298.5px,898.309998px) scale(6,6)} 82% {transform: translate(298.5px,898.309998px) scale(1,1)} 100% {transform: translate(298.5px,898.309998px) scale(1,1)}} #conveyor-all-2-u-c-lever2_tr {animation: conveyor-all-2-u-c-lever2_tr__tr 10000ms linear infinite normal forwards}@keyframes conveyor-all-2-u-c-lever2_tr__tr { 0% {transform: translate(555.8px,329.03px) rotate(0deg)} 10% {transform: translate(555.8px,329.03px) rotate(0deg);animation-timing-function: cubic-bezier(0.445,0.05,0.55,0.95)} 15% {transform: translate(555.8px,329.03px) rotate(-91.069929deg)} 20% {transform: translate(555.8px,329.03px) rotate(0deg)} 100% {transform: translate(555.8px,329.03px) rotate(0deg)}} #conveyor-all-2-u-orb_ts {animation: conveyor-all-2-u-orb_ts__ts 10000ms linear infinite normal forwards}@keyframes conveyor-all-2-u-orb_ts__ts { 0% {transform: translate(657.150024px,337.330017px) scale(1,1)} 20% {transform: translate(657.150024px,337.330017px) scale(1,1)} 25% {transform: translate(657.150024px,337.330017px) scale(1.25,1.25)} 30% {transform: translate(657.150024px,337.330017px) scale(1,1)} 100% {transform: translate(657.150024px,337.330017px) scale(1,1)}} #conveyor-all-2-u-orb2_ts {animation: conveyor-all-2-u-orb2_ts__ts 10000ms linear infinite normal forwards}@keyframes conveyor-all-2-u-orb2_ts__ts { 0% {transform: translate(734.900024px,381.470001px) scale(1,1)} 20% {transform: translate(734.900024px,381.470001px) scale(1,1)} 25% {transform: translate(734.900024px,381.470001px) scale(1.25,1.25)} 30% {transform: translate(734.900024px,381.470001px) scale(1,1)} 100% {transform: translate(734.900024px,381.470001px) scale(1,1)}} #conveyor-all-2-u-p-cube3_to {animation: conveyor-all-2-u-p-cube3_to__to 10000ms linear infinite normal forwards}@keyframes conveyor-all-2-u-p-cube3_to__to { 0% {offset-distance: 0%} 4% {offset-distance: 20.107638%} 35% {offset-distance: 20.107638%} 60% {offset-distance: 61.769019%;animation-timing-function: cubic-bezier(0.32,0.015,1,1)} 67% {offset-distance: 92.68158%} 69% {offset-distance: 93.567074%} 72% {offset-distance: 94.452569%} 76% {offset-distance: 94.452569%} 82% {offset-distance: 100%} 100% {offset-distance: 100%}} #conveyor-all-2-u-p-cube3_ts {animation: conveyor-all-2-u-p-cube3_ts__ts 10000ms linear infinite normal forwards}@keyframes conveyor-all-2-u-p-cube3_ts__ts { 0% {transform: scale(1.5,1.5)} 76% {transform: scale(1.5,1.5)} 82% {transform: scale(0,0)} 100% {transform: scale(0,0)}}]]></style>";

  string internal constant SCRIPT = "<script type='text/javascript' href='https://demowebdevukssa2.z33.web.core.windows.net/html-svg/pocs/3110/anma.js' xlink:actuate='onLoad' xlink:show='other' xlink:type='simple' />";

  // closing svg tag
  string internal constant SVG_END = "</svg>";

  string internal constant TEXT_CLOSE = "</text>";

  string internal constant G_START = "<g>";

  string internal constant G_TRANSFORM = "<g transform='translate(";

  string internal constant G_MID = ")'>";

  string internal constant G_END = "</g>";

  string internal constant G2_END = "</g></g>";

  function groupTransform(string memory x, string memory y, string memory data) internal pure returns (string memory) {
    return string.concat(G_TRANSFORM, x, ",", y, G_MID, data, G_END);
  }
}