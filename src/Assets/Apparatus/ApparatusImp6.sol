// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract ApparatusImp6 {

  string internal constant C_BASE_B = "<g id='as-u-c-base-b-p3'><g id='as-u-c-base-b-p3-c1-s1'><path id='as-s-polygon13' fill='url(#as-s-polygon13-fill-c1-s1)' stroke='#1d1d1b' d='m468.12 540.23 155.89-90 155.86 89.99-155.86 90-155.89-89.99z'/><path id='as-s-path49' d='M468.12 540.23v179.96l155.89 89.99V630.2l-155.89-89.96Z' fill='url(#as-s-path49-fill-c1-s1)' stroke='#1d1d1b'/><path id='as-s-path50' d='M623.99 630.21v179.98l155.89-89.99V540.24L623.99 630.2Z' fill='url(#as-s-path50-fill-c1-s1)' stroke='#1d1d1b'/><path id='as-s-path51' d='M637.59 778.87V643.4c0-3.32 1.77-6.38 4.64-8.03l117.34-67.71c5.31-3.06 11.73-.2 13.46 5.18-1.63-6.22-11.4-10.5-17.06-7.23l-117.34 67.71a9.281 9.281 0 0 0-4.64 8.03v135.47c0 5.38 5.78 10.51 11.27 11.19-4.17-.75-7.67-4.33-7.67-9.13Z' fill='url(#as-s-path51-fill-c1-s1)' stroke='#000'/><path id='as-s-path52' d='M773.03 572.83c-1.72-5.38-8.15-8.24-13.46-5.18l-117.34 67.71a9.281 9.281 0 0 0-4.64 8.03v135.47c0 4.8 3.5 8.38 7.67 9.13 2.03.37 4.22.07 6.24-1.1l117.34-67.73a9.281 9.281 0 0 0 4.64-8.03V575.68c0-1.01-.17-1.97-.46-2.86Z' fill='url(#as-s-path52-fill-c1-s1)' stroke='#1d1d1b'/><ellipse id='as-s-ellipse2' rx='2.79' ry='2.56' transform='rotate(-72 763.181 -121.728)' fill='url(#as-s-ellipse2-fill-c1-s1)' stroke='#000' stroke-width='.5'/><ellipse id='as-s-ellipse3' rx='2.79' ry='2.56' transform='rotate(-72 860.102 -53.326)' fill='url(#as-s-ellipse3-fill-c1-s1)' stroke='#000' stroke-width='.5'/><ellipse id='as-s-ellipse4' rx='2.79' ry='2.56' transform='rotate(-72 874.713 -171.594)' fill='url(#as-s-ellipse4-fill-c1-s1)' stroke='#000' stroke-width='.5'/><ellipse id='as-s-ellipse5' rx='2.79' ry='2.56' transform='rotate(-72 777.504 -239.18)' fill='url(#as-s-ellipse4-fill-c1-s1)' stroke='#000' stroke-width='.5'/></g></g>";
  string internal constant C_BASE_B2 = "<g id='as-u-c-base-b2-p4'><g id='as-u-c-cube-b-c1-s1'><path id='as-s-polygon19' fill='url(#as-s-polygon19-fill-c1-s1)' stroke='#1d1d1b' d='m313.55 629.4 155.89-89.99 155.86 89.98-155.86 90-155.89-89.99z'/><path id='as-s-path114' d='M313.55 629.4v179.96l155.89 89.99V719.37l-155.89-89.96Z' fill='url(#as-s-path114-fill-c1-s1)' stroke='#1d1d1b'/><path id='as-s-path115' d='M469.42 719.39v179.98l155.89-89.99V629.42l-155.89 89.96Z' fill='url(#as-s-path115-fill-c1-s1)' stroke='#1d1d1b'/></g></g>";
  string internal constant C_BASE_H = "<g id='as-u-c-base-h-p4'><g id='as-u-c-cube-b-2-c2-s1'><path id='as-s-polygon20' fill='var(--c2b)' stroke='#1d1d1b' d='m312.16 628.87 155.89-90 155.85 89.98-155.85 90-155.89-89.98z'/><path id='as-s-path116' d='M312.16 628.87v179.96l155.89 89.99V718.84l-155.89-89.96Z' fill='url(#as-s-path116-fill-c2-s1)' stroke='#1d1d1b'/><path id='as-s-path117' d='M468.02 718.85v179.98l155.89-89.99V628.88l-155.89 89.96Z' fill='var(--c2b)' stroke='#1d1d1b'/></g></g>";
  string internal constant C_BASE_G = "<g transform='translate(156,-90)'><g id='as-u-c-base-h5-p5'><g id='as-u-c-base-h5-p5-gr-c2-s1'><path id='as-s-path122' d='M312.2 810V630.02l-155.89 89.99v179.96l155.89-89.96Zm-10-9.67c0 2.41-1.29 4.64-3.38 5.84l-122.4 70.63c-4.5 2.6-10.12-.65-10.12-5.84V729.67c0-2.41 1.29-4.64 3.37-5.84l122.4-70.65c4.5-2.6 10.12.65 10.12 5.84v141.31Z' fill='var(--c2b)' stroke='#1d1d1b'/><path id='as-s-path123' d='M468.07 899.95V719.99L312.18 630v179.98l155.89 89.96ZM322.18 659.01c0-5.19 5.62-8.44 10.12-5.84l122.4 70.65a6.74 6.74 0 0 1 3.37 5.84v141.29c0 5.19-5.62 8.44-10.12 5.84l-122.4-70.63a6.75 6.75 0 0 1-3.38-5.84V659.01Z' fill='var(--c2b)' stroke='#1d1d1b'/><path id='as-s-polygon23' fill='var(--c2l)' stroke='#1d1d1b' d='m156.28 900.04 155.89-89.99 155.86 89.98-155.86 90-155.89-89.99z'/><path id='as-s-path124' d='M156.28 720.08v179.96l155.89 89.99V810.05l-155.89-89.96Zm145.89 240.94c0 5.19-5.62 8.44-10.12 5.84l-122.4-70.65a6.74 6.74 0 0 1-3.37-5.84V749.08c0-5.19 5.62-8.44 10.12-5.84l122.4 70.63a6.75 6.75 0 0 1 3.38 5.84v141.31Z' fill='var(--c2b)' stroke='#1d1d1b'/><path id='as-s-path125' d='M312.15 810.06v179.98l155.89-89.99V720.09l-155.89 89.96Zm10 9.67c0-2.41 1.29-4.64 3.38-5.84l122.4-70.63c4.5-2.6 10.12.65 10.12 5.84v141.29c0 2.41-1.29 4.64-3.37 5.84l-122.4 70.65c-4.5 2.6-10.12-.65-10.12-5.84V819.73Z' fill='var(--c2b)' stroke='#1d1d1b'/><path id='as-s-path126' d='m312.17 630.09-155.89 90 155.89 89.99 155.86-90-155.85-89.98Zm0 168.43-135.89-78.44 135.89-78.45 135.86 78.44-135.86 78.45Z' fill='var(--c2b)' stroke='#1d1d1b'/><path id='as-s-polygon24' fill='url(#as-s-polygon24-fill-c2-s1)' stroke='#000' stroke-width='.86' d='m312.17 641.63-135.89 78.45 135.89 78.44 135.86-78.45-135.86-78.44z'/></g></g></g>";
  string internal constant M_LAPTOP = "<g id='as-u-m-laptop'><g id='as-u-panel-c1-s1'><path id='as-s-path328' d='M349.81 673.92 233.2 741.19s.05-12.15.05-76.05c-1.14-86.77 120.64-161.45 116.57-56.79v65.58Z' fill='url(#as-s-path328-fill-c1-s1)' stroke='#1d1d1b'/><path id='as-s-path329' d='M233.2 741.19s.05-12.15.05-76.05c-.89-68.35 74.46-129.19 104.52-100.8-.01-.01-.02-.03-.04-.05-6.19-6.76-19.45-13.07-26.34-14.73-34.35-8.29-93.62 46.46-92.83 107.11 0 63.9-.05 76.05-.05 76.05l14.64 8.52.16-.12-.11.07Z' fill='var(--c1b)' stroke='#171d35'/></g><g id='as-u-c-gauge-d'><g id='as-u-c-eyepanel2' transform='matrix(1.28 0 0 1.28 29.575 143.32)'><g id='as-u-c-eyestalks-l2' transform='matrix(.75 0 0 .75 19.43 134.628)'><g id='as-u-c-eye-c-4-l2'><path id='as-u-path-c1-s17' d='M232.47 346.68c-8.93-5.02-23.19 3.39-31.85 18.79-7.91 14.05-8.62 30.12-1.59 35.32l6.06 3.71 31.77-55.5-4.39-2.32Z' fill='url(#as-u-path-c1-s15-fill)' stroke='#000' stroke-width='1.01'/><ellipse id='as-u-ellipse-c1-s13' rx='32' ry='18.54' transform='rotate(-60.6 433.394 -1.012)' fill='var(--c1l)' stroke='#1d1d1b'/><ellipse id='as-u-ellipse-yellow3' rx='21.41' ry='11.35' transform='rotate(-60.6 434.592 -.844)' opacity='0' fill='#ffed69' stroke='#221e1f'/><ellipse id='as-u-ellipse-bluel-c1-s13' rx='21.41' ry='11.35' transform='rotate(-60.6 434.592 -.844)' fill='var(--c1l)' stroke='#221e1f'/><ellipse id='as-s-ellipse22' rx='21.41' ry='11.35' transform='rotate(-60.6 436.973 -2.144)' fill='#ffed69' stroke='#221e1f'/><path id='as-s-path330' d='M197.8 377.44a30.06 30.06 0 0 0-1.42 12.8c.1.89 1.49.89 1.4 0-.45-4.2.01-8.43 1.37-12.43.29-.85-1.06-1.22-1.35-.37Z' fill='#fff'/></g><g id='as-u-c-eyelidsl2'><g id='as-u-clip-group8' clip-path='url(#as-u-clipping-paths8)'><g id='as-u-c-eye1-c1-s13'><path id='as-s-path331' d='M197.8 377.44a30.06 30.06 0 0 0-1.42 12.8c.1.89 1.49.89 1.4 0-.45-4.2.01-8.43 1.37-12.43.29-.85-1.06-1.22-1.35-.37Z' fill='var(--c1b)'/><g id='as-u-eye-lid13_to' transform='translate(224.205 367.766)'><path id='as-u-eye-lid13' d='m204.29 393.571 39.83-23.81V341.96l-38.896.512-.934 51.1Z' transform='translate(-224.205 -367.766)' fill='var(--c1b)' stroke='#000'/></g><g id='as-u-eye-lid23_to' transform='translate(224.205 395.766)'><path id='as-u-eye-lid23' d='m204.29 393.571 39.83-23.81V341.96l-38.896.512-.934 51.1Z' transform='rotate(180 112.103 183.883)' fill='var(--c1b)' stroke='#000'/></g></g><clipPath id='as-u-clipping-paths8'><ellipse id='as-u-ellipse-cpa3' rx='21.41' ry='11.35' transform='rotate(-60.6 436.973 -2.144)' fill='#4cb4ca' stroke='#1d1d1b'/></clipPath></g></g></g><g id='as-u-c-eyestalks-r2' transform='matrix(.75 0 0 .75 62.43 109.628)'><g id='as-u-c-eye-c-4-r2'><path id='as-u-path-c1-s18' d='M232.47 346.68c-8.93-5.02-23.19 3.39-31.85 18.79-7.91 14.05-8.62 30.12-1.59 35.32l6.06 3.71 31.77-55.5-4.39-2.32Z' fill='url(#as-u-path-c1-s15-fill)' stroke='#000' stroke-width='1.01'/><ellipse id='as-u-ellipse-c1-s14' rx='32' ry='18.54' transform='rotate(-60.6 433.394 -1.012)' fill='var(--c1l)' stroke='#1d1d1b'/><ellipse id='as-u-ellipse-yellow4' rx='21.41' ry='11.35' transform='rotate(-60.6 434.592 -.844)' opacity='0' fill='#ffed69' stroke='#221e1f'/><ellipse id='as-u-ellipse-bluel-c1-s14' rx='21.41' ry='11.35' transform='rotate(-60.6 434.592 -.844)' fill='var(--c1l)' stroke='#221e1f'/><ellipse id='as-s-ellipse24' rx='21.41' ry='11.35' transform='rotate(-60.6 436.973 -2.144)' fill='#ffed69' stroke='#221e1f'/><path id='as-s-path332' d='M197.8 377.44a30.06 30.06 0 0 0-1.42 12.8c.1.89 1.49.89 1.4 0-.45-4.2.01-8.43 1.37-12.43.29-.85-1.06-1.22-1.35-.37Z' fill='#fff'/></g><g id='as-u-c-eyelidsr2'><g id='as-u-clip-group9' clip-path='url(#as-u-clipping-paths9)'><g id='as-u-c-eye1-c1-s14'><path id='as-s-path333' d='M197.8 377.44a30.06 30.06 0 0 0-1.42 12.8c.1.89 1.49.89 1.4 0-.45-4.2.01-8.43 1.37-12.43.29-.85-1.06-1.22-1.35-.37Z' fill='var(--c1b)'/><g id='as-u-eye-lid14_to' transform='translate(224.205 367.766)'><path id='as-u-eye-lid14' d='m204.29 393.571 39.83-23.81V341.96l-38.896.512-.934 51.1Z' transform='translate(-224.205 -367.766)' fill='var(--c1b)' stroke='#000'/></g><g id='as-u-eye-lid24_to' transform='translate(224.205 395.766)'><path id='as-u-eye-lid24' d='m204.29 393.571 39.83-23.81V341.96l-38.896.512-.934 51.1Z' transform='rotate(180 112.103 183.883)' fill='var(--c1b)' stroke='#000'/></g></g><clipPath id='as-u-clipping-paths9'><ellipse id='as-u-ellipse-cpa4' rx='21.41' ry='11.35' transform='rotate(-60.6 436.973 -2.144)' fill='#4cb4ca' stroke='#1d1d1b'/></clipPath></g></g></g></g></g><g id='as-u-c-device'><g id='as-u-group-c1-s13'><path id='as-s-polygon99' fill='url(#as-s-polygon99-fill-c1-s13)' stroke='#1d1d1b' d='M421.86 715.07v-12.25l-116.79 67.25v12.69l116.79-67.69z'/><path id='as-s-polygon100' fill='var(--c1b)' stroke='#171d35' d='m349.83 661.28 72.03 41.54-116.79 67.25-71.89-41.33 116.65-67.46z'/><path id='as-s-polygon101' fill='var(--c1b)' stroke='#171d35' d='M233.18 741.15v-12.43l71.89 41.35v12.69l-71.89-41.61z'/></g><path id='as-s-polygon102' fill='#1d1d1b' stroke='#1d1d1b' d='m248.7 728.46 101.14-58.41 56.75 32.52-101.34 58.46-56.55-32.57z'/><g id='as-u-clip-group10' clip-path='url(#as-u-clipping-paths10)'><g id='as-u-z-lines-g_to' transform='translate(148.62 814.55)'><g id='as-u-z-lines-g_ts'><g id='as-u-z-lines-g' transform='translate(-328.62 -714.55)'><path id='as-u-l1-2' fill='none' stroke='#fff' d='m288.65 738.04 12.46-7.01v-12.97l27.77 14.01-5.97-19.46 11.42 7-4.93-9.6 9.34 4.15-5.19-15.05 22.06 13.5-3.38-11.16 16.36-10.39'/><path id='as-u-l1-1' transform='translate(-80 47)' fill='none' stroke='#fff' d='m142.56 819.965 158.55-88.935v-12.97l27.77 14.01-5.97-19.46 11.42 7-4.93-9.6 9.34 4.15-5.19-15.05 22.06 13.5-3.38-11.16 16.36-10.39'/><path id='as-u-l1' transform='translate(80 -47)' fill='none' stroke='#fff' d='m288.65 738.04 12.46-7.01v-12.97l27.77 14.01-5.97-19.46 11.42 7-4.93-9.6 9.34 4.15-5.19-15.05 22.06 13.5-3.38-11.16 339.18-191.12'/></g></g></g><clipPath id='as-u-clipping-paths10'><path id='as-s-path334' d='m251.27 729.777 55.207 31.15 100.793-57.82-56.78-31.5-99.22 58.17Z' fill='none' stroke='#3f5787' stroke-width='2.16'/></clipPath></g></g></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 8037) {
      return C_BASE_B;
    } else if (assetID == 8038) {
      return C_BASE_B2;
    } else if (assetID == 8039) {
      return C_BASE_H;
    } else if (assetID == 8040) {
      return C_BASE_G;
    } else if (assetID == 8041) {
      return M_LAPTOP;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 8037) {
      return 4;
    } else if (assetID == 8038) {
      return 2;
    } else if (assetID == 8039) {
      return 1;
    } else if (assetID == 8040) {
      return 4;
    } else if (assetID == 8041) {
      return 4;
    } else {
      return 0;
    }
  }
}