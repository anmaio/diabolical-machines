// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";

library GlobalNumbers {
  uint internal constant FLIPPER_WRAPPER_NUMBER = 19010;
  uint internal constant CHAR_MASK_GROUP_NUMBER = 20006;

  uint internal constant GROUP_CLOSE_NUMBER = 19000;

  string internal constant GLOBAL_ASSET_NUMBERS_LARGE = "60006002600460066008";
  string internal constant GLOBAL_ASSET_NUMBERS_SMALL = "60016003600560076009";

  string internal constant EXPANSION_PROPS_NUMBERS = "20002001200220032004200520062007";

  string internal constant CHARACTER_LEVER_NUMBERS = "30003001300230033016301730183019";

  string internal constant CHARACTER_NUMBERS = "200012000320005200002000220004";

  // probability of each column should add up to 90 for global assets and expansion props

  // Global Asset Probabilities - 5 values
  // State    = D, B, E
  // Lavalamp = 4,  8,  24
  // Cactus   = 21, 22, 31
  // Martini  = 20, 30, 20
  // Bong     = 15, 10, 5
  // Fridge   = 30, 20, 10

  string internal constant GLOBAL_ASSET_PROBABILITIES = "042120153008223010202431200510";

  // Expansion Props Probabilities - 8 values
  // State    = D,  B,  E
  // Crack    = 20, 15, 10
  // Grate    = 10, 10, 10
  // Pit      = 20, 10, 5
  // Stairs   = 10, 10, 10
  // Ladder   = 5,  15, 20
  // Recess A = 15, 10, 5
  // Recess B = 8,  9,  10
  // Recess C = 2,  11, 20

  string internal constant EXPANSION_PROPS_PROBABILITIES = "201020100515080215101010151009111010051020051020";

  // Character Lever Probabilities - 8 values
  // State             = D,  B,  E
  // LEVER A           = 15, 10, 2
  // LEVER B           = 15, 20, 10
  // LEVER C           = 30, 15, 5
  // LEVER D           = 20, 15, 3
  // DETAILED LEVER A  = 2,  5,  15
  // DETAILED LEVER B  = 10, 10, 15
  // DETAILED LEVER C  = 5,  15, 30
  // DETAILED LEVER D  = 3,  10, 20

  string internal constant CHARACTER_LEVER_PROBABILITIES = "151530200210050310201515051015100210050315153020";

  // Character Probabilities - 6 values
  // State      = D, B, E
  // SITTING    = 30, 15, 15
  // COLLAPSED  = 20, 15, 25
  // MEDITATING = 5,  10, 25
  // STANDING   = 10, 30, 15
  // SLOUCHED   = 20, 15, 10
  // HUNCHED    = 15, 15, 10

  string internal constant CHARACTER_PROBABILITIES = "302005102015151510301515152525151010";

  // Use NatSpec format
  /**
    * @dev Returns the global asset number based on the digits and state
    * @param digits The digits to use
    * @param state The state to use
    * @param version The version of the asset big/small
    * @return The global asset number
   */

  function getGlobalAssetNumber(bytes memory digits, uint state, uint version) external pure returns (uint) {
    uint[] memory globalAssetNumbersArray = GridHelper.setUintArrayFromString(GLOBAL_ASSET_NUMBERS_LARGE, 5, 4);
    if (version == 1) {
      globalAssetNumbersArray = GridHelper.setUintArrayFromString(GLOBAL_ASSET_NUMBERS_SMALL, 5, 4);
    }
    uint[] memory globalAssetProbabilitiesArray = GridHelper.setUintArrayFromString(GLOBAL_ASSET_PROBABILITIES, 15, 2);
    uint globalAssetDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 20, 2));

    uint assetNumber = 0;

    uint sum;
    for (uint i = 0; i < globalAssetNumbersArray.length; i++) {
      if (globalAssetDigits < globalAssetProbabilitiesArray[state*5+i] + sum) {
        assetNumber = globalAssetNumbersArray[i];
        break;
      }
      sum += globalAssetProbabilitiesArray[state*5+i];
    }

    return assetNumber;
  }
  
  /**
    * @dev Returns the expansion prop number based on the digits and state
    * @param digits The digits to use
    * @param state The state to use
    * @return The expansion prop number
   */

  function getExpansionPropsNumber(bytes memory digits, uint state) external pure returns (uint) {
    uint[] memory expansionPropsNumbersArray = GridHelper.setUintArrayFromString(EXPANSION_PROPS_NUMBERS, 8, 4);
    uint[] memory expansionPropsProbabilitiesArray = GridHelper.setUintArrayFromString(EXPANSION_PROPS_PROBABILITIES, 24, 2);
    uint expansionPropsDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 22, 2));

    uint propNumber = 0;

    uint sum;
    for (uint i = 0; i < expansionPropsNumbersArray.length; i++) {
      if (expansionPropsDigits < expansionPropsProbabilitiesArray[state*8+i] + sum) {
        propNumber = expansionPropsNumbersArray[i];
        break;
      }
      sum += expansionPropsProbabilitiesArray[state*8+i];
    }

    return propNumber;
  }

  /**
    * @dev Returns the character lever number based on the digits and state
    * @param digits The digits to use
    * @param state The state to use
    * @return The character lever number
   */

  function getCharacterLeverNumber(bytes memory digits, uint state) internal pure returns (uint) {
    uint[] memory characterLeverNumbersArray = GridHelper.setUintArrayFromString(CHARACTER_LEVER_NUMBERS, 8, 4);
    uint[] memory characterLeverProbabilitiesArray = GridHelper.setUintArrayFromString(CHARACTER_LEVER_PROBABILITIES, 24, 2);
    uint characterLeverDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 30, 2));

    uint leverNumber = 0;

    uint sum;
    for (uint i = 0; i < characterLeverNumbersArray.length; i++) {
      sum += characterLeverProbabilitiesArray[state*8+i];
      if (characterLeverDigits < sum) {
        leverNumber = characterLeverNumbersArray[i];
        break;
      }
    }

    return leverNumber;
  }

  /**
    * @dev Returns the character number based on the digits and state
    * @param digits The digits to use
    * @param state The state to use
    * @return The character number
   */

  function getCharacterNumber(bytes memory digits, uint state) internal pure returns (uint) {
    uint[] memory characterNumbersArray = GridHelper.setUintArrayFromString(CHARACTER_NUMBERS, 6, 5);
    uint[] memory characterProbabilitiesArray = GridHelper.setUintArrayFromString(CHARACTER_PROBABILITIES, 18, 2);
    uint characterDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 32, 2));

    uint characterNumber = 0;

    uint sum;
    for (uint i = 0; i < characterNumbersArray.length; i++) {
      sum += characterProbabilitiesArray[state*6+i];
      if (characterDigits < sum) {
        characterNumber = characterNumbersArray[i];
        break;
      }
    }

    return characterNumber;
  }

  function getCharacterNumberAndLeverNumber(bytes memory digits, uint state, bool flip) external pure returns (uint[5] memory) {
    uint characterNumber = getCharacterNumber(digits, state);
    uint characterLeverNumber = getCharacterLeverNumber(digits, state);
    uint armMask;
    if (characterNumber == 20001 || characterNumber == 20003 || characterNumber == 20005) {
      armMask = CHAR_MASK_GROUP_NUMBER;
    }

    uint flipOpen;
    uint flipClose;
    if (flip) {
      flipOpen = FLIPPER_WRAPPER_NUMBER;
      flipClose = GROUP_CLOSE_NUMBER;
    }

    return [flipOpen, armMask, characterLeverNumber, characterNumber, flipClose];
  }
}