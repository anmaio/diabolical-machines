// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract SharedAssets {

  // opening svg tag
  string public constant SVG_OPEN = "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 282 282'>";

  // test shape 1
  string public constant grid = "<path d='M 0 0 L 0 500 L 500 500 L 500 0 Z' fill='#000000' />";

  // test shape 2
  string public constant altar = "<path d='M 0 0 L 0 500 L 500 500 L 500 0 Z' fill='#ffffff' />";

  // closing svg tag
  string public constant SVG_CLOSE = "</svg>";
}