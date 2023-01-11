// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./GridHelper.sol";
import "./ColourConverter.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library Environment {

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

  // 0 = degraded, 1 = basic, 2 = embellished
  function getState(bytes memory digits) public pure returns (uint) {
    uint stateDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 20, 2));
    // return stateDigits % 3;
    return 2;
  }

  function getShellPercentages(bytes memory digits) public pure returns (int[2] memory) {
    int percentage1 = int(GridHelper.bytesToUint(GridHelper.slice(digits, 22, 2)));
    int percentage2 = int(GridHelper.bytesToUint(GridHelper.slice(digits, 24, 2)));
    return [percentage1, percentage2];
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
    int[2] memory percentages = getShellPercentages(digits);

    int[] memory colourArray = new int[](18); // 6 colours, 3 values each
    string memory colours = "";

    if (keccak256(bytes(machine)) == keccak256(bytes("altar"))) {
      colours = TEST_ALTAR_COLOURS;
    }

    for (uint i = 0; i < 3; i++) {
      string memory colourPart = string(GridHelper.slice(bytes(colours), state*6 + i*24, 12));
      int[] memory colourArrayPart = interpolateBetweenColours(colourPart, percentages, int(state));
      for (uint j = 0; j < 6; j++) {
        colourArray[i*6 + j] = colourArrayPart[j];
      }
    }

    return colourArray;
  }

}