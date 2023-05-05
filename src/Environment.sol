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

  // Darker Gray, Orange, Dark Gray, Red, Light Gray, Orange, Lightest Gray, Red
  string internal constant EXECUTIVE_DEGRADED_HSL = "120001015019058048120001035002047049120001061019058048120002088002047049";
  string internal constant LAB_DEGRADED_HSL = "120001015019058048120001035002047049120001061019058048120002088002047049"; // CHANGE THIS
  string internal constant FACTORY_DEGRADED_HSL = "120001015019058048120001035002047049120001061019058048120002088002047049"; // CHANGE THIS

  // EXECUTIVE
  // Combined without shades
  string internal constant EXECUTIVE_COLOURS_BASIC = "354100060000000000000100004022100050041100050354100060000000025000000069041100050022100050047100050000000000021081004030100013022100045121082050093090004099074009095085054099075072221082050194089004199074009195085054199075080339082050314089004317074009313085054318075084178078047268083049313088084340087015178090044221081088194090077200075078195086089200084076";
  string internal constant EXECUTIVE_COLOURS_EMBELLISHED = "240003029240003029240003029022100050022100050022100050000000069240003029000000069240003029000000069240003029240003029354100060354100060354100060354100060354100060240003029041100050022100050240004013000000069240003029240003029354100060022100050271042044041100050240004013271042044271042044271042044271042044000000069240003029041100050041100050041100050041100050000000069240003029041100050041100050041100050271042044271042044271042044";
  // Combined with shades
  string internal constant EXECUTIVE_COLOURS_BASIC_SHADE = "000086027000061010000100007013091043041100045354100028000007041000000050041100045013091043047100032022080008022081012030100015022100040104079046096071004080054015095093054095096068204079046196071004180054015195093054195096068322079046316071004299054015313093054313096068358091057053098065101100038059100060354065059204079087196071077180054080195093089195095092";
  string internal constant EXECUTIVE_COLOURS_EMBELLISHED_SHADE = "240004013240004013240004013013091043013091043013091043000000050240004013000000050240004013000000050240004013240004013354079054354079054354079054354079054354079054240004013041100045013091043240024019000000050240004013240004013354079054013091043270042030041100045240024019270042030270042030270042030270042030000000050240004013041100045041100045041100045041100045000000050240004013041100045041100045041100045270042030270042030270042030";

  // LAB
  // Combined without shades
  string internal constant LAB_COLOURS_BASIC = "158100077228081062168056095051093072186079070238100086253081078240060097224062081245080083274079075180055056185053039180095040181066049190054036252070052231095074210049067030060058352033081165032066027028078027033080037031079349090038000000100143014078237045053183099034207099060207099060040090096239066051040077064206095034001066033205090096012082053036084052";
  string internal constant LAB_COLOURS_EMBELLISHED = "158100077228081062168056095051093072182081087168056095158100077228081062168056095051093072182081087168056095158100077228081062168056095051093072182081087168056095158100077228081062168056095051093072182081087168056095158100077228081062168056095051093072182081087168056095158100077228081062168056095051093072182081087168056095158100077228081062168056095051093072182081087168056095158100077228081062168056095051093072182081087168056095";
  // Combined with shades
  string internal constant LAB_COLOURS_BASIC_SHADE = "169048056229047032182081087051090084086079052241047074252047060242083093224058089244079072274017053184045075181085042180059062181062052184021040251073027251085079211053076030060044004029080164031070021030079022034081023028075349090038183100080143014068237045048183099028239066051207099060041090092238072019040077048206094028001066028205090088012082048036084044";
  string internal constant LAB_COLOURS_EMBELLISHED_SHADE = "169048056229047032182081087051090084180064063182081087169048056229047032182081087051090084180064063182081087169048056229047032182081087051090084180064063182081087169048056229047032182081087051090084180064063182081087169048056229047032182081087051090084180064063182081087169048056229047032182081087051090084180064063182081087169048056229047032182081087051090084180064063182081087169048056229047032182081087051090084180064063182081087";

  // FACTORY
  // Combined without shades
  string internal constant FACTORY_COLOURS_BASIC = "249069060196085079231032035300085082000000085300085082196085079231032035300085082000000085300085082196085079231032035300085082000000085266083081162085079197031035266083081000000085033098060196085068231032035300085082000000085280094041340086057280084075340084055340087027205069060152085079186031035256083081000000085249069060033098060196085079231032035000000085";
  string internal constant FACTORY_COLOURS_EMBELLISHED = "000069060000097059000085079000031035000000085000000000175097059338084068013031035082083081000000085000000000359096064195100049044100050000098043347096027000000000150053055150053055150053055150053055150053055150053055197013032200021020040091062237074068202025085202025085197013032200021020237074068150053055202025085202025085127037024140047042178042055167069064178092070127037024150053055040091062040091062040091062040091062040091062";
  // Combined with shades
  string internal constant FACTORY_COLOURS_BASIC_SHADE = "243039046193083063229034024033098060000000052321076067193083063229034024033098060000000052033098060193083063229034024300085072000000052359097059159084063195034025266086072000000052033098044193083052229034024300085072000000052160073059280078043280077074340097062160071039199039046149084063184034025349097059000000052243039046300085082193083063229034024000000052";
  string internal constant FACTORY_COLOURS_EMBELLISHED_SHADE = "000039046000083081000084063000034025000000052000000000175098044335084052011034025082086072000000052000000000359087049179050048034077052015082060328088037000000000150053036150053036150053036150053036150053036150053036200021020196019012040091044232035045204035078204035078200021020196019012232035045150053036204035078204035078127080090140080090178080090167080090178080090127080090150053036040091044040091044040091044040091044040091044";

  string internal constant DEGRADED_COLOUR_PERCENTAGES = "064115153191217237251256";
  string internal constant BASIC_COLOUR_PERCENTAGES = "064115153191217237251256";
  string internal constant EMBELLISHED_COLOUR_PERCENTAGES = "064115153191217237251256";

  function increaseValueByPercentage(uint baseLightness, uint percentage) internal pure returns(uint) {
    uint value = baseLightness + (baseLightness * percentage / 100);
    if (value > 100) {
      value = 100;
    }
    return value;
  }

  function decreaseValueByPercentage(uint baseLightness, uint percentage) internal pure returns (uint) {
    return baseLightness - (baseLightness * percentage / 100);
  }

  function getColours(string memory machine, uint baseValue) external pure returns (uint[] memory) {
    uint[] memory colourArray = new uint[](36); // 6 colours, 3*2 values each

    uint colourIndex = getColourIndex(baseValue);

    if (colourIndex < 8) { // degraded
      colourArray = getDegradedShell(colourArray, machine, baseValue);
    } else { // basic or embellished
      colourArray = getBasicEmbelishedShell(colourArray, machine, baseValue);
    }
    return colourArray;
  }

  function getColourIndex(uint baseValue) internal pure returns(uint) {
    uint[] memory colourProbabilitiesArray = GridHelper.createEqualProbabilityArray(24);

    uint index = 100;
    for (uint i = 0; i < colourProbabilitiesArray.length; ++i) {
      if (baseValue < colourProbabilitiesArray[i]) {
        index = i;
        break;
      }
    }
    if (index == 100) {
      index = 23;
    }

    return index;
  }

  function selectBasicEmbellishedPalette(string memory machine, uint baseValue) internal pure returns (string[] memory) {
    string[] memory basicPalette = new string[](2);
    uint index = getColourIndex(baseValue);

    uint state = 2;
    if (index < 16) {
      state = 1;
    }

    index = index % 8;

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
    } else if (keccak256(bytes(machine)) == keccak256(bytes("Apparatus")) || keccak256(bytes(machine)) == keccak256(bytes("Cells"))) { // lab
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(LAB_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(LAB_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(LAB_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(LAB_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
    } else { // factory
      if (state == 1) {
        basicPalette[0] = string(GridHelper.slice(bytes(FACTORY_COLOURS_BASIC), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(FACTORY_COLOURS_BASIC_SHADE), index * size, size));
      } else {
        basicPalette[0] = string(GridHelper.slice(bytes(FACTORY_COLOURS_EMBELLISHED), index * size, size));
        basicPalette[1] = string(GridHelper.slice(bytes(FACTORY_COLOURS_EMBELLISHED_SHADE), index * size, size));
      }
    }

    return basicPalette;
  }

  function getDegradedShell(uint[] memory colourArray, string memory machine, uint baseValue) internal pure returns (uint[] memory) {

    string memory degradedHsl;
    string memory degradedPercentages;

    if (keccak256(bytes(machine)) == keccak256(bytes("Altar"))) { // executive
      degradedHsl = EXECUTIVE_DEGRADED_HSL;
      degradedPercentages = EXECUTIVE_COLOUR_PERCENTAGES;
    } else if (keccak256(bytes(machine)) == keccak256(bytes("Apparatus")) || keccak256(bytes(machine)) == keccak256(bytes("Cells"))) { // lab
      degradedHsl = LAB_DEGRADED_HSL;
      degradedPercentages = LAB_COLOUR_PERCENTAGES;
    } else { // factory
      degradedHsl = FACTORY_DEGRADED_HSL;
      degradedPercentages = FACTORY_COLOUR_PERCENTAGES;
    }

    uint index = getColourIndex(baseValue);
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

  function getBasicEmbelishedShell(uint[] memory colourArray, string memory machine, uint baseValue) internal pure returns (uint[] memory) {

    uint index = getColourIndex(baseValue);

    uint state = 2;
    if (index < 16) {
      state = 1;
    }

    uint numColours;
    if (state == 1) {
      numColours = TOTAL_BASIC_COLOURS;
    } else {
      numColours = TOTAL_EMBELLISHED_COLOURS;
    }

    string[] memory colourAvailableStrings = selectBasicEmbellishedPalette(machine, baseValue);
    uint[] memory coloursAvailable = GridHelper.setUintArrayFromString(colourAvailableStrings[0], numColours*3, 3);
    uint[] memory coloursAvailableShade = GridHelper.setUintArrayFromString(colourAvailableStrings[1], numColours*3, 3);

    for (uint i = 0; i < 6; ++i) {
      for (uint j = 0; j < 3; ++j) { // j = h, s, l
        // Duplicate colours for linear gradient
        colourArray[2*i*3+j] = coloursAvailable[3*(i % numColours) + j];
        colourArray[(2*i+1)*3+j] = coloursAvailableShade[3*(i % numColours) + j];
      }
    }

    return colourArray;
  }

}