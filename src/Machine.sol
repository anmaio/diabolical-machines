// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./CommonSVG.sol";
import "./Drills.sol";
import "./CB1.sol";
import "./CB2.sol";
import "./CB3.sol";
import "./CB4.sol";
import "./CB5.sol";
import "./CB6.sol";
import "./CB7.sol";
import "./CB8.sol";

contract Machine {
  // GRIDS
  string[9] internal noRow1Grid = ["x", "x", "x", "", "", "", "", "", ""];
  string[9] internal fullGrid = ["x", "x", "x", "x", "x", "x", "x", "x", "x"];
  string[9] internal charTouchingWall = ["x", "x", "", "x", "x", "", "", "", ""];

  // conveyor belt
  string[] public machines = ["conveyorBelt", "drills"];
  mapping(string => uint[][]) internal machineToPosition;
  mapping(string => uint) internal machineToSWHeight;
  mapping(string => uint[]) internal machineToSVGIndex;
  mapping(string => string[9]) internal machineToLWGrid;
  mapping(string => uint) internal numMachineParts;


  // Used if a machine has repeating parts or parts that occur in other machines
  mapping(string => string[]) internal partXOffset;
  mapping(string => string[]) internal partYOffset;

  // TESTING labels index of machines position
  mapping(string => string) internal machineText;

  // string[] internal machineParts = [
  //   // Conveyor Belt
  //   "<g id='MaC40-ho' transform='translate(0,0)'><g id='MaC40-ho2' transform='translate(-20,-142)'><g id='MaC40-offset' transform='scale(1)' transform-origin='0 0'><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' id='MaC40' viewBox='0 0 330 540' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='330' height='540'> <style><![CDATA[#cnv-buc-bl_to {animation: cnv-buc-bl_to__to 2000ms linear infinite normal forwards}@keyframes cnv-buc-bl_to__to { 0% {transform: translate(459.504944px,649.740021px)} 75% {transform: translate(302.504944px,740.740021px)} 85% {transform: translate(289.504944px,753.740021px)} 95% {transform: translate(287.504944px,773.740021px)} 100% {transform: translate(288.504944px,781.740021px)}} ]]></style> <g id='cnv-buc-cnv-end' transform='translate(25-400)'><g id='cnv-buc-wheel'><g id='cnv-bit-u-wall-disc'><path id='cnv-bit-s-path1' d='M280.71,648.84v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' class='fs-wb' stroke-miterlimit='10'></path><path id='cnv-bit-s-path2' d='M285.35,659.04c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-p3' d='M285.35,659.04c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g><g id='cnv-bit-u-wall-ring'><path id='cnv-bit-s-path4' d='M285.35,659.04c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-path5' d='M285.35,659.04c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path><path id='cnv-bit-s-path6' d='M279.31,662.82c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g></g><g id='cnv-buc-wheel2'><g id='cnv-bit-u-wall-disc2'><path id='cnv-bit-s-path7' d='M249.24,668.14v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' class='fs-wb' stroke-miterlimit='10'></path><path id='cnv-bit-s-path8' d='M253.88,678.34c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-path9' d='M253.88,678.34c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g><g id='cnv-bit-u-wall-ring2'><path id='cnv-bit-s-path10' d='M253.88,678.34c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-path11' d='M253.88,678.34c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path><path id='cnv-bit-s-path12' d='M247.84,682.12c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g></g><g id='cnv-buc-wheel3'><g id='cnv-bit-u-wall-disc3'><path id='cnv-bit-s-path13' d='M217.77,685.45v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' class='fs-wb' stroke-miterlimit='10'></path><path id='cnv-bit-s-path14' d='M222.41,695.64c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-path15' d='M222.41,695.64c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g><g id='cnv-bit-u-wall-ring3'><path id='cnv-bit-s-path16' d='M222.41,695.64c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-path17' d='M222.41,695.64c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path><path id='cnv-bit-s-path18' d='M216.37,699.42c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g></g><g id='cnv-buc-wheel4'><g id='cnv-bit-u-wall-disc4'><path id='cnv-bit-s-path19' d='M186.29,704.58v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' class='fs-wb' stroke-miterlimit='10'></path><path id='cnv-bit-s-path20' d='M190.94,714.77c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-path21' d='M190.94,714.77c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g><g id='cnv-bit-u-wall-ring4'><path id='cnv-bit-s-path22' d='M190.94,714.77c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-path23' d='M190.94,714.77c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path><path id='cnv-bit-s-path24' d='M184.9,718.55c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g></g><g id='cnv-buc-wheel5'><g id='cnv-bit-u-wall-disc5'><path id='cnv-bit-s-path25' d='M154.82,721.87v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#fff' stroke='#1D1D1B' stroke-miterlimit='10'></path><path id='cnv-bit-s-path26' d='M478.47,732.06c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-path27' d='M159.47,732.06c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g><g id='cnv-bit-u-wall-ring5'><path id='cnv-bit-s-path28' d='M159.47,732.06c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'></path><path id='cnv-bit-s-path29' d='M159.47,732.06c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff' stroke='#1D1D1B' stroke-linecap='square' stroke-linejoin='round'></path><path id='cnv-bit-s-p30' d='M153.42,735.84c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' class='fs-wb' stroke-linecap='square' stroke-linejoin='round'></path></g></g><path id='cnv-buc-belt' d='M149.35,720.2l155.12-90.38c-2.51916-1.450706-5.122475-2.950178-7.798452-4.491818-46.612712-26.853758-115.272367-66.502077-145.234402-84.072532-.700457-.410765-1.379765-.809464-2.037146-1.19565c0,0-159.99,92.41-160.4,92.65-8.7,5.03-13.53,17.22-13.5,27.23.01,4.97-.07,9.87,2.77,11.52l154.06,87.96c0,0-4.8-4.08-3.32-12.76.32-1.84,1.91-10.05,5.87-15.18c0,0,1.99-3.46,8.5-7.83.29-.19,5.96-3.44,5.96-3.44Z' transform='translate(1.224548 1.224548)' fill='#fff' stroke='#1D1D1B' stroke-linejoin='round'></path><g id='cnv-buc-bl_to' transform='translate(459.504944,649.740021)'><path id='cnv-buc-bl' d='M305.51,630.11L149.4,540.06' transform='translate(-459.504944,-649.740021)' class='fs-wb' stroke-linejoin='round'></path></g></g></svg></g>",
  //   // Conveyor Belt Flipped
  //   "<g id='machine-CB2-MaB5-MaA8' class='ma' transform='translate(0,-540)'><g id='CB 2' transform='translate(0,540)'><g id='CB 2L'><svg width='312' height='360'><polygon points='156,180 312,90 312,270 156,360' class='ma-g2'></polygon></svg></g><g id='CB 2R'><svg width='312' height='360'><polygon points='156,180 156,360 0,270 0,90' class='ma-g3'></polygon></svg></g><g id='CB 2T'><svg width='312' height='360'><polygon points='156,0 312,90 156,180 0,90' class='ma-g1'></polygon></svg></g><text y='90' x='125' class='bla'><tspan>CB 2</tspan></text></g><g id='Ma B 5' transform='translate(156,630)'><g id='Ma B 5L'><svg width='312' height='360'><polygon points='156,180 312,90 312,270 156,360' class='ma-g2'></polygon></svg></g><g id='Ma B 5R'><svg width='312' height='360'><polygon points='156,180 156,360 0,270 0,90' class='ma-g3'></polygon></svg></g><g id='Ma B 5T'><svg width='312' height='360'><polygon points='156,0 312,90 156,180 0,90' class='ma-g1'></polygon></svg></g><text y='90' x='125' class='bla'><tspan>Ma B 5</tspan></text></g><g id='Ma A 8' transform='translate(312,720)'><g id='Ma A 8L'><svg width='312' height='360'><polygon points='156,180 312,90 312,270 156,360' class='ma-g2'></polygon></svg></g><g id='Ma A 8R'><svg width='312' height='360'><polygon points='156,180 156,360 0,270 0,90' class='ma-g3'></polygon></svg></g><g id='Ma A 8T'><svg width='312' height='360'><polygon points='156,0 312,90 156,180 0,90' class='ma-g1'></polygon></svg></g>",
  //   // Drills
  //   "<g transform='translate(0,-335)'><path id='m-drill-312x720_hole-u-ellipse' d='M-73.977 0c0-17.718 33.12-32.082 73.977-32.082S73.977-17.718 73.977 0 40.857 32.082 0 32.082-73.977 17.718-73.977 0Z' transform='matrix(.7 0 0 .7 156 613.633)' fill='none' stroke='#000'/><g id='m-drill-312x720_hole-u-mask-group' mask='url(#m-drill-312x720_hole-u-masks)'><g id='m-drill-312x720_hole-u-machine-drill-1-noshell' transform='matrix(1.95 0 0 1.95 41.223 51.317)'><g transform='translate(59.535 156.515)' style='animation:m-drill-312x720_hole-u-c-drill-btm_to__to 1000ms linear infinite normal forwards'><g id='m-drill-312x720_hole-u-c-drill-btm' transform='translate(-59.535 -156.515)'><g id='m-drill-312x720_hole-u-c-bit'><g id='m-drill-312x720_hole-u-c-tube'><path id='m-drill-312x720_hole-s-path1' d='M46.45 206.64c0-4.21 6.17-7.63 13.78-7.63s13.78 3.41 13.78 7.63v54.8c0 4.21-2.23 15.79-13.78 15.79-10.89 0-13.78-11.57-13.78-15.79v-54.8Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bumps'><g id='m-drill-312x720_hole-u-light' fill='#fff' stroke='#000' stroke-width='.5' stroke-miterlimit='10'><circle id='m-drill-312x720_hole-s-circle1' r='3.66' transform='translate(59.83 261.38)'/><circle id='m-drill-312x720_hole-s-circle2' r='3.66' transform='translate(59.83 245.74)'/><circle id='m-drill-312x720_hole-s-circle3' r='3.66' transform='translate(59.83 230.1)'/><circle id='m-drill-312x720_hole-s-circle4' r='3.66' transform='translate(59.83 216.46)'/></g></g><g id='m-drill-312x720_hole-u-c-bump'><path id='m-drill-312x720_hole-s-path2' d='M56.12 274c0-1.07 1.66-1.94 3.71-1.94s3.71.87 3.71 1.94v2.43c0 1.07-.6 4.02-3.71 4.02-2.93 0-3.71-2.95-3.71-4.02V274Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump2'><path id='m-drill-312x720_hole-s-path3' d='M68.61 271.38c-.89-.6-.67-2.47.48-4.16s2.81-2.57 3.69-1.97l2.01 1.37c.89.6 2.98 2.76 1.23 5.33-1.65 2.42-4.52 1.4-5.41.8l-2.01-1.37Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump3'><path id='m-drill-312x720_hole-s-path4' d='M70.94 260.25c-1.04-.26-1.48-2.08-.99-4.07.5-1.99 1.74-3.39 2.78-3.13l2.36.59c1.04.26 3.76 1.55 3 4.57-.71 2.84-3.76 2.88-4.8 2.62l-2.36-.59Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump4'><path id='m-drill-312x720_hole-s-path5' d='M71.69 247.2c-1.07-.01-1.92-1.68-1.9-3.73s.91-3.7 1.98-3.69l2.43.03c1.07.01 4.01.64 3.98 3.75-.03 2.93-2.99 3.68-4.06 3.66l-2.43-.03Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump5'><path id='m-drill-312x720_hole-s-path6' d='M71.69 233.96c-1.07-.01-1.92-1.68-1.9-3.73s.91-3.7 1.98-3.69l2.43.03c1.07.01 4.01.64 3.98 3.75-.03 2.93-2.99 3.68-4.06 3.66l-2.43-.03Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump6'><path id='m-drill-312x720_hole-s-path7' d='M71.69 220.72c-1.07-.01-1.92-1.68-1.9-3.73s.91-3.7 1.98-3.69l2.43.03c1.07.01 4.01.64 3.98 3.75-.03 2.93-2.99 3.68-4.06 3.66l-2.43-.03Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump7'><path id='m-drill-312x720_hole-s-path8' d='M48.13 247.01c1.04-.26 1.48-2.08.99-4.07-.5-1.99-1.74-3.39-2.78-3.13l-2.36.59c-1.04.26-3.76 1.55-3 4.57.71 2.84 3.76 2.88 4.8 2.62l2.36-.59Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump8'><path id='m-drill-312x720_hole-s-path9' d='M47.38 233.96c1.07-.01 1.92-1.68 1.9-3.73s-.91-3.7-1.98-3.69l-2.43.03c-1.07.01-4.01.64-3.98 3.75.03 2.93 2.99 3.68 4.06 3.66l2.43-.03Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump9'><path id='m-drill-312x720_hole-s-path10' d='M47.38 220.72c1.07-.01 1.92-1.68 1.9-3.73s-.91-3.7-1.98-3.69l-2.43.03c-1.07.01-4.01.64-3.98 3.75.03 2.93 2.99 3.68 4.06 3.66l2.43-.03Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump10'><path id='m-drill-312x720_hole-s-path11' d='M49.94 260.43c.97-.46 1.05-2.33.18-4.18s-2.37-2.98-3.34-2.53l-2.2 1.04c-.97.46-3.38 2.26-2.06 5.07 1.25 2.65 4.25 2.1 5.22 1.64l2.2-1.04Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g><g id='m-drill-312x720_hole-u-c-bump11'><path id='m-drill-312x720_hole-s-path12' d='M47.78 266.15c.83-.68 2.55.05 3.85 1.63s1.68 3.42.85 4.1l-1.88 1.54c-.83.68-3.49 2.09-5.46-.32-1.86-2.26-.07-4.74.76-5.42l1.88-1.54Z' fill='#fff' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='m-drill-312x720_hole-u-c-tube2'><path id='m-drill-312x720_hole-s-path13' d='M70.42 203.6c0 2.94-4.55 5.32-10.16 5.32s-10.16-2.38-10.16-5.32V37.9c0-2.94 4.55-5.32 10.16-5.32s10.16 2.38 10.16 5.32v165.7Z' stroke='#000' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g></g></g><g transform='translate(58.86 96.835)' style='animation:m-drill-312x720_hole-u-c-head-a-holder_to__to 1000ms linear infinite normal forwards'><g id='m-drill-312x720_hole-u-c-head-a-holder' transform='translate(-58.86 -96.835)' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'><g id='m-drill-312x720_hole-u-c-head-a' stroke='#fff'><g id='m-drill-312x720_hole-u-c-cylinder'><path id='m-drill-312x720_hole-s-path14' d='M96.06 146.03c0 10.56-16.34 19.13-36.51 19.13s-36.51-8.56-36.51-19.13v-29.76c0-10.56 16.34-19.13 36.51-19.13s36.51 8.56 36.51 19.13v29.76Z'/><ellipse id='m-drill-312x720_hole-s-ellipse1' rx='36.51' ry='19.13' transform='translate(60.86 113.82)'/></g><g id='m-drill-312x720_hole-u-c-cylinder2'><path id='m-drill-312x720_hole-s-path15' d='M117.47 110.93c0 16.96-26.24 30.71-58.61 30.71S.25 127.89.25 110.93V63.15c0-16.96 26.24-30.71 58.61-30.71s58.61 13.75 58.61 30.71v47.78Z'/><ellipse id='m-drill-312x720_hole-s-ellipse2' rx='58.61' ry='30.71' transform='translate(58.86 59.22)'/></g></g><g id='m-drill-312x720_hole-u-c-holes-a' fill='#fff' stroke='#000'><g id='m-drill-312x720_hole-u-c-hole-a'><path id='m-drill-312x720_hole-s-path16' d='M27.25 121.09c-3.66.33-7.14-5.07-7.77-12.06s1.83-12.92 5.49-13.25'/><ellipse id='m-drill-312x720_hole-s-ellipse3' rx='6.66' ry='12.71' transform='rotate(-5.14 1220.96 -236.742)'/><path id='m-drill-312x720_hole-s-path17' d='M28.33 120.75c-3.3-.57-6.15-5.52-6.73-11.91s1.18-11.66 4.25-12.91'/></g><g id='m-drill-312x720_hole-u-c-hole-a2'><path id='m-drill-312x720_hole-s-path18' d='M53.81 125.47c-3.66.33-7.14-5.07-7.77-12.06s1.83-12.92 5.49-13.25'/><ellipse id='m-drill-312x720_hole-s-ellipse4' rx='6.66' ry='12.71' transform='rotate(-5.14 1283.065 -530.256)'/><path id='m-drill-312x720_hole-s-path19' d='M54.89 125.13c-3.3-.57-6.15-5.52-6.73-11.91-.57-6.3 1.18-11.66 4.25-12.91'/></g></g></g></g><g id='m-drill-312x720_hole-u-c-drill-top'><g transform='translate(58.55 33.875)' style='animation:m-drill-312x720_hole-u-c-tube3_to__to 1000ms linear infinite normal forwards'><g id='m-drill-312x720_hole-u-c-tube3' transform='translate(-58.55 -33.875)'><path id='m-drill-312x720_hole-s-path20' d='M68.71 58.73c0 2.94-4.55 5.32-10.16 5.32s-10.16-2.38-10.16-5.32V9.02c0-2.94 4.55-5.32 10.16-5.32s10.16 2.38 10.16 5.32v49.71Z' stroke='#fff' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'/></g></g><g transform='translate(58.62 11.055)' style='animation:m-drill-312x720_hole-u-c-expander_to__to 1000ms linear infinite normal forwards'><g id='m-drill-312x720_hole-u-c-expander' transform='translate(-58.62 -11.055)' stroke='#fff' stroke-width='.5' stroke-linecap='square' stroke-linejoin='round'><ellipse id='m-drill-312x720_hole-s-ellipse5' rx='15.44' ry='8.09' transform='translate(58.62 13.77)'/><ellipse id='m-drill-312x720_hole-s-ellipse6' rx='15.44' ry='8.09' transform='translate(58.62 12.78)'/><ellipse id='m-drill-312x720_hole-s-ellipse7' rx='15.44' ry='8.09' transform='translate(58.62 11.96)'/><ellipse id='m-drill-312x720_hole-s-ellipse8' rx='15.44' ry='8.09' transform='translate(58.62 10.97)'/><ellipse id='m-drill-312x720_hole-s-ellipse9' rx='15.44' ry='8.09' transform='translate(58.62 10.15)'/><ellipse id='m-drill-312x720_hole-s-ellipse10' rx='15.44' ry='8.09' transform='translate(58.62 9.16)'/><ellipse id='m-drill-312x720_hole-s-ellipse11' rx='15.44' ry='8.09' transform='translate(58.62 8.34)'/></g></g></g></g><mask id='m-drill-312x720_hole-u-masks' mask-type='luminance'><ellipse id='m-drill-312x720_hole-s-ellipse12' rx='280.528' ry='326.993' transform='matrix(.55118 0 0 1 157.379 308.722)' fill='#fff' stroke-width='0'/></mask>"
  // ];

  uint[] internal partsToContract = [0, 1, 2, 3, 4]; // index is which contract 

  constructor() {
    // conveyor belt
    machineToPosition["conveyorBelt"] = [[0,1,3,4,5], [3,4,6,7,8]];
    machineToSWHeight["conveyorBelt"] = 2;
    machineToSVGIndex["conveyorBelt"] = [0, 0, 1, 1];
    machineText["conveyorBelt"] = "<text class='bla' x='300' y='0'>";
    machineToLWGrid["conveyorBelt"] = charTouchingWall;
    numMachineParts["conveyorBelt"] = 1;

    // drills
    machineToPosition["drills"] = [[0,1,2,3,4,5], [0,1,2,9,9,9], [9,9,9,3,4,5]];
    machineToSWHeight["drills"] = 3;
    machineToSVGIndex["drills"] = [2, 2];
    machineText["drills"] = "<text class='bla3' x='155' y='180'>";
    machineToLWGrid["drills"] = fullGrid;
    numMachineParts["drills"] = 1;
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

  function getMachinePWGrid(string memory machine) public view returns (string[9] memory) {
    return machineToLWGrid[machine];
  }

  // INTERNAL FUNCTIONS

  function positionText(string memory name, uint position) internal pure returns (string memory) {
    return string.concat(
        "<tspan>",
        name,
        Strings.toString(position),
        "</tspan>"
    );
  }

  // Get machine's SVG
  function getMachineSVG(string memory machine, uint position, bool leftAlign) external view returns (string memory) {
    // get the number of parts the main svg is split into
    uint numParts = numMachineParts[machine];
    uint offset = 0;
    string memory svg = "";
    if (!leftAlign) {
      offset = numParts;
    }
    // get the svg for each part given the alignment
    for (uint i = 0; i < numParts; i++) {
      string memory tempSvg = "";
      tempSvg = string.concat(
        machineToGetter(machine),
        // machineParts[machineToSVGIndex[machine][i + offset]],
        
        // Testing text
        machineText[machine], // open text
        // machineToSVG[machine][numParts * 2], // open text
        positionText(machine, position),
        CommonSVG.TEXT_CLOSE
        // CommonSVG.G2_END
      );
      // if (numParts > 1) {
      //   // get the x offset for the part
      //   string memory xOffset = partXOffset[machine][i];
      //   // get the y offset for the part
      //   string memory yOffset = partYOffset[machine][i];
      //   tempSvg = CommonSVG.groupTransform(xOffset, yOffset, tempSvg);
      // }
      svg = string.concat(svg, tempSvg);
    }

    return svg;
  }

  // function matchIndexToContract(uint index, uint currentPosition) internal view {
  //   if (partsToContract[currentPosition] < index) {
  //     matchIndexToContract(index, currentPosition + 1);
  //   } else {
  //     getMachinePartFromContract(currentPosition, index);
  //   }
    
  // }

  function machineToGetter(string memory machine) internal view returns (string memory) {
    if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("conveyorBelt"))) {
      return getConveyorBelt();
    } else if (keccak256(abi.encodePacked(machine)) == keccak256(abi.encodePacked("drills"))) {
      return getDrills();
    } else {
      return "";
    }
  }

  // Machine Getters

  function getConveyorBelt() internal view returns (string memory) {
    return string.concat(CB1.getMachinepart(), CB2.getMachinepart(), CB3.getMachinepart(), CB4.getMachinepart(), CB5.getMachinepart(), CB6.getMachinepart(), CB7.getMachinepart(), CB8.getMachinepart());
  }

  function getDrills() internal pure returns (string memory) {
    return Drills.getMachinepart();
  }
}