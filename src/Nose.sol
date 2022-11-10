// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";

library Nose {
  string internal constant HOLE = "<g><defs><linearGradient id='c-hole-lg' x1='451.32' x2='482.86' y1='626.51' y2='626.51' gradientUnits='userSpaceOnUse' spreadMethod='pad'> <stop offset='17%' stop-color='#c6f7f6'/> <stop offset='100%' stop-color='#2c84a3'/> </linearGradient> </defs> <g id='c-hole-a'> <g stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5'> <path fill='url(#c-hole-lg)' d='M478.19 621.58c-6.21-3.64-16.26-3.76-22.34-.28-5.28 3.03-5.94 7.8-2.01 11.35.6-.66 1.37-1.27 2.33-1.82 5.19-2.98 13.79-2.87 19.1.24 1.58.93 2.68 2.02 3.32 3.17 5.82-3.45 5.69-9.09-.4-12.66Z'/> <path fill='#1d1d1b' d='M475.27 631.08c-5.31-3.11-13.9-3.22-19.1-.24-.95.55-1.73 1.16-2.33 1.82.59.53 1.28 1.04 2.08 1.51 6.12 3.59 16.17 3.71 22.34.28.12-.06.21-.14.33-.2-.64-1.15-1.74-2.24-3.32-3.17Z'/></g></g></g>";

  // get the arrangment for 4 holes
  function getArrangement4(string memory xOffset, string memory yOffset) internal pure returns (string memory) {
    return string.concat(
      "<g transform='translate(", 
      xOffset, 
      ",", 
      yOffset, 
      ")'>",
      HOLE,
      "</g>"
    );
  }

  // get the arrangment for 5 holes
  function getArrangement5(string memory xOffset, string memory yOffset) internal pure returns (string memory) {
    // up = -55
    // down = 55
    // left = -90
    // right = 90
    string[10] memory holes = ["0", "0", "0", "-55", "0", "55", "-90", "0", "90", "0"];
    string memory output = string.concat(
      "<g transform='translate(", 
      xOffset, 
      ",", 
      yOffset, 
      ")'>");
    for (uint i = 0; i < holes.length / 2; i++) {
      output = string.concat(
        output,
        "<g transform='translate(",
        holes[2*i],
        ",",
        holes[2*i + 1],
        ")'>",
        HOLE,
        "</g>"
      );
    }
    return string.concat(
      output,
      "</g>"
    );
  }

  // get the holes
  function getHoles(uint[6] memory holeDistribution) internal pure returns (string memory) {

    string[12] memory HOLE_OFFSET = ["-156", "-630", "-312", "-540", "-468", "-450", "0", "-540", "-156", "-450", "-312", "-360"];
    string memory output = "";

    // call the function for the given number of holes - possible values = 4, 5 and 0 if empty
    for (uint i = 0; i < holeDistribution.length; i++) {
      // get the x and y offset for the hole distribution
      string memory xOffset = HOLE_OFFSET[i * 2];
      string memory yOffset = HOLE_OFFSET[i * 2 + 1];
      // 5 holes
      if (holeDistribution[i] == 0) {
        output = string.concat(output, getArrangement5(xOffset, yOffset));
      // 4 holes
      } else if (holeDistribution[i] == 1) {
        output = string.concat(output, getArrangement4(xOffset, yOffset));
      }
    }
    return output;
  }
}