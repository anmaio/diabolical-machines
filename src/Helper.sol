// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";

library Helper {
  string internal constant FLIPPED = "<g style='transform:scaleX(-1);transform-origin:50% 50%;'>";
  
  // // xlms
  // function getXML(string memory svg) internal pure returns (string memory) {
  //   return string(abi.encodePacked("<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' viewBox='0 0 1000 1000'>", svg, "</svg>"));
  // }

  string internal constant NOT_FLIPPED = "<g style='transform:scaleX(1);transform-origin:50% 50%;'>";

  string internal constant G_END = "</g>";

  string internal constant G2_END = "</g></g>";

  string internal constant G_TRANSFORM = "<g transform='translate(";

  string internal constant G_MID = ")'>";

  string internal constant SHELL_OPEN = "<g style='transform:scaleX(";

  string internal constant SHELL_CLOSE = ");transform-origin:50% 50%;' id='shell-clip' clip-path='url(#shell-clip)'><g id='diorama-filters' filter='url(#chromatic-aberration)'><g id='shell'> <g id='shell-main' transform='translate(0,0)'> <g id='floor'> <svg height='1080' width='936'> <g> <polygon class='floor' points='0,810 468,1080 936,810 468,540' /> </g> <line class='hd' x1='156' y1='900' x2='624' y2='630'  /> <line class='hd' x1='312' y1='990' x2='780' y2='720'  /> <line class='hd' x1='156' y1='720' x2='624' y2='990'  /> <line class='hd' x1='312' y1='630' x2='780' y2='900'  /> </svg> </g> <g id='wall-l'> <svg class='wall-l' height='1080' width='936'> <polygon points='0,270 468,0 468,540 0,810' /> <line class='hd' x1='0' y1='630' x2='468' y2='360'  /> <line class='hd' x1='0' y1='450' x2='468' y2='180'  /> <line class='hd' x1='156' y1='180' x2='156' y2='720'  /> <line class='hd' x1='312' y1='90' x2='312' y2='630'  /> </svg> </g> <g id='wall-r'> <svg class='wall-r' height='1080' width='936'> <polygon points='468,540 468,0 936,270 936,810' /> <line class='hw' x1='468' y1='180' x2='936' y2='450'  /> <line class='hw' x1='468' y1='360' x2='936' y2='630'  /> <line class='hw' x1='624' y1='90' x2='624' y2='630'  /> <line class='hw' x1='780' y1='180' x2='780' y2='720'  /> </svg> </g> </g> </g>";

  // closing svg tag
  string internal constant SVG_END = "</svg>";

  function groupTransform(string memory x, string memory y, string memory data) internal pure returns (string memory) {
    return string.concat(G_TRANSFORM, x, ",", y, G_MID, data, G_END);
  }

  function getClosingSVG() external pure returns (string memory) {
    return string.concat(
      G2_END,
      SVG_END
    );
  }

  function getShell(string memory flip) external pure returns (string memory) {
    return string.concat(
      SHELL_OPEN,
      flip,
      SHELL_CLOSE
    );
  }
}