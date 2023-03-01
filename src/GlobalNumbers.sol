// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";

library GlobalNumbers {
  function getGlobalNoiseArray() public pure returns (int256[256] memory) {
    // Linear 1 -> 256
    // int[256] memory globalNoiseArray = [int(1), 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256];
    // Linear -128 -> 127
    // int[256] memory globalNoiseArray = [int(-128), -127, -126, -125, -124, -123, -122, -121, -120, -119, -118, -117, -116, -115, -114, -113, -112, -111, -110, -109, -108, -107, -106, -105, -104, -103, -102, -101, -100, -99, -98, -97, -96, -95, -94, -93, -92, -91, -90, -89, -88, -87, -86, -85, -84, -83, -82, -81, -80, -79, -78, -77, -76, -75, -74, -73, -72, -71, -70, -69, -68, -67, -66, -65, -64, -63, -62, -61, -60, -59, -58, -57, -56, -55, -54, -53, -52, -51, -50, -49, -48, -47, -46, -45, -44, -43, -42, -41, -40, -39, -38, -37, -36, -35, -34, -33, -32, -31, -30, -29, -28, -27, -26, -25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127];
    // Linear -32 -> 31
    // int[256] memory globalNoiseArray = [int(-32), -31, -30, -29, -28, -27, -26, -25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, -32, -31, -30, -29, -28, -27, -26, -25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, -32, -31, -30, -29, -28, -27, -26, -25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, -32, -31, -30, -29, -28, -27, -26, -25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
    // Just 0
    // int[256] memory globalNoiseArray = [int(0), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    // Linear -8 -> 7
    // int[256] memory globalNoiseArray = [int(-8), -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7];
    // Linear -256 -> 254
    // int[256] memory globalNoiseArray = [int(-256), -254, -252, -250, -248, -246, -244, -242, -240, -238, -236, -234, -232, -230, -228, -226, -224, -222, -220, -218, -216, -214, -212, -210, -208, -206, -204, -202, -200, -198, -196, -194, -192, -190, -188, -186, -184, -182, -180, -178, -176, -174, -172, -170, -168, -166, -164, -162, -160, -158, -156, -154, -152, -150, -148, -146, -144, -142, -140, -138, -136, -134, -132, -130, -128, -126, -124, -122, -120, -118, -116, -114, -112, -110, -108, -106, -104, -102, -100, -98, -96, -94, -92, -90, -88, -86, -84, -82, -80, -78, -76, -74, -72, -70, -68, -66, -64, -62, -60, -58, -56, -54, -52, -50, -48, -46, -44, -42, -40, -38, -36, -34, -32, -30, -28, -26, -24, -22, -20, -18, -16, -14, -12, -10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140, 142, 144, 146, 148, 150, 152, 154, 156, 158, 160, 162, 164, 166, 168, 170, 172, 174, 176, 178, 180, 182, 184, 186, 188, 190, 192, 194, 196, 198, 200, 202, 204, 206, 208, 210, 212, 214, 216, 218, 220, 222, 224, 226, 228, 230, 232, 234, 236, 238, 240, 242, 244, 246, 248, 250, 252, 254];
    // Linear -128 -> 124
    int[256] memory globalNoiseArray = [int(-128), -124, -120, -116, -112, -108, -104, -100, -96, -92, -88, -84, -80, -76, -72, -68, -64, -60, -56, -52, -48, -44, -40, -36, -32, -28, -24, -20, -16, -12, -8, -4, 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108, 112, 116, 120, 124, -128, -124, -120, -116, -112, -108, -104, -100, -96, -92, -88, -84, -80, -76, -72, -68, -64, -60, -56, -52, -48, -44, -40, -36, -32, -28, -24, -20, -16, -12, -8, -4, 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108, 112, 116, 120, 124, -128, -124, -120, -116, -112, -108, -104, -100, -96, -92, -88, -84, -80, -76, -72, -68, -64, -60, -56, -52, -48, -44, -40, -36, -32, -28, -24, -20, -16, -12, -8, -4, 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108, 112, 116, 120, 124, -128, -124, -120, -116, -112, -108, -104, -100, -96, -92, -88, -84, -80, -76, -72, -68, -64, -60, -56, -52, -48, -44, -40, -36, -32, -28, -24, -20, -16, -12, -8, -4, 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108, 112, 116, 120, 124];
    return globalNoiseArray;
  }

  uint internal constant FLIPPER_WRAPPER_NUMBER = 19010;
  uint internal constant CHAR_MASK_GROUP_NUMBER = 20006;

  uint internal constant GROUP_CLOSE_NUMBER = 19000;

  string internal constant GLOBAL_ASSET_NUMBERS_LARGE = "60006002600460066008";
  string internal constant GLOBAL_ASSET_NUMBERS_SMALL = "60016003600560076009";

  string internal constant EXPANSION_PROPS_NUMBERS = "20002001200220032004200520062007";

  string internal constant CHARACTER_LEVER_NUMBERS = "30003001300230033016301730183019";

  string internal constant CHARACTER_NUMBERS = "200012000320005200002000220004";

  // Global Asset Probabilities - 5 values
  // State    = D, B, E
  // Lavalamp = 010, 020, 061
  // Cactus   = 064, 076, 140
  // Martini  = 115, 153, 191
  // Bong     = 153, 179, 204
  // Fridge   = 230, 230, 230
  // None     = 256, 256, 256

  string internal constant GLOBAL_ASSET_PROBABILITIES = "010064115153230020076153179230061140191204230";

  // Expansion Props Probabilities - 8 values
  // State    = D,  B,  E
  // Crack    = 051, 038, 026
  // Grate    = 077, 064, 052
  // Pit      = 128, 090, 065
  // Stairs   = 154, 116, 091
  // Ladder   = 167, 154, 142
  // Recess A = 205, 180, 155
  // Recess B = 225, 203, 180
  // Recess C = 230, 230, 230
  // None     = 256, 256, 256

  string internal constant EXPANSION_PROPS_PROBABILITIES = "051077128154167205225230038064090116154180203230026052065091142155180230";

  // Character Lever Probabilities - 8 values
  // State             = D,   B,   E
  // LEVER D           = 051, 038, 008
  // LEVER C           = 128, 076, 021
  // LEVER B           = 166, 127, 047
  // LEVER A           = 204, 153, 052
  // DETAILED LEVER D  = 212, 179, 103
  // DETAILED LEVER C  = 225, 217, 180
  // DETAILED LEVER B  = 251, 243, 218
  // DETAILED LEVER A  = 256, 256, 256

  string internal constant CHARACTER_LEVER_PROBABILITIES = "051128166204212225251256038076127153179217243256008021047052103180218256";

  // Character Probabilities - 6 values
  // State      = D,   B,   E
  // SITTING    = 077, 038, 038
  // COLLAPSED  = 128, 076, 102
  // MEDITATING = 141, 102, 166
  // STANDING   = 167, 179, 204
  // SLOUCHED   = 218, 218, 230
  // HUNCHED    = 256, 256, 256

  string internal constant CHARACTER_PROBABILITIES = "077128141167218256038076102179218256038102166204230256";

  /**
    * @dev Returns the global asset number based on the digits and state
    * @param rand The digits to use
    * @param state The state to use
    * @param version The version of the asset big/small
    * @return The global asset number
   */

  function getGlobalAssetNumber(uint rand, uint state, uint version, int baseline) external pure returns (uint) {
    uint[] memory globalAssetNumbersArray = GridHelper.setUintArrayFromString(GLOBAL_ASSET_NUMBERS_LARGE, 5, 4);
    if (version == 1) {
      globalAssetNumbersArray = GridHelper.setUintArrayFromString(GLOBAL_ASSET_NUMBERS_SMALL, 5, 4);
    }
    uint[] memory globalAssetProbabilitiesArray = GridHelper.setUintArrayFromString(GLOBAL_ASSET_PROBABILITIES, 15, 3);
    uint globalAssetDigits = GridHelper.getRandByte(rand, 20);
    globalAssetDigits = GridHelper.constrainToHex(getGlobalNoiseArray()[globalAssetDigits] + baseline);

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
    * @param rand The digits to use
    * @param state The state to use
    * @return The expansion prop number
   */

  function getExpansionPropsNumber(uint rand, uint state, int baseline) external pure returns (uint) {
    uint[] memory expansionPropsNumbersArray = GridHelper.setUintArrayFromString(EXPANSION_PROPS_NUMBERS, 8, 4);
    uint[] memory expansionPropsProbabilitiesArray = GridHelper.setUintArrayFromString(EXPANSION_PROPS_PROBABILITIES, 24, 3);
    uint expansionPropsDigits = GridHelper.getRandByte(rand, 22);
    expansionPropsDigits = GridHelper.constrainToHex(getGlobalNoiseArray()[expansionPropsDigits] + baseline);

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
    * @param rand The digits to use
    * @param state The state to use
    * @return The character lever number
   */

  function getCharacterLeverNumber(uint rand, uint state, int baseline) internal pure returns (uint) {
    uint[] memory characterLeverNumbersArray = GridHelper.setUintArrayFromString(CHARACTER_LEVER_NUMBERS, 8, 4);
    uint[] memory characterLeverProbabilitiesArray = GridHelper.setUintArrayFromString(CHARACTER_LEVER_PROBABILITIES, 24, 3);
    uint characterLeverDigits = GridHelper.getRandByte(rand, 30);
    characterLeverDigits = GridHelper.constrainToHex(getGlobalNoiseArray()[characterLeverDigits] + baseline);

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
    * @param rand The digits to use
    * @param state The state to use
    * @return The character number
   */

  function getCharacterNumber(uint rand, uint state, int baseline) internal pure returns (uint) {
    uint[] memory characterNumbersArray = GridHelper.setUintArrayFromString(CHARACTER_NUMBERS, 6, 5);
    uint[] memory characterProbabilitiesArray = GridHelper.setUintArrayFromString(CHARACTER_PROBABILITIES, 18, 3);
    uint characterDigits = GridHelper.getRandByte(rand, 31);
    characterDigits = GridHelper.constrainToHex(getGlobalNoiseArray()[characterDigits] + baseline);

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

  /**
    * @dev Returns the character number and lever number based on the digits and state
    * @param rand The digits to use
    * @param state The state to use
    * @param flip Whether to flip the character
    * @return The character number and lever numbers
   */
  function getCharacterNumberAndLeverNumber(uint rand, uint state, bool flip, int baseline) external pure returns (uint[5] memory) {
    uint characterNumber = getCharacterNumber(rand, state, baseline);
    uint characterLeverNumber = getCharacterLeverNumber(rand, state, baseline);
    uint armMask = 0;
    if (characterNumber == 20001 || characterNumber == 20003 || characterNumber == 20005) {
      armMask = CHAR_MASK_GROUP_NUMBER;
    }

    uint flipOpen = 0;
    uint flipClose = 0;
    if (flip) {
      flipOpen = FLIPPER_WRAPPER_NUMBER;
      flipClose = GROUP_CLOSE_NUMBER;
    }

    return [flipOpen, armMask, characterLeverNumber, characterNumber, flipClose];
  }
}