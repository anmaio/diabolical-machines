// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract ApparatusImp1 {

  string internal constant C_HOLE_A = "<g transform='translate(-522,-250)'><g id='m_a_limit33-u-c-hole-a28'><path id='m_a_limit33-s-path341' d='M689.54,861.69c-6.21-3.64-16.26-3.76-22.34-.28-5.28,3.03-5.94,7.8-2.01,11.35.6-.66,1.37-1.27,2.33-1.82c5.19-2.98,13.79-2.87,19.1.24c1.58.93,2.68,2.02,3.32,3.17c5.82-3.45,5.69-9.09-.4-12.66Z' fill='url(#m_a_limit33-s-path341-fill)' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/><path id='m_a_limit33-s-path342' d='M686.61,871.19c-5.31-3.11-13.9-3.22-19.1-.24-.95.55-1.73,1.16-2.33,1.82.59.53,1.28,1.04,2.08,1.51c6.12,3.59,16.17,3.71,22.34.28.12-.06.21-.14.33-.2-.64-1.15-1.74-2.24-3.32-3.17Z' fill='#1d1d1b' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/></g></g>";

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