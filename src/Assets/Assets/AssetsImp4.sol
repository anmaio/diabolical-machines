// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AssetsImp4 {

  string internal constant C_FLYING_DUCKSR = "<g id='C-Flying-DucksR'><path d='m604 532-1 4 1-1 2-1c0 1 0 11-2 16-2 4-5 7-7 8l-2 2-2 5h1c5 4 11 16 12 16 0 1 3 4 2 5l-17-8-2-1c-5-3-10-7-13-12 1-1 3-2 3-6 0-2 0-5-2-8l-9-3s0-5-5-11c-4-4-4-6-4-10v-11l6 10 1 1c6 6 11 17 12 20l1 2 2-2c3-2 8-5 10-8 3-3 7-5 9-5l4-2' class='gl-dcks-cls-85'/><path d='M549 538v4l-6-4h6' class='gl-dcks-cls-94'/><path d='M577 551c2 3 2 6 2 8 0 4-2 5-3 6l-1-3-1-1a56 56 0 0 0-9-9l1-5 2 1h1l8 3' class='gl-dcks-cls-96'/><path d='m553 541-1-2h1l1 1-1 1m2-3-1-1h-2l-3 1v4l1 1 5 4h1l2 1 5 3h1l1-5h-1l-6-5-3-3' class='gl-dcks-cls-85'/><path d='m566 547-1 5-2-1 2-5v1h1' class='gl-dcks-cls-92'/><path d='m553 539 1 1-1 1-1-2h1'/><path d='m603 536 1-1 2-1c0 1 0 11-2 16-2 4-5 7-7 8l-2 2-2 5h1c5 4 11 16 12 16 0 1 3 4 2 5l-17-8-2-1c-5-3-10-7-13-12l-1-3-1-1a56 56 0 0 0-9-9l-1-1h-1l-5-3-2-1h-1l-5-4-1-1-6-4h6l3-1h2l1 1 3 3 6 5h1v1h1l2 1h1s-1-5-6-11c-4-4-4-6-4-10v-11l7 10c6 7 11 18 12 21l1 2 2-2c3-2 8-5 10-8 3-3 7-5 9-5l4-2-1 4m1-5v1l-5 1-8 6-10 8-2 1v-1c-2-3-6-14-13-21-1-1-5-9-7-10v11c0 4 0 6 3 10 5 5 6 10 6 11l-2-1-1-1h-1l-6-5-3-4a9 9 0 0 0-3-1l-3 1-6 1 7 5a33 33 0 0 0 6 5l2 1 5 3h2v1l9 8 1 1 1 3a37 37 0 0 0 15 13c13 7 17 9 18 8 0-2-3-5-3-5-1-1-7-12-12-16l1-5 2-1c2-2 6-5 7-9a36 36 0 0 0 2-16l-2 1v-4'/><path d='M561 469v2l2-1-1 13-6 6-2 1-1 4v1c5 3 10 12 10 12l2 4-14-6-1-1c-4-3-8-6-10-10 0 0 2-1 2-4 0-2 0-4-2-7l-6-2s-1-4-5-9c-3-3-3-4-3-7v-9l5 8a60 60 0 0 1 11 18l1-1 8-7 7-4 3-1' class='gl-dcks-cls-85'/><path d='M518 473v4l-5-4h5' class='gl-dcks-cls-94'/><path d='M540 483c2 3 2 5 2 7 0 3-2 4-2 4l-1-2-1-1a45 45 0 0 0-8-7l2-4v1h2l6 2' class='gl-dcks-cls-96'/><path d='m522 475-1-1h1v1s0 1 0 0m1-2h-1l-2-1-2 1v4h1l4 3 2 1 4 2 1 1 1-4h-1l-5-5-2-2' class='gl-dcks-cls-85'/><path d='m532 480-2 4 1-4h1' class='gl-dcks-cls-92'/><path d='M522 474v1s0 1 0 0l-1-1h1'/><path d='m561 471 2-1-1 13-6 6-2 1-1 4v1c5 3 10 12 10 12l2 4-14-6-1-1c-4-3-8-6-10-10l-1-2-1-1a45 45 0 0 0-8-7l-1-1-4-2-1-1h-1l-4-3h-1l-5-4h5l2-1 2 1h1l2 2 5 5h2v1h2s-1-4-5-9c-3-3-3-4-3-7v-9l5 8a60 60 0 0 1 11 18l1-1 8-7 7-4 3-1v2m1-3h-1l-3 1-7 5-8 6-1 1v-1c-2-2-5-11-11-16 0-1-3-7-5-8v-1 9c0 3 0 5 3 8l4 9a14 14 0 0 1-3-2l-4-4-3-3h-3l-2 1h-5l6 4 4 4 2 1 4 2h1l1 1 7 6v1l1 2a29 29 0 0 0 12 11c11 6 14 7 14 6l-2-4c-1-1-5-10-9-13l1-3 1-1 6-7c2-4 1-12 1-13h-2l1-2'/><path d='M519 414v2-1h1c0 1 1 6-1 9l-4 5-1 1-1 3c3 2 7 9 7 9l2 3-10-5h-1c-4-2-6-5-8-7 1-1 2-1 2-4l-1-5-5-1-4-7c-2-2-2-3-2-5v-6l4 5c4 4 6 10 7 12l1 1h1l6-5 5-3 2-1' class='gl-dcks-cls-85'/><path d='M487 417v2l-3-2h3' class='gl-dcks-cls-94'/><path d='m504 424 1 5c0 3-1 3-2 4l-1-2v-1a33 33 0 0 0-6-5l1-3a9 9 0 0 0 1 1h1l5 1' class='gl-dcks-cls-96'/><path d='m490 419-1-1 1-1v2m0-2a4 4 0 0 0-1-1l-2 1v3h1l3 2 1 1 4 2v-3l-3-3-3-2' class='gl-dcks-cls-85'/><path d='m497 422-1 3v-3h1' class='gl-dcks-cls-92'/><path d='M490 417v2l-1-1 1-1'/><path d='M519 416v-1h1c0 1 1 6-1 9l-4 5-1 1-1 3c3 2 7 9 7 9l2 3-10-5h-1a21 21 0 0 1-8-7l-1-2v-1a33 33 0 0 0-6-5l-4-2-1-1-3-2h-1v-1l-3-2h3l2-1 1 1 3 2 3 3h1a9 9 0 0 0 1 1h1l-4-7c-2-2-2-3-2-5v-6l4 5c4 4 6 10 7 12l1 1h1l6-5 5-3 2-1v2m1-3h-1l-2 1-6 4-5 4-1 1-1-1c0-2-3-8-7-12l-4-6v7c0 2 0 3 2 5 3 3 3 6 3 7l-1-1h-1v-1l-3-3-3-2h-1l-2 1h-4l4 3 4 3h1l3 2h1a10 10 0 0 1 1 1 33 33 0 0 1 5 5l1 2a22 22 0 0 0 9 8l10 4-2-3c0-1-3-7-7-9l1-3 1-1 5-5v-9h-1l1-2'/></g>";
  string internal constant C_SHELFL_A = "<g id='C-ShelfL-A'><g id='C-ShelfL-A-TG'><path d='M44.3 315.8v5l15.8 9.3V325l-15.8-9.2zm379.4-200.7L60 325v5l363.6-209.9v-5z' class='gss-31'/><path fill='url(#linear-gradient-9)' stroke='#1d1d1b' d='M642 428 278.3 637.7l15.8 9.2 363.6-210-15.7-9z' transform='translate(-234 -322)'/></g></g>";
  string internal constant C_SHELFR_A = "<g id='C-ShelfR-A'><g id='C-ShelfR-A-TG'><path d='M891.7 315.8v5l-15.8 9.3V325l15.8-9.2zM512.3 115.1 876 325v5L512.3 120.2v-5z' class='gss-31'/><path fill='url(#linear-gradient-8)' stroke='#1d1d1b' d='m294 428 363.7 209.8-15.8 9.2-363.6-210 15.7-9z' transform='translate(234 -322)'/></g></g>";
  
  
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 6013) {
      return C_FLYING_DUCKSR;
    } else if (assetID == 6014) {
      return C_SHELFL_A;
    } else if (assetID == 6015) {
      return C_SHELFR_A;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 6013) {
      return 5;
    } else if (assetID == 6014) {
      return 5;
    } else if (assetID == 6015) {
      return 5;
    } else {
      return 0;
    }
  }
}