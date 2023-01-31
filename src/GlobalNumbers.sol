// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";

library GlobalNumbers {
  string internal constant GLOBAL_ASSET_NUMBERS_LARGE = "60006002600460066008";
  string internal constant GLOBAL_ASSET_NUMBERS_SMALL = "60016003600560076009";

  string internal constant EXPANSION_PROPS_NUMBERS = "20002001200220032004200520062007";

  // probability of each column should add up to 90

  // Global Asset Probabilities - 5 values
  // State = D, B, E
  // Lavalamp = 4, 8, 24
  // Cactus = 21, 22, 31
  // Martini = 20, 30, 20
  // Bong = 15, 10, 5
  // Fridge = 30, 20, 10

  string internal constant GLOBAL_ASSET_PROBABILITIES = "042120153008223010202431200510";

  // Expansion Props Probabilities - 8 values
  // State    = D, B, E
  // Crack    = 20, 15, 10
  // Grate    = 10, 10, 10
  // Pit      = 20, 10, 5
  // Stairs   = 10, 10, 10
  // Ladder   = 5, 15, 20
  // Recess A = 15, 10, 5
  // Recess B = 8, 9, 10
  // Recess C = 2, 11, 20

  string internal constant EXPANSION_PROPS_PROBABILITIES = "201020100515080215101010151009111010051020051020";


  function getGlobalAssetNumber(bytes memory digits, uint state, uint version) external pure returns (uint) {
    uint[] memory globalAssetNumbersArray = GridHelper.setUintArrayFromString(GLOBAL_ASSET_NUMBERS_LARGE, 5, 4);
    if (version == 1) {
      globalAssetNumbersArray = GridHelper.setUintArrayFromString(GLOBAL_ASSET_NUMBERS_SMALL, 5, 4);
    }
    uint[] memory globalAssetProbabilitiesArray = GridHelper.setUintArrayFromString(GLOBAL_ASSET_PROBABILITIES, 15, 2);
    uint globalAssetDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 20, 2));

    uint assetNumber;

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

  function getExpansionPropsNumber(bytes memory digits, uint state) external pure returns (uint) {
    uint[] memory expansionPropsNumbersArray = GridHelper.setUintArrayFromString(EXPANSION_PROPS_NUMBERS, 8, 4);
    uint[] memory expansionPropsProbabilitiesArray = GridHelper.setUintArrayFromString(EXPANSION_PROPS_PROBABILITIES, 24, 2);
    uint expansionPropsDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 22, 2));

    uint propNumber;

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
}