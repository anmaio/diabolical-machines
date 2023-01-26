// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";
import "./ColourConverter.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library Environment {
  uint internal constant TOTAL_COLOURS = 5;
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

  // EXECUTIVE
  // Combined without shades
  string internal constant EXECUTIVE_COLOURS_BASIC = "240003029354100060240004013000000069000000069240003029271042044240004013000000069000000069240003029022100050240004013000000069000000069240003029041100050240004013000000069000000069240003029354100060022100050240004013000000069240003029354100060041100050240004013000000069240003029271042044354100060240004013000000069240003029041100050022100050240004013000000069";
  string internal constant EXECUTIVE_COLOURS_EMBELLISHED = "240003029240003029240003029022100050022100050022100050000000069240003029000000069240003029000000069240003029240003029354100060354100060354100060354100060354100060240003029041100050022100050240004013000000069240003029240003029354100060022100050271042044041100050240004013271042044271042044271042044271042044000000069240003029041100050041100050041100050041100050000000069240003029041100050041100050041100050271042044271042044271042044";
  // Combined with shades
  string internal constant EXECUTIVE_COLOURS_BASIC_SHADE = "240004013354079054240024019000000050000000050240004013270042030240024019000000050000000050240004013013091043240024019000000050000000050240004013041100045240024019000000050000000050240004013354079054013091043240024019000000050240004013354079054041100045240024019000000050240004013270042030354079054240024019000000050240004013041100045013091043240024019000000050";
  string internal constant EXECUTIVE_COLOURS_EMBELLISHED_SHADE = "240004013240004013240004013013091043013091043013091043000000050240004013000000050240004013000000050240004013240004013354079054354079054354079054354079054354079054240004013041100045013091043240024019000000050240004013240004013354079054013091043270042030041100045240024019270042030270042030270042030270042030000000050240004013041100045041100045041100045041100045000000050240004013041100045041100045041100045270042030270042030270042030";

  // LAB
  // Combined without shades
  string internal constant LAB_COLOURS_BASIC = "";
  string internal constant LAB_COLOURS_EMBELLISHED = "";
  // Combined with shades
  string internal constant LAB_COLOURS_BASIC_SHADE = "";
  string internal constant LAB_COLOURS_EMBELLISHED_SHADE = "";

  // FACTORY
  // Combined without shades
  string internal constant FACTORY_COLOURS_BASIC = "";
  string internal constant FACTORY_COLOURS_EMBELLISHED = "";
  // Combined with shades
  string internal constant FACTORY_COLOURS_BASIC_SHADE = "";
  string internal constant FACTORY_COLOURS_EMBELLISHED_SHADE = "";

  // MINING
  // Combined without shades
  string internal constant MINING_COLOURS_BASIC = "";
  string internal constant MINING_COLOURS_EMBELLISHED = "";
  // Combined with shades
  string internal constant MINING_COLOURS_BASIC_SHADE = "";
  string internal constant MINING_COLOURS_EMBELLISHED_SHADE = "";

  // LOGISTICS
  // Combined without shades
  string internal constant LOGISTICS_COLOURS_BASIC = "";
  string internal constant LOGISTICS_COLOURS_EMBELLISHED = "";
  // Combined with shades
  string internal constant LOGISTICS_COLOURS_BASIC_SHADE = "";
  string internal constant LOGISTICS_COLOURS_EMBELLISHED_SHADE = "";

  string internal constant BASIC_COLOUR_PERCENTAGES = "4515110210050210";
  string internal constant EMBELLISHED_COLOUR_PERCENTAGES = "4515110210050210";


  // 0 = degraded, 1 = basic, 2 = embellished
  function getState(bytes memory digits) public pure returns (uint) {
    uint stateDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 0, 2));
    if (stateDigits < 20) {
      return 0;
    } else if (stateDigits < 70) {
      return 1;
    } else {
      return 2;
    }
    
    // return 0;
  }

  function increaseColourLightness(uint baseLightness, uint percentage) internal pure returns(uint) {
    return baseLightness + (baseLightness * percentage / 100);
  }

  function decreaseColourLightness(uint baseLightness, uint percentage) internal pure returns(uint) {
    return baseLightness - (baseLightness * percentage / 100);
  }

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

  function getColourIndex(uint percentage, uint state) internal pure returns(uint) {
    uint[] memory percentages = GridHelper.setUintArrayFromString(BASIC_COLOUR_PERCENTAGES, 8, 2);
    if (state == 2) {
      percentages = GridHelper.setUintArrayFromString(EMBELLISHED_COLOUR_PERCENTAGES, 8, 2);
    }
    uint total = 0;
    for (uint i = 0; i < percentages.length; i++) {
      total += percentages[i];
      if (percentage < total) {
        return i;
      }
    }
    return 0;
  }

  function selectBasicPalette(string memory machine, uint percentage, uint state) internal pure returns (string[] memory) {
    string[] memory basicPalette = new string[](2);
    uint[] memory percentages = GridHelper.setUintArrayFromString(BASIC_COLOUR_PERCENTAGES, 8, 2);
    uint index = getColourIndex(percentage, state);

    uint size = TOTAL_COLOURS * 9;

    if (keccak256(bytes(machine)) == keccak256(bytes("altar"))) { // executive
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
    } else if (keccak256(bytes(machine)) == keccak256(bytes("lab"))) { // lab
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(LAB_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(LAB_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(LAB_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(LAB_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
    } else if (keccak256(bytes(machine)) == keccak256(bytes("factory"))) { // factory
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(FACTORY_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(FACTORY_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(FACTORY_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(FACTORY_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
    } else if (keccak256(bytes(machine)) == keccak256(bytes("mining"))) { // mining
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(MINING_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(MINING_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(MINING_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(MINING_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
    } else { // logistics
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(LOGISTICS_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(LOGISTICS_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(LOGISTICS_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(LOGISTICS_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
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

    uint percentage = NumColoursDigits % 100;
    string[] memory colourAvailableStrings = selectBasicPalette(machine, percentage, state);
    uint[] memory coloursAvailable = GridHelper.setUintArrayFromString(colourAvailableStrings[0], TOTAL_COLOURS*3, 3);
    uint[] memory coloursAvailableShade = GridHelper.setUintArrayFromString(colourAvailableStrings[1], TOTAL_COLOURS*3, 3);

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