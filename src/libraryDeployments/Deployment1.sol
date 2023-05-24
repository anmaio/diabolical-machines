// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "../defs/patterns/PatternsDefs1.sol";
import "../defs/patterns/PatternsDefs2.sol";
import "../defs/patterns/PatternsDefs3.sol";
import "../defs/patterns/PatternsDefs4.sol";
import "../defs/patterns/PatternsDefs5.sol";
import "../defs/patterns/PatternsDefs6.sol";
import "../defs/patterns/PatternsDefs7.sol";
import "../defs/patterns/PatternsDefs8.sol";
import "../defs/patterns/PatternsDefs9.sol";
import "../defs/patterns/PatternsDefs10.sol";
import "../defs/patterns/PatternsDefs11.sol";
import "../defs/patterns/PatternsDefs12.sol";

contract Deployment1 {

  function getPart() external pure returns (string memory) {
    string memory output = string.concat(
      PatternsDefs1.getPart(),
      PatternsDefs2.getPart(),
      PatternsDefs3.getPart(),
      PatternsDefs4.getPart(),
      PatternsDefs5.getPart(),
      PatternsDefs6.getPart()
    );

    return string.concat(
      output,
      PatternsDefs7.getPart(),
      PatternsDefs8.getPart(),
      PatternsDefs9.getPart(),
      PatternsDefs10.getPart(),
      PatternsDefs11.getPart(),
      PatternsDefs12.getPart()
    );
  }
}