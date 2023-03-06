// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AssetsImp6 {

  string internal constant C_WALL_RUGL = "";
  string internal constant C_WALL_RUGR = "";
  
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 6018) {
      return C_WALL_RUGL;
    } else if (assetID == 6019) {
      return C_WALL_RUGR;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 6018) {
      return 1;
    } else if (assetID == 6019) {
      return 1;
    } else {
      return 0;
    }
  }
}