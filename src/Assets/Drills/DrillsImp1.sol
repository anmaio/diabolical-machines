// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract DrillsImp1 {

  string internal constant C_FIXTURE = "<g id='drl-u-c-fixture'><path id='drl-s-path169' fill='url(#drl-s-path169-fill)' stroke='#1d1d1b' d='M438.08 268.34v7.81c.21 8.99 13.59 16.24 30.07 16.24s30.07-7.36 30.07-16.45v-7.61h-60.15Z'/><ellipse id='drl-s-ellipse3' fill='url(#c0l)' stroke='#171d35' rx='30.07' ry='16.45' transform='translate(468.15 268.34)'/><path id='drl-s-path170' fill='url(#drl-s-path170-fill)' stroke='#1d1d1b' d='M468.15 280.78c-15.37 0-26.07-6.56-26.07-12.45s10.71-12.45 26.07-12.45 26.08 6.56 26.08 12.45-10.71 12.45-26.08 12.45Z'/><path id='drl-s-path171' fill='url(#c0l)' stroke='#171d35' d='M467.9 275.71c-9.83 0-16.68-4.2-16.68-7.96s6.85-7.96 16.68-7.96 16.69 4.2 16.69 7.96-6.85 7.96-16.69 7.96Z'/></g>";
  string internal constant C_TUBE_G = "";
  string internal constant C_TUBE_E = "<g id='drl-u-c-tube_b'><path id='drl-s-path163' fill='url(#drl-s-path163-fill)' stroke='#000' stroke-width='1.01' d='M487.32 446.41c0 5.53-8.55 10-19.09 10s-19.09-4.48-19.09-10V285.05c0-5.53 8.55-10 19.09-10s19.09 4.48 19.09 10v161.36Z'/><path id='drl-s-line5' fill='none' stroke='#fff' stroke-width='3' d='M456.64 294.56V450.5'/></g>";
  string internal constant C_TUBE_F = "<g id='drl-u-c-tube'><path id='drl-s-path57' fill='url(#drl-s-path57-fill)' stroke='#000' stroke-width='1.01' d='M487.42 724.79c0 5.53-8.55 10-19.09 10s-19.09-4.48-19.09-10V509.34c0-5.53 8.55-10 19.09-10s19.09 4.48 19.09 10v215.45Z'/><path id='drl-s-line1' fill='none' stroke='#fff' stroke-width='3' d='M456.74 507.63v219.64'/></g>";
  string internal constant C_PIPE_MINE_A = "<g id='drl-u-c-pipe-mine-a'><g id='drl-u-c-mineral-c2-min-all'><g id='drl-u-mask-group3' mask='url(#drl-u-masks3)'><g style='offset-path:path(&quot;M779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717C782.503288,460.909443,745.740002,428.525129,898.133284,353.583233Q909.807586,274.216429,779.05,232.967717&quot;);offset-rotate:0deg;animation:drl-u-c-mineral-c2-min_to__to 20000ms linear 999 normal forwards'><g id='drl-u-c-mineral-c2-min' style='isolation:isolate' transform='translate(-319.9767 -584.6144)'><g id='drl-u-min-prts'><circle id='drl-s-circle15' r='9.16' fill='url(#g0)' stroke='#000' stroke-width='.5' transform='translate(332.59 577.44)'/><path id='drl-s-path177' fill='url(#g0)' d='M336.81 569.33c1.84 1.76 2.95 4.28 2.82 7.03-.23 5.05-4.51 8.96-9.56 8.73-1.38-.06-2.66-.43-3.81-1.03 1.54 1.48 3.6 2.43 5.91 2.54 5.05.23 9.33-3.68 9.56-8.73.17-3.68-1.86-6.93-4.92-8.53Z' opacity='.3' style='mix-blend-mode:multiply'/><circle id='drl-s-circle16' r='5.89' fill='url(#g0)' stroke='#000' stroke-width='.5' transform='translate(314.3 571.86)'/><path id='drl-s-path178' fill='url(#g0)' d='M317.01 566.64c1.19 1.13 1.9 2.75 1.82 4.52-.15 3.25-2.9 5.76-6.15 5.62-.88-.04-1.71-.28-2.45-.66.99.95 2.32 1.56 3.8 1.63 3.25.15 6-2.37 6.15-5.62.11-2.36-1.2-4.46-3.17-5.49Z' opacity='.3' style='mix-blend-mode:multiply'/><circle id='drl-s-circle17' r='15.83' fill='url(#g0)' stroke='#000' stroke-width='.5' transform='translate(320.84 584.66)'/><path id='drl-s-path179' fill='url(#g0)' d='M328.14 570.64c3.19 3.05 5.1 7.39 4.88 12.14-.4 8.73-7.8 15.49-16.53 15.09-2.38-.11-4.6-.75-6.58-1.78 2.67 2.55 6.23 4.2 10.21 4.38 8.73.4 16.13-6.36 16.53-15.09.29-6.35-3.22-11.99-8.51-14.75Z' opacity='.3' style='mix-blend-mode:multiply'/><circle id='drl-s-circle18' r='9.16' fill='url(#g0)' stroke='#000' stroke-width='.5' transform='translate(307.53 580.32)'/><path id='drl-s-path180' fill='url(#g0)' d='M311.75 572.21c1.84 1.76 2.95 4.28 2.82 7.03-.23 5.05-4.51 8.96-9.56 8.73-1.38-.06-2.66-.43-3.81-1.03 1.54 1.48 3.6 2.43 5.91 2.54 5.05.23 9.33-3.68 9.56-8.73.17-3.68-1.86-6.93-4.92-8.53Z' opacity='.3' style='mix-blend-mode:multiply'/><circle id='drl-s-circle19' r='6.08' fill='url(#g0)' stroke='#000' stroke-width='.5' transform='translate(333.03 591.59)'/><path id='drl-s-path181' fill='url(#g0)' d='M335.83 586.2c1.22 1.17 1.96 2.84 1.88 4.67-.15 3.35-3 5.95-6.35 5.8-.91-.04-1.77-.29-2.53-.68 1.03.98 2.39 1.61 3.92 1.68 3.35.15 6.2-2.44 6.35-5.8.11-2.44-1.24-4.61-3.27-5.66Z' opacity='.3' style='mix-blend-mode:multiply'/><circle id='drl-s-circle20' r='4.77' fill='url(#g0)' stroke='#000' stroke-width='.5' transform='translate(310.51 595.45)'/><path id='drl-s-path182' fill='url(#g0)' d='M312.71 591.23c.96.92 1.54 2.23 1.47 3.66-.12 2.63-2.35 4.67-4.98 4.55-.72-.03-1.39-.23-1.98-.54.8.77 1.88 1.27 3.08 1.32 2.63.12 4.86-1.92 4.98-4.55.09-1.91-.97-3.61-2.57-4.44Z' opacity='.3' style='mix-blend-mode:multiply'/></g></g></g><mask id='drl-u-masks3' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='drl-u-mask2' fill='url(#c2b)' d='M878.53 388.01c-.83-6.09-3.19-13.21-7.42-20.51-7.36-12.7-17.04-20.25-24.31-21.87-2.64-.59-4.97-.42-6.74.61h-.01l-.04-.08-27.13 17.05V332.6l.32-61.28v-.02c0-7.67-13.95-16.21-33.96-16.21s-33.96 8.54-33.96 16.21l.02 45.5-.23 65.03c-.17 23.74 9.49 40.82 26.5 51.47 17.03 10.63 38.21 10.17 58.12-1.22l44.58-27.04v-.16c3.71-2.32 5.38-8.65 4.25-16.87Z' transform='translate(0 .8588)'/></mask></g></g><path id='drl-s-path183' fill='none' stroke='#fff' stroke-width='.5' d='M779.05 319.58c19.63 0 33.31 8.2 33.31 15.56s-13.68 15.56-33.31 15.56-33.31-8.2-33.31-15.56 13.68-15.56 33.31-15.56Z'/><path id='drl-s-path184' fill='none' stroke='#fff' stroke-width='.5' d='M820.09 359.48c6.28-3.83 20.41 3.57 30.63 20.33 10.22 16.75 10.35 32.7 4.07 36.53s-20.41-3.57-30.63-20.33c-10.22-16.75-10.35-32.7-4.07-36.54Z'/><path id='drl-s-path185' fill='none' stroke='#000' d='M878.53 388.01c-.83-6.09-3.19-13.21-7.42-20.51-7.36-12.7-17.04-20.25-24.31-21.87-2.64-.59-4.97-.42-6.74.61h-.01l-.04-.08-27.13 17.05V332.6l.32-61.28v-.02c0-7.67-13.95-16.21-33.96-16.21s-33.96 8.54-33.96 16.21l.02 45.5-.23 65.03c-.17 23.74 9.49 40.82 26.5 51.47 17.03 10.63 38.21 10.17 58.12-1.22l44.58-27.04v-.16c3.71-2.32 5.38-8.65 4.25-16.87Z'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#drl-s-path186' stroke-width='3'/></g>";
  string internal constant C_PIPE_MINE_A2 = "<g id='drl-u-c-pipe-mine-a2'><path id='drl-s-path187' fill='url(#drl-s-path187-fill)' stroke='#1d1d1b' d='M878.53 388.01c-.83-6.09-3.19-13.21-7.42-20.51-7.36-12.7-17.04-20.25-24.31-21.87-2.64-.59-4.97-.42-6.74.61h-.01l-.04-.08-27.13 17.05V332.6l.32-61.28v-.02c0-7.67-13.95-16.21-33.96-16.21s-33.96 8.54-33.96 16.21l.02 45.5-.23 65.03c-.17 23.74 9.49 40.82 26.5 51.47 17.03 10.63 38.21 10.17 58.12-1.22l44.58-27.04v-.16c3.71-2.32 5.38-8.65 4.25-16.87Z'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#drl-s-path186' id='drl-s-path188' stroke-width='3'/></g>";
  string internal constant C_CONNECTOR_B = "<g id='drl-u-c-connector-b'><path id='drl-s-path189' fill='url(#drl-s-path189-fill)' stroke='#1d1d1b' d='M739.88 270.7v10.18c.28 11.7 17.7 21.15 39.17 21.15 21.63 0 39.17-9.59 39.17-21.42v-9.9h-78.33Z'/><ellipse id='drl-s-ellipse5' fill='url(#c0l)' stroke='#171d35' rx='39.17' ry='21.42' transform='translate(779.04 270.7)'/><path id='drl-s-path190' fill='url(#drl-s-path190-fill)' stroke='#1d1d1b' d='M779.04 286.91c-20.01 0-33.96-8.54-33.96-16.21s13.95-16.21 33.96-16.21S813 263.03 813 270.7s-13.95 16.21-33.96 16.21Z'/></g>";
  string internal constant C_CONNECTORR_B = "<g id='drl-u-c-connectorr-b'><path id='drl-s-path175' fill='url(#drl-s-path175-fill)' stroke='#1d1d1b' d='m876.7 409.56 8.8-5.11c9.99-6.1 9.44-25.91-1.32-44.48-10.84-18.72-27.93-29.09-38.16-23.16l-8.57 4.96 39.26 67.79Z'/><ellipse id='drl-s-ellipse4' fill='url(#c0l)' stroke='#171d35' rx='21.42' ry='39.17' transform='rotate(-30.08 1127.4328 -1407.0447)'/><path id='drl-s-path176' fill='url(#drl-s-path176-fill)' stroke='#1d1d1b' d='M871.1 367.54c10.03 17.32 9.62 33.67 2.99 37.51s-21.02-3.95-31.04-21.26c-10.03-17.32-9.63-33.67-2.99-37.51 6.63-3.84 21.02 3.95 31.04 21.26Z'/></g>";
  string internal constant C_HOLE_A_A1 = "<g id='drl-u-hole-main' transform='translate(-623.3377 -719.397)'><path id='drl-s-path5' fill='url(#drl-s-path5-fill)' stroke='#1d1d1b' stroke-width='.5' d='M591.29 711.09c17.37-10.05 46.15-9.79 63.96.57 6.52 3.79 10.65 8.41 12.42 13.23 2.72-8.18-1.47-17.08-12.62-23.56-17.81-10.36-46.6-10.62-63.96-.57-10.99 6.36-14.93 15.33-11.9 23.65 1.59-4.9 5.6-9.57 12.09-13.32Z'/><path id='drl-s-path6' fill='#000' stroke='#1d1d1b' stroke-width='.5' d='M585.45 733.27c1.7 1.52 3.68 2.97 5.98 4.31 17.55 10.21 46.33 10.46 63.96.57.33-.19.61-.39.93-.58 4.42-2.64 7.62-5.72 9.63-9.01.73-1.2 1.3-2.43 1.71-3.67-1.77-4.82-5.9-9.44-12.42-13.23-17.81-10.36-46.6-10.62-63.96-.57-6.49 3.75-10.5 8.42-12.09 13.32.42 1.16.97 2.3 1.67 3.43 1.16 1.89 2.67 3.72 4.59 5.44Z'/></g>";
  string internal constant C_HOLE_A_A4 = "";
  string internal constant C_BIT_D = "<g id='drl-u-c-bit-d-2' transform='translate(-155 92)'><path id='drl-s-path42' fill='url(#drl-s-path42-fill)' stroke='#000' stroke-width='1.01' d='M642.67 631.06v4.04c0 5.53-8.55 10-19.09 10s-19.09-4.48-19.09-10v-3.68c-4.05 2.53-6.51 5.86-6.51 9.5v103.02c0 7.92 5.43 29.68 25.91 29.68 21.72 0 25.91-21.76 25.91-29.68V640.92c0-3.82-2.71-7.29-7.12-9.87Z'/><path id='drl-s-path43' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M643 741.7c-1.96-.49-2.79-3.91-1.86-7.65s3.27-6.37 5.23-5.88l4.43 1.11c1.96.49 7.06 2.92 5.65 8.59-1.33 5.34-7.06 5.42-9.02 4.93l-4.43-1.11Z'/><path id='drl-s-path44' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M647.42 667.4c-2.02-.02-3.62-3.16-3.58-7.01s1.71-6.95 3.73-6.93l4.57.05c2.02.02 7.55 1.21 7.48 7.05-.06 5.51-5.62 6.91-7.63 6.89l-4.57-.05Z'/><path id='drl-s-path45' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M599.71 692.29c2.02-.02 3.62-3.16 3.58-7.01s-1.71-6.95-3.73-6.93l-4.57.05c-2.02.02-7.55 1.21-7.48 7.05.06 5.51 5.62 6.91 7.63 6.89l4.57-.05Z'/><g id='drl-s-g10'><path id='drl-s-path46' fill='url(#c0l)' d='M626.67 680.98c2.32 1.11 3.92 3.46 3.92 6.2 0 3.8-3.08 6.88-6.88 6.88-.27 0-.54-.02-.8-.05.9.43 1.9.68 2.96.68 3.8 0 6.88-3.08 6.88-6.88 0-3.53-2.66-6.43-6.08-6.83Z' opacity='.3' style='mix-blend-mode:color-burn'/><circle id='drl-s-circle5' r='6.88' fill='url(#c2b)' stroke='#000' stroke-width='.94' transform='translate(623.71 687.19)'/></g></g>";
  
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 13000) {
      return C_FIXTURE;
    } else if (assetID == 13001) {
      return C_TUBE_G;
    } else if (assetID == 13002) {
      return C_TUBE_E;
    } else if (assetID == 13003) {
      return C_TUBE_F;
    } else if (assetID == 13004) {
      return C_PIPE_MINE_A;
    } else if (assetID == 13005) {
      return C_PIPE_MINE_A2;
    } else if (assetID == 13006) {
      return C_CONNECTOR_B;
    } else if (assetID == 13007) {
      return C_CONNECTORR_B;
    } else if (assetID == 13008) {
      return C_HOLE_A_A1;
    } else if (assetID == 13009) {
      return C_HOLE_A_A4;
    } else if (assetID == 13010) {
      return C_BIT_D;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 13000) {
      return 3;
    } else if (assetID == 13001) {
      return 1;
    } else if (assetID == 13002) {
      return 3;
    } else if (assetID == 13003) {
      return 3;
    } else if (assetID == 13004) {
      return 3;
    } else if (assetID == 13005) {
      return 3;
    } else if (assetID == 13006) {
      return 3;
    } else if (assetID == 13007) {
      return 3;
    } else if (assetID == 13008) {
      return 3;
    } else if (assetID == 13009) {
      return 3;
    } else if (assetID == 13010) {
      return 3;
    } else {
      return 0;
    }
  }
}