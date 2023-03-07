// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract SubstancesImp1 {

  string internal constant C_JAR_MINERAL_DRY = "<g id='ap-u-c-jar-mineral-dry'><path id='ap-s-path174' fill='#FFFFFF' stroke='#000000' stroke-width='.86' d='M623.55 392.07c21.04 0 38.1 8.94 38.1 19.97S644.59 432 623.55 432s-38.1-8.94-38.1-19.97 17.06-19.96 38.1-19.96' opacity='0.25'/><path id='ap-s-path175' fill='#FFFFFF' stroke='#000000' stroke-width='.86' d='M661.57 361.04v51.04c0 11.03-17.06 19.96-38.1 19.96s-38.1-8.94-38.1-19.97v-51.04' opacity='0.25'/><path id='ap-s-path176' fill='url(#ap-s-path176-fill)' stroke='#1d1d1b' d='M661.57 361.04v9.84c0 11.03-17.06 17.96-38.1 17.96s-38.1-6.94-38.1-17.96v-9.84'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path177'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path178'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path179'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path180'/></g>";
  string internal constant C_FLOOB_SLIMY = "<g id='ap-u-c-floob-slimy'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path165'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path166'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path167' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path168' stroke-width='.5'/></g>";
  string internal constant C_JAR_MINERAL_A = "<g id='ap-u-c-jar-mineral-a'><path id='ap-s-path181' fill='#FFFFFF' d='M623.55 392.07c21.04 0 38.1 8.94 38.1 19.97S644.59 432 623.55 432s-38.1-8.94-38.1-19.97 17.06-19.96 38.1-19.96' opacity='0.25'/><path id='ap-s-path182' fill='#FFFFFF' stroke='#000000' d='M661.57 361.04v51.04c0 11.03-17.06 19.96-38.1 19.96s-38.1-8.94-38.1-19.97v-51.04' opacity='0.25'/><path id='ap-s-path183' fill='url(#ap-s-path176-fill)' stroke='#1d1d1b' d='M661.57 361.04v9.84c0 11.03-17.06 17.96-38.1 17.96s-38.1-6.94-38.1-17.96v-9.84'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path177' id='ap-s-path184'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path178' id='ap-s-path185'/><circle id='ap-s-circle7' r='5.64' fill='var(--g0)' opacity='.5' transform='translate(602.8 414.54)'/><circle id='ap-s-circle8' r='3.62' fill='var(--g0)' opacity='.5' transform='translate(607.52 401.81)'/><circle id='ap-s-circle9' r='2.9' fill='var(--g0)' opacity='.5' transform='translate(598.05 392.82)'/></g>";
  string internal constant C_JAR_MINERAL_B = "<g id='ap-u-c-jar-mineral-b'><path id='ap-s-path186' fill='#FFFFFF' d='M623.55 392.07c21.04 0 38.1 8.94 38.1 19.97S644.59 432 623.55 432s-38.1-8.94-38.1-19.97 17.06-19.96 38.1-19.96' opacity='0.25'/><path id='ap-s-path187' fill='#FFFFFF' stroke='#000000' d='M661.57 361.04v51.04c0 11.03-17.06 19.96-38.1 19.96s-38.1-8.94-38.1-19.97v-51.04' opacity='0.25'/><path id='ap-s-path188' fill='url(#ap-s-path176-fill)' stroke='#1d1d1b' d='M661.57 361.04v9.84c0 11.03-17.06 17.96-38.1 17.96s-38.1-6.94-38.1-17.96v-9.84'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path177' id='ap-s-path189'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path178' id='ap-s-path190'/><rect id='ap-s-rect1' width='5.49' height='25.75' fill='var(--g0)' opacity='.5' rx='2' ry='2' transform='translate(593.18 390.72)'/><rect id='ap-s-rect2' width='4.12' height='27.07' fill='var(--g1)' opacity='.5' rx='1.5' ry='1.5' transform='translate(602.1 396.89)'/></g>";

  string internal constant C_MINERAL_C = "<g id='ap-u-c-mineral-c'><g id='ap-s-g17'><circle id='ap-s-circle1' r='21.53' fill='var(--g0)' stroke='#000000' transform='translate(652.79 371.12)'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path159' opacity='.3' style='mix-blend-mode:multiply'/></g><g id='ap-s-g18'><circle id='ap-s-circle2' r='13.85' fill='var(--g0)' stroke='#000000' transform='translate(609.23 359.96)'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path160' opacity='.3' style='mix-blend-mode:multiply'/></g><g id='ap-s-g19'><circle id='ap-s-circle3' r='37.22' fill='var(--g0)' stroke='#000000' transform='translate(625.96 389.34)'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path161' opacity='.3' style='mix-blend-mode:multiply'/></g><g id='ap-s-g20'><circle id='ap-s-circle4' r='21.53' fill='var(--g0)' stroke='#000000' transform='translate(594.23 380.56)'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path162' opacity='.3' style='mix-blend-mode:multiply'/></g><g id='ap-s-g21'><circle id='ap-s-circle5' r='14.3' fill='var(--g0)' stroke='#000000' transform='translate(655.33 404.31)'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path163' opacity='.3' style='mix-blend-mode:multiply'/></g><g id='ap-s-g22'><circle id='ap-s-circle6' r='11.22' fill='var(--g0)' stroke='#000000' transform='translate(602.83 415.79)'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path164' opacity='.3' style='mix-blend-mode:multiply'/></g></g>";

  string internal constant M_PETRI_B = "<g id='ap-u-m-petri-b'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path169' stroke-width='.86'/><path id='ap-s-path170' fill='#FFFFFF' stroke='#000000' stroke-width='.86' d='M660.88 386.56c-3.4 9.17-18.83 16.1-37.37 16.1s-33.97-6.93-37.37-16.1c-.46-1.23-.7-2.51-.7-3.81v7.62c0 11 17.04 19.91 38.07 19.91s38.07-8.92 38.07-19.91v-7.62c0 1.3-.25 2.58-.7 3.81Z' opacity='0.25'/><path id='ap-s-path171' fill='#FFFFFF' stroke='#000000' stroke-width='.86' d='M623.51 362.83c-21.03 0-38.07 8.92-38.07 19.91s17.04 19.91 38.07 19.91 38.07-8.92 38.07-19.91-17.04-19.91-38.07-19.91Zm0 38.25c-19.78 0-36.49-8.4-36.49-18.33s16.71-18.33 36.49-18.33 36.49 8.4 36.49 18.33-16.71 18.33-36.49 18.33Z' opacity='0.25'/><ellipse id='ap-s-ellipse11' fill='#FFFFFF' rx='38.07' ry='19.91' transform='translate(623.51 390.37)' opacity='0.2'/><g id='ap-u-c-splat-b'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path172' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path173' stroke-width='.5'/></g></g>";
  string internal constant C_FLOOBRAW_B = "<g id='ap-u-c-floobraw-a-2'><g id='ap-u-raw-2'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path198'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path199'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path200'/></g><g id='ap-u-detail-12'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path201' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path202' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path203' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path204' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path205' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path206' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path207' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path208' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path209' stroke-width='.5'/></g><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path210'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path211'/></g>";
  string internal constant C_FLOOB_A = "<g id='ap-u-c-floob-a'><g id='ap-s-g24'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon43'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon44'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon45'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polyline1' stroke-width='3'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-line13' stroke-width='3'/></g></g>";
  
  string internal constant C_FLOOB_DISC = "<g id='ap-u-c-floob-disc'><path id='ap-s-path194' fill='var(--g1)' stroke='#000000' d='M661.61 373.63v27.86c0 11.03-17.06 17.96-38.1 17.96s-38.1-6.94-38.1-17.96v-27.86'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path195' stroke-width='3'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path196'/></g>";
  string internal constant C_FLOOBLRGPK_A = "<g id='ap-u-c-flooblrgpk-a'><g id='ap-s-g23'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon39'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon40' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon41' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon42' stroke-width='.5'/></g><g id='ap-u-detail'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-line11' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-line12' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path197' stroke-width='.5'/></g></g>";
  string internal constant C_FLOOB_DISCLRGPK_A = "<g id='ap-u-c-floob-disclrgpk-a'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path191' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path192' stroke-width='.5'/><g id='ap-u-detail-13'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path193' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-line10' stroke-width='.5'/></g></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 1004) {
      return C_JAR_MINERAL_DRY;
    } else if (assetID == 1005) {
      return C_FLOOB_SLIMY;
    } else if (assetID == 1008) {
      return C_JAR_MINERAL_A;
    } else if (assetID == 1009) {
      return C_JAR_MINERAL_B;
    } else if (assetID == 1010) {
      return C_MINERAL_C;
    } else if (assetID == 1013) {
      return M_PETRI_B;
    } else if (assetID == 1015) {
      return C_FLOOBRAW_B;
    } else if (assetID == 1016) {
      return C_FLOOB_A;
    } else if (assetID == 1017) {
      return C_FLOOB_DISC;
    } else if (assetID == 1019) {
      return C_FLOOBLRGPK_A;
    } else if (assetID == 1020) {
      return C_FLOOB_DISCLRGPK_A;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 1004) {
      return 1;
    } else if (assetID == 1005) {
      return 1;
    } else if (assetID == 1008) {
      return 3;
    } else if (assetID == 1009) {
      return 4;
    } else if (assetID == 1010) {
      return 4;
    } else if (assetID == 1013) {
      return 5;
    } else if (assetID == 1015) {
      return 5;
    } else if (assetID == 1016) {
      return 5;
    } else if (assetID == 1017) {
      return 5;
    } else if (assetID == 1019) {
      return 5;
    } else if (assetID == 1020) {
      return 5;
    } else {
      return 0;
    }
  }
}