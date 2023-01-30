// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AssetsImp1 {

  string internal constant C_LAVALAMP_A = "<g id='C-Lavalamp-A'><g id='g-ll-u-c-lavalamp-a' transform='translate(-.005 -2.81)'><ellipse id='g-ll-u-shadow' fill='#1d1d1b' opacity='.3' rx='16.22' ry='10.62' style='mix-blend-mode:multiply' transform='rotate(-18.49 2100.4642 -1151.6914)'/><path id='g-ll-s-pa86' fill='url(#g-ll-s-pa86-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='m484.43 609.21-7.71-25.76s-11.63-.65-11.31-.88c.31-.24-11.17.88-11.17.88l-7.42 24.91c-.14.42-.22.84-.22 1.25 0 4.26 7.75 9.01 18.87 9.01s18.87-4.75 18.87-9.01c0-.12 0-.25-.02-.37l.09-.03Z'/><path id='g-ll-s-pa87' fill='url(#g-ll-s-pa87-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='m484.36 557.66-15.26-1.98-.39.02-22.1 1.24 7.8 27.47h.05c.98 2.24 5.23 4.4 11.02 4.4s9.94-2.11 10.98-4.32h.05l7.84-26.82Z'/><path id='g-ll-u-c-connector' fill='url(#g-ll-u-c-connector-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M465.48 565.95c-11.12 0-18.87-4.75-18.87-9.01s7.75-9.01 18.87-9.01 18.87 4.75 18.87 9.01-7.75 9.01-18.87 9.01Z'/><g id='g-ll-u-mask-group' mask='url(#g-ll-u-masks)'><g id='g-ll-u-c-lava'><g style='animation:g-ll-s-pa88_to__to 14000ms linear 999 normal forwards' transform='translate(463.7626 525.0957)'><path id='g-ll-s-pa88' fill='url(#g-ll-s-pa88-fl)' d='M468.81 500.65c-5.69.13-7.8 6.34-6.61 10.05 1.19 3.7.13 12.16-2.78 17.45-1.62 2.95-8.46 8.86-6.08 15.46 2.38 6.61 16.52 8.46 19.43 1.59s-.4-15.86-.93-19.56-.66-12.95 1.72-15.46 1.06-9.65-4.76-9.52Z' transform='translate(-463.7626 -525.0957)'/></g><g style='animation:g-ll-s-circle3_to__to 14000ms linear 999 normal forwards' transform='translate(459.89 497.15)'><circle id='g-ll-s-circle3' r='3.77' fill='url(#g-ll-s-circle3-fl)'/></g><g style='animation:g-ll-s-ellipse1_to__to 14000ms linear 999 normal forwards' transform='translate(471.86 550.49)'><ellipse id='g-ll-s-ellipse1' fill='url(#g-ll-s-ellipse1-fl)' rx='10.76' ry='10.04'/></g></g><mask id='g-ll-u-masks' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='g-ll-u-c-lavalamp-lava-mask' fill='url(#g-ll-u-c-lavalamp-lava-mask-fl)' stroke='#1d1d1b' stroke-miterlimit='10' d='m476.72 483.75-8.21.08-14.27-.08s-7.64 72.96-7.64 73.19c0 4.26 7.75 9.01 18.87 9.01s18.87-4.75 18.87-9.01c0-.79-7.64-73.19-7.64-73.19Z' opacity='.8'/></mask></g><path id='g-ll-u-c-lavalamp-glass' fill='url(#g-ll-u-c-lavalamp-glass-fl)' stroke='#1d1d1b' stroke-miterlimit='10' d='m476.72 483.75-8.21.08-14.27-.08s-7.64 72.96-7.64 73.19c0 4.26 7.75 9.01 18.87 9.01s18.87-4.75 18.87-9.01c0-.79-7.64-73.19-7.64-73.19Z' opacity='.8'/><g id='g-ll-u-lid'><path id='g-ll-s-pa89' fill='url(#g-ll-s-pa89-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='m473.74 465.09-5.09-.63-11.47.89s-2.95 18.27-2.95 18.41c0 2.54 4.62 5.36 11.24 5.36s11.24-2.83 11.24-5.36c0-.07-2.98-18.66-2.98-18.66Z'/><path id='g-ll-u-c-connector-2' fill='url(#g-ll-u-c-connector-2-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M465.48 469.3c-4.89 0-8.29-2.09-8.29-3.96s3.41-3.96 8.29-3.96 8.29 2.09 8.29 3.96-3.41 3.96-8.29 3.96Z'/></g></g></g>";
  string internal constant C_LAVALAMP_B = "";
  string internal constant C_CACTUS_A = "";
  string internal constant C_CACTUS_B = "";
  string internal constant C_MARTINI_A = "";
  string internal constant C_MARTINI_B = "";
  string internal constant C_BONG_A = "";
  string internal constant C_BONG_B = "";
  string internal constant C_FRIDGE_A = "";
  string internal constant C_FRIDGE_B = "";
  string internal constant C_PLINTH_GLOBAL_A = "";
  string internal constant C_PLINTH_GLOBAL_B = "";
  string internal constant C_FLYING_DUCKSL = "";
  string internal constant C_FLYING_DUCKSR = "";
  string internal constant C_SHELFL_A = "";
  string internal constant C_SHELFR_A = "";
  string internal constant C_AZTECL_A = "";
  string internal constant C_AZTECR_A = "";
  string internal constant C_WALL_RUGL = "";
  string internal constant C_WALL_RUGR = "";
  
  
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 6000) {
      return C_LAVALAMP_A;
    } else if (assetID == 6001) {
      return C_LAVALAMP_B;
    } else if (assetID == 6002) {
      return C_CACTUS_A;
    } else if (assetID == 6003) {
      return C_CACTUS_B;
    } else if (assetID == 6004) {
      return C_MARTINI_A;
    } else if (assetID == 6005) {
      return C_MARTINI_B;
    } else if (assetID == 6006) {
      return C_BONG_A;
    } else if (assetID == 6007) {
      return C_BONG_B;
    } else if (assetID == 6008) {
      return C_FRIDGE_A;
    } else if (assetID == 6009) {
      return C_FRIDGE_B;
    } else if (assetID == 6010) {
      return C_PLINTH_GLOBAL_A;
    } else if (assetID == 6011) {
      return C_PLINTH_GLOBAL_B;
    } else if (assetID == 6012) {
      return C_FLYING_DUCKSL;
    } else if (assetID == 6013) {
      return C_FLYING_DUCKSR;
    } else if (assetID == 6014) {
      return C_SHELFL_A;
    } else if (assetID == 6015) {
      return C_SHELFR_A;
    } else if (assetID == 6016) {
      return C_AZTECL_A;
    } else if (assetID == 6017) {
      return C_AZTECR_A;
    } else if (assetID == 6018) {
      return C_WALL_RUGL;
    } else if (assetID == 6019) {
      return C_WALL_RUGR;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    
  }
}