// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "../../GridHelper.sol";
import "../../CommonSVG.sol";

library Nose {
  string internal constant HOLE1 = "<g><defs><linearGradient id='c-hole-lg' x1='451.32' x2='482.86' y1='626.51' y2='626.51' gradientUnits='userSpaceOnUse' spreadMethod='pad'> <stop offset='17%' stop-color='#c6f7f6'/> <stop offset='100%' stop-color='#2c84a3'/> </linearGradient> </defs> <g id='c-hole-a'> <g stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5'> <path fill='url(#c-hole-lg)' d='M478.19 621.58c-6.21-3.64-16.26-3.76-22.34-.28-5.28 3.03-5.94 7.8-2.01 11.35.6-.66 1.37-1.27 2.33-1.82 5.19-2.98 13.79-2.87 19.1.24 1.58.93 2.68 2.02 3.32 3.17 5.82-3.45 5.69-9.09-.4-12.66Z'/> <path fill='#1d1d1b' d='M475.27 631.08c-5.31-3.11-13.9-3.22-19.1-.24-.95.55-1.73 1.16-2.33 1.82.59.53 1.28 1.04 2.08 1.51 6.12 3.59 16.17 3.71 22.34.28.12-.06.21-.14.33-.2-.64-1.15-1.74-2.24-3.32-3.17Z'/></g></g></g>";
  string internal constant HOLE2 = "<g transform='translate(100,420)' ><g id='m_a_limit33-u-c-hole-a31'><path id='m_a_limit33-s-path347' d='M689.54,922.18c-6.21-3.64-16.26-3.76-22.34-.28-5.28,3.03-5.94,7.8-2.01,11.35.6-.66,1.37-1.27,2.33-1.82c5.19-2.98,13.79-2.87,19.1.24c1.58.93,2.68,2.02,3.32,3.17c5.82-3.45,5.69-9.09-.4-12.66Z' fill='url(#m_a_limit33-s-path347-fill)' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/><path id='m_a_limit33-s-path348' d='M686.61,931.68c-5.31-3.11-13.9-3.22-19.1-.24-.95.55-1.73,1.16-2.33,1.82.59.53,1.28,1.04,2.08,1.51c6.12,3.59,16.17,3.71,22.34.28.12-.06.21-.14.33-.2-.64-1.15-1.74-2.24-3.32-3.17Z' fill='#1d1d1b' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/></g></g>";
  string internal constant HOLE3 = "<g transform='translate(100,420)' ><g id='m_a_limit33-u-c-hole-a28'><path id='m_a_limit33-s-path341' d='M689.54,861.69c-6.21-3.64-16.26-3.76-22.34-.28-5.28,3.03-5.94,7.8-2.01,11.35.6-.66,1.37-1.27,2.33-1.82c5.19-2.98,13.79-2.87,19.1.24c1.58.93,2.68,2.02,3.32,3.17c5.82-3.45,5.69-9.09-.4-12.66Z' fill='url(#m_a_limit33-s-path341-fill)' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/><path id='m_a_limit33-s-path342' d='M686.61,871.19c-5.31-3.11-13.9-3.22-19.1-.24-.95.55-1.73,1.16-2.33,1.82.59.53,1.28,1.04,2.08,1.51c6.12,3.59,16.17,3.71,22.34.28.12-.06.21-.14.33-.2-.64-1.15-1.74-2.24-3.32-3.17Z' fill='#1d1d1b' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/></g></g>";

  string internal constant MOVING_PANEL = "<g id='m_a_limit33-u-panel' style='display: inline-block;'><g id='m_a_limit33-s-g8'><polygon id='m_a_limit33-s-polygon13' points='1.65,271.27 469.02,1.54 467.43,541.83 1.65,811.73 1.65,271.27' fill='#1f3759' stroke='#000' stroke-miterlimit='10'/><polygon id='m_a_limit33-u-f' points='17.3,280.47 484.05,10.74 482.46,551.03 17.3,820.93 17.3,280.47' fill='url(#m_a_limit33-u-f-fill)' stroke='#000' stroke-width='1.01' stroke-miterlimit='10'/><polygon id='m_a_limit33-u-l' points='1.65,811.47 17.3,820.66 17.3,280.47 1.65,271.27 1.65,811.47' fill='#206c8e' stroke='#000' stroke-width='1.01' stroke-miterlimit='10'/><polygon id='m_a_limit33-u-t' points='1.65,271.27 17.3,280.47 484.05,10.74 469.02,1.54 1.65,271.27' fill='url(#m_a_limit33-u-t-fill)' stroke='#000' stroke-width='1.01' stroke-miterlimit='10'/></g></g>";

  // EYES
  // Mid eyes
  string internal constant EYES1 = "";
  string internal constant EYES2 = "";
  string internal constant EYES3 = "";
  string internal constant EYES4 = "";

  // NOSES
  string internal constant NOSE1 = "";
  string internal constant NOSE2 = "";
  string internal constant NOSE3 = "";
  string internal constant NOSE4 = "";
  string internal constant NOSE5 = "";

  bytes internal constant HOLES_OFFSET = "-156-630-312-540-468-450+000-540-156-450-312-360";

  bytes internal constant HOLES_5 = "+00+00+00-55+00+55-90+00+90+00";
  bytes internal constant HOLES_4 = "+50+35+50-35-50+35-50-35nulnul";

  // get the arrangment for 4-5 holes
  function getArrangement(string memory xOffset, string memory yOffset, bytes memory holes, uint holeVersion) internal pure returns (string memory) {
    string memory output = "";
    for (uint i = 0; i < 5; i++) {
      string memory offsetX = string(GridHelper.slice(holes, 2*i*3, 3));
      string memory offsetY = string(GridHelper.slice(holes, (2*i + 1)*3, 3));

      if (keccak256(abi.encodePacked(offsetX)) != keccak256(abi.encodePacked("nul"))) {
        output = string.concat(
          output,
          CommonSVG.groupTransform(offsetX, offsetY, getHole(holeVersion))
        );
      }
    }
    return CommonSVG.groupTransform(xOffset, yOffset, output);
  }

  // get the hole from the hole number
  function getHole(uint holeNumber) internal pure returns (string memory) {
    if (holeNumber == 0) {
      return HOLE1;
    } else if (holeNumber == 1) {
      return HOLE2;
    } else {
      return HOLE3;
    }
  }

  // get the holes
  function getHoles(uint[6] memory holeDistribution, bytes memory digits) internal pure returns (string memory) {

    bytes memory holeBytes = GridHelper.slice(digits, 0, 1);
    uint holeVersion = uint256(keccak256(holeBytes)) % 3;

    // string[12] memory HOLE_OFFSET = ["-156", "-630", "-312", "-540", "-468", "-450", "0", "-540", "-156", "-450", "-312", "-360"];
    // string[10] memory holes4 = ["0", "0", "0", "-55", "0", "55", "-90", "0", "90", "0"];
    // string[10] memory holes5 = ["50", "35", "50", "-35", "-50", "35", "-50", "-35", "null", "null"];

    string memory output = "";

    // call the function for the given number of holes - possible values = 4, 5 and 0 if empty
    for (uint i = 0; i < holeDistribution.length; i++) {
      // get the x and y offset for the hole distribution
      string memory xOffset = string(GridHelper.slice(HOLES_OFFSET, 2*i*4, 4));
      string memory yOffset = string(GridHelper.slice(HOLES_OFFSET, (2*i + 1)*4, 4));

      // string memory xOffset = HOLE_OFFSET[i * 2];
      // string memory yOffset = HOLE_OFFSET[i * 2 + 1];
      // 5 holes
      if (holeDistribution[i] == 0) {
        output = string.concat(output, getArrangement(xOffset, yOffset, HOLES_5, holeVersion));
      // 4 holes
      } else if (holeDistribution[i] == 1) {
        output = string.concat(output, getArrangement(xOffset, yOffset, HOLES_4, holeVersion));
      }
    }
    return output;
  }

  function getMachine(uint[6] memory holeDistribution, bytes memory digits) internal pure returns (string memory) {
    string memory output = CommonSVG.groupTransform("-312", "-720", string.concat(MOVING_PANEL, getHoles(holeDistribution, digits)));
    return string.concat("<g id='m_a_limit33-u-a_to' style='animation-play-state: running;'>", output, "</g>");
  }
}