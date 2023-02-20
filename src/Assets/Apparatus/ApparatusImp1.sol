// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract ApparatusImp1 {

  string internal constant C_HOLE_A = "<g transform='translate(-312,0)'><g id='nos-hole-c' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5'> <path fill='url(#nos-hole-lg-a)' d='M479 801c-6-4-16-4-22 0-6 3-6 7-2 11l2-2c5-3 14-3 19 0 2 1 3 2 3 4 6-4 6-10 0-13Z' transform='translate(0 -177)'/> <path fill='#1d1d1b' d='M476 633c-5-3-14-3-19 0l-2 2 2 2c6 3 16 3 22 0 0 0 0 0 0 0 0-2-1-3-3-4Z'/> </g></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 8011) {
      return C_HOLE_A;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 8011) {
      return 2;
    } else {
      return 0;
    }
  }
}