// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "../defs/cells/CellsDefs1.sol";
import "../defs/cells/CellsDefs2.sol";

import "../defs/tubes/TubesDefs1.sol";

import "../defs/conveyorBelt/ConveyorBeltDefs1.sol";

import "../defs/assets/AssetsDefs1.sol";
import "../defs/assets/AssetsDefs2.sol";

import "../defs/props/PropsDefs1.sol";

import "../defs/beast/BeastDefs1.sol";
import "../defs/beast/BeastDefs2.sol";

contract Deployment3 {

  function getPart() external pure returns (string memory) {
    string memory output = string.concat(
      CellsDefs1.getPart(),
      CellsDefs2.getPart(),
      TubesDefs1.getPart(),
      ConveyorBeltDefs1.getPart(),
      AssetsDefs1.getPart()
    );

    return string.concat(
      output,
      AssetsDefs2.getPart(),
      PropsDefs1.getPart(),
      BeastDefs1.getPart(),
      BeastDefs2.getPart()
    );
  }
}