// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract MiscImp1 {

  string internal constant GROUP_CLOSE = "</g>";

  string internal constant TRANSFORM_0 = "<g transform='translate(312 0)'>";
  string internal constant TRANSFORM_1 = "<g transform='translate(156 90)'>";
  string internal constant TRANSFORM_2 = "<g transform='translate(0 180)'>";
  string internal constant TRANSFORM_3 = "<g transform='translate(468 90)'>";
  string internal constant TRANSFORM_4 = "<g transform='translate(312 180)'>";
  string internal constant TRANSFORM_5 = "<g transform='translate(156 270)'>";
  string internal constant TRANSFORM_6 = "<g transform='translate(624 180)'>";
  string internal constant TRANSFORM_7 = "<g transform='translate(468 270)'>";
  string internal constant TRANSFORM_8 = "<g transform='translate(312 360)'>";

  string internal constant FLIP_WRAPPER = "<g style='transform:scaleX(-1);transform-origin:50% 50%;'>";

  string internal constant NEGATIVE_156 = "<g transform='translate(-156 0)'>";

  string internal constant NO_TRANSFORM = "<g transform='translate(0 0)'>";

  string internal constant TRANSFORM_1_NEGATIVE = "<g transform='translate(-156 -90)'>";

  string internal constant CB_TRANSFORM = "<g transform='translate(27 0)'>";

  // transform 0->8
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 19000) {
      return GROUP_CLOSE;
    } else if (assetID == 19001) {
      return TRANSFORM_0;
    } else if (assetID == 19002) {
      return TRANSFORM_1;
    } else if (assetID == 19003) {
      return TRANSFORM_2;
    } else if (assetID == 19004) {
      return TRANSFORM_3;
    } else if (assetID == 19005) {
      return TRANSFORM_4;
    } else if (assetID == 19006) {
      return TRANSFORM_5;
    } else if (assetID == 19007) {
      return TRANSFORM_6;
    } else if (assetID == 19008) {
      return TRANSFORM_7;
    } else if (assetID == 19009) {
      return TRANSFORM_8;
    } else if (assetID == 19010) {
      return FLIP_WRAPPER;
    } else if (assetID == 19011) {
      return NEGATIVE_156;
    } else if (assetID == 19012) {
      return NO_TRANSFORM;
    } else if (assetID == 19013) {
      return TRANSFORM_1_NEGATIVE;
    } else if (assetID == 19014) {
      return CB_TRANSFORM;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 19000) {
      return 3;
    } else if (assetID == 19001) {
      return 3;
    } else if (assetID == 19002) {
      return 3;
    } else if (assetID == 19003) {
      return 3;
    } else if (assetID == 19004) {
      return 3;
    } else if (assetID == 19005) {
      return 3;
    } else if (assetID == 19006) {
      return 3;
    } else if (assetID == 19007) {
      return 3;
    } else if (assetID == 19008) {
      return 3;
    } else if (assetID == 19009) {
      return 3;
    } else if (assetID == 19010) {
      return 3;
    } else if (assetID == 19011) {
      return 3;
    } else if (assetID == 19012) {
      return 3;
    } else if (assetID == 19013) {
      return 3;
    } else if (assetID == 19014) {
      return 3;
    } else {
      return 0;
    }
  }
}