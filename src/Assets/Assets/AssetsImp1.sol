// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AssetsImp1 {

  string internal constant C_LAVALAMP_A = "<g transform='translate(-312,0)'><g id='g-u-c-lavalamp-a'><g id='g-u-c-lavalamp-tr' transform='translate(0 0.000001)'><ellipse id='g-u-shadow-42' fill='#1d1d1b' opacity='0.3' rx='16.22' ry='10.62' style='mix-blend-mode:multiply' transform='matrix(.948379-.317139 0.317139 0.948379 473.674329 606.687645)'/><path id='g-s-path363' fill='url(#g-s-path363-fill)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M484.43,609.21l-7.71-25.76c0,0-11.63-.65-11.31-.88.31-.24-11.17.88-11.17.88l-7.42,24.91c-.14.42-.22.84-.22,1.25c0,4.26,7.75,9.01,18.87,9.01s18.87-4.75,18.87-9.01c0-.12,0-.25-.02-.37.06-.02.09-.03.09-.03Z'/><path id='g-s-path364' fill='url(#g-s-path364-fill)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M484.36,557.66l-15.26-1.98-.39.02-22.1,1.24l7.8,27.47h.05c.98,2.24,5.23,4.4,11.02,4.4s9.94-2.11,10.98-4.32h.05c0,0,7.84-26.82,7.84-26.82Z'/><g id='g-u-c-connector'><path id='g-s-path365' fill='url(#g-s-path365-fill)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M465.48,565.95c-11.12,0-18.87-4.75-18.87-9.01s7.75-9.01,18.87-9.01s18.87,4.75,18.87,9.01-7.75,9.01-18.87,9.01Z'/></g><g id='g-u-c-lava'><g id='g-u-clip-group3' clip-path='url(#g-u-clipping-paths3)'><g id='g-s-g26' transform='translate(.000001 0)'><g style='animation:g-u-path-g3-s14_to__to 60000ms linear 999 normal forwards' transform='translate(463.762573,525.095657)'><path id='g-u-path-g3-s14' fill='url(#g-u-path-g3-s14-fill)' d='M468.81,500.65c-5.69.13-7.8,6.34-6.61,10.05c1.19,3.7.13,12.16-2.78,17.45-1.62,2.95-8.46,8.86-6.08,15.46c2.38,6.61,16.52,8.46,19.43,1.59s-.4-15.86-.93-19.56-.66-12.95,1.72-15.46s1.06-9.65-4.76-9.52Z' transform='translate(-463.762573,-525.095657)'/></g><g style='animation:g-u-circle-g3-s1_to__to 60000ms linear 999 normal forwards' transform='translate(459.89003,497.150009)'><circle id='g-u-circle-g3-s1' r='3.77' fill='url(#g-u-circle-g3-s1-fill)' transform='translate(-0.00003,-0.000009)'/></g><g style='animation:g-u-ellipse-g3-s1_to__to 60000ms linear 999 normal forwards' transform='translate(471.85997,550.490021)'><ellipse id='g-u-ellipse-g3-s1' fill='url(#g-u-ellipse-g3-s1-fill)' rx='10.76' ry='10.04' transform='translate(0.00003,-0.000021)'/></g></g><clipPath id='g-u-clipping-paths3'><path id='g-u-c-lavalamp-lava-mask' fill='#f00' stroke-miterlimit='10' d='M476.72,483.75l-8.21.08-14.27-.08c0,0-7.64,72.96-7.64,73.19c0,4.26,7.75,9.01,18.87,9.01s18.87-4.75,18.87-9.01c0-.79-7.64-73.19-7.64-73.19Z' opacity='0.8'/></clipPath></g></g><g id='g-u-fluid2'><path id='g-u-path-g2-s13' fill='url(#g-u-path-g2-s13-fill)' stroke='#1d1d1b' stroke-miterlimit='10' d='M476.72,483.75l-8.21.08-14.27-.08c0,0-7.64,72.96-7.64,73.19c0,4.26,7.75,9.01,18.87,9.01s18.87-4.75,18.87-9.01c0-.79-7.64-73.19-7.64-73.19Z' opacity='0.8'/></g><g id='g-u-lid'><path id='g-s-path366' fill='url(#g-s-path366-fill)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M473.74,465.09l-5.09-.63-11.47.89c0,0-2.95,18.27-2.95,18.41c0,2.54,4.62,5.36,11.24,5.36s11.24-2.83,11.24-5.36c0-.07-2.98-18.66-2.98-18.66Z'/><g id='g-u-c-connector-2'><path id='g-s-path367' fill='url(#g-s-path367-fill)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M465.48,469.3c-4.89,0-8.29-2.09-8.29-3.96s3.41-3.96,8.29-3.96s8.29,2.09,8.29,3.96-3.41,3.96-8.29,3.96Z'/></g></g></g></g></g>";
  string internal constant C_CACTUS_A = "<g transform='translate(-312,0)'><g id='g-u-c-cactus-a'><ellipse id='g-u-shadow-72' fill='#221e1f' opacity='0.3' rx='22.43' ry='13.44' style='mix-blend-mode:color-burn' transform='matrix(.958123-.286357 0.286357 0.958123 473.442587 607.651219)'/><g id='g-u-c-pot'><path id='g-s-path338' fill='#4cb4ca' stroke='#1d1d1b' stroke-miterlimit='10' d='M446.93,582.88v28.13c.14,5.89,8.91,10.64,19.71,10.64s19.71-4.83,19.71-10.78v-27.99h-39.43Z'/><ellipse id='g-s-ellipse15' fill='#4cb4ca' stroke='#1d1d1b' stroke-miterlimit='10' rx='19.71' ry='10.78' transform='translate(466.64 582.81)'/><path id='g-s-path339' fill='#3d4676' stroke='#221e1f' stroke-miterlimit='10' d='M466.66,590.51c-9.68,0-16.43-4.13-16.43-7.84s6.75-7.84,16.43-7.84s16.43,4.13,16.43,7.84-6.75,7.84-16.43,7.84Z'/></g><g id='g-u-c-cactus'><path id='g-u-path-g3-s12' fill='var(--g3)' stroke='#1d1d1b' stroke-miterlimit='10' d='M472.19,568.48c-2.08,0-4.06-1.22-4.92-3.26-1.15-2.71.12-5.85,2.84-6.99l9.15-4.01c6.3-2.32,6.81-7.21,6.81-12.89v-24.64c0-2.95,2.39-5.34,5.34-5.34s5.34,2.39,5.34,5.34v24.64c0,4.86,0,17.74-13.67,22.86l-8.81,3.87c-.68.29-1.38.42-2.08.42Z'/><path id='g-u-path-g2-s12' fill='var(--g2)' stroke='#1d1d1b' stroke-miterlimit='10' d='M467,461.21c-4.18,0-7.59,3.42-7.59,7.59v120.85c2.15.53,4.58.86,7.26.86c2.95,0,5.63-.39,7.93-1.03v-120.68c0-4.18-3.42-7.59-7.59-7.59Z'/><path id='g-u-path-g3-s13' fill='var(--g3)' stroke='#1d1d1b' stroke-miterlimit='10' d='M467.54,546.11c-3.15-2.71-6.81.31-6.81.31s-2.56,2.57-7.4,1.92c-2.76-.37-3.5-1.2-3.5-6.37v-35.8c0-2.92-2.25-5.47-5.17-5.56s-5.5,2.33-5.5,5.33v36.03c0,3.77,0,15.25,12.77,16.95c1.03.14,2.02.2,2.97.2c5.54,0,9.76-2.13,12.29-4.17c1.34-1.08,2.1-2.69,2.09-4.41c0-1.48-.36-3.25-1.73-4.43Z'/><g id='g-u-c-spikes'><path id='g-s-line51' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M467.23 464.25 467.23 458.01'/><path id='g-s-line52' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M471.69 477.89 477.31 477.17'/><path id='g-s-line53' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M461.7 471.91 456.8 469.77'/><path id='g-s-line54' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M467.23 492.06 469.1 488.14'/><path id='g-s-line55' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M457.33 482.29 461.81 484.83'/><path id='g-s-line56' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M472.18 511.85 477.66 509.77'/><path id='g-s-line57' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M457.26 508.44 461.41 511.85'/><path id='g-s-path340' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M472.41,531.63c2.03-1.09,4.06-2.17,6.1-3.26'/><path id='g-s-path341' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M457.59,524.38c1.27.63,2.53,1.26,3.8,1.9'/><path id='g-s-path342' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M492.3,514.06c1.26-1.59,2.53-3.19,3.79-4.78'/><path id='g-s-path343' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M443.75,503.49c-.84-1.78-1.32-3.72-1.41-5.69'/><path id='g-s-path344' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M435.86,515.96c1.92.41,3.84.82,5.76,1.23'/><path id='g-s-path345' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M447.32,523.7c1.96-.54,3.92-1.08,5.88-1.62'/><path id='g-s-path346' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M437.34,531.84c1.36.62,2.73,1.23,4.09,1.85'/><path id='g-s-path347' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M444.87,540.91c1.14-.87,2.27-1.74,3.41-2.61'/><path id='g-s-path348' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M444.6,553.54c-1.6,1.05-3.21,2.1-4.81,3.14'/><path id='g-s-path349' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M452.97,557.52c.29,1.69.58,3.39.87,5.08'/><path id='g-s-path350' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M485.67,560.56c1.45.75,2.91,1.5,4.36,2.25'/><path id='g-s-path351' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M494.79,549.07c1.78-.6,3.57-1.21,5.35-1.81'/><path id='g-s-path352' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M484.05,523.99c1.8,1.35,3.59,2.7,5.39,4.05'/><path id='g-s-path353' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M495.78,534.71c1.32-1,2.63-2.01,3.95-3.01'/><path id='g-s-path354' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M491.09,540.62l-2.61-1.87'/><path id='g-s-path355' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M480.74,553.64c-.92-.98-1.49-2.27-1.61-3.61'/><path id='g-s-path356' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M465.93,520.87c1.06,1.38,2.12,2.76,3.18,4.15'/><path id='g-s-path357' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M457.07,568.44c1.19.94,2.38,1.89,3.57,2.83'/><path id='g-s-path358' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M463.84,585.68c1.08-1.19,2.16-2.39,3.24-3.58'/><path id='g-s-path359' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M474.51,562.78c1.08-.87,2.17-1.75,3.25-2.62'/><path id='g-s-path360' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M466.45,569.97c.72-1.71,1.44-3.41,2.16-5.12'/><path id='g-s-path361' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M473.84,580.7c1.11-1.34,2.23-2.68,3.34-4.02'/><path id='g-s-path362' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M457.44,549.92c-.69-1.38-1.39-2.77-2.08-4.15'/></g></g></g></g>";
  string internal constant C_MARTINI_A = "<g transform='translate(-312,0)'><g id='g-u-c-martini-a'><g id='g-u-c-martini-tra' transform='translate(0 0.000001)'><path id='g-u-shadow4' fill='#1d1d1b' d='M504.98,588.63c-1.41-9.19-17.58-14.34-36.13-11.5-7.54,1.16-14.32,3.46-19.6,6.4c5.12-2.17,11.64-3.47,18.74-3.47c16.49,0,29.85,7,29.85,15.64c0,3.25-1.9,6.27-5.14,8.78c8.22-4.34,13.14-10.2,12.27-15.85Z' opacity='0.3' style='mix-blend-mode:multiply'/><g id='g-u-glass' transform='translate(0 0.000001)'><path id='g-s-path368' fill='url(#g-s-path368-fill)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='0.86' d='M468,518.21c-24.18,0-43.13-10.55-43.13-24.03c0-6.79,4.75-13.01,13.36-17.53c8-4.19,18.57-6.5,29.76-6.5v0c24.18,0,43.13,10.55,43.13,24.03s-18.95,24.03-43.13,24.03Z'/><path id='g-s-path369' fill='url(#g-s-path369-fill)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='0.86' d='M467.99,580.06c16.49,0,29.85,7,29.85,15.64s-13.37,15.64-29.85,15.64c-16.49,0-29.85-7-29.85-15.64s13.37-15.64,29.85-15.64'/><path id='g-s-path370' fill='url(#g-s-path370-fill)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='0.86' d='M467.58,550.94c-1.91,0-3.46-.85-3.46-1.89v44.62c0,0,0,0,0,0c.02,1.03,1.56,1.87,3.46,1.87s3.46-.85,3.46-1.89v-44.6c0,1.05-1.55,1.89-3.46,1.89Z'/><path id='g-s-path371' fill='url(#g-s-path371-fill)' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' d='M506.82,504.82c-.89,1.03-1.91,2.01-3.04,2.94-4.61,8.6-18.71,14.71-35.85,14.71-17.29,0-31.49-6.22-35.97-14.95-1.31-1.11-2.49-2.29-3.46-3.53h-.08c0,0,35.69,45.06,35.69,45.06.82.86,1.55,1.89,3.46,1.89s2.64-.87,3.46-1.89l35.99-44.23h-.21Z'/><path id='g-s-path372' fill='url(#g-s-path372-fill)' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' d='M467.93,480.75v0c-9.72,0-18.9,2-25.84,5.64-7.48,3.92-11.6,9.32-11.6,15.22c0,2.06.52,4.05,1.48,5.92c4.47,8.73,18.67,14.95,35.97,14.95c17.14,0,31.24-6.1,35.85-14.71c1.04-1.94,1.6-4,1.6-6.15c0-11.7-16.45-20.86-37.45-20.86Z'/><path id='g-s-path373' fill='#fff' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' d='M468,470.16v0c-11.19,0-21.76,2.31-29.76,6.5-8.62,4.51-13.36,10.74-13.36,17.53c0,13.47,18.95,24.03,43.13,24.03s43.13-10.55,43.13-24.03-18.95-24.03-43.13-24.03Zm0,45.05c-22.16,0-40.13-9.41-40.13-21.03c0-11.61,17.97-21.03,40.13-21.03s40.13,9.41,40.13,21.03c0,11.61-17.97,21.03-40.13,21.03Z'/><path id='g-s-path374' fill='url(#g-s-path374-fill)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='0.86' d='M468,518.21c-17.87,0-32.87-5.77-39.49-14.21h-.08c0,0,35.69,45.06,35.69,45.06.82.86,1.55,1.89,3.46,1.89s2.64-.87,3.46-1.89l35.99-44.23h-.21c-6.93,7.99-21.53,13.39-38.82,13.39Z'/><g id='g-u-c-olive'><path id='g-s-line58' fill='none' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' d='M448.07 492.85 464.18 512.61'/><circle id='g-s-circle14' r='6.49' fill='#93bf1f' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' transform='translate(447.74 492.62)'/><path id='g-s-line59' fill='none' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' d='M428.65 468.66 446.54 490.97'/></g></g></g></g></g>";
  string internal constant C_PEEPHOLE_A = "<g transform='translate(-312,-360)'><g id='g-u-peephole-a'><path id='g-s-path15' fill='#1d1d1b' stroke='#4c598e' stroke-linecap='square' stroke-linejoin='round' stroke-width='0.5' d='M345.39,478.09v0v86.54l98.67-56.86v-86.84c0,0-98.67,57.16-98.67,57.16Z'/><g id='g-u-c-captive-eyes'><g style='animation:g-u-eyer_to__to 60000ms linear 999 normal forwards' transform='translate(379.275375,499.421585)'><g style='animation:g-u-eyer_ts__ts 60000ms linear 999 normal forwards' transform='scale(1,1)'><g id='g-u-eyer' transform='translate(-379.275375,-499.421585)'><ellipse id='g-u-ellipse2r' fill='#fff' rx='10.5' ry='5.71' transform='matrix(.898641-.438685 0.438685 0.898641 379.275375 499.421559)'/><g style='animation:g-u-ellipse1r_to__to 60000ms linear 999 normal forwards' transform='translate(-231.14,642.92)'><ellipse id='g-u-ellipse1r' rx='5.85' ry='4.42' transform='rotate(-65.999971) translate(379.41,499.41)'/></g></g></g></g><g style='animation:g-u-eyel_to__to 60000ms linear 999 normal forwards' transform='translate(410.218948,482.52623)'><g style='animation:g-u-eyel_ts__ts 60000ms linear 999 normal forwards' transform='scale(1,1)'><g id='g-u-eyel' transform='translate(-410.218948,-482.52623)'><ellipse id='g-u-ellipse2l' fill='#fff' rx='10.5' ry='5.71' transform='matrix(.898641-.438685 0.438685 0.898641 410.218922 482.526214)'/><g style='animation:g-u-ellipse1l_to__to 60000ms linear 999 normal forwards' transform='translate(-197.36,661.17)'><ellipse id='g-u-ellipse1l' rx='5.85' ry='4.42' transform='rotate(-65.999971) translate(410.35,482.53)'/></g></g></g></g></g><g style='animation:g-u-c-door_to__to 60000ms linear 999 normal forwards' transform='translate(393.854996,488.410004)'><g id='g-u-c-door' transform='translate(-393.854996,-499.410004)'><path id='g-u-polygon-c1b-s13' fill='var(--c1b)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M436.88 462.39 436.88 458.87 350.83 508.99 350.83 512.25 436.88 462.39z'/><path id='g-u-polygon-c1b-s14' fill='var(--c1b)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M350.83 512.25 350.83 539.95 436.88 490.23 436.88 462.39 350.83 512.25z'/></g></g><g id='g-u-c-block-front'><g id='g-s-g5' transform='translate(0 0.000001)'><g id='g-u-group-c1-s1' transform='translate(0 0.000001)'><path id='g-s-polygon10' fill='var(--c1b)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M444.08 420.93 437.9 417.44 339.88 474.8 345.39 478.09 444.08 420.93z'/><path id='g-s-polygon11' fill='var(--c1b)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M345.39 478.09 339.88 474.8 339.88 561.3 345.39 564.63 345.39 478.09 345.39 478.09z'/></g><g id='g-u-group' transform='translate(.000001 0.000001)'><path id='g-u-polygon-c1l-s1' fill='var(--c1l)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M430.87 490.99 423.53 486.09 423.53 486.05 356.84 524.28 356.84 533.57 430.87 490.99z'/><path id='g-u-polygon-c1l-s12' fill='var(--c1l)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M424.12 455.2 423.53 455.54 423.53 486.05 423.53 486.09 430.87 490.99 431.23 490.79 431.23 480.95 431.23 451.1 424.12 455.2z'/></g><path id='g-u-path-c1b-s12' fill='var(--c1b)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M345.39,478.09v0v86.54l98.67-56.86v-86.84c0,0-98.67,57.16-98.67,57.16Zm83.57,11.14l-68.32,39.35v-31.88l58.17-33.5l10.15-5.85v31.88Z'/><g id='g-u-pins-group' transform='translate(.000001 0.000001)'><path id='g-s-path16' fill='#1d1d1b' d='M349.87,479.29c-.88.51-1.58,1.72-1.57,2.73s.71,1.41,1.59.9s1.58-1.73,1.57-2.73-.72-1.4-1.59-.9'/><path id='g-s-path17' fill='#1d1d1b' d='M349.48,555.76c-.88.51-1.58,1.72-1.57,2.73s.71,1.41,1.59.9s1.58-1.73,1.57-2.73-.72-1.4-1.59-.9'/><path id='g-s-path18' fill='#1d1d1b' d='M440.37,426.14c-.88.51-1.58,1.72-1.57,2.73s.71,1.41,1.59.9s1.58-1.73,1.57-2.73-.72-1.4-1.59-.9'/><path id='g-s-path19' fill='#1d1d1b' d='M439.98,503.35c-.88.51-1.58,1.72-1.57,2.73s.71,1.41,1.59.9s1.58-1.73,1.57-2.73-.72-1.4-1.59-.9'/></g></g></g></g></g>";
  string internal constant CB_LAVALAMP_WRAPPER = "<g style='transform:scale(0.5);transform-origin:50% 50%;'><g transform='translate(450,-800)'>";
  string internal constant CB_CACTUS_WRAPPER = "<g style='transform:scale(0.5);transform-origin:50% 50%;'><g transform='translate(520,-760)'>";
  string internal constant GROUP2_CLOSE = "</g></g>";
  
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 6000) {
      return C_LAVALAMP_A;
    } else if (assetID == 6001) {
      return string.concat(CB_LAVALAMP_WRAPPER, C_LAVALAMP_A, GROUP2_CLOSE);
    } else if (assetID == 6003) {
      return string.concat(CB_CACTUS_WRAPPER, C_CACTUS_A, GROUP2_CLOSE);
    } else if (assetID == 6004) {
      return C_MARTINI_A;
    } else if (assetID == 6005) {
      return C_PEEPHOLE_A;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 6000) {
      return 5;
    } else if (assetID == 6001) {
      return 5;
    } else if (assetID == 6002) {
      return 5;
    } else if (assetID == 6003) {
      return 5;
    } else if (assetID == 6004) {
      return 5;
    } else if (assetID == 6005) {
      return 5;
    } else {
      return 0;
    }
  }
}