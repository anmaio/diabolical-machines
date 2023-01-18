// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";
import "./ColourConverter.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library Environment {
  uint internal constant TOTAL_COLOURS = 6;
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

  string internal constant EXECUTIVE_COLOURS_HSL = "041100050022100050354100060240004013240003029271042044"; // 7 colours, 3*3 values each
  string internal constant LAB_COLOURS_HSL = "041100050022100050354100060354058048240004013240003029271042044"; // CHANGE THIS
  string internal constant FACTORY_COLOURS_HSL = "041100050022100050354100060354058048240004013240003029271042044"; // CHANGE THIS
  string internal constant MINING_COLOURS_HSL = "041100050022100050354100060354058048240004013240003029271042044"; // CHANGE THIS
  string internal constant LOGISTICS_COLOURS_HSL = "041100050022100050354100060354058048240004013240003029271042044"; // CHANGE THIS

  // 0 = degraded, 1 = basic, 2 = embellished
  function getState(bytes memory digits) public pure returns (uint) {
    uint stateDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 0, 2));
    // return stateDigits % 3;
    return 0;
  }

  // function getShellPercentages(bytes memory digits) public pure returns (int[2] memory) {
  //   int percentageOne = int(GridHelper.bytesToUint(GridHelper.slice(digits, 22, 2)));
  //   int percentageTwo = int(GridHelper.bytesToUint(GridHelper.slice(digits, 24, 2)));
  //   return [percentageOne, percentageTwo];
  // }

  function interpolateBetweenColours(string memory colours, int[2] memory percentages, int state) public pure returns (int[] memory) {

        // hex to int
        uint[] memory colourIntArray = new uint[](2);
        for (uint i = 0; i < 2; i++) {
            colourIntArray[i] = ColourConverter.hexToUint(string(GridHelper.slice(bytes(colours), i*6, 6)));
        }
        
        // int to rgb to hsl
        int[] memory hslArray = new int[](6);
        for (uint i = 0; i < 2; i++) {
            (hslArray[i*3], hslArray[i*3+1], hslArray[i*3+2]) = ColourConverter.rgbToHsl(ColourConverter.intToRGBRed(colourIntArray[i]), ColourConverter.intToRGBGreen(colourIntArray[i]), ColourConverter.intToRGBBlue(colourIntArray[i]));
        }

        // TODO: interpolate
        int[] memory newHslArray = new int[](6);
        for (uint i = 0; i < 3; i++) {
            (newHslArray[i], newHslArray[i+3]) = ColourConverter.interpolatebetweenTwovalues(hslArray[i], hslArray[i+3], percentages, state);
        }

        // hsl to rgb
        int[] memory newRgbArray = new int[](6);
        for (uint i = 0; i < 2; i++) {
            (newRgbArray[i*3], newRgbArray[i*3+1], newRgbArray[i*3+2]) = ColourConverter.hslToRgb(newHslArray[i*3], newHslArray[i*3+1], newHslArray[i*3+2]);
        }

        return newRgbArray;

    }

  function getShellColours(string memory machine, bytes memory digits) external pure returns (int[] memory) {
    uint state = getState(digits);
    int[] memory colourArray = new int[](36); // 6 colours, 3*2 values each

    if (state == 0) { // degraded
      colourArray = getDegradedShell(colourArray, machine, digits);
    } else { // basic or embellished
      colourArray = getBasicEmbelishedShell(colourArray, machine, digits, state);
    }
    return colourArray;
  }

  function getDegradedShell(int[] memory colourArray, string memory machine, bytes memory digits) internal pure returns (int[] memory) {

    uint randomColourDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 2, 8));

    string memory degradedHsl = "";
    string memory degradedPercentages = "";

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
    } else if (keccak256(bytes(machine)) == keccak256(bytes("logistics"))) { // logistics
      degradedHsl = LOGISTICS_DEGRADED_HSL;
      degradedPercentages = LOGISTICS_COLOUR_PERCENTAGES;
    }

    int[] memory singleColour = new int[](3); // h, s, l
    for (uint i = 0; i < 3; ++i) {
      singleColour[i] = int(GridHelper.stringToUint(string(GridHelper.slice(bytes(degradedHsl), (randomColourDigits%TOTAL_DEGRADED_COLOURS)*9 + 3*i, 3)))); // 9 = h,s,l to 3 significant digits
    }
    int[] memory colourPercentages = GridHelper.setIntArrayFromString(degradedPercentages, 6, 3);
    
    for (uint i = 0; i < 6; ++i) {
      colourArray[i*3] = singleColour[0];
      colourArray[i*3+1] = singleColour[1];
      colourArray[i*3+2] = ColourConverter.increaseColourLightness(singleColour[2], colourPercentages[i]);
    }

    return colourArray;
  }

  function getBasicEmbelishedShell(int[] memory colourArray, string memory machine, bytes memory digits, uint state) internal pure returns (int[] memory) {
    uint NumColoursDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 2, 8));
    uint numColours = (NumColoursDigits % 3) + ((state-1) * 3) + 1; // basic = 1, 2, 3; embellished = 4, 5, 6

    int[] memory coloursAvailable = GridHelper.setIntArrayFromString(LOGISTICS_COLOURS_HSL, TOTAL_COLOURS*3, 3);
    if (keccak256(bytes(machine)) == keccak256(bytes("altar"))) { // executive
      coloursAvailable = GridHelper.setIntArrayFromString(EXECUTIVE_COLOURS_HSL, TOTAL_COLOURS*3, 3);
    } else if (keccak256(bytes(machine)) == keccak256(bytes("lab"))) { // lab
      coloursAvailable = GridHelper.setIntArrayFromString(LAB_COLOURS_HSL, TOTAL_COLOURS*3, 3);
    } else if (keccak256(bytes(machine)) == keccak256(bytes("factory"))) { // factory
      coloursAvailable = GridHelper.setIntArrayFromString(FACTORY_COLOURS_HSL, TOTAL_COLOURS*3, 3);
    } else if (keccak256(bytes(machine)) == keccak256(bytes("mining"))) { // mining
      coloursAvailable = GridHelper.setIntArrayFromString(MINING_COLOURS_HSL, TOTAL_COLOURS*3, 3);
    }

    int[] memory coloursUsed = new int[](numColours*3);

    // Select all colours that will be used
    for (uint i = 0; i < numColours; ++i) {

      uint index = (NumColoursDigits % (TOTAL_COLOURS - i)) * 3;

      for (uint j = 0; j < 3; j++) { // j = h, s, l
        coloursUsed[i*3+j] = coloursAvailable[index];
        coloursAvailable = GridHelper.shiftToEndIntArray(index, coloursAvailable);
      }

      NumColoursDigits = NumColoursDigits / TOTAL_COLOURS;
    }

    for (uint i = 0; i < 6; ++i) {
      for (uint j = 0; j < 3; ++j) { // j = h, s, l
        // Duplicate colours for linear gradient
        colourArray[2*i*3+j] = coloursUsed[3*(i % numColours) + j];
        colourArray[(2*i+1)*3+j] = coloursUsed[3*(i % numColours) + j];
      }
    }

    return colourArray;
  }

}