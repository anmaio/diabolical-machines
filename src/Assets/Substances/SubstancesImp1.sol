// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract SubstancesImp1 {

  string internal constant C_FLOOB_GLOOP_A = "<g id='cs-u-c-gloop-a_to' transform='translate(155.64 292.93)'><g id='cs-u-c-gloop-a' transform='translate(-155.64 -682.93)'><g id='cs-u-floob-gloop-a'><path id='cs-u-path-g0-s116' d='M180.72 783.49c-.76-15.82-8.3-23.08-9.09-42.46-.34-8.45-1.53-16.89-1.53-27.59 0-6.41-.9-12.61-1.8-18.37-.6-3.86-1.21-7.53-1.55-10.92-.84-8.45-1.37-46.73-1.42-61.38-.04-13.41-2.22-26.68-3.22-37.66-1.77-19.67-2.23-32.9-5.47-32.9-4.31 0-5 15.2-6.8 33.78-1.14 11.81-3.06 24.74-3.36 36.78-.37 14.64-.58 52.93-1.42 61.38-.32 3.27-.9 6.8-1.48 10.51-.92 5.87-1.86 12.22-1.86 18.77 0 10.7-1.18 19.14-1.53 27.59-.85 20.83-10.26 31.67-9.67 46.16.1 2.38.31 4.98.74 7.62 2.81 10.81 12.68 18.85 24.33 18.85s21.91-8.37 24.49-19.51c.4-1.75.63-3.56.64-5.42.03-.52.05-1.04.06-1.55.02-1.29 0-2.51-.06-3.7v.02Z' fill='var(--g0)' stroke='#221e1f'/><path id='cs-u-path-g0-s117' d='M142.46 749.41c-1.26.27-.92 9.6-4.69 18.74-4.37 10.6-7.04 29.7 1.45 29.96 3.65.11 5.68-5.07 3.99-10.14s-3.35-12.39-1.69-20.69c1.21-6.04 1.56-18.01.94-17.88Z' fill='var(--g0)'/><circle id='cs-u-circle-g0-s12' r='2.19' transform='translate(142.72 801.82)' fill='var(--g0)'/><path id='cs-u-path-g0-s118' d='M155.87 554.45c-1.52 7.2-1.71 14.58-2.26 21.91l-1.75 22.01c-.42 7.38-2.07 14.62-2.15 21.88-.62 17.48.64 34.96-.48 52.41-.34 6.43-.11 12.96-1.42 19.33-1.22 5.13-2.72 10.91-2.91 16.17-.2 3.63.14 7.3.24 10.99.13 3.69-.22 7.39-.94 11 .51-3.65.67-7.32.41-10.98-.24-3.66-.74-7.31-.69-11.05.04-5.37 1.41-11.18 2.51-16.42 1.11-6.3.72-12.75 1.05-19.16.94-17.44-.45-34.93.41-52.36.17-7.42 1.78-14.63 2.44-21.99l2.3-21.93c.89-7.29 1.24-14.73 3.23-21.83v.02Z' fill='var(--g0)'/></g></g></g>";
  string internal constant C_FLOOB_GLOOP_B = "<g id='cs-u-c-gloop-b_to' transform='translate(155.64 392.93)'><g id='cs-u-c-gloop-b' transform='translate(-155.64 -682.93)'><g id='cs-u-floob-gloop-b'><path id='cs-u-path-g0-s114' d='M158.87 675.48c-1.69-6.76-2.03-9.7-2.88-9.74-.65-.03-.77 1.67-3.28 9.93-1.81 5.97-1.98 6.34-2.39 8.14-1.27 5.71-1.88 8.62-.65 11.72.02.06.05.14.1.24.82 1.97 2.92 4.11 5.63 4.33 2.7.22 5.18-1.54 6.15-3.67 1.1-2.39.97-6.9-.47-12.16s-.98-3.85-2.21-8.79Z' fill='var(--g0)' stroke='#221e1f'/><path id='cs-u-path-g0-s115' d='M155.7 670.22c-.79 4.45-1.92 8.84-3.02 13.21-.82 4.17-2.82 8.8-.43 12.76.57 1.1 1.48 2.01 2.65 2.61-.63-.16-1.24-.43-1.79-.82-4.31-3.38-3.29-8.43-2.2-12.98 1.21-5.06 2.84-9.96 4.78-14.78Z' fill='var(--g0)'/></g></g></g>";
  string internal constant C_FLOOB_GLOOP_C = "<g id='cs-u-c-gloop-c_to' transform='translate(155.61 402.93)'><g id='cs-u-c-gloop-c' transform='translate(-155.61 -682.93)'><g id='cs-u-floob-gloop-c'><circle id='cs-u-circle-g0-s1' r='3.29' transform='translate(155.61 682.93)' fill='var(--g0)' stroke='#221e1f'/><path id='cs-u-path-g0-s113' d='M154.82 684.04s-.05-.03-.08-.05c0 0-.1-.08-.06-.04.04.03-.03-.03-.03-.03-.03-.02-.05-.05-.08-.08-.03-.04-.07-.07-.1-.11 0-.01-.03-.04-.03-.05-.02-.02-.03-.05-.05-.08-.03-.06-.07-.12-.09-.18l-.03-.1c-.02-.06-.03-.13-.05-.19v-.32c0-.03 0-.06.02-.09 0-.07.03-.13.05-.2v-.04c0-.02.03-.07.03-.07.03-.06.06-.12.1-.18.02-.03.03-.05.05-.08 0 0 .09-.1.14-.15.03-.03.06-.05.08-.07l.03-.02c.21-.15.33-.44.18-.68-.14-.21-.45-.34-.68-.18-.64.44-1.06 1.19-1.03 1.98.03.77.46 1.48 1.12 1.88.22.14.56.06.68-.18.13-.24.06-.54-.18-.68Z' fill='var(--g0)'/></g></g></g>";

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
    if (assetID == 1000) {
      return C_FLOOB_GLOOP_A;
    } else if (assetID == 1001) {
      return C_FLOOB_GLOOP_B;
    } else if (assetID == 1002) {
      return C_FLOOB_GLOOP_C;
    } else if (assetID == 1004) {
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
    if (assetID == 1000) {
      return 3;
    } else if (assetID == 1001) {
      return 3;
    } else if (assetID == 1002) {
      return 3;
    } else if (assetID == 1004) {
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