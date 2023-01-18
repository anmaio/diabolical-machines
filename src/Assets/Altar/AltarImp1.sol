// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AltarImp1 {
  string internal constant C_BASE_D = "";
  string internal constant C_BASE_F = "";
  string internal constant C_BASE_G = "";

  string internal constant C_FRAME_A = "";
  string internal constant C_FRAME_B = "";

  string internal constant M_PLINTH_A = "";
  string internal constant M_PLINTH_B = "";
  string internal constant M_PLINTH_C = "";

  string internal constant C_HEAD_A = "";
  string internal constant C_HEAD_B = "";
  string internal constant C_HEAD_C = "";

  string internal constant DETAIL = "";

  string internal constant C_FRAME_C = "";
  string internal constant C_STEPS = "";
  string internal constant C_STEPS_RUNNER = "";
  string internal constant C_BASE_D_RUNNER = "";
  string internal constant C_PLATE_B = "";

  string internal constant C_HOLE_B = "";
  string internal constant C_HOLE_B_A3 = "";
  string internal constant C_HOLE_A_A2 = "";
  string internal constant C_RUG_A_ = "";
  string internal constant C_RUG_B = "";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 0) {
      return C_BASE_D;
    } else if (assetID == 1) {
      return C_BASE_F;
    } else if (assetID == 2) {
      return C_BASE_G;
    } else if (assetID == 3) {
      return C_FRAME_A;
    } else if (assetID == 4) {
      return C_FRAME_B;
    } else {
      return "";
    }
  }
}