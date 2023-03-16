// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./Additional/CellsAdditional1.sol";
import "./Additional/CellsAdditional2.sol";
import "./Additional/CellsAdditional3.sol";
import "./Additional/CellsAdditional4.sol";
import "./Additional/CellsAdditional5.sol";

contract CellsImp5 {

  string internal C_CELL_B_JUMPER = string.concat(CellsAdditional1.getPart(), CellsAdditional2.getPart(), CellsAdditional3.getPart());

  string internal C_CELL_C_JUMPER = string.concat(CellsAdditional4.getPart(), CellsAdditional5.getPart());
  
  string internal constant C_SHELF = "<g id='cs-u-c-shelf-2'><path id='cs-u-path-c0-s2' d='M323.65 374.63v8.76l144.51 83.19v-8.78l-144.51-83.17Z' fill='var(--c0l)' stroke='#000'/><path id='cs-u-polygon-c0-s2' fill='url(#cs-u-polygon-c0-s2-fill)' stroke='#000' d='m323.65 374.63 138.81-80.83 144.48 83.18-138.78 80.83-144.51-83.18z'/><path id='cs-u-path-c0-s12' d='M468.14 457.81v8.78l138.81-80.82v-8.76l-138.81 80.8Z' fill='url(#cs-u-path-c0-s12-fill)' stroke='#000'/></g>";

  string internal constant C_CELL_A = "<g id='cs-u-m-cell-a-3' transform='translate(0 -199)'><g id='cs-u-c-tube-c2-s12'><path id='cs-u-path-c1-s' d='m474.84 547.18-32-3.02-.03 81.67h.04c.17 7.42 11.22 13.41 24.83 13.41s24.84-6.08 24.84-13.58v-81.5l-17.68 3.02Z' fill='url(#cs-u-path-c1-s-fill-c2-s12)' stroke='#000' stroke-width='1.01'/><ellipse id='cs-s-ellipse31' rx='24.84' ry='13.58' transform='translate(467.68 535.16)' fill='url(#cs-s-ellipse20-fill-c2-s1)' stroke='#000' stroke-width='1.01'/></g><g id='cs-u-c-cube'><path id='cs-u-polygon-c1-s3' fill='url(#cs-u-polygon-c1-s3-fill)' stroke='#000' d='m363.86 429.54 104.58 60.6 103.69-60.36-103.69-60.09-104.58 59.85z'/><path id='cs-s-path363' d='M467.68 454.17c-21.57 0-37.84-11.43-37.84-26.58s16.27-26.58 37.84-26.58 37.84 11.43 37.84 26.58-16.27 26.58-37.84 26.58Z' fill='none' stroke='#1d1d1b' stroke-width='.5' stroke-dasharray='0 3'/><path id='cs-u-path-c1-s3' d='M467.68 448.17c-18.15 0-31.84-8.85-31.84-20.58s13.69-20.58 31.84-20.58 31.84 8.85 31.84 20.58-13.69 20.58-31.84 20.58Z' fill='var(--c1l)' stroke='#171d35'/><path id='cs-u-path-c1-s22' d='M468.44 490.14v123.95l103.69-59.58V429.78l-103.69 60.37Z' fill='url(#cs-u-path-c1-s22-fill)' stroke='#000'/><path id='cs-u-path-c1-s14' d='M468.44 614.09V490.14l-104.58-60.6v123.95l104.58 60.6Z' fill='url(#cs-u-path-c1-s14-fill)' stroke='#000' stroke-width='1.01'/><g id='cs-s-g51'><path id='cs-s-line19' fill='none' stroke='#1d1d1b' stroke-width='.5' d='m560.69 423.99-1.3.76'/><path id='cs-s-line20' fill='none' stroke='#1d1d1b' stroke-width='.5' stroke-dasharray='0 0 2.96 2.96' d='m556.84 426.24-95.79 55.94'/><path id='cs-s-polyline1' fill='none' stroke='#1d1d1b' stroke-width='.5' d='m459.78 482.92-1.3.76v1.5'/><path id='cs-s-line21' fill='none' stroke='#1d1d1b' stroke-width='.5' stroke-dasharray='0 0 2.95 2.95' d='M458.48 488.13v116.46'/><path id='cs-s-line22' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M458.48 606.07v1.5'/></g><g id='cs-s-g52'><path id='cs-s-line23' fill='none' stroke='#1d1d1b' stroke-width='.5' d='m475.69 374.94-1.29.76'/><path id='cs-s-line24' fill='none' stroke='#1d1d1b' stroke-width='.5' stroke-dasharray='0 0 2.96 2.96' d='m471.84 377.19-95.78 55.94'/><path id='cs-s-polyline2' fill='none' stroke='#1d1d1b' stroke-width='.5' d='m374.78 433.88-1.29.76v1.5'/><path id='cs-s-line25' fill='none' stroke='#1d1d1b' stroke-width='.5' stroke-dasharray='0 0 2.95 2.95' d='M373.49 439.08v116.47'/><path id='cs-s-line26' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M373.49 557.02v1.5'/></g><g id='cs-u-dots-c1-s3'><ellipse id='cs-s-ellipse32' rx='3.94' ry='2.96' transform='rotate(-66.6 614.536 -114.319)' fill='var(--c1b)' stroke='#ebebeb' stroke-width='.5'/><ellipse id='cs-s-ellipse33' rx='3.94' ry='2.96' transform='rotate(-66.6 696.536 -60.444)' fill='var(--c1b)' stroke='#ebebeb' stroke-width='.5'/><ellipse id='cs-s-ellipse34' rx='3.94' ry='2.96' transform='rotate(-66.6 620.213 -209.073)' fill='var(--c1b)' stroke='#ebebeb' stroke-width='.5'/><ellipse id='cs-s-ellipse35' rx='3.94' ry='2.96' transform='rotate(-66.6 702.218 -155.205)' fill='var(--c1b)' stroke='#ebebeb' stroke-width='.5'/></g></g><path id='cs-u-c-slit2' d='m555.71 490.18-67.19 38.77c-1.9 1.1-4.27-.27-4.27-2.47v-16.72c0-1.02.54-1.96 1.43-2.47l67.19-38.77c1.9-1.1 4.27.27 4.27 2.47v16.72c0 1.02-.54 1.96-1.43 2.47Z'/><g id='cs-u-c-captive-eyes2'><g id='cs-u-eyes-both2'><g id='cs-u-eye-l2'><g id='cs-s-ellipse36_ts' transform='rotate(-26 1328.057 -915.474)'><ellipse id='cs-s-ellipse36' rx='9.42' ry='5.13' transform='translate(.03 -.517)' fill='#fff'/></g><ellipse id='cs-s-ellipse37' rx='5.25' ry='3.97' transform='rotate(-66 644.854 -168.119)'/></g><g id='cs-u-eye-r2' transform='translate(-28 15)'><g id='cs-s-ellipse38_ts' transform='rotate(-26 1328.057 -915.474)'><ellipse id='cs-s-ellipse38' rx='9.42' ry='5.13' transform='translate(.03 -.517)' fill='#fff'/></g><ellipse id='cs-s-ellipse39' rx='5.25' ry='3.97' transform='rotate(-66 644.854 -168.119)'/></g></g></g><g id='cs-u-c-light-a4' transform='translate(0 -3)'><g id='cs-u-c-l-bs-g3'><ellipse id='cs-u-ellipse-c2-s17' rx='28.05' ry='16.37' transform='rotate(-59 741.916 -197.278)' fill='var(--c2l)' stroke='#1d1d1b'/><ellipse id='cs-u-ellipse-c2-s18' rx='28.05' ry='16.37' transform='rotate(-59 745.405 -199.286)' fill='var(--c2l)' stroke='#1d1d1b'/><path id='cs-u-path-c2-s14' d='M523.98 563.71c-1.25 0-2.35-.28-3.27-.84-2.37-1.42-3.71-4.82-3.65-9.33.06-5.32 2.06-11.64 5.49-17.35 6.19-10.32 14.39-15.03 19.4-15.03 1.25 0 2.35.28 3.27.84 4.93 2.95 5.38 14.64-1.84 26.68-6.19 10.32-14.39 15.02-19.4 15.02Z' fill='var(--c2l)' stroke='#221e1f'/></g><g id='cs-u-c-l-on4_ts' transform='translate(544.051 549.303)'><g id='cs-u-c-l-on4' transform='translate(-544.051 -549.303)'><ellipse id='cs-u-orb4' rx='21.92' ry='21.89' transform='rotate(-30 1297.038 -740.56)' fill='#fae676' stroke='#221e1f'/><ellipse id='cs-u-orb-idle4' rx='21.92' ry='21.89' transform='rotate(-30 1297.038 -740.56)' fill='#ebebeb' stroke='#221e1f'/><path id='cs-s-path364' style='mix-blend-mode:color-burn' d='M530.12 566.19c6.14 2.65 13.41 2.49 19.66-1.12 10.48-6.05 14.08-19.44 8.04-29.91a21.712 21.712 0 0 0-5.05-5.93c4.17 1.8 7.82 4.88 10.26 9.11 6.04 10.47 2.45 23.86-8.04 29.91-8.14 4.7-18.02 3.57-24.87-2.06Z' opacity='.3' fill='#221e1f'/><g id='cs-s-g53'><path id='cs-s-path365' d='M528.26 554.59c-1.41.3-3.4-.48-3.62-2.12-.24-1.79-.25-3.45.01-5.24.22-1.53.7-2.96 1.31-4.38 1.23-2.88 3.31-5.26 5.83-7.09 1.26-.91 3.36-.24 4.05 1.09.79 1.52.28 3.02-1.03 4l.03-.03c-.1.1-.22.18-.33.27-.24.2-.47.41-.69.63-.41.4-.77.82-1.14 1.25-.07.09-.13.19-.2.28-.18.26-.34.52-.5.79-.3.51-.54 1.03-.8 1.56-.03.09-.07.18-.1.27-.11.29-.2.59-.29.89-.16.56-.27 1.12-.37 1.69-.01.13-.03.26-.04.39-.02.28-.03.57-.04.85 0 .28 0 .57.01.85.01.26.14 1.38.02.42.11.8.12 1.49-.29 2.22-.36.64-1.1 1.24-1.83 1.4Z' fill='#fff'/><path id='cs-s-path366' d='M534.76 540.9s.04-.03.06-.05c-.52.53-.28.21-.06.05Z' fill='#fff'/></g><path id='cs-s-path367' d='M539.24 535.63c-1.91-3.31 3.23-6.28 5.14-2.97s-3.23 6.28-5.14 2.97Z' fill='#fff'/></g></g></g><g id='cs-u-c-pipel-a2'><path id='cs-u-polyline-shadow2' style='mix-blend-mode:color-burn' opacity='.3' fill='#221e1f' d='m450.14 438.97-54.65-30.71-21.19-72.85 38.37-18.1 17.46 64.76 56.31 27.59-34.35 27.59'/><g id='cs-u-c-pipel-a-m-g-c2-s1'><ellipse id='cs-s-ellipse40' rx='24.84' ry='13.58' transform='translate(467.67 426.18)' fill='url(#cs-s-ellipse20-fill-c2-s1)' stroke='#000' stroke-width='1.01'/><ellipse id='cs-s-ellipse41' rx='24.84' ry='13.58' transform='rotate(-60 478.701 -174.027)' fill='url(#cs-s-ellipse41-fill-c2-s1)' stroke='#000' stroke-width='1.01'/><path id='cs-s-path368' d='m442.84 419.74-.03 6.61h.04c.17 7.42 11.22 13.41 24.83 13.41s24.84-6.08 24.84-13.58v-6.44h-49.68Z' fill='url(#cs-s-path368-fill-c2-s1)' stroke='#000' stroke-width='1.01'/><ellipse id='cs-s-ellipse42' rx='24.84' ry='13.58' transform='translate(467.68 418.44)' fill='url(#cs-s-ellipse42-fill-c2-s1)' stroke='#000'/><path id='cs-s-path369' d='M467.68 429.02c-12.87 0-21.84-5.58-21.84-10.58s8.97-10.58 21.84-10.58 21.84 5.58 21.84 10.58-8.97 10.58-21.84 10.58Z' fill='url(#cs-s-path369-fill-c2-s1)' stroke='#000' stroke-width='1.01'/><g id='cs-u-c-mineral-c2-min-all-2' transform='translate(-422.689 80.93)'><g id='cs-u-clip-group3' clip-path='url(#cs-u-clipping-paths3)'><g id='cs-u-c-mineral-c2-min3' style='isolation:isolate' transform='translate(459.122 -290.082)'><g id='cs-u-min-prts-g0-s13_to' style='offset-path:path(\"M430.059998,653.22995C432.936966,567.362506,427.771964,581.012503,320.059998,523.22995L430.059998,653.22995L430.059998,653.22995C432.936966,567.362506,427.771964,581.012503,320.059998,523.22995L430.059998,653.22995L430.059998,653.22995C432.936966,567.362506,427.771964,581.012503,320.059998,523.22995L430.059998,653.22995L430.059998,653.22995C432.936966,567.362506,427.771964,581.012503,320.059998,523.22995L430.059998,653.22995L430.059998,653.22995C432.936966,567.362506,427.771964,581.012503,320.059998,523.22995L430.059998,653.22995L430.059998,653.22995C432.936966,567.362506,427.771964,581.012503,320.059998,523.22995L430.059998,653.22995\");offset-rotate:0deg'><g id='cs-u-min-prts-g0-s13' transform='translate(-320.06 -583.23)'><circle id='cs-s-circle13' r='9.16' transform='translate(332.59 577.44)' fill='var(--g0)' stroke='#000' stroke-width='.5'/><path id='cs-s-path370' style='mix-blend-mode:multiply' d='M336.81 569.33a9.114 9.114 0 0 1 2.82 7.03c-.23 5.05-4.51 8.96-9.56 8.73a9.039 9.039 0 0 1-3.81-1.03 9.116 9.116 0 0 0 5.91 2.54c5.05.23 9.33-3.68 9.56-8.73.17-3.68-1.86-6.93-4.92-8.53Z' opacity='.3' fill='var(--g0)'/><circle id='cs-s-circle14' r='5.89' transform='translate(314.3 571.86)' fill='var(--g0)' stroke='#000' stroke-width='.5'/><path id='cs-s-path371' style='mix-blend-mode:multiply' d='M317.01 566.64a5.849 5.849 0 0 1 1.82 4.52 5.898 5.898 0 0 1-6.15 5.62c-.88-.04-1.71-.28-2.45-.66.99.95 2.32 1.56 3.8 1.63 3.25.15 6-2.37 6.15-5.62.11-2.36-1.2-4.46-3.17-5.49Z' opacity='.3' fill='var(--g0)'/><circle id='cs-s-circle15' r='15.83' transform='translate(320.84 584.66)' fill='var(--g0)' stroke='#000' stroke-width='.5'/><path id='cs-s-path372' style='mix-blend-mode:multiply' d='M328.14 570.64c3.19 3.05 5.1 7.39 4.88 12.14-.4 8.73-7.8 15.49-16.53 15.09-2.38-.11-4.6-.75-6.58-1.78 2.67 2.55 6.23 4.2 10.21 4.38 8.73.4 16.13-6.36 16.53-15.09.29-6.35-3.22-11.99-8.51-14.75Z' opacity='.3' fill='var(--g0)'/><circle id='cs-s-circle16' r='9.16' transform='translate(307.53 580.32)' fill='var(--g0)' stroke='#000' stroke-width='.5'/><path id='cs-s-path373' style='mix-blend-mode:multiply' d='M311.75 572.21a9.114 9.114 0 0 1 2.82 7.03c-.23 5.05-4.51 8.96-9.56 8.73a9.039 9.039 0 0 1-3.81-1.03 9.116 9.116 0 0 0 5.91 2.54c5.05.23 9.33-3.68 9.56-8.73.17-3.68-1.86-6.93-4.92-8.53Z' opacity='.3' fill='var(--g0)'/><circle id='cs-s-circle17' r='6.08' transform='translate(333.03 591.59)' fill='var(--g0)' stroke='#000' stroke-width='.5'/><path id='cs-s-path374' style='mix-blend-mode:multiply' d='M335.83 586.2a6.087 6.087 0 0 1 1.88 4.67c-.15 3.35-3 5.95-6.35 5.8-.91-.04-1.77-.29-2.53-.68a6.06 6.06 0 0 0 3.92 1.68c3.35.15 6.2-2.44 6.35-5.8a6.066 6.066 0 0 0-3.27-5.66Z' opacity='.3' fill='var(--g0)'/><circle id='cs-s-circle18' r='4.77' transform='translate(310.51 595.45)' fill='var(--g0)' stroke='#000' stroke-width='.5'/><path id='cs-s-path375' style='mix-blend-mode:multiply' d='M312.71 591.23a4.74 4.74 0 0 1 1.47 3.66 4.772 4.772 0 0 1-4.98 4.55c-.72-.03-1.39-.23-1.98-.54.8.77 1.88 1.27 3.08 1.32 2.63.12 4.86-1.92 4.98-4.55.09-1.91-.97-3.61-2.57-4.44Z' opacity='.3' fill='var(--g0)'/></g></g></g><clipPath id='cs-u-clipping-paths3'><path id='cs-u-c-mineral-cpath3' d='M492.49 214.02c0-2.45.03-.46.02-2.83 0-5.07-.02-5.28-.02-5.71 0-23.76-3.63-40.94-31.33-57.46l-58.48-33.8-.02.03c-6.51-3.57-17.22 3.01-24.03 14.8-6.86 11.88-7.15 24.55-.66 28.3l56.17 32.43c8.32 5.13 8.68 9.59 8.71 14.92v6.75l-.02 19.83.477-14.61c0 5.61 9.295 14.218 23.935 14.218s22.707-4.838 22.977-10.388c0 0 1.34-3.82 1.35-3.83Z' transform='translate(422 115)'/></clipPath></g></g><path id='cs-s-path376' d='m471.24 345.69-68.57-39.63-.02.03c-6.51-3.57-17.22 3.01-24.03 14.8-6.86 11.88-7.15 24.55-.66 28.3l68.44 39.51 24.84-43.02Z' fill='url(#cs-s-path376-fill-c2-s1)' stroke='#000' stroke-width='1.01'/><ellipse id='cs-s-ellipse43' rx='24.84' ry='13.58' transform='rotate(-60 534.755 -206.144)' fill='url(#cs-s-ellipse41-fill-c2-s1)' stroke='#000' stroke-width='1.01'/><path id='cs-s-path377' d='M489.45 374.85h-43.6v43.59c0 5.01 8.97 10.58 21.84 10.58s21.84-5.58 21.84-10.58v-43.59h-.08Z' opacity='.45' fill='var(--c2b)' stroke='#26474e'/><path id='cs-s-path378' d='M491.87 365.87c-1.65-15.88-34.49-29.33-34.49-29.33-6.76-3.9-18.01 2.96-25.13 15.31-7.13 12.35-7.42 25.53-.67 29.42.28.16 6.86 4.01 7.81 4.72.37.27.71.8 1.01 1.36.59 1.13.87 2.39.87 3.66v1.52c0 7.8 11.56 14.12 25.82 14.12s25.82-6.32 25.82-14.12v-9.13s-.28-10.18-1.05-17.54Z' fill='url(#cs-s-path378-fill-c2-s1)' stroke='#000' stroke-width='1.01'/><path id='cs-s-line27' fill='none' stroke='#fff' stroke-width='3' d='m378.45 334.01 45.93 24.38'/><path id='cs-s-path379' d='m434.01 364.63 8.78 4.9a21.05 21.05 0 0 1 10.78 17.9l.29 12.35' fill='none' stroke='#fff' stroke-width='3'/><path id='cs-s-line28' fill='none' stroke='#fff' stroke-width='3' d='m453.79 409.49.11 13.88'/></g></g></g>";

  function getAssetFromID(uint assetID) external view returns (string memory) {
    if (assetID == 9020) {
      return C_CELL_B_JUMPER;
    } else if (assetID == 9021) {
      return C_CELL_C_JUMPER;
    } else if (assetID == 9026) {
      return C_SHELF;
    } else if (assetID == 9030) {
      return C_CELL_A;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 9020) {
      return 1;
    } else if (assetID == 9021) {
      return 1;
    } else if (assetID == 9026) {
      return 3;
    } else if (assetID == 9030) {
      return 1;
    } else {
      return 0;
    }
  }
}