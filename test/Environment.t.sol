// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import "forge-std/Test.sol";
import "../src/Environment.sol";

contract EnvironmentTest is Test{
  /* Environment FUNCTIONS */

  function testIncreaseValueByPercentage(uint baseLightness, uint percentage) public {
    vm.assume(baseLightness <= 100);
    vm.assume(percentage <= 100);

    uint result = Environment.increaseValueByPercentage(baseLightness, percentage);

    assertLt(result, 101);
  }

  function testDecreaseValueByPercentage(uint baseLightness, uint percentage) public {
    vm.assume(baseLightness <= 100);
    vm.assume(percentage <= 100);

    uint result = Environment.decreaseValueByPercentage(baseLightness, percentage);

    // result is a uint so it can't be negative
    assertLt(result, 101);
  }


  function testGetColours(uint baseValue) public {
    vm.assume(baseValue <= 255);

    uint[] memory result = Environment.getColours("Altar", baseValue);

    assertEq(result.length, 36);

    // every 1st element is a hue, every 2nd element is a saturation, every 3rd element is a lightness
    // hue is a uint between 0 and 360, saturation and lightness are uints between 0 and 100
    for (uint i = 0; i < result.length; i++) {
      if (i % 3 == 0) {
        assertLt(result[i], 361);
      } else {
        assertLt(result[i], 101);
      }
    }
  }

  function testGetColourIndex(uint baseValue) public {
    vm.assume(baseValue <= 255);

    uint result = Environment.getColourIndex(baseValue);

    assertLt(result, 24);
  }
}