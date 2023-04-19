// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";

import "./Noise.sol";

library GlobalNumbers {

  uint internal constant FLIPPER_WRAPPER_NUMBER = 13010;
  uint internal constant CHAR_MASK_GROUP_NUMBER = 14006;

  uint internal constant GROUP_CLOSE_NUMBER = 13000;

  // Global Asset - 6 values
  // None
  // Martini
  // Cactus
  // Fridge
  // Bong
  // Lavalamp

  string internal constant GLOBAL_ASSET_NUMBERS = "000000600406002060080600606000";

  // Expansion Props - 9 values
  // None
  // Crack
  // Recess A
  // Recess B
  // Recess C
  // Pit
  // Grate
  // Stairs
  // Ladder

  string internal constant EXPANSION_PROPS_NUMBERS = "000000200002005020060200702002020010200302004";

  // Character Lever - 8 values
  // LEVER D
  // LEVER C
  // LEVER B
  // LEVER A
  // DETAILED LEVER D
  // DETAILED LEVER C
  // DETAILED LEVER B
  // DETAILED LEVER A

  string internal constant CHARACTER_LEVER_NUMBERS = "0300003001030020300303016030170301803019";

  // Character - 7 values
  // None
  // COLLAPSED
  // STANDING
  // HUNCHED
  // SLOUCHED
  // SITTING
  // MEDITATING

  string internal constant CHARACTER_NUMBERS = "00000140021400114005140031400014004";

  /**
    * @dev Returns the global asset number based on the digits
    * @param rand The digits to use
    * @return The global asset number
   */

  function getGlobalAssetNumber(uint rand, int baseline) external pure returns (uint) {
    uint globalAssetDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 20)] + baseline);

    return GridHelper.getSingleObject(GLOBAL_ASSET_NUMBERS, globalAssetDigits, 6, 5);
  }
  
  /**
    * @dev Returns the expansion prop number based on the digits
    * @param rand The digits to use
    * @return The expansion prop number
   */

  function getExpansionPropsNumber(uint rand, int baseline) public pure returns (uint) {
    uint expansionPropsDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 22)] + baseline);

    return GridHelper.getSingleObject(EXPANSION_PROPS_NUMBERS, expansionPropsDigits, 9, 5);
  }

  /**
    * @dev Returns the character lever number based on the digits and state
    * @param rand The digits to use
    * @return The character lever number
   */

  function getCharacterLeverNumber(uint rand, int baseline) internal pure returns (uint) {
    uint characterLeverDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 30)] + baseline);

    return GridHelper.getSingleObject(CHARACTER_LEVER_NUMBERS, characterLeverDigits, 8, 5);
  }

  /**
    * @dev Returns the character number based on the digits and state
    * @param rand The digits to use
    * @return The character number
   */

  function getCharacterNumber(uint rand, int baseline) internal pure returns (uint) {
    uint characterDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 31)] + baseline);

    return GridHelper.getSingleObject(CHARACTER_NUMBERS, characterDigits, 7, 5);
  }

  /**
    * @dev Returns the character number and lever number based on the digits and state
    * @param rand The digits to use
    * @param flip Whether to flip the character
    * @return The character number and lever numbers
   */
  function getCharacterNumberAndLeverNumber(uint rand, bool flip, int baseline) external pure returns (uint[5] memory) {
    uint characterNumber = getCharacterNumber(rand, baseline);
    uint characterLeverNumber = getCharacterLeverNumber(rand, baseline);
    uint armMask = 0;
    if (characterNumber == 14001 || characterNumber == 14003 || characterNumber == 14005) {
      armMask = CHAR_MASK_GROUP_NUMBER;
    }

    uint flipOpen = 0;
    uint flipClose = 0;
    if (flip) {
      flipOpen = FLIPPER_WRAPPER_NUMBER;
      flipClose = GROUP_CLOSE_NUMBER;
    }

    return [flipOpen, characterLeverNumber, armMask, characterNumber, flipClose];
  }

  /** 
    * @dev Returns the global asset position based on the digits
    * @param rand The digits to use
    * @param floorOffsets The floor offsets
    * @param numberOfFloorPositions The number of floor positions
    * @return The global asset position
   */
  function getGlobalAssetPosition(uint rand, string memory floorOffsets, uint numberOfFloorPositions) public pure returns (string memory) {

    uint globalAssetDigits = GridHelper.getRandByte(rand, 21);

    string memory assetOffset = string(GridHelper.slice(bytes(floorOffsets), (globalAssetDigits % numberOfFloorPositions)*8, 8));

    return assetOffset;
  }

  /** 
    * @dev Returns the expansion prop position based on the digits
    * @param rand The digits to use
    * @param baseline The baseline number
    * @param floorOffsets The floor offsets
    * @param numberOfFloorPositions The number of floor positions
    * @param wallOffsets The wall offsets
    * @param numberOfWallPositions The number of wall positions
    * @return The expansion prop position
   */
  function getExpansionPropPosition(uint rand, int baseline, string memory floorOffsets, uint numberOfFloorPositions, string memory wallOffsets, uint numberOfWallPositions) external pure returns (string memory) {

    uint expansionPropDigits = GridHelper.getRandByte(rand, 23);
    uint expansionPropsNumber = getExpansionPropsNumber(rand, baseline);
    if (expansionPropsNumber == 2000 || expansionPropsNumber == 2005 || expansionPropsNumber == 2006 || expansionPropsNumber == 2007) {
      return string(GridHelper.slice(bytes(wallOffsets), (expansionPropDigits % numberOfWallPositions)*8, 8));
    } else {
      // Need to check that the position is not already taken by the global asset
      string memory globalAssetOffset = getGlobalAssetPosition(rand, floorOffsets, numberOfFloorPositions);
      string memory expansionPropOffset = string(GridHelper.slice(bytes(floorOffsets), (expansionPropDigits % numberOfFloorPositions)*8, 8));
      if (keccak256(bytes(expansionPropOffset)) == keccak256(bytes(globalAssetOffset))) {
        return string(GridHelper.slice(bytes(floorOffsets), ((expansionPropDigits+1) % numberOfFloorPositions)*8, 8));
      } else {
        return expansionPropOffset;
      }
    }
  }
}