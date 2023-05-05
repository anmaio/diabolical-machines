// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import "forge-std/Test.sol";
import "../src/GridHelper.sol";

contract GridHelperTest is Test{
  /* GRIDHELPER FUNCTIONS */

  function testSliceBytes() public {
    bytes memory testBytes = "ABCDEF";

    bytes memory result = GridHelper.slice(testBytes, 0, 2);

    assertEq(result, "AB");
  }

  function testSliceString() public {
    string memory testString = "hello world";

    string memory result = string(GridHelper.slice(bytes(testString), 0, 5));

    assertEq(result, "hello");
  }

  function testSliceBytesNumber() public {
    bytes memory testBytes = "123456789";

    bytes memory result = GridHelper.slice(testBytes, 0, 8);

    assertEq(result, "12345678");
  }

  function testCombineStringArrays() public {
    string[] memory array1 = new string[](2);
    array1[0] = "hello";
    array1[1] = "world";

    string[] memory array2 = new string[](2);
    array2[0] = "goodbye";
    array2[1] = "world";

    string[] memory result = GridHelper.combineStringArrays(array1, array2);

    assertEq(result[0], "hello");
    assertEq(result[1], "world");
    assertEq(result[2], "goodbye");
    assertEq(result[3], "world");
    
    assertEq(result.length, 4);
  }

  function testCombineUintArrays() public {
    uint[] memory array1 = new uint[](2);
    array1[0] = 1;
    array1[1] = 2;

    uint[] memory array2 = new uint[](2);
    array2[0] = 3;
    array2[1] = 4;

    uint[] memory result = GridHelper.combineUintArrays(array1, array2);

    assertEq(result[0], 1);
    assertEq(result[1], 2);
    assertEq(result[2], 3);
    assertEq(result[3], 4);
    
    assertEq(result.length, 4);
  }

  function testGroupTransform() public {
    string memory testString = "hello world";
    string memory x = "50";
    string memory y = "200";

    string memory result = GridHelper.groupTransform(x, y, testString);

    assertEq(result, "<g transform='translate(50,200)'>hello world</g>");
  }

  function testUintToBytes() public {
    uint testUint = 255;

    bytes memory result = GridHelper.uintToBytes(testUint);

    uint resultUint = GridHelper.bytesToUint(result);

    assertEq(resultUint, 255);
  }

  function testGetRandByte() public {
    uint value = type(uint).max;

    uint result = GridHelper.getRandByte(value, 0);

    assertEq(result, 255);
  }

  function testStringToUint() public {
    string memory testString = "0123456789";

    uint result = GridHelper.stringToUint(testString);

    assertEq(result, 123456789);
  }

  function testSetUintArrayFromString() public {
    string memory testString = "01234";

    uint[] memory result = GridHelper.setUintArrayFromString(testString, 5, 1);

    assertEq(result[0], 0);
    assertEq(result[1], 1);
    assertEq(result[2], 2);
    assertEq(result[3], 3);
    assertEq(result[4], 4);

    assertEq(result.length, 5);

    string memory testString2 = "123456789";

    uint[] memory result2 = GridHelper.setUintArrayFromString(testString2, 3, 3);

    assertEq(result2[0], 123);
    assertEq(result2[1], 456);
    assertEq(result2[2], 789);

    assertEq(result2.length, 3);
  }

  function testGetSumOfUintArray() public {
    uint[] memory testArray = new uint[](3);
    testArray[0] = 1;
    testArray[1] = 2;
    testArray[2] = 3;

    uint result = GridHelper.getSumOfUintArray(testArray);

    assertEq(result, 6);

    uint[] memory testArray2 = new uint[](3);
    testArray2[0] = 100;
    testArray2[1] = 255;
    testArray2[2] = 420;

    uint result2 = GridHelper.getSumOfUintArray(testArray2);

    assertEq(result2, 775);
  }

  function testContrainToHex(int value) public {
    vm.assume(value <= 510 && value >= -255);

    uint result = GridHelper.constrainToHex(value);

    bool resultIsHex = result <= 255;

    assertEq(resultIsHex, true);
  }

  function testCreateEqualProbabilityArray() public {
    uint[] memory result = GridHelper.createEqualProbabilityArray(5);

    assertEq(result[0], 51);
    assertEq(result[1], 102);
    assertEq(result[2], 153);
    assertEq(result[3], 204);

    assertEq(result.length, 4);

    uint[] memory result2 = GridHelper.createEqualProbabilityArray(2);

    assertEq(result2[0], 128);

    assertEq(result2.length, 1);
  }

  function testGetSingleObject() public {
    string memory testString = "000010000200003001230045600789";

    uint result = GridHelper.getSingleObject(testString, 150, 6, 5);

    assertEq(result, 123);
  }
}