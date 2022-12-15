// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

library AltarAdditional3 {
  
  // Expanding/shrinking hole with blue background
  string internal constant FRAME1 = "<g id='exe_1-u-m-frame-a-2' style='display: inline-block;'><polygon id='exe_1-u-shadow' style='mix-blend-mode:multiply' points='846.14,278.94 840.19,267.15 588.51,142.29 580.65,137.75 580.73,418.7 837.56,567.91 846.14,563.25 846.14,278.94' opacity='0.3' fill='#1d1d1b'/><polygon id='exe_1-s-polygon15' points='840.11,266.79 580.28,116.81 572.43,121.31 832.27,271.29 832.27,271.31 840.11,266.79' fill='#c6f7f6' stroke='#1d1d1b' stroke-miterlimit='10'/><polygon id='exe_1-s-polygon16' points='840.12,266.79 840.11,266.79 832.27,271.31 832.29,547.15 832.29,556.17 840.14,551.68 840.12,266.79' fill='#78e4ef' stroke='#1d1d1b' stroke-miterlimit='10'/><polygon id='exe_1-s-polygon17' points='832.27,271.31 832.27,271.31 832.27,271.29 580.28,125.84 572.43,121.31 572.5,406.26 832.29,556.18 832.29,556.17 832.29,556.17 832.27,271.31' fill='url(#exe_1-s-polygon17-fill)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round'/><line id='exe_1-s-line17' x1='574.93' y1='125.83' x2='576.07' y2='403.81' fill='none' stroke='#fff' stroke-width='3' stroke-linecap='round' stroke-miterlimit='10'/><g id='exe_1-u-c-hole-b_a3_ts' transform='translate(701.990021,344.417282) scale(0.26,0.26)'><g id='exe_1-u-c-hole-b_a3' transform='translate(-701.990021,-344.417282)'><path id='exe_1-s-path3' d='M752.51,420.55c-4.6,3.99-9.92,7.07-15.78,9.07-9.74,3.32-25.43,5.21-44.87-4.67-10.33-5.25-20.26-13.29-28.88-23.26' fill='none' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='round' stroke-linejoin='round'/><path id='exe_1-s-path4' d='M651.38,264.99c7.54-4.66,16.12-7.51,25.08-8.25c9.57-.79,19.2.8,28.63,4.71.79.3,1.5.59,2.22.92c11.29,5.14,21.91,13.61,30.62,24.31c2.16,2.65,4.19,5.44,6.1,8.34' fill='none' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='round' stroke-linejoin='round'/><path id='exe_1-s-path5' d='M646.64,278.58c7.84-7.99,18.34-12.9,29.57-13.83c8.23-.68,16.6.73,24.86,4.17.67.26,1.26.49,1.87.77c12.88,5.86,24.87,16.57,33.74,30.13v0c1.43,2.2,2.77,4.43,4,6.7' fill='none' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='round' stroke-linejoin='round'/><path id='exe_1-s-path6' d='M757.34,400.64c-4.81,10.14-13.08,17.64-23.29,21.12-8.23,2.81-21.58,4.35-38.43-4.22-13.14-6.68-25.65-18.43-35.23-33.07' fill='none' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='round' stroke-linejoin='round'/><g id='exe_1-s-g6'><path id='exe_1-s-path7' d='M706.78,393.92c-25.65-13.04-46.87-46.3-48.32-75.71-.67-13.65,3.14-25.04,10.39-32.47-13.37,5.78-20.94,20.29-20.02,39.08c1.45,29.41,22.67,62.67,48.32,75.71c7.27,3.69,14.42,5.57,21.26,5.57c9,0,16.99-3.28,22.94-9.31-4.05,1.76-8.54,2.7-13.31,2.7-6.84,0-13.99-1.87-21.26-5.57Z' fill='url(#exe_1-s-path7-fill)' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/><path id='exe_1-s-path8' d='M744.17,393.53c1.4-1.86,2.63-3.89,3.65-6.04c1.69-3.57,2.88-7.46,3.52-11.58.57-3.63.76-7.47.56-11.39-1.43-28.98-22.59-62.2-48.18-75.64-.47-.25-.92-.46-1.38-.66l-.12-.05c-6.89-3.38-13.69-5.09-20.2-5.09-.32,0-.64,0-.96.01-2.57.07-5.12.43-7.59,1.07-1.61.42-3.15.95-4.62,1.59-7.26,7.43-11.07,18.82-10.39,32.47c1.45,29.41,22.67,62.67,48.32,75.71c7.27,3.69,14.42,5.57,21.26,5.57c4.77,0,9.26-.93,13.31-2.7c1-1.01,1.94-2.09,2.82-3.26Z' transform='translate(.000001 0)' fill='#1d1d1b' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/><path id='exe_1-s-path9' d='M744.17,393.53c1.4-1.86,2.63-3.89,3.65-6.04c1.69-3.57,2.88-7.46,3.52-11.58.57-3.63.76-7.47.56-11.39-1.43-28.98-22.59-62.2-48.18-75.64-.47-.25-.92-.46-1.38-.66l-.12-.05c-6.89-3.38-13.69-5.09-20.2-5.09-.32,0-.64,0-.96.01-2.57.07-5.12.43-7.59,1.07-1.61.42-3.15.95-4.62,1.59-7.26,7.43-11.07,18.82-10.39,32.47c1.45,29.41,22.67,62.67,48.32,75.71c7.27,3.69,14.42,5.57,21.26,5.57c4.77,0,9.26-.93,13.31-2.7c1-1.01,1.94-2.09,2.82-3.26Z' transform='translate(.000001 0)' fill='#1d1d1b' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/></g></g></g></g>";

  // Opening/closing eye with red background
  string internal constant FRAME2 = "<g id='exe_1-u-m-frame-b' style='display: inline-block;'><polygon id='exe_1-u-shadow2' style='mix-blend-mode:multiply' points='846.14,278.94 840.19,267.15 588.51,142.29 580.65,137.75 580.73,418.7 837.56,567.91 846.14,563.25 846.14,278.94' opacity='0.3' fill='#1d1d1b'/><polygon id='exe_1-s-polygon18' points='840.11,266.79 580.28,116.81 572.43,121.31 832.27,271.29 832.27,271.31 840.11,266.79' fill='#fb6364' stroke='#000' stroke-miterlimit='10'/><polygon id='exe_1-s-polygon19' points='840.12,266.79 840.11,266.79 832.27,271.31 832.29,547.15 832.29,556.17 840.14,551.68 840.12,266.79' fill='#fb6364' stroke='#000' stroke-miterlimit='10'/><polygon id='exe_1-s-polygon20' points='832.27,271.31 832.27,271.31 832.27,271.29 580.28,125.84 572.43,121.31 572.5,406.26 832.29,556.18 832.29,556.17 832.29,556.17 832.27,271.31' fill='#fb6364' stroke='#000' stroke-miterlimit='10'/><line id='exe_1-s-line18' x1='574.93' y1='125.83' x2='576.07' y2='403.81' fill='none' stroke='#fff' stroke-width='3' stroke-linecap='round' stroke-miterlimit='10'/><g id='exe_1-u-c-eye-n'><g id='exe_1-s-g7'><path id='exe_1-s-path10' style='mix-blend-mode:color-burn' d='M712.91,282.41c-2.47-1.42-4.89-2.62-7.28-3.65c31.45,18.26,56.92,62.44,56.82,98.6-.09,33.39-21.97,48.44-50.08,36.34.05.03.11.07.16.1c31.52,18.2,57.25,3.54,57.35-32.69.1-36.22-25.46-80.5-56.98-98.7Z' opacity='0.3' fill='#221e1f'/><path id='exe_1-s-path11' d='M705.63,278.76c-.05-.03-.11-.07-.16-.1-31.52-18.2-57.25-3.54-57.35,32.68-.1,36.23,25.46,80.51,56.98,98.7c2.47,1.42,4.89,2.62,7.28,3.65c28.11,12.1,49.98-2.95,50.08-36.34.1-36.16-25.37-80.34-56.82-98.6Z' fill='none' stroke='#000' stroke-miterlimit='10'/><path id='exe_1-s-path12' d='M683.09,267.94c-20.54-1.86-38.06,14.17-38.14,41.33c0,3.07.17,6.2.52,9.37' fill='none' stroke='#fff' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10'/><path id='exe_1-s-path13' d='M648.58,320.15c1.76,0,112.9,65.49,112.9,65.49' fill='#fb6364' stroke='#000' stroke-miterlimit='10'/></g></g><g id='exe_1-u-c-eye-n_a' opacity='0'><path id='exe_1-s-path14' style='mix-blend-mode:color-burn' d='M712.91,282.41c-2.47-1.42-4.89-2.62-7.28-3.65c31.45,18.26,56.92,62.44,56.82,98.6-.09,33.39-21.97,48.44-50.08,36.34.05.03.11.07.16.1c31.52,18.2,57.25,3.54,57.35-32.69.1-36.22-25.46-80.5-56.98-98.7Z' opacity='0.3' fill='#221e1f'/><g id='exe_1-s-g8'><path id='exe_1-s-path15' d='M726.11,408.92c-2.39-1.03-4.81-2.23-7.28-3.65-31.52-18.2-57.08-62.48-56.98-98.7.05-17,5.75-29.24,15.05-35.56-1.5.13-2.97.35-4.38.69-14.69,3.45-24.34,17.51-24.4,39.66-.1,36.23,25.46,80.51,56.98,98.7c2.47,1.42,4.89,2.62,7.28,3.65c13.08,5.63,24.81,5.38,33.62.14.48-.28.94-.6,1.4-.91-6.42.56-13.62-.7-21.29-4Z' fill='url(#exe_1-s-path15-fill)' stroke='#000' stroke-miterlimit='10'/><path id='exe_1-s-path16' d='M762.45,377.36c.1-36.16-25.37-80.34-56.82-98.6-.05-.03-.11-.07-.16-.1-10.39-6-20.15-8.4-28.57-7.66-9.29,6.33-15,18.56-15.05,35.56-.1,36.23,25.46,80.51,56.98,98.7c2.47,1.42,4.89,2.62,7.28,3.65c7.67,3.3,14.86,4.56,21.29,4c9.3-6.33,15.01-18.56,15.05-35.56Z' fill='#fae676' stroke='#000' stroke-linecap='round' stroke-linejoin='round'/></g><path id='exe_1-s-path17' d='M683.09,267.94c-20.54-1.86-38.06,14.17-38.14,41.33c0,3.07.17,6.2.52,9.37' fill='none' stroke='#fff' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10'/></g></g>";

  string internal constant RUG = "<g id='exe_1-u-p-rug' style='display: inline-block;'><polygon id='exe_1-s-polygon31' points='300.15,757.91 559.89,907.89 567.27,903.67 307.47,753.65 300.15,757.91' fill='#4c598e' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round'/><polygon id='exe_1-s-polygon32' points='284.2,767.17 380.54,822.75 392.13,829.43 406.25,837.58 420.37,845.72 433.37,853.22 448.05,861.69 543.95,917.01 559.89,907.89 300.15,757.91 284.2,767.17' fill='#78e4ef' stroke='#000' stroke-miterlimit='10'/><polygon id='exe_1-s-polygon33' points='307.47,753.65 567.27,903.67 575.29,899.07 315.43,749.02 307.47,753.65' fill='#fb6364' stroke='#000' stroke-miterlimit='10'/><polygon id='exe_1-s-polygon34' points='596,887.23 499.99,831.68 485.33,823.19 472.35,815.69 458.25,807.53 444.15,799.37 432.59,792.68 336.24,736.93 323.08,744.58 583,894.66 596,887.23' fill='#78e4ef' stroke='#000' stroke-miterlimit='10'/><polygon id='exe_1-s-polygon35' points='323.08,744.58 315.43,749.02 575.29,899.07 583,894.66 323.08,744.58' fill='#4c598e' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round'/></g>";
  
  function getFrame1() external pure returns (string memory) {
    return FRAME1;
  }

  function getFrame2() external pure returns (string memory) {
    return FRAME2;
  }

  function getRug() external pure returns (string memory) {
    return RUG;
  }
}