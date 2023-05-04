// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./GridHelper.sol";
import "./Noise.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library Patterns {

  // 20 to 2 inclusive in 0.5 decrements
  string internal constant ANIMATED_TEXTURE_NUMBERS = "20.019.018.017.016.015.014.013.012.011.010.09.008.007.006.005.004.003.002.00";

  // 4 to 1 inclusive in 0.1 decriments
  string internal constant TEXTURE_SCALE_NUMBERS = "4.03.93.83.73.63.53.43.33.23.13.02.92.82.72.62.52.42.32.22.12.01.91.81.71.61.51.41.31.21.11.0";

  // 15 to 0.3 inclusive in 0.3 decriments
  string internal constant PATTERNS_SCALE_NUMBERS = "15.014.714.414.113.813.513.212.912.612.312.011.711.411.110.810.510.209.909.609.309.008.708.408.107.807.507.206.906.606.306.005.705.405.104.804.504.203.903.603.303.002.702.402.101.801.501.200.900.600.3";

  string internal constant ANIMATED_TEXTURE_NAMES = "sqrestriancircsoctagstarsovals";

  string internal constant TEXTURE_NAMES = "g-1a-2f-2d-1f-3b-1b-2e-1";

  string internal constant PATTERNS_NAMES = "cdrqbaiosekgpfnjlm";

  /**
    * @dev Get if the pattern is a texture or not based on the baseline rarity and random number
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return If the pattern is a texture or not
   */

  function getIsTexture(uint rand, int baseline) public pure returns (bool) {
    uint textureDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 4)] + baseline);

    return textureDigits < 128;
  }

  /**
    * @dev Get the pattern name based on the baseline rarity and random number
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return The pattern name
   */

  function getPatternName(uint rand, int baseline) public pure returns (string memory) {
    uint patternDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 5)] + baseline);

    bool isTexture = getIsTexture(rand, baseline);

    bool isAnimatedTexture = baseline < 43;

    uint nameLength;
    uint nameCount;
    string memory names;

    if (isAnimatedTexture) {
      nameLength = 5;
      nameCount = 6;
      names = ANIMATED_TEXTURE_NAMES;
    } else if (isTexture && !isAnimatedTexture) {
      nameLength = 3;
      nameCount = 8;
      names = TEXTURE_NAMES;
    } else {
      nameLength = 1;
      nameCount = 18;
      names = PATTERNS_NAMES;
    }

    uint[] memory nameProbabilitiesArray = GridHelper.createEqualProbabilityArray(nameCount);

    uint oneLess = nameCount - 1;

    for (uint i = 0; i < oneLess; ++i) {
      if (patternDigits < nameProbabilitiesArray[i]) {
        return string(GridHelper.slice(bytes(names), i * nameLength, nameLength));
      }
    }

    return string(GridHelper.slice(bytes(names), oneLess * nameLength, nameLength));
  }

  /**
    * @dev Get the surface quantity based on the baseline rarity and random number
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return The surface quantity
   */

  function getSurfaceQuantity(uint rand, int baseline) public pure returns (bool[3] memory) {
    uint surfaceDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 6)] + baseline);

    if (baseline < 43) {
      surfaceDigits += 128; // animated textures should appear on 2+ surfaces
    }

    // LW, RW, FLOOR
    uint[] memory surfaceProbabilitiesArray = GridHelper.createEqualProbabilityArray(4);

    if (surfaceDigits < surfaceProbabilitiesArray[0]) {
      return [true, false, false];
    } else if (surfaceDigits < surfaceProbabilitiesArray[1]) {
      return [false, true, false];
    } else if (surfaceDigits < surfaceProbabilitiesArray[2]) {
      return [true, true, false];
    } else {
      return [true, true, true];
    }
  }

  /**
    * @dev Get the pattern scale based on the baseline rarity and random number
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return The pattern scale
   */

  function getScale(uint rand, int baseline) public pure returns (string memory) {
    uint scaleDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 7)] + baseline);

    bool isTexture = getIsTexture(rand, baseline);
    bool isAnimatedTexture = baseline < 43;

    uint scaleLength;
    uint scaleCount;
    string memory scales;

    if (isAnimatedTexture) {
      scaleLength = 4;
      scaleCount = 19;
      scales = ANIMATED_TEXTURE_NUMBERS;
    } else if (isTexture && !isAnimatedTexture) {
      scaleLength = 3;
      scaleCount = 31;
      scales = TEXTURE_SCALE_NUMBERS;
    } else {
      scaleLength = 4;
      scaleCount = 50;
      scales = PATTERNS_SCALE_NUMBERS;
    }

    uint[] memory scaleProbabilitiesArray = GridHelper.createEqualProbabilityArray(scaleCount);

    uint oneLess = scaleCount - 1;

    if (baseline > 180) {
      uint scaleValue = oneLess - (scaleDigits % 5);
      return string(GridHelper.slice(bytes(scales), scaleValue * scaleLength, scaleLength));
    }

    for (uint i = 0; i < oneLess; ++i) {
      if (scaleDigits < scaleProbabilitiesArray[i]) {
        return string(GridHelper.slice(bytes(scales), i * scaleLength, scaleLength));
      }
    }

    return string(GridHelper.slice(bytes(scales), oneLess * scaleLength, scaleLength));
  }

  /**
    * @dev Get the pattern opacity based on the baseline rarity and random number
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @param surfaceNumber The surface number 0 is left wall, 1 is right wall, 2 is floor
    * @return The pattern opacity as a string
   */

  function getOpacity(uint rand, int baseline, uint surfaceNumber) public pure returns (string memory) {
    uint opacityDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 8)] + baseline);

    bool[3] memory surfaceQuantity = getSurfaceQuantity(rand, baseline);

    if (!surfaceQuantity[surfaceNumber]) {
      return Strings.toString(0);
    }

    bool isTexture = getIsTexture(rand, baseline);

    if (isTexture) {
      // 100 -> 20
      return Strings.toString(100 - (opacityDigits * 80 / 255 + 20));
    } else {
      if (baseline > 180) {
        return Strings.toString(100);
      } else {
        // 25 -> 100
        return Strings.toString(opacityDigits * 75 / 255 + 25);
      }
    }
  }

  /**
    * @dev Get the pattern rotation based on the baseline rarity and random number
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return The pattern rotation in degrees from 0 to 45
   */

  // Only used for textures
  function getRotate(uint rand, int baseline) public pure returns (uint) {
    uint rotateDigits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 9)] + baseline);

    // 0 -> 45
    return rotateDigits * 45 / 255;
  }

  // /**
  //   * @dev Get the pattern width and height based on the baseline rarity and random number
  //   * @param rand The digits to use
  //   * @param baseline The baseline rarity
  //   * @param part The part of the random number to use
  //   * @return The pattern width or height as a string
  //  */

  // function getWidthHeight(uint rand, int baseline, uint part) public pure returns (string memory) {
  //   uint digits = GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, part)] + baseline);

  //   bool isTexture = getIsTexture(rand, baseline);

  //   if (isTexture) {
  //     return "0.333";
  //   }

  //   uint[] memory probabilitiesArray = GridHelper.createEqualProbabilityArray(3);

  //   if (digits < probabilitiesArray[0]) {
  //     return "1";
  //   } else if (digits < probabilitiesArray[1]) {
  //     return "0.666";
  //   } else {
  //     return "0.333";
  //   }
  // }

  // /**
  //   * @dev Get the pattern width based on the baseline rarity and random number
  //   * @param rand The digits to use
  //   * @param baseline The baseline rarity
  //   * @return The pattern width as a string
  //  */

  // function getWidth(uint rand, int baseline) public pure returns (string memory) {
  //   return getWidthHeight(rand, baseline, 9);
  // }

  // /**
  //   * @dev Get the pattern height based on the baseline rarity and random number
  //   * @param rand The digits to use
  //   * @param baseline The baseline rarity
  //   * @return The pattern height as a string
  //  */

  // function getHeight(uint rand, int baseline) public pure returns (string memory) {
  //   return getWidthHeight(rand, baseline, 10);
  // }

}