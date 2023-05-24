// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "../styles/apparatus/ApparatusCSS1.sol";
import "../styles/apparatus/ApparatusCSS2.sol";
import "../styles/apparatus/ApparatusCSS3.sol";

import "../styles/altar/AltarCSS1.sol";

import "../styles/cells/CellsCSS1.sol";
import "../styles/cells/CellsCSS2.sol";
import "../styles/cells/CellsCSS3.sol";

import "../styles/tubes/TubesCSS1.sol";

contract Deployment5 {

  function getPart() external pure returns (string memory) {
    string memory output = string.concat(
      ApparatusCSS1.getPart(), // MUST: be apparatucss1 after getAnimationSpeed
      ApparatusCSS2.getPart(),
      ApparatusCSS3.getPart(),
      AltarCSS1.getPart()
    );

    return string.concat(
      output,
      CellsCSS1.getPart(),
      CellsCSS2.getPart(),
      CellsCSS3.getPart(),
      TubesCSS1.getPart()
    );
  }
}