// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";
import "./ColourConverter.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library Environment {
  uint internal constant TOTAL_COLOURS = 7;

  // string internal constant ALTAR_LW_COLOURS = "D5918EC0595648484C2E2E30";
  // string internal constant ALTAR_RW_COLOURS = "C05956B947432E2E30202023";
  // string internal constant ALTAR_FLOOR_COLOURS = "EAC8C7C05956FF3246202023";
  string internal constant ALTAR_SHELL_COLOURS = "D5918EC0595648484C2E2E30C05956B947432E2E30202023EAC8C7C05956FF3246202023";

  string internal constant TEST_ALTAR_COLOURS = "D5918E4C231F48484C2E2E30C059564C231F2E2E30202023EAC8C74C231FFF3246202023";

  // string internal constant LAB_LW_COLOURS = "DFEFE9BFDFD3EAF9F691D8C4";
  // string internal constant LAB_RW_COLOURS = "BFDFD35EB090C5F7F966DDDD";
  // string internal constant LAB_FLOOR_COLOURS = "BFDFD3C059568AFFD55BC5B2";
  string internal constant LAB_SHELL_COLOURS = "DFEFE9BFDFD3EAF9F691D8C4BFDFD35EB090C5F7F966DDDDBFDFD3C059568AFFD55BC5B2";

  string internal constant TEST_LAB_COLOURS = "DFEFE94EA885EAF9F666DDDDDFEFE95EB090DBFCFC78E4EFDFEFE98EC8B178E4EF2B3977";

  // int[] internal executiveColourPercentages = [60, 80, 80, 100, 30, 80];
  // int[] internal labColourPercentages = [40, 20, 20, 0, 70, 20]; // CHANGE THIS

  // LW, RW, FLOOR
  string internal constant EXECUTIVE_COLOUR_PERCENTAGES = "040020015000070000";
  string internal constant LAB_COLOUR_PERCENTAGES = "040020020000070020"; // CHANGE THIS

  // int[] internal altarDegradedHsl = [2, 47, 49, 41, 100, 65];
  // string internal constant ALTAR_DEGRADED_HSL = "002047049019058048";
  string internal constant ALTAR_DEGRADED_HSL = "002047049019058048120001061120001035120001015";
  string internal constant ALTAR_COLOURS_HSL = "041100050022100050354100060354058048240004013240003029271042044"; // 7 colours, 3*3 values each
  // int[] internal labDegradedHsl = [2, 47, 49, 41, 100, 65];
  string internal constant LAB_DEGRADED_HSL = "002047049041100065"; // CHANGE THIS
  string internal constant LAB_COLOURS_HSL = "041100050022100050354100060354058048240004013240003029271042044"; // CHANGE THIS

  // 0 = degraded, 1 = basic, 2 = embellished
  function getState(bytes memory digits) public pure returns (uint) {
    uint stateDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 20, 2));
    // return stateDigits % 3;
    return 0;
  }

  function getShellPercentages(bytes memory digits) public pure returns (int[2] memory) {
    int percentageOne = int(GridHelper.bytesToUint(GridHelper.slice(digits, 22, 2)));
    int percentageTwo = int(GridHelper.bytesToUint(GridHelper.slice(digits, 24, 2)));
    return [percentageOne, percentageTwo];
  }

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
    int[] memory colourArray = new int[](18); // 6 colours, 3 values each

    if (state == 0) { // degraded
      colourArray = getDegradedShell(colourArray, machine, digits);
    } else { // basic or embellished
      colourArray = getBasicEmbelishedShell(colourArray, machine, digits, state);
    }
    return colourArray;
  }

  function getDegradedShell(int[] memory colourArray, string memory machine, bytes memory digits) internal pure returns (int[] memory) {
    int[] memory singleColour = new int[](3); // h, s, l
    int[] memory colourPercentages = GridHelper.setIntArrayFromString(EXECUTIVE_COLOUR_PERCENTAGES, 6, 3);

    uint randomColourDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 16, 2));

    if (keccak256(bytes(machine)) == keccak256(bytes("altar"))) { // executive
      for (uint i = 0; i < 3; i++) {
        singleColour[i] = int(GridHelper.stringToUint(string(GridHelper.slice(bytes(ALTAR_DEGRADED_HSL), (randomColourDigits%5)*9 + 3*i, 3)))); // 9 = h,s,l to 3 significant digits
      }
      colourPercentages = GridHelper.setIntArrayFromString(EXECUTIVE_COLOUR_PERCENTAGES, 6, 3);

    } else if (keccak256(bytes(machine)) == keccak256(bytes("lab"))) { // lab
      for (uint i = 0; i < 3; i++) {
        singleColour[i] = int(GridHelper.stringToUint(string(GridHelper.slice(bytes(LAB_DEGRADED_HSL), (randomColourDigits%2)*9 + 3*i, 3)))); // 9 = h,s,l to 3 significant digits
      }
      colourPercentages = GridHelper.setIntArrayFromString(LAB_COLOUR_PERCENTAGES, 6, 3);
    }
    
    for (uint i = 0; i < 6; ++i) {
      colourArray[i*3] = singleColour[0];
      colourArray[i*3+1] = singleColour[1];
      colourArray[i*3+2] = ColourConverter.increaseColourLightness(singleColour[2], colourPercentages[i]);
    }

    return colourArray;
  }

  function getBasicEmbelishedShell(int[] memory colourArray, string memory machine, bytes memory digits, uint state) internal pure returns (int[] memory) {
    uint NumColoursDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 16, 8));
    uint numColours = (NumColoursDigits % 3) + ((state-1) * 3) + 1; // basic = 1, 2, 3; embellished = 4, 5, 6

    int[] memory coloursAvailable = GridHelper.setIntArrayFromString(LAB_COLOURS_HSL, TOTAL_COLOURS*3, 3);
    if (keccak256(bytes(machine)) == keccak256(bytes("altar"))) { // executive
      coloursAvailable = GridHelper.setIntArrayFromString(ALTAR_COLOURS_HSL, TOTAL_COLOURS*3, 3);
    } else if (keccak256(bytes(machine)) == keccak256(bytes("lab"))) { // lab
      coloursAvailable = GridHelper.setIntArrayFromString(LAB_COLOURS_HSL, TOTAL_COLOURS*3, 3);
    }

    int[] memory coloursUsed = new int[](numColours*3);

    // Select all colours that will be used
    for (uint i = 0; i < numColours; ++i) {

      uint index = (NumColoursDigits % (TOTAL_COLOURS - i)) * 3;

      for (uint j = 0; j < 3; j++) {
        coloursUsed[i*3+j] = coloursAvailable[index];
        coloursAvailable = GridHelper.shiftToEndIntArray(index, coloursAvailable);
      }

      NumColoursDigits = NumColoursDigits / TOTAL_COLOURS;
    }

    for (uint i = 0; i < 3; ++i) {
      for (uint j = 0; j < 3; ++j) {
        colourArray[2*i*3+j] = coloursUsed[3*(i % numColours) + j];
        colourArray[(2*i+1)*3+j] = coloursUsed[3*(i % numColours) + j];
      }
    }

    return colourArray;
  }

}