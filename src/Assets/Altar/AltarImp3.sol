// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AltarImp3 {
  string internal constant C_Base_D = "";
  string internal constant C_Base_F = "";
  string internal constant C_Base_G = "";

  string internal constant C_Frame_A = "";
  string internal constant C_Frame_B = "";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 0) {
      return C_Base_D;
    } else if (assetID == 1) {
      return C_Base_F;
    } else if (assetID == 2) {
      return C_Base_G;
    } else if (assetID == 3) {
      return C_Frame_A;
    } else if (assetID == 4) {
      return C_Frame_B;
    } else {
      return "";
    }
  }
}