// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract MachinesDevicesImp2 {
  string internal constant M_HEAD = "";
  string internal constant M_HEADL = "";
  string internal constant M_CELL_A = "";
  string internal constant M_MACHINE = "";
  string internal constant M_DRILL = "";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 0) {
      return M_HEAD;
    } else if (assetID == 1) {
      return M_HEADL;
    } else if (assetID == 2) {
      return M_CELL_A;
    } else if (assetID == 3) {
      return M_MACHINE;
    } else if (assetID == 4) {
      return M_DRILL;
    } else {
      return "";
    }
  }
}