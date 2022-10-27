// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

library CB1 {
  string internal constant CB_PART1 = "<g transform='translate(-234,-630)'><g id='conveyor-all-2-u-03-factory-conveyor' transform='translate(73.495758 0)'><g id='conveyor-all-2-u-d-lab'><g id='conveyor-all-2-u-c-hole-closed' transform='translate(26-29)'><path id='conveyor-all-2-u-c-conveyor-shade' d='M700.365758,449.317001l153.69,89.322999-327.24,192.839999-158.82-92.68l332.37-189.482998Z' transform='translate(-102 208.000001)' opacity='0.14' fill='#206d8f' stroke-width='2.16'/></g><g id='conveyor-all-2-u-m-conveyor'><g id='conveyor-all-2-u-c-conveyor-end'><g id='conveyor-all-2-u-c-wheel'><g id='conveyor-all-2-u-wall-disc'><path id='conveyor-all-2-s-path1' d='M755.76,558.87v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#206c8e' stroke='#000' stroke-miterlimit='10'/><g id='conveyor-all-2-s-g1'><path id='conveyor-all-2-s-path2' d='M760.41,569.06c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path3' d='M760.41,569.06c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-wall-ring'><g id='conveyor-all-2-s-g2'><path id='conveyor-all-2-s-path4' d='M760.41,569.06c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path5' d='M760.41,569.06c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fae676' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g><path id='conveyor-all-2-s-path6' d='M754.37,572.84c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-c-wheel2'><g id='conveyor-all-2-u-wall-disc2'><path id='conveyor-all-2-s-path7' d='M724.29,578.17v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#206c8e' stroke='#000' stroke-miterlimit='10'/><g id='conveyor-all-2-s-g3'><path id='conveyor-all-2-s-path8' d='M728.94,588.36c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path9' d='M728.94,588.36c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-wall-ring2'><g id='conveyor-all-2-s-g4'><path id='conveyor-all-2-s-path10' d='M728.94,588.36c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path11' d='M728.94,588.36c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fae676' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g><path id='conveyor-all-2-s-path12' d='M722.89,592.14c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-c-wheel3'><g id='conveyor-all-2-u-wall-disc3'><path id='conveyor-all-2-s-path13' d='M692.82,595.47v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#206c8e' stroke='#000' stroke-miterlimit='10'/><g id='conveyor-all-2-s-g5'><path id='conveyor-all-2-s-path14' d='M697.47,605.66c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path15' d='M697.47,605.66c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-wall-ring3'><g id='conveyor-all-2-s-g6'><path id='conveyor-all-2-s-path16' d='M697.47,605.66c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path17' d='M697.47,605.66c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fae676' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g><path id='conveyor-all-2-s-path18' d='M691.42,609.44c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-c-wheel4'><g id='conveyor-all-2-u-wall-disc4'><path id='conveyor-all-2-s-path19' d='M661.35,614.6v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#206c8e' stroke='#000' stroke-miterlimit='10'/><g id='conveyor-all-2-s-g7'><path id='conveyor-all-2-s-path20' d='M666,624.79c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#206c8e'/><path id='conveyor-all-2-s-path21' d='M666,624.79c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-wall-ring4'><g id='conveyor-all-2-s-g8'><path id='conveyor-all-2-s-path22' d='M666,624.79c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path23' d='M666,624.79c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fae676' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g><path id='conveyor-all-2-s-path24' d='M659.95,628.57c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-c-wheel5'><g id='conveyor-all-2-u-wall-disc5'><path id='conveyor-all-2-s-path25' d='M629.88,631.89v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#206c8e' stroke='#1d1d1b' stroke-miterlimit='10'/><g id='conveyor-all-2-s-g9'><path id='conveyor-all-2-s-path26' d='M634.52,642.09c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path27' d='M634.52,642.09c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-wall-ring5'><g id='conveyor-all-2-s-g10'><path id='conveyor-all-2-s-path28' d='M634.52,642.09c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path29' d='M634.52,642.09c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fae676' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round'/></g><path id='conveyor-all-2-s-path30' d='M628.48,645.87c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><path id='conveyor-all-2-u-c-belt' d='M624.4,630.22l156.16-90.09-156.11-90.05c0,0-159.99,92.41-160.4,92.65-8.7,5.03-13.53,17.22-13.5,27.23.01,4.97-.07,9.87,2.77,11.52l154.06,87.96c0,0-4.8-4.08-3.32-12.76.32-1.84,1.91-10.05,5.87-15.18c0,0,1.99-3.46,8.5-7.83.29-.19,5.96-3.44,5.96-3.44Z' fill='#f2b6d3' stroke='#1d1d1b' stroke-linejoin='round'/></g><g id='conveyor-all-2-u-c-conveyor-end2'><g id='conveyor-all-2-u-c-wheel6'><g id='conveyor-all-2-u-wall-disc6'><path id='conveyor-all-2-s-path31' d='M599.71,648.84v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#206d8f' stroke='#000' stroke-miterlimit='10'/><g id='conveyor-all-2-s-g11'><path id='conveyor-all-2-s-path32' d='M604.35,659.04c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path33' d='M604.35,659.04c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-wall-ring6'><g id='conveyor-all-2-s-g12'><path id='conveyor-all-2-s-path34' d='M604.35,659.04c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path35' d='M604.35,659.04c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fae676' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g><path id='conveyor-all-2-s-path36' d='M598.31,662.82c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-c-wheel7'><g id='conveyor-all-2-u-wall-disc7'><path id='conveyor-all-2-s-path37' d='M568.24,668.14v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#206d8f' stroke='#000' stroke-miterlimit='10'/><g id='conveyor-all-2-s-g13'><path id='conveyor-all-2-s-path38' d='M572.88,678.34c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path39' d='M572.88,678.34c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-wall-ring7'><g id='conveyor-all-2-s-g14'><path id='conveyor-all-2-s-path40' d='M572.88,678.34c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path41' d='M572.88,678.34c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fae676' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g><path id='conveyor-all-2-s-path42' d='M566.84,682.12c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,8.4-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g id='conveyor-all-2-u-c-wheel8'><g id='conveyor-all-2-u-wall-disc8'><path id='conveyor-all-2-s-path43' d='M536.77,685.45v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#206d8f' stroke='#000' stroke-miterlimit='10'/><g id='conveyor-all-2-s-g15'><path id='conveyor-all-2-s-path44' d='M541.41,695.64c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff'/><path id='conveyor-all-2-s-path45' d='M541.41,695.64c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#fff' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/></g></g><g ";

  function getMachinepart() public view returns (string memory) {
    return CB_PART1;
  }
}