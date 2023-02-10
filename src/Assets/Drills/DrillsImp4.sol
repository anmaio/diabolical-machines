// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract DrillsImp4 {

  string internal constant HOLE_WRAPPER_1 = "<g style='animation:drl-u-hole-main_ts__ts 20000ms linear 999 normal forwards;animation-delay:0s' transform='matrix(.2 0 0 .2 623.3377 719.397)'>";
  string internal constant HOLE_WRAPPER_2 = "<g style='animation:drl-u-hole-main_ts__ts 20000ms linear 999 normal forwards;animation-delay:0.2s' transform='matrix(.2 0 0 .2 623.3377 719.397)'>";
  string internal constant HOLE_WRAPPER_3 = "<g style='animation:drl-u-hole-main_ts__ts 20000ms linear 999 normal forwards;animation-delay:0.4s' transform='matrix(.2 0 0 .2 623.3377 719.397)'>";
  string internal constant HOLE_WRAPPER_4 = "<g style='animation:drl-u-hole-main_ts__ts 20000ms linear 999 normal forwards;animation-delay:0.6s' transform='matrix(.2 0 0 .2 623.3377 719.397)'>";
  string internal constant HOLE_WRAPPER_5 = "<g style='animation:drl-u-hole-main_ts__ts 20000ms linear 999 normal forwards;animation-delay:0.8s' transform='matrix(.2 0 0 .2 623.3377 719.397)'>";
  string internal constant HOLE_WRAPPER_6 = "<g style='animation:drl-u-hole-main_ts__ts 20000ms linear 999 normal forwards;animation-delay:1s' transform='matrix(.2 0 0 .2 623.3377 719.397)'>";
  string internal constant WRINKLE_WRAPPER_1 = "<g style='animation:drl-u-hole-wrinkles_ts__ts 20000ms linear 999 normal forwards;animation-delay:0s' transform='matrix(0 0 0 0 622.5526 720.255)'>";
  string internal constant WRINKLE_WRAPPER_2 = "<g style='animation:drl-u-hole-wrinkles_ts__ts 20000ms linear 999 normal forwards;animation-delay:0.2s' transform='matrix(0 0 0 0 622.5526 720.255)'>";
  string internal constant WRINKLE_WRAPPER_3 = "<g style='animation:drl-u-hole-wrinkles_ts__ts 20000ms linear 999 normal forwards;animation-delay:0.4s' transform='matrix(0 0 0 0 622.5526 720.255)'>";
  string internal constant WRINKLE_WRAPPER_4 = "<g style='animation:drl-u-hole-wrinkles_ts__ts 20000ms linear 999 normal forwards;animation-delay:0.6s' transform='matrix(0 0 0 0 622.5526 720.255)'>";
  string internal constant WRINKLE_WRAPPER_5 = "<g style='animation:drl-u-hole-wrinkles_ts__ts 20000ms linear 999 normal forwards;animation-delay:0.8s' transform='matrix(0 0 0 0 622.5526 720.255)'>";
  string internal constant WRINKLE_WRAPPER_6 = "<g style='animation:drl-u-hole-wrinkles_ts__ts 20000ms linear 999 normal forwards;animation-delay:1s' transform='matrix(0 0 0 0 622.5526 720.255)'>";

  string internal constant HOLE_AND_WRINKLE_WRAPPER = "<g id='drl-u-drl-hl'><g id='drl-u-drl-hl-pos' transform='translate(-155 90)'>";

  string internal constant ALL_DRILL_WRAPPER = "<g id='drl-u-m-drl-pos' transform='translate(-312 -181)'>";

  string internal constant DRILL_MASK_WRAPPER = "<g id='drl-u-drl-msk-g' mask='url(#drl-u-drl-msk)'>";
  string internal constant DRILL_MASK = "<mask id='drl-u-drl-msk' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><ellipse id='drl-u-e-m' fill='url(#c0l)' stroke-width='0' rx='139.9184' ry='300.24' transform='matrix(.9605 0 0 .9514 468.591 549.1575)'/><rect id='drl-u-r-m' width='273.9039' height='295.195' fill='url(#c0l)' stroke-width='0' rx='0' ry='0' transform='translate(333.064 263.2075)'/></mask>";

  string internal constant DRILL_PARTS_WRAPPER_1 = "<g style='animation:drl-u-c-head-all_to__to 20000ms linear 999 normal forwards;animation-delay:0s' transform='translate(468.095 512.595)'><g id='drl-u-c-head-all' transform='translate(-468.095 -632.595)'>";
  string internal constant DRILL_PARTS_WRAPPER_2 = "<g style='animation:drl-u-c-head-all_to__to 20000ms linear 999 normal forwards;animation-delay:0.2s' transform='translate(468.095 512.595)'><g id='drl-u-c-head-all' transform='translate(-468.095 -632.595)'>";
  string internal constant DRILL_PARTS_WRAPPER_3 = "<g style='animation:drl-u-c-head-all_to__to 20000ms linear 999 normal forwards;animation-delay:0.4s' transform='translate(468.095 512.595)'><g id='drl-u-c-head-all' transform='translate(-468.095 -632.595)'>";
  string internal constant DRILL_PARTS_WRAPPER_4 = "<g style='animation:drl-u-c-head-all_to__to 20000ms linear 999 normal forwards;animation-delay:0.6s' transform='translate(468.095 512.595)'><g id='drl-u-c-head-all' transform='translate(-468.095 -632.595)'>";
  string internal constant DRILL_PARTS_WRAPPER_5 = "<g style='animation:drl-u-c-head-all_to__to 20000ms linear 999 normal forwards;animation-delay:0.8s' transform='translate(468.095 512.595)'><g id='drl-u-c-head-all' transform='translate(-468.095 -632.595)'>";
  string internal constant DRILL_PARTS_WRAPPER_6 = "<g style='animation:drl-u-c-head-all_to__to 20000ms linear 999 normal forwards;animation-delay:1s' transform='translate(468.095 512.595)'><g id='drl-u-c-head-all' transform='translate(-468.095 -632.595)'>";

  string internal constant DRL_U_C_TUBE_FULL_HEIGHT = "<g id='drl-u-c-tube-full-height'> <path id='drl-s-path58' fill='url(#drl-s-path163-fill)' stroke='#000' stroke-miterlimit='10' stroke-width='1.01' d='M487.42 724.79c0 5.53-8.55 10-19.09 10s-19.09-4.48-19.09-10V279.34c0-5.53 8.55-10 19.09-10s19.09 4.48 19.09 10v445.45Z'/> <path id='drl-s-line2' fill='none' stroke='#fff' stroke-linecap='round' stroke-miterlimit='10' stroke-width='3' d='M456.74 277.63v449.64'/> </g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 13019) {
      return HOLE_WRAPPER_1;
    } else if (assetID == 13020) {
      return HOLE_WRAPPER_2;
    } else if (assetID == 13021) {
      return HOLE_WRAPPER_3;
    } else if (assetID == 13022) {
      return HOLE_WRAPPER_4;
    } else if (assetID == 13023) {
      return HOLE_WRAPPER_5;
    } else if (assetID == 13024) {
      return HOLE_WRAPPER_6;
    } else if (assetID == 13025) {
      return WRINKLE_WRAPPER_1;
    } else if (assetID == 13026) {
      return WRINKLE_WRAPPER_2;
    } else if (assetID == 13027) {
      return WRINKLE_WRAPPER_3;
    } else if (assetID == 13028) {
      return WRINKLE_WRAPPER_4;
    } else if (assetID == 13029) {
      return WRINKLE_WRAPPER_5;
    } else if (assetID == 13030) {
      return WRINKLE_WRAPPER_6;
    } else if (assetID == 13031) {
      return HOLE_AND_WRINKLE_WRAPPER;
    } else if (assetID == 13032) {
      return ALL_DRILL_WRAPPER;
    } else if (assetID == 13033) {
      return DRILL_MASK_WRAPPER;
    } else if (assetID == 13034) {
      return DRILL_MASK;
    } else if (assetID == 13035) {
      return DRILL_PARTS_WRAPPER_1;
    } else if (assetID == 13036) {
      return DRILL_PARTS_WRAPPER_2;
    } else if (assetID == 13037) {
      return DRILL_PARTS_WRAPPER_3;
    } else if (assetID == 13038) {
      return DRILL_PARTS_WRAPPER_4;
    } else if (assetID == 13039) {
      return DRILL_PARTS_WRAPPER_5;
    } else if (assetID == 13040) {
      return DRILL_PARTS_WRAPPER_6;
    } else if (assetID == 13041) {
      return DRL_U_C_TUBE_FULL_HEIGHT;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 13015) {
      return 1;
    } else if (assetID == 13016) {
      return 3;
    } else if (assetID == 13017) {
      return 3;
    } else if (assetID == 13018) {
      return 3;
    } else if (assetID == 13019) {
      return 3;
    } else if (assetID == 13020) {
      return 3;
    } else if (assetID == 13021) {
      return 3;
    } else if (assetID == 13022) {
      return 3;
    } else if (assetID == 13023) {
      return 3;
    } else if (assetID == 13024) {
      return 3;
    } else if (assetID == 13025) {
      return 3;
    } else if (assetID == 13026) {
      return 3;
    } else if (assetID == 13027) {
      return 3;
    } else if (assetID == 13028) {
      return 3;
    } else if (assetID == 13029) {
      return 3;
    } else if (assetID == 13030) {
      return 3;
    } else if (assetID == 13031) {
      return 3;
    } else if (assetID == 13032) {
      return 3;
    } else if (assetID == 13033) {
      return 3;
    } else if (assetID == 13034) {
      return 3;
    } else if (assetID == 13035) {
      return 3;
    } else if (assetID == 13036) {
      return 3;
    } else if (assetID == 13037) {
      return 3;
    } else if (assetID == 13038) {
      return 3;
    } else if (assetID == 13039) {
      return 3;
    } else if (assetID == 13040) {
      return 3;
    } else if (assetID == 13041) {
      return 3;
    } else {
      return 0;
    }
  }
}