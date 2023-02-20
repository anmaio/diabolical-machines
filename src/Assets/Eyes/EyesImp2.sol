// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract EyesImp2 {
  string internal constant C_EYE_D = "<g id='nos-u-c-eye-d'><g id='nos-u-c-eye-d2'><g id='nos-u-c-eye-d-2'><ellipse id='nos-s-ellipse7' fill='url(#c2l)' stroke='#1d1d1b' rx='39.88' ry='23.27' transform='rotate(-59.05 628.5483 88.485)'/><ellipse id='nos-s-ellipse8' fill='url(#c2l)' stroke='#1d1d1b' rx='39.88' ry='23.27' transform='rotate(-59.05 633.5233 85.6189)'/><path id='nos-s-path31' fill='url(#c0l)' stroke='#231f20' d='M221.51 615.12c-1.77 0-3.34-.4-4.65-1.19-3.38-2.02-5.27-6.86-5.19-13.26.09-7.56 2.93-16.55 7.8-24.67 8.8-14.68 20.47-21.36 27.58-21.36 1.77 0 3.34.4 4.65 1.19 7 4.2 7.66 20.81-2.61 37.94-8.8 14.68-20.47 21.36-27.58 21.36Z'/><g id='nos-s-g7'><ellipse id='nos-u-orb' fill='#ebebeb' stroke='#231f20' rx='31.12' ry='31.16' transform='translate(250.05 594.62)'/><path id='nos-s-path32' fill='url(#c0l)' d='M260.95 565.46c7.63 5.68 12.6 14.75 12.6 25 0 17.21-13.93 31.16-31.12 31.16-3.84 0-7.5-.73-10.9-2 5.18 3.85 11.57 6.16 18.52 6.16 17.19 0 31.12-13.95 31.12-31.16 0-13.36-8.42-24.73-20.22-29.16Z' opacity='.3' style='mix-blend-mode:color-burn'/><g id='nos-s-g8'><path id='nos-s-path33' fill='#ffffff' d='M245.35 571.42c-.63-1.96-3-3.85-5.19-2.94-2.37.98-4.43 2.15-6.44 3.74-1.73 1.36-3.15 2.96-4.46 4.72-2.67 3.57-4.13 7.82-4.58 12.22-.23 2.2 2.1 4.31 4.22 4.22 2.44-.11 3.92-1.81 4.2-4.11 0 .02 0 .03-.01.05.05-.19.06-.4.1-.6.08-.44.17-.87.28-1.3.2-.78.46-1.53.74-2.29.07-.15.13-.29.2-.44.19-.4.4-.79.62-1.18.41-.73.89-1.41 1.36-2.1.09-.11.17-.21.26-.32.29-.34.58-.67.89-.99.57-.59 1.19-1.13 1.82-1.67.15-.11.3-.22.46-.32.33-.23.67-.44 1.02-.65s.7-.4 1.06-.59c.33-.17 1.79-.8.53-.28 1.06-.44 1.92-.91 2.52-1.94.53-.9.75-2.24.43-3.25Z'/><path id='nos-s-path34' fill='url(#c2l)' d='M233.11 589.16s-.01.07-.02.11c.28-1.02.06-.49.02-.11Z'/></g><path id='nos-s-path35' fill='#ffffff' d='M229.81 598.41c-5.43 0-5.44 8.43 0 8.43s5.44-8.43 0-8.43Z'/></g></g><g id='nos-u-c-eye-d-3'><ellipse id='nos-s-ellipse9' fill='url(#c2l)' stroke='#1d1d1b' rx='39.88' ry='23.27' transform='rotate(-59.05 635.5417 -273.1946)'/><ellipse id='nos-s-ellipse10' fill='url(#c2l)' stroke='#1d1d1b' rx='39.88' ry='23.27' transform='rotate(-59.05 640.5256 -276.0558)'/><path id='nos-s-path36' fill='url(#c0l)' stroke='#231f20' d='M535.07 445.45c-1.77 0-3.34-.4-4.65-1.19-3.38-2.02-5.27-6.86-5.19-13.26.09-7.56 2.93-16.55 7.8-24.67 8.8-14.68 20.47-21.36 27.58-21.36 1.77 0 3.34.4 4.65 1.19 7 4.2 7.66 20.81-2.61 37.94-8.8 14.68-20.47 21.36-27.58 21.36Z'/><g id='nos-s-g9'><ellipse id='nos-u-orb-2' fill='#ebebeb' stroke='#231f20' rx='31.12' ry='31.16' transform='translate(563.61 424.95)'/><path id='nos-s-path37' fill='url(#c0l)' d='M574.51 395.79c7.63 5.68 12.6 14.75 12.6 25 0 17.21-13.93 31.16-31.12 31.16-3.84 0-7.5-.73-10.9-2 5.18 3.85 11.57 6.16 18.52 6.16 17.19 0 31.12-13.95 31.12-31.16 0-13.36-8.42-24.73-20.22-29.16Z' opacity='.3' style='mix-blend-mode:color-burn'/><g id='nos-s-g10'><path id='nos-s-path38' fill='#ffffff' d='M558.91 401.75c-.63-1.96-3-3.85-5.19-2.94-2.37.98-4.43 2.15-6.44 3.74-1.73 1.36-3.15 2.96-4.46 4.72-2.67 3.57-4.13 7.82-4.58 12.22-.23 2.2 2.1 4.31 4.22 4.22 2.44-.11 3.92-1.81 4.2-4.11 0 .02 0 .03-.01.05.05-.19.06-.4.1-.6.08-.44.17-.87.28-1.3.2-.78.46-1.53.74-2.29.07-.15.13-.29.2-.44.19-.4.4-.79.62-1.18.41-.73.89-1.41 1.36-2.1.09-.11.17-.21.26-.32.29-.34.58-.67.89-.99.57-.59 1.19-1.13 1.82-1.67.15-.11.3-.22.46-.32.33-.23.67-.44 1.02-.65s.7-.4 1.06-.59c.33-.17 1.79-.8.53-.28 1.06-.44 1.92-.91 2.52-1.94.53-.9.75-2.24.43-3.25Z'/><path id='nos-s-path39' fill='url(#c2l)' d='M546.67 419.49s-.01.07-.02.11c.28-1.02.06-.49.02-.11Z'/></g><path id='nos-s-path40' fill='#ffffff' d='M543.37 428.74c-5.43 0-5.44 8.43 0 8.43s5.44-8.43 0-8.43Z'/></g></g></g><g opacity='0' style='animation:nos-u-c-eye-d_a_c_o 20000ms linear 999 normal forwards'><g id='nos-u-c-eye-d_a-2'><ellipse id='nos-s-ellipse11' fill='url(#c2l)' stroke='#1d1d1b' rx='39.88' ry='23.27' transform='rotate(-59.05 627.968 88.1518)'/><ellipse id='nos-s-ellipse12' fill='url(#c2l)' stroke='#1d1d1b' rx='39.88' ry='23.27' transform='rotate(-59.05 632.9381 85.2945)'/><path id='nos-s-path41' fill='url(#c0l)' stroke='#231f20' d='M221.51 614.46c-1.77 0-3.34-.4-4.65-1.19-3.38-2.02-5.27-6.86-5.19-13.26.09-7.56 2.93-16.55 7.8-24.67 8.8-14.68 20.47-21.36 27.58-21.36 1.77 0 3.34.4 4.65 1.19 7 4.2 7.66 20.81-2.61 37.94-8.8 14.68-20.47 21.36-27.58 21.36Z'/><g id='nos-s-g11'><ellipse id='nos-u-orb-3' fill='#fae676' stroke='#231f20' rx='31.12' ry='31.16' transform='translate(250.05 593.96)'/><path id='nos-s-path42' fill='url(#c0l)' d='M260.95 564.8c7.63 5.68 12.6 14.75 12.6 25 0 17.21-13.93 31.16-31.12 31.16-3.84 0-7.5-.73-10.9-2 5.18 3.85 11.57 6.16 18.52 6.16 17.19 0 31.12-13.95 31.12-31.16 0-13.36-8.42-24.73-20.22-29.16Z' opacity='.3' style='mix-blend-mode:color-burn'/><g id='nos-s-g12'><path id='nos-s-path43' fill='#ffffff' d='M245.35 570.76c-.63-1.96-3-3.85-5.19-2.94-2.37.98-4.43 2.15-6.44 3.74-1.73 1.36-3.15 2.96-4.46 4.72-2.67 3.57-4.13 7.82-4.58 12.22-.23 2.2 2.1 4.31 4.22 4.22 2.44-.11 3.92-1.81 4.2-4.11 0 .02 0 .03-.01.05.05-.19.06-.4.1-.6.08-.44.17-.87.28-1.3.2-.78.46-1.53.74-2.29.07-.15.13-.29.2-.44.19-.4.4-.79.62-1.18.41-.73.89-1.41 1.36-2.1.09-.11.17-.21.26-.32.29-.34.58-.67.89-.99.57-.59 1.19-1.13 1.82-1.67.15-.11.3-.22.46-.32.33-.23.67-.44 1.02-.65s.7-.4 1.06-.59c.33-.17 1.79-.8.53-.28 1.06-.44 1.92-.91 2.52-1.94.53-.9.75-2.24.43-3.25Z'/><path id='nos-s-path44' fill='url(#c2l)' d='M233.11 588.5s-.01.07-.02.11c.28-1.02.06-.49.02-.11Z'/></g><path id='nos-s-path45' fill='#ffffff' d='M229.81 597.75c-5.43 0-5.44 8.43 0 8.43s5.44-8.43 0-8.43Z'/></g></g><g id='nos-u-c-eye-d_a-3'><ellipse id='nos-s-ellipse13' fill='url(#c2l)' stroke='#1d1d1b' rx='39.88' ry='23.27' transform='rotate(-59.05 634.9565 -273.519)'/><ellipse id='nos-s-ellipse14' fill='url(#c2l)' stroke='#1d1d1b' rx='39.88' ry='23.27' transform='rotate(-59.05 639.9404 -276.3802)'/><path id='nos-s-path46' fill='url(#c0l)' stroke='#231f20' d='M535.07 444.79c-1.77 0-3.34-.4-4.65-1.19-3.38-2.02-5.27-6.86-5.19-13.26.09-7.56 2.93-16.55 7.8-24.67 8.8-14.68 20.47-21.36 27.58-21.36 1.77 0 3.34.4 4.65 1.19 7 4.2 7.66 20.81-2.61 37.94-8.8 14.68-20.47 21.36-27.58 21.36Z'/><g id='nos-s-g13'><ellipse id='nos-u-orb-4' fill='#fae676' stroke='#231f20' rx='31.12' ry='31.16' transform='translate(563.61 424.29)'/><path id='nos-s-path47' fill='url(#c0l)' d='M574.51 395.13c7.63 5.68 12.6 14.75 12.6 25 0 17.21-13.93 31.16-31.12 31.16-3.84 0-7.5-.73-10.9-2 5.18 3.85 11.57 6.16 18.52 6.16 17.19 0 31.12-13.95 31.12-31.16 0-13.36-8.42-24.73-20.22-29.16Z' opacity='.3' style='mix-blend-mode:color-burn'/><g id='nos-s-g14'><path id='nos-s-path48' fill='#ffffff' d='M558.91 401.09c-.63-1.96-3-3.85-5.19-2.94-2.37.98-4.43 2.15-6.44 3.74-1.73 1.36-3.15 2.96-4.46 4.72-2.67 3.57-4.13 7.82-4.58 12.22-.23 2.2 2.1 4.31 4.22 4.22 2.44-.11 3.92-1.81 4.2-4.11 0 .02 0 .03-.01.05.05-.19.06-.4.1-.6.08-.44.17-.87.28-1.3.2-.78.46-1.53.74-2.29.07-.15.13-.29.2-.44.19-.4.4-.79.62-1.18.41-.73.89-1.41 1.36-2.1.09-.11.17-.21.26-.32.29-.34.58-.67.89-.99.57-.59 1.19-1.13 1.82-1.67.15-.11.3-.22.46-.32.33-.23.67-.44 1.02-.65s.7-.4 1.06-.59c.33-.17 1.79-.8.53-.28 1.06-.44 1.92-.91 2.52-1.94.53-.9.75-2.24.43-3.25Z'/><path id='nos-s-path49' fill='url(#c2l)' d='M546.67 418.83s-.01.07-.02.11c.28-1.02.06-.49.02-.11Z'/></g><path id='nos-s-path50' fill='#ffffff' d='M543.37 428.08c-5.43 0-5.44 8.43 0 8.43s5.44-8.43 0-8.43Z'/></g></g></g></g>";


  string internal constant C_EYE_N = "<g id='ap-u-frame-c-eye-n-all'><g id='ap-u-frame-c-eye-n_idle'><g id='ap-u-frame-c-eye-n_idle_paths'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1731' opacity='.3' style='mix-blend-mode:color-burn'/><path id='ap-s-path1732' fill='none' stroke='#000000' d='M705.63 278.76c-.05-.03-.11-.07-.16-.1-31.52-18.2-57.25-3.54-57.35 32.68-.1 36.23 25.46 80.51 56.98 98.7 2.47 1.42 4.89 2.62 7.28 3.65 28.11 12.1 49.98-2.95 50.08-36.34.1-36.16-25.37-80.34-56.82-98.6Z'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1733' stroke-width='2'/><path id='ap-s-path1734' fill='url(#c2d)' stroke='#000000' d='M648.58 320.15c1.76 0 112.9 65.49 112.9 65.49'/></g></g><g id='ap-u-frame-c-eye-n_active' opacity='0' style='animation-play-state: running;'><g id='ap-u-frame-c-eye-n_active_group'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1731' id='ap-s-path1735' opacity='.3' style='mix-blend-mode:color-burn'/><g id='ap-s-g356'><path id='ap-s-path1736' fill='url(#ap-s-path1736-fill)' stroke='#000000' d='M726.11 408.92c-2.39-1.03-4.81-2.23-7.28-3.65-31.52-18.2-57.08-62.48-56.98-98.7.05-17 5.75-29.24 15.05-35.56-1.5.13-2.97.35-4.38.69-14.69 3.45-24.34 17.51-24.4 39.66-.1 36.23 25.46 80.51 56.98 98.7 2.47 1.42 4.89 2.62 7.28 3.65 13.08 5.63 24.81 5.38 33.62.14.48-.28.94-.6 1.4-.91-6.42.56-13.62-.7-21.29-4Z'/><path id='ap-s-path1737' fill='url(#c5b)' stroke='#000000' d='M762.45 377.36c.1-36.16-25.37-80.34-56.82-98.6-.05-.03-.11-.07-.16-.1-10.39-6-20.15-8.4-28.57-7.66-9.29 6.33-15 18.56-15.05 35.56-.1 36.23 25.46 80.51 56.98 98.7 2.47 1.42 4.89 2.62 7.28 3.65 7.67 3.3 14.86 4.56 21.29 4 9.3-6.33 15.01-18.56 15.05-35.56Z'/></g><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1733' id='ap-s-path1738' stroke-width='2'/></g></g></g>";

  string internal constant C_EYE_W = "<g id='drl-u-c-eyes'><g opacity='0' style='animation:drl-u-c-eyes-a_a_c_o 20000ms linear 999 normal forwards'><g id='drl-s-g21'><path id='drl-s-path138' fill='url(#c0l)' d='M404.4 522.26c5.27 4.26 9.01 13.54 9.16 24.37.21 14.98-6.53 27.25-15.05 27.39-1.26.02-2.48-.23-3.66-.71 2.03 1.64 4.28 2.54 6.65 2.5 8.52-.14 15.26-12.41 15.05-27.39-.18-12.77-5.35-23.39-12.14-26.16Z' opacity='.3' style='mix-blend-mode:color-burn'/><g id='drl-s-g22'><path id='drl-s-path139' fill='url(#g0)' stroke='#000' d='M387.93 547.94c-.2-14.3 5.93-26.11 13.9-27.29-1.3-.6-2.67-.91-4.07-.89-8.52.14-15.26 12.41-15.05 27.39.18 12.77 5.35 23.39 12.14 26.16 1.18.48 2.4.73 3.66.71.4 0 .79-.05 1.18-.11-6.61-3.01-11.59-13.45-11.76-25.97Z'/><path id='drl-s-path140' fill='url(#g0)' stroke='#000' d='M413.56 546.63c-.15-10.82-3.88-20.1-9.16-24.37-.82-.66-1.68-1.2-2.57-1.61-7.97 1.18-14.1 12.99-13.9 27.29.17 12.53 5.15 22.96 11.76 25.97 7.95-1.2 14.07-13 13.87-27.28Z'/></g></g><g id='drl-s-g23'><path id='drl-s-path141' fill='url(#c0l)' d='M452.56 534.66c5.27 4.26 9.01 13.54 9.16 24.37.21 14.98-6.53 27.25-15.05 27.39-1.26.02-2.48-.23-3.66-.71 2.03 1.64 4.28 2.54 6.65 2.5 8.52-.14 15.26-12.41 15.05-27.39-.18-12.77-5.35-23.39-12.14-26.16Z' opacity='.3' style='mix-blend-mode:color-burn'/><g id='drl-s-g24'><path id='drl-s-path142' fill='url(#g0)' stroke='#000' d='M436.09 560.34c-.2-14.3 5.93-26.11 13.9-27.29-1.3-.6-2.67-.91-4.07-.89-8.52.14-15.26 12.41-15.05 27.39.18 12.77 5.35 23.39 12.14 26.16 1.18.48 2.4.73 3.66.71.4 0 .79-.05 1.18-.11-6.61-3.01-11.59-13.45-11.76-25.97Z'/><path id='drl-s-path143' fill='url(#g0)' stroke='#000' d='M461.72 559.03c-.15-10.82-3.88-20.1-9.16-24.37-.82-.66-1.68-1.2-2.57-1.61-7.97 1.18-14.1 12.99-13.9 27.29.17 12.53 5.15 22.96 11.76 25.97 7.95-1.2 14.07-13 13.87-27.28Z'/></g></g></g><g id='drl-u-c-eyes-a' transform='translate(0 127)'><g id='drl-s-g25'><path id='drl-s-path144' fill='none' stroke='#000' d='M413.39 425.05c-11.57-3.51-21.8-8.11-30.18-13.51'/><g id='drl-s-g26'><path id='drl-s-path145' fill='url(#c0l)' d='M404.4 395.16c5.27 4.26 9.01 13.54 9.16 24.37.21 14.98-6.53 27.25-15.05 27.39-1.26.02-2.48-.23-3.66-.71 2.03 1.64 4.28 2.54 6.65 2.5 8.52-.14 15.26-12.41 15.05-27.39-.18-12.77-5.35-23.39-12.14-26.16Z' opacity='.3' style='mix-blend-mode:color-burn'/><path id='drl-s-path146' fill='none' stroke='#000' d='M404.4 395.16c-2.03-1.64-4.28-2.54-6.65-2.5-8.52.14-15.26 12.41-15.05 27.39.18 12.77 5.35 23.39 12.14 26.16 1.18.48 2.4.73 3.66.71 8.52-.14 15.26-12.41 15.05-27.39-.15-10.82-3.88-20.1-9.16-24.37Z'/></g></g><g id='drl-s-g27'><path id='drl-s-path147' fill='none' stroke='#000' d='M461.53 432.63c-10.72-.33-21.02-1.48-30.69-3.31'/><g id='drl-s-g28'><path id='drl-s-path148' fill='url(#c0l)' d='M452.53 407.52c5.27 4.26 9.01 13.54 9.16 24.37.21 14.98-6.53 27.25-15.05 27.39-1.26.02-2.48-.23-3.66-.71 2.03 1.64 4.28 2.54 6.65 2.5 8.52-.14 15.26-12.41 15.05-27.39-.18-12.77-5.35-23.39-12.14-26.16Z' opacity='.3' style='mix-blend-mode:color-burn'/><path id='drl-s-path149' fill='none' stroke='#000' d='M452.53 407.52c-2.03-1.64-4.28-2.54-6.65-2.5-8.52.14-15.26 12.41-15.05 27.39.18 12.77 5.35 23.39 12.14 26.16 1.18.48 2.4.73 3.66.71 8.52-.14 15.26-12.41 15.05-27.39-.15-10.82-3.88-20.1-9.16-24.37Z'/></g></g></g></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 5006) {
      return C_EYE_D;
    } else if (assetID == 5026) {
      return C_EYE_N;
    } else if (assetID == 5044) {
      return C_EYE_W;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 5006) {
      return 5;
    } else if (assetID == 5026) {
      return 5;
    } else if (assetID == 5044) {
      return 2;
    } else {
      return 0;
    }
  }
}