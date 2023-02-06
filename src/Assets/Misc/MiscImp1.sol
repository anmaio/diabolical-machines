// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract MiscImp1 {

  string internal constant ALTAR_FLOOB_WRAPPER_OPEN = "<g id='ap-u-floobs-mask-g' mask='url(#ap-u-masks19)'><g id='ap-u-floobs_to' transform='translate(623.385 629.165)' style='animation-play-state: running;'><g id='ap-u-floobs' transform='translate(-624 -380)'>";
  string internal constant ALTAR_FLOOB_WRAPPER_CLOSE = "</g></g><mask id='ap-u-masks19' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='ap-u-floob-mask3' fill='url(#c5l)' stroke-width='2.16' d='M568.77 544.34c15.4 31.34 90.63 37.04 109.4547 0l64.884-135.518c11.7802-4.7646 19.4434-23.5593 17.4813-36.512-4.0623-86.6755-107.55-140.75-120.69-59.58L521.14 401.2l47.63 143.14Z'/></mask></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 19000) {
      return ALTAR_FLOOB_WRAPPER_OPEN;
    } else if (assetID == 19001) {
      return ALTAR_FLOOB_WRAPPER_CLOSE;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 19000) {
      return 3;
    } else if (assetID == 19001) {
      return 3;
    } else {
      return 0;
    }
  }
}