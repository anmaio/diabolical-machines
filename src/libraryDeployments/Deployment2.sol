// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "../defs/patterns/PatternsDefs13.sol";
import "../defs/patterns/PatternsDefs14.sol";
import "../defs/patterns/PatternsDefs15.sol";
import "../defs/patterns/PatternsDefs16.sol";
import "../defs/patterns/PatternsDefs17.sol";
import "../defs/patterns/PatternsDefs18.sol";

import "../defs/apparatus/ApparatusDefs1.sol";
import "../defs/apparatus/ApparatusDefs2.sol";

import "../defs/altar/AltarDefs1.sol";
import "../defs/altar/AltarDefs2.sol";
import "../defs/altar/AltarDefs3.sol";

contract Deployment2 {

  function getPart() external pure returns (string memory) {
    string memory output = string.concat(
      PatternsDefs13.getPart(),
      PatternsDefs14.getPart(),
      PatternsDefs15.getPart(),
      PatternsDefs16.getPart(),
      PatternsDefs17.getPart(),
      PatternsDefs18.getPart()
    );

    return string.concat(
      output,
      ApparatusDefs1.getPart(),
      ApparatusDefs2.getPart(),
      AltarDefs1.getPart(),
      AltarDefs2.getPart(),
      AltarDefs3.getPart()
    );
  }
}