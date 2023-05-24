// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "../styles/tubes/TubesCSS2.sol";

import "../styles/beast/BeastCSS1.sol";
import "../styles/beast/BeastCSS2.sol";
import "../styles/beast/BeastCSS3.sol";

import "../styles/conveyorBelt/ConveyorBeltCSS1.sol";
import "../styles/conveyorBelt/ConveyorBeltCSS2.sol";
import "../styles/conveyorBelt/ConveyorBeltCSS3.sol";

import "../styles/assets/AssetsCSS1.sol";
import "../styles/assets/AssetsCSS2.sol";

import "../styles/character/CharacterCSS1.sol";
import "../styles/character/CharacterCSS2.sol";

contract Deployment6 {

  function getPart() external pure returns (string memory) {
    string memory output = string.concat(
      TubesCSS2.getPart(),
      BeastCSS1.getPart(),
      BeastCSS2.getPart(),
      BeastCSS3.getPart(),
      ConveyorBeltCSS1.getPart(),
      ConveyorBeltCSS2.getPart()
    );

    return string.concat(
      output,
      ConveyorBeltCSS3.getPart(),
      AssetsCSS1.getPart(),
      AssetsCSS2.getPart(),
      CharacterCSS1.getPart(),
      CharacterCSS2.getPart()
    );
  }
}