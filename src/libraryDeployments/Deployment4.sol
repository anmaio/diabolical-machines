// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "../sound/SoundImp1.sol";
import "../sound/SoundImp2.sol";
import "../sound/SoundImp3.sol";
import "../sound/SoundImp4.sol";
import "../sound/SoundImp5.sol";
import "../sound/SoundImp6.sol";
import "../sound/SoundImp7.sol";
import "../sound/SoundImp8.sol";
import "../sound/SoundImp9.sol";
import "../sound/SoundImp10.sol";
import "../sound/SoundImp11.sol";
import "../sound/SoundImp12.sol";
import "../sound/SoundImp13.sol";
import "../sound/SoundImp14.sol";
import "../sound/SoundImp15.sol";
import "../sound/SoundImp16.sol";

contract Deployment4 {

  function getPart() external pure returns (string memory) {
    string memory output = string.concat(
      SoundImp1.getPart(),
      SoundImp2.getPart(),
      SoundImp3.getPart(),
      SoundImp4.getPart(),
      SoundImp5.getPart(),
      SoundImp6.getPart()
    );

    output = string.concat(
      output,
      SoundImp7.getPart(),
      SoundImp8.getPart(),
      SoundImp9.getPart(),
      SoundImp10.getPart(),
      SoundImp11.getPart(),
      SoundImp12.getPart()
    );

    return string.concat(
      output,
      SoundImp13.getPart(),
      SoundImp14.getPart(),
      SoundImp15.getPart(),
      SoundImp16.getPart()
    );
  }
}