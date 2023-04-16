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

    assertLt(result, 101);
  }
}