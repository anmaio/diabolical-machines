// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library Environment {
  uint internal constant TOTAL_BASIC_COLOURS = 5;
  uint internal constant TOTAL_EMBELLISHED_COLOURS = 6;
  uint internal constant TOTAL_DEGRADED_COLOURS = 8; // includes grey

  // LW, RW, FLOOR
  string internal constant EXECUTIVE_COLOUR_PERCENTAGES = "040020025000070000";
  string internal constant LAB_COLOUR_PERCENTAGES = "040020025000070000"; // CHANGE THIS
  string internal constant FACTORY_COLOUR_PERCENTAGES = "040020025000070000"; // CHANGE THIS
  string internal constant MINING_COLOUR_PERCENTAGES = "040020025000070000"; // CHANGE THIS
  string internal constant LOGISTICS_COLOUR_PERCENTAGES = "040020025000070000"; // CHANGE THIS
  
  // Red, Lightest Gray, Orange, Light Gray, Red, Dark Gray, Orange, Darker Gray
  string internal constant EXECUTIVE_DEGRADED_HSL = "002047049120002088019058048120001061002047049120001035019058048120001015";
  string internal constant LAB_DEGRADED_HSL = "002047049120002088019058048120001061002047049120001035019058048120001015"; // CHANGE THIS
  string internal constant FACTORY_DEGRADED_HSL = "002047049120002088019058048120001061002047049120001035019058048120001015"; // CHANGE THIS
  string internal constant MINING_DEGRADED_HSL = "002047049120002088019058048120001061002047049120001035019058048120001015"; // CHANGE THIS
  string internal constant LOGISTICS_DEGRADED_HSL = "002047049120002088019058048120001061002047049120001035019058048120001015"; // CHANGE THIS

  // EXECUTIVE
  // Combined without shades
  string internal constant EXECUTIVE_COLOURS_BASIC = "240003029354100060240004013000000069000000069240003029271042044240004013000000069000000069240003029022100050240004013000000069000000069240003029041100050240004013000000069000000069240003029354100060022100050240004013000000069240003029354100060041100050240004013000000069240003029271042044354100060240004013000000069240003029041100050022100050240004013000000069";
  string internal constant EXECUTIVE_COLOURS_EMBELLISHED = "240003029240003029240003029022100050022100050022100050000000069240003029000000069240003029000000069240003029240003029354100060354100060354100060354100060354100060240003029041100050022100050240004013000000069240003029240003029354100060022100050271042044041100050240004013271042044271042044271042044271042044000000069240003029041100050041100050041100050041100050000000069240003029041100050041100050041100050271042044271042044271042044";
  // Combined with shades
  string internal constant EXECUTIVE_COLOURS_BASIC_SHADE = "240004013354079054240024019000000050000000050240004013270042030240024019000000050000000050240004013013091043240024019000000050000000050240004013041100045240024019000000050000000050240004013354079054013091043240024019000000050240004013354079054041100045240024019000000050240004013270042030354079054240024019000000050240004013041100045013091043240024019000000050";
  string internal constant EXECUTIVE_COLOURS_EMBELLISHED_SHADE = "240004013240004013240004013013091043013091043013091043000000050240004013000000050240004013000000050240004013240004013354079054354079054354079054354079054354079054240004013041100045013091043240024019000000050240004013240004013354079054013091043270042030041100045240024019270042030270042030270042030270042030000000050240004013041100045041100045041100045041100045000000050240004013041100045041100045041100045270042030270042030270042030";

  // LAB
  // Combined without shades
  string internal constant LAB_COLOURS_BASIC = "240003029354100060240004013000000069000000069240003029271042044240004013000000069000000069240003029022100050240004013000000069000000069240003029041100050240004013000000069000000069240003029354100060022100050240004013000000069240003029354100060041100050240004013000000069240003029271042044354100060240004013000000069240003029041100050022100050240004013000000069";
  string internal constant LAB_COLOURS_EMBELLISHED = "240003029240003029240003029022100050022100050022100050000000069240003029000000069240003029000000069240003029240003029354100060354100060354100060354100060354100060240003029041100050022100050240004013000000069240003029240003029354100060022100050271042044041100050240004013271042044271042044271042044271042044000000069240003029041100050041100050041100050041100050000000069240003029041100050041100050041100050271042044271042044271042044";
  // Combined with shades
  string internal constant LAB_COLOURS_BASIC_SHADE = "240004013354079054240024019000000050000000050240004013270042030240024019000000050000000050240004013013091043240024019000000050000000050240004013041100045240024019000000050000000050240004013354079054013091043240024019000000050240004013354079054041100045240024019000000050240004013270042030354079054240024019000000050240004013041100045013091043240024019000000050";
  string internal constant LAB_COLOURS_EMBELLISHED_SHADE = "240004013240004013240004013013091043013091043013091043000000050240004013000000050240004013000000050240004013240004013354079054354079054354079054354079054354079054240004013041100045013091043240024019000000050240004013240004013354079054013091043270042030041100045240024019270042030270042030270042030270042030000000050240004013041100045041100045041100045041100045000000050240004013041100045041100045041100045270042030270042030270042030";

  // FACTORY
  // Combined without shades
  string internal constant FACTORY_COLOURS_BASIC = "240003029354100060240004013000000069000000069240003029271042044240004013000000069000000069240003029022100050240004013000000069000000069240003029041100050240004013000000069000000069240003029354100060022100050240004013000000069240003029354100060041100050240004013000000069240003029271042044354100060240004013000000069240003029041100050022100050240004013000000069";
  string internal constant FACTORY_COLOURS_EMBELLISHED = "240003029240003029240003029022100050022100050022100050000000069240003029000000069240003029000000069240003029240003029354100060354100060354100060354100060354100060240003029041100050022100050240004013000000069240003029240003029354100060022100050271042044041100050240004013271042044271042044271042044271042044000000069240003029041100050041100050041100050041100050000000069240003029041100050041100050041100050271042044271042044271042044";
  // Combined with shades
  string internal constant FACTORY_COLOURS_BASIC_SHADE = "240004013354079054240024019000000050000000050240004013270042030240024019000000050000000050240004013013091043240024019000000050000000050240004013041100045240024019000000050000000050240004013354079054013091043240024019000000050240004013354079054041100045240024019000000050240004013270042030354079054240024019000000050240004013041100045013091043240024019000000050";
  string internal constant FACTORY_COLOURS_EMBELLISHED_SHADE = "240004013240004013240004013013091043013091043013091043000000050240004013000000050240004013000000050240004013240004013354079054354079054354079054354079054354079054240004013041100045013091043240024019000000050240004013240004013354079054013091043270042030041100045240024019270042030270042030270042030270042030000000050240004013041100045041100045041100045041100045000000050240004013041100045041100045041100045270042030270042030270042030";

  // MINING
  // Combined without shades
  string internal constant MINING_COLOURS_BASIC = "197013032200021020211019040040091062202025085197013032200021020211019040237074068202025085197013032200021020211019040150053055202025085197013032200021020211019040211019040202025085197013032200021020040091062237074068202025085197013032200021020237074068150053055202025085197013032200021020150053055211019040202025085197013032200021020211019040237074068202025085";
  string internal constant MINING_COLOURS_EMBELLISHED = "197013032200021020150053055150053055150053055150053055197013032200021020237074068237074068237074068237074068237074068237074068237074068237074068237074068237074068150053055150053055150053055150053055150053055150053055197013032200021020040091062237074068202025085202025085197013032200021020237074068150053055202025085202025085127037024140047042178042055167069064178092070127037024150053055040091062040091062040091062040091062040091062";
  // Combined with shades
  string internal constant MINING_COLOURS_BASIC_SHADE = "200021020196019012200021020040091044204035078200021020196019012200021020232035045204035078200021020196019012200021020150053036204035078200021020196019012200021020200021020204035078200021020196019012040091044232035045204035078200021020196019012232035045150053036204035078200021020196019012150053036200021020204035078200021020196019012200021020232035045204035078";
  string internal constant MINING_COLOURS_EMBELLISHED_SHADE = "200021020196019012150053036150053036150053036150053036200021020196019012232035045232035045232035045232035045232035045232035045232035045232035045232035045232035045150053036150053036150053036150053036150053036150053036200021020196019012040091044232035045204035078204035078200021020196019012232035045150053036204035078204035078127080090140080090178080090167080090178080090127080090150053036040091044040091044040091044040091044040091044";

  // LOGISTICS
  // Combined without shades
  string internal constant LOGISTICS_COLOURS_BASIC = "240003029354100060240004013000000069000000069240003029271042044240004013000000069000000069240003029022100050240004013000000069000000069240003029041100050240004013000000069000000069240003029354100060022100050240004013000000069240003029354100060041100050240004013000000069240003029271042044354100060240004013000000069240003029041100050022100050240004013000000069";
  string internal constant LOGISTICS_COLOURS_EMBELLISHED = "240003029240003029240003029022100050022100050022100050000000069240003029000000069240003029000000069240003029240003029354100060354100060354100060354100060354100060240003029041100050022100050240004013000000069240003029240003029354100060022100050271042044041100050240004013271042044271042044271042044271042044000000069240003029041100050041100050041100050041100050000000069240003029041100050041100050041100050271042044271042044271042044";
  // Combined with shades
  string internal constant LOGISTICS_COLOURS_BASIC_SHADE = "240004013354079054240024019000000050000000050240004013270042030240024019000000050000000050240004013013091043240024019000000050000000050240004013041100045240024019000000050000000050240004013354079054013091043240024019000000050240004013354079054041100045240024019000000050240004013270042030354079054240024019000000050240004013041100045013091043240024019000000050";
  string internal constant LOGISTICS_COLOURS_EMBELLISHED_SHADE = "240004013240004013240004013013091043013091043013091043000000050240004013000000050240004013000000050240004013240004013354079054354079054354079054354079054354079054240004013041100045013091043240024019000000050240004013240004013354079054013091043270042030041100045240024019270042030270042030270042030270042030000000050240004013041100045041100045041100045041100045000000050240004013041100045041100045041100045270042030270042030270042030";

  string internal constant DEGRADED_COLOUR_PERCENTAGES = "2520151510080502";
  string internal constant BASIC_COLOUR_PERCENTAGES = "2520151510080502";
  string internal constant EMBELLISHED_COLOUR_PERCENTAGES = "2520151510080502";

  function increaseValueByPercentage(uint baseLightness, uint percentage) internal pure returns(uint) {
    uint value = baseLightness + (baseLightness * percentage / 100);
    if (value > 100) {
      value = 100;
    }
    return value;
  }

  function decreaseValueByPercentage(uint baseLightness, uint percentage) internal pure returns(uint) {
    return baseLightness - (baseLightness * percentage / 100);
  }

  function getColours(string memory machine, uint rand, uint state) external pure returns (uint[] memory) {
    uint[] memory colourArray = new uint[](36); // 6 colours, 3*2 values each

    if (state == 0) { // degraded
      colourArray = getDegradedShell(colourArray, machine, rand);
    } else { // basic or embellished
      colourArray = getBasicEmbelishedShell(colourArray, machine, rand, state);
    }
    return colourArray;
  }

  function getColourIndex(uint rand, uint state) internal pure returns(uint) {
    uint baseValue = GridHelper.getRandByte(rand, 3);
    uint[] memory percentages = GridHelper.setUintArrayFromString(DEGRADED_COLOUR_PERCENTAGES, 8, 2);
    if (state == 1) {
      percentages = GridHelper.setUintArrayFromString(BASIC_COLOUR_PERCENTAGES, 8, 2);
    } else {
      percentages = GridHelper.setUintArrayFromString(EMBELLISHED_COLOUR_PERCENTAGES, 8, 2);
    }
    uint total = 0;
    for (uint i = 0; i < percentages.length; i++) {
      total += percentages[i];
      if (baseValue < total) {
        return i;
      }
    }
    return 0;
  }

  function selectBasicEmbellishedPalette(string memory machine, uint rand, uint state) internal pure returns (string[] memory) {
    string[] memory basicPalette = new string[](2);
    uint index = getColourIndex(rand, state);

    uint size;
    if (state == 1) {
      size = TOTAL_BASIC_COLOURS * 9;
    } else {
      size = TOTAL_EMBELLISHED_COLOURS * 9;
    }

    // could be simplified by storing every colour in a single string but this is more readable and easier to change
    if (keccak256(bytes(machine)) == keccak256(bytes("Altar"))) { // executive
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(EXECUTIVE_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
    } else if (keccak256(bytes(machine)) == keccak256(bytes("Lab"))) { // lab
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(LAB_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(LAB_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(LAB_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(LAB_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
    } else if (keccak256(bytes(machine)) == keccak256(bytes("Factory"))) { // factory
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(FACTORY_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(FACTORY_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(FACTORY_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(FACTORY_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
    } else if (keccak256(bytes(machine)) == keccak256(bytes("Drills")) || keccak256(bytes(machine)) == keccak256(bytes("Noses"))) { // mining
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

  function getDegradedShell(uint[] memory colourArray, string memory machine, uint rand) internal pure returns (uint[] memory) {

    string memory degradedHsl = LOGISTICS_DEGRADED_HSL;
    string memory degradedPercentages = LOGISTICS_COLOUR_PERCENTAGES;

    if (keccak256(bytes(machine)) == keccak256(bytes("Altar"))) { // executive
      degradedHsl = EXECUTIVE_DEGRADED_HSL;
      degradedPercentages = EXECUTIVE_COLOUR_PERCENTAGES;
    } else if (keccak256(bytes(machine)) == keccak256(bytes("Lab"))) { // lab
      degradedHsl = LAB_DEGRADED_HSL;
      degradedPercentages = LAB_COLOUR_PERCENTAGES;
    } else if (keccak256(bytes(machine)) == keccak256(bytes("Factory"))) { // factory
      degradedHsl = FACTORY_DEGRADED_HSL;
      degradedPercentages = FACTORY_COLOUR_PERCENTAGES;
    } else if (keccak256(bytes(machine)) == keccak256(bytes("Drills")) || keccak256(bytes(machine)) == keccak256(bytes("Noses"))) { // mining
      degradedHsl = MINING_DEGRADED_HSL;
      degradedPercentages = MINING_COLOUR_PERCENTAGES;
    }

    uint index = getColourIndex(rand, 0);
    uint[] memory singleColour = new uint[](3); // h, s, l
    for (uint i = 0; i < 3; ++i) {
      singleColour[i] = GridHelper.stringToUint(string(GridHelper.slice(bytes(degradedHsl), (index)*9 + 3*i, 3))); // 9 = h,s,l to 3 significant digits
    }
    uint[] memory colourPercentages = GridHelper.setUintArrayFromString(degradedPercentages, 6, 3);
    
    for (uint i = 0; i < 12; ++i) { // 12 = 6 colours, 2 values each
      colourArray[i*3] = singleColour[0];
      colourArray[i*3+1] = singleColour[1];
      colourArray[i*3+2] = increaseValueByPercentage(singleColour[2], colourPercentages[i%6]);
    }

    return colourArray;
  }

  function getBasicEmbelishedShell(uint[] memory colourArray, string memory machine, uint rand, uint state) internal pure returns (uint[] memory) {
    uint NumColoursDigits = GridHelper.bytesToUint(GridHelper.slice(GridHelper.uintToBytes(rand), 2, 8));
    // uint numColours = (NumColoursDigits % 3) + ((state-1) * 3) + 1; // basic = 1, 2, 3; embellished = 4, 5, 6
    uint numColours;
    if (state == 1) {
      numColours = TOTAL_BASIC_COLOURS;
    } else {
      numColours = TOTAL_EMBELLISHED_COLOURS;
    }

    string[] memory colourAvailableStrings = selectBasicEmbellishedPalette(machine, rand, state);
    uint[] memory coloursAvailable = GridHelper.setUintArrayFromString(colourAvailableStrings[0], numColours*3, 3);
    uint[] memory coloursAvailableShade = GridHelper.setUintArrayFromString(colourAvailableStrings[1], numColours*3, 3);

    uint[] memory baseColoursUsed = new uint[](numColours*3);
    uint[] memory baseColoursUsedShade = new uint[](numColours*3);

    // Select all colours that will be used
    for (uint i = 0; i < numColours; ++i) {

      uint index = (NumColoursDigits % (numColours - i)) * 3;

      for (uint j = 0; j < 3; j++) { // j = h, s, l
        baseColoursUsed[i*3+j] = coloursAvailable[index];
        coloursAvailable = GridHelper.shiftToEndUintArray(index, coloursAvailable);
        baseColoursUsedShade[i*3+j] = coloursAvailableShade[index];
        coloursAvailableShade = GridHelper.shiftToEndUintArray(index, coloursAvailableShade);
      }

      NumColoursDigits = NumColoursDigits / numColours;
    }

    for (uint i = 0; i < 6; ++i) {
      for (uint j = 0; j < 3; ++j) { // j = h, s, l
        // Duplicate colours for linear gradient
        colourArray[2*i*3+j] = baseColoursUsed[3*(i % numColours) + j];
        colourArray[(2*i+1)*3+j] = baseColoursUsedShade[3*(i % numColours) + j];
        // if (j == 0) {
        //   uint value = 315;
        //   colourArray[2*i*3+j] = value;
        //   colourArray[(2*i+1)*3+j] = value;
        // }
      }
    }

    return colourArray;
  }

}