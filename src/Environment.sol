// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";
import "./ColourConverter.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library Environment {
  uint internal constant TOTAL_COLOURS = 4;
  uint internal constant TOTAL_DEGRADED_COLOURS = 6; // includes grey

  // LW, RW, FLOOR
  string internal constant EXECUTIVE_COLOUR_PERCENTAGES = "040020025000070000";
  string internal constant LAB_COLOUR_PERCENTAGES = "040020020000070020"; // CHANGE THIS
  string internal constant FACTORY_COLOUR_PERCENTAGES = "040020020000070020"; // CHANGE THIS
  string internal constant MINING_COLOUR_PERCENTAGES = "040020020000070020"; // CHANGE THIS
  string internal constant LOGISTICS_COLOUR_PERCENTAGES = "040020020000070020"; // CHANGE THIS
  
  string internal constant EXECUTIVE_DEGRADED_HSL = "002047049019058048120002088120001061120001035120001015";
  string internal constant LAB_DEGRADED_HSL = "002047049041100065"; // CHANGE THIS
  string internal constant FACTORY_DEGRADED_HSL = "002047049041100065"; // CHANGE THIS
  string internal constant MINING_DEGRADED_HSL = "002047049041100065"; // CHANGE THIS
  string internal constant LOGISTICS_DEGRADED_HSL = "002047049041100065"; // CHANGE THIS

  // string internal constant EXECUTIVE_COLOURS_HSL = "354100060022100050041100050240004013000000069240003029271042044"; // 6 colours, 3*3 values each
  // string internal constant LAB_COLOURS_HSL = "354100060022100050041100050240004013000000069240003029271042044"; // CHANGE THIS
  // string internal constant FACTORY_COLOURS_HSL = "354100060022100050041100050240004013000000069240003029271042044"; // CHANGE THIS
  // string internal constant MINING_COLOURS_HSL = "354100060022100050041100050240004013000000069240003029271042044"; // CHANGE THIS
  // string internal constant LOGISTICS_COLOURS_HSL = "354100060022100050041100050240004013000000069240003029271042044"; // CHANGE THIS

  // string internal constant EXECUTIVE_COLOURS_HSL_SHADE = "354079054013090048041100045240024019000000050240004013270042030"; // 6 colours, 3*3 values each
  // string internal constant LAB_COLOURS_HSL_SHADE = "354079054013090048041100045240024019000000050240004013270042030"; // CHANGE THIS
  // string internal constant FACTORY_COLOURS_HSL_SHADE = "354079054013090048041100045240024019000000050240004013270042030"; // CHANGE THIS
  // string internal constant MINING_COLOURS_HSL_SHADE = "354079054013090048041100045240024019000000050240004013270042030"; // CHANGE THIS
  // string internal constant LOGISTICS_COLOURS_HSL_SHADE = "354079054013090048041100045240024019000000050240004013270042030"; // CHANGE THIS

  // EXECUTIVE
  string internal constant EXECUTIVE_COLOURS_BASIC_ONE = "240003029354100060240004013000000069";
  string internal constant EXECUTIVE_COLOURS_BASIC_ONE_SHADE = "240004013354079054240024019000000050";
  string internal constant EXECUTIVE_COLOURS_BASIC_TWO = "240003029271042044240004013000000069";
  string internal constant EXECUTIVE_COLOURS_BASIC_TWO_SHADE = "240004013270042030240024019000000050";
  string internal constant EXECUTIVE_COLOURS_BASIC_THREE = "240003029022100050240004013000000069";
  string internal constant EXECUTIVE_COLOURS_BASIC_THREE_SHADE = "240004013013091043240024019000000050";
  string internal constant EXECUTIVE_COLOURS_BASIC_FOUR = "240003029041100050240004013000000069";
  string internal constant EXECUTIVE_COLOURS_BASIC_FOUR_SHADE = "240004013041100045240024019000000050";
  // Combined without shades
  string internal constant EXECUTIVE_COLOURS_BASIC = "240003029354100060240004013000000069240003029271042044240004013000000069240003029022100050240004013000000069240003029041100050240004013000000069";
  // Combined with shades
  string internal constant EXECUTIVE_COLOURS_BASIC_SHADE = "240004013354079054240024019000000050240004013270042030240024019000000050240004013013091043240024019000000050240004013041100045240024019000000050";
  
  

  // LAB
  string internal constant LAB_COLOURS_BASIC_ONE = "240003029354100060240004013000000069";
  string internal constant LAB_COLOURS_BASIC_ONE_SHADE = "240004013354079054240024019000000050";
  string internal constant LAB_COLOURS_BASIC_TWO = "";
  string internal constant LAB_COLOURS_BASIC_TWO_SHADE = "";
  string internal constant LAB_COLOURS_BASIC_THREE = "";
  string internal constant LAB_COLOURS_BASIC_THREE_SHADE = "";
  string internal constant LAB_COLOURS_BASIC_FOUR = "";
  string internal constant LAB_COLOURS_BASIC_FOUR_SHADE = "";
  // Combined without shades
  string internal constant LAB_COLOURS_BASIC = "";
  // Combined with shades
  string internal constant LAB_COLOURS_BASIC_SHADE = "";

  // FACTORY
  string internal constant FACTORY_COLOURS_BASIC_ONE = "240003029354100060240004013000000069";
  string internal constant FACTORY_COLOURS_BASIC_ONE_SHADE = "240004013354079054240024019000000050";
  string internal constant FACTORY_COLOURS_BASIC_TWO = "";
  string internal constant FACTORY_COLOURS_BASIC_TWO_SHADE = "";
  string internal constant FACTORY_COLOURS_BASIC_THREE = "";
  string internal constant FACTORY_COLOURS_BASIC_THREE_SHADE = "";
  string internal constant FACTORY_COLOURS_BASIC_FOUR = "";
  string internal constant FACTORY_COLOURS_BASIC_FOUR_SHADE = "";
  // Combined without shades
  string internal constant FACTORY_COLOURS_BASIC = "";
  // Combined with shades
  string internal constant FACTORY_COLOURS_BASIC_SHADE = "";

  // MINING
  string internal constant MINING_COLOURS_BASIC_ONE = "240003029354100060240004013000000069";
  string internal constant MINING_COLOURS_BASIC_ONE_SHADE = "240004013354079054240024019000000050";
  string internal constant MINING_COLOURS_BASIC_TWO = "";
  string internal constant MINING_COLOURS_BASIC_TWO_SHADE = "";
  string internal constant MINING_COLOURS_BASIC_THREE = "";
  string internal constant MINING_COLOURS_BASIC_THREE_SHADE = "";
  string internal constant MINING_COLOURS_BASIC_FOUR = "";
  string internal constant MINING_COLOURS_BASIC_FOUR_SHADE = "";
  // Combined without shades
  string internal constant MINING_COLOURS_BASIC = "";
  // Combined with shades
  string internal constant MINING_COLOURS_BASIC_SHADE = "";

  // LOGISTICS
  string internal constant LOGISTICS_COLOURS_BASIC_ONE = "240003029354100060240004013000000069";
  string internal constant LOGISTICS_COLOURS_BASIC_ONE_SHADE = "240004013354079054240024019000000050";
  string internal constant LOGISTICS_COLOURS_BASIC_TWO = "";
  string internal constant LOGISTICS_COLOURS_BASIC_TWO_SHADE = "";
  string internal constant LOGISTICS_COLOURS_BASIC_THREE = "";
  string internal constant LOGISTICS_COLOURS_BASIC_THREE_SHADE = "";
  string internal constant LOGISTICS_COLOURS_BASIC_FOUR = "";
  string internal constant LOGISTICS_COLOURS_BASIC_FOUR_SHADE = "";
  // Combined without shades
  string internal constant LOGISTICS_COLOURS_BASIC = "";
  // Combined with shades
  string internal constant LOGISTICS_COLOURS_BASIC_SHADE = "";

  string internal constant BASIC_COLOUR_PERCENTAGES = "050005035010";


  // 0 = degraded, 1 = basic, 2 = embellished
  function getState(bytes memory digits) public pure returns (uint) {
    uint stateDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 0, 2));
    // return stateDigits % 3;
    return 2;
  }

  function increaseColourLightness(uint baseLightness, uint percentage) internal pure returns(uint) {
    return baseLightness + (baseLightness * percentage / 100);
  }

  function decreaseColourLightness(uint baseLightness, uint percentage) internal pure returns(uint) {
    return baseLightness - (baseLightness * percentage / 100);
  }

  // // combination of increase and decrease functions
  // function changeColourLightness(int baseLightness, int percentage) internal pure returns(int) {
  //   if (percentage > 0) {
  //     return baseLightness + ((100 - baseLightness) * percentage / 100);
  //   } else {
  //     return baseLightness - (baseLightness * percentage / 100);
  //   }
  // }

  function getColours(string memory machine, bytes memory digits) external pure returns (uint[] memory) {
    uint state = getState(digits);
    uint[] memory colourArray = new uint[](36); // 6 colours, 3*2 values each

    if (state == 0) { // degraded
      colourArray = getDegradedShell(colourArray, machine, digits);
    } else { // basic or embellished
      colourArray = getBasicEmbelishedShell(colourArray, machine, digits, state);
    }
    return colourArray;
  }

  function selectBasicPalette(string memory machine, uint percentage) internal pure returns (string[] memory) {
    string[] memory basicPalette = new string[](2);
    uint[] memory percentages = GridHelper.setUintArrayFromString(BASIC_COLOUR_PERCENTAGES, 4, 3);
    uint index;

    if (percentage < percentages[0]) {
      index = 0;
    } else if (percentage < percentages[0] + percentages[1]) {
      index = 1;
    } else if (percentage < percentages[0] + percentages[1] + percentages[2]) {
      index = 2;
    } else {
      index = 3;
    }

    if (keccak256(bytes(machine)) == keccak256(bytes("altar"))) { // executive
      basicPalette[0] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_BASIC), index * 36, 36));
      basicPalette[1] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_BASIC_SHADE), index * 36, 36));
    } else if (keccak256(bytes(machine)) == keccak256(bytes("lab"))) { // lab
      basicPalette[0] = string(GridHelper.slice(bytes(LAB_COLOURS_BASIC), index * 36, 36));
      basicPalette[1] = string(GridHelper.slice(bytes(LAB_COLOURS_BASIC_SHADE), index * 36, 36));
    } else if (keccak256(bytes(machine)) == keccak256(bytes("factory"))) { // factory
      basicPalette[0] = string(GridHelper.slice(bytes(FACTORY_COLOURS_BASIC), index * 36, 36));
      basicPalette[1] = string(GridHelper.slice(bytes(FACTORY_COLOURS_BASIC_SHADE), index * 36, 36));
    } else if (keccak256(bytes(machine)) == keccak256(bytes("mining"))) { // mining
      basicPalette[0] = string(GridHelper.slice(bytes(MINING_COLOURS_BASIC), index * 36, 36));
      basicPalette[1] = string(GridHelper.slice(bytes(MINING_COLOURS_BASIC_SHADE), index * 36, 36));
    } else { // logistics
      basicPalette[0] = string(GridHelper.slice(bytes(LOGISTICS_COLOURS_BASIC), index * 36, 36));
      basicPalette[1] = string(GridHelper.slice(bytes(LOGISTICS_COLOURS_BASIC_SHADE), index * 36, 36));
    }

    return basicPalette;
  }

  function getDegradedShell(uint[] memory colourArray, string memory machine, bytes memory digits) internal pure returns (uint[] memory) {

    uint randomColourDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 2, 8));

    string memory degradedHsl = LOGISTICS_DEGRADED_HSL;
    string memory degradedPercentages = LOGISTICS_COLOUR_PERCENTAGES;

    if (keccak256(bytes(machine)) == keccak256(bytes("altar"))) { // executive
      degradedHsl = EXECUTIVE_DEGRADED_HSL;
      degradedPercentages = EXECUTIVE_COLOUR_PERCENTAGES;
    } else if (keccak256(bytes(machine)) == keccak256(bytes("lab"))) { // lab
      degradedHsl = LAB_DEGRADED_HSL;
      degradedPercentages = LAB_COLOUR_PERCENTAGES;
    } else if (keccak256(bytes(machine)) == keccak256(bytes("factory"))) { // factory
      degradedHsl = FACTORY_DEGRADED_HSL;
      degradedPercentages = FACTORY_COLOUR_PERCENTAGES;
    } else if (keccak256(bytes(machine)) == keccak256(bytes("mining"))) { // mining
      degradedHsl = MINING_DEGRADED_HSL;
      degradedPercentages = MINING_COLOUR_PERCENTAGES;
    }

    uint[] memory singleColour = new uint[](3); // h, s, l
    for (uint i = 0; i < 3; ++i) {
      singleColour[i] = GridHelper.stringToUint(string(GridHelper.slice(bytes(degradedHsl), (randomColourDigits%TOTAL_DEGRADED_COLOURS)*9 + 3*i, 3))); // 9 = h,s,l to 3 significant digits
    }
    uint[] memory colourPercentages = GridHelper.setUintArrayFromString(degradedPercentages, 6, 3);
    
    for (uint i = 0; i < 12; ++i) { // 12 = 6 colours, 2 values each
      colourArray[i*3] = singleColour[0];
      colourArray[i*3+1] = singleColour[1];
      colourArray[i*3+2] = increaseColourLightness(singleColour[2], colourPercentages[i%6]);
    }

    return colourArray;
  }

  function getBasicEmbelishedShell(uint[] memory colourArray, string memory machine, bytes memory digits, uint state) internal pure returns (uint[] memory) {
    uint NumColoursDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 2, 8));
    // uint numColours = (NumColoursDigits % 3) + ((state-1) * 3) + 1; // basic = 1, 2, 3; embellished = 4, 5, 6
    uint numColours = TOTAL_COLOURS;

    uint[] memory coloursAvailable = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE, TOTAL_COLOURS*3, 3);
    uint[] memory coloursAvailableShade = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE_SHADE, TOTAL_COLOURS*3, 3);
    // if (keccak256(bytes(machine)) == keccak256(bytes("altar"))) { // executive
    //   coloursAvailable = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE, TOTAL_COLOURS*3, 3);
    //   coloursAvailableShade = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE_SHADE, TOTAL_COLOURS*3, 3);
    // } else if (keccak256(bytes(machine)) == keccak256(bytes("lab"))) { // lab
    //   coloursAvailable = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE, TOTAL_COLOURS*3, 3);
    //   coloursAvailableShade = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE_SHADE, TOTAL_COLOURS*3, 3);
    // } else if (keccak256(bytes(machine)) == keccak256(bytes("factory"))) { // factory
    //   coloursAvailable = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE, TOTAL_COLOURS*3, 3);
    //   coloursAvailableShade = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE_SHADE, TOTAL_COLOURS*3, 3);
    // } else if (keccak256(bytes(machine)) == keccak256(bytes("mining"))) { // mining
    //   coloursAvailable = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE, TOTAL_COLOURS*3, 3);
    //   coloursAvailableShade = GridHelper.setUintArrayFromString(EXECUTIVE_COLOURS_BASIC_ONE_SHADE, TOTAL_COLOURS*3, 3);
    // }

    uint percentage = NumColoursDigits % 100;
    string[] memory colourAvailableStrings = selectBasicPalette(machine, percentage);
    coloursAvailable = GridHelper.setUintArrayFromString(colourAvailableStrings[0], TOTAL_COLOURS*3, 3);
    coloursAvailableShade = GridHelper.setUintArrayFromString(colourAvailableStrings[1], TOTAL_COLOURS*3, 3);

    uint[] memory baseColoursUsed = new uint[](numColours*3);
    uint[] memory baseColoursUsedShade = new uint[](numColours*3);

    // Select all colours that will be used
    for (uint i = 0; i < numColours; ++i) {

      uint index = (NumColoursDigits % (TOTAL_COLOURS - i)) * 3;

      for (uint j = 0; j < 3; j++) { // j = h, s, l
        baseColoursUsed[i*3+j] = coloursAvailable[index];
        coloursAvailable = GridHelper.shiftToEndUintArray(index, coloursAvailable);
        baseColoursUsedShade[i*3+j] = coloursAvailableShade[index];
        coloursAvailableShade = GridHelper.shiftToEndUintArray(index, coloursAvailableShade);
      }

      NumColoursDigits = NumColoursDigits / TOTAL_COLOURS;
    }

    for (uint i = 0; i < 6; ++i) {
      for (uint j = 0; j < 3; ++j) { // j = h, s, l
        // Duplicate colours for linear gradient
        colourArray[2*i*3+j] = baseColoursUsed[3*(i % numColours) + j];
        colourArray[(2*i+1)*3+j] = baseColoursUsedShade[3*(i % numColours) + j];
      }
    }

    return colourArray;
  }

}