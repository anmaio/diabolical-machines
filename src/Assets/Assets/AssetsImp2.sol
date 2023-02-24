// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AssetsImp2 {

  string internal constant C_MARTINI_B = "<g transform='translate(-312,90)'><g id='C-Martini-B'><path id='Shadow-2' d='M485.63 562.96c-.69-4.48-8.57-6.99-17.62-5.61-3.68.56-6.98 1.69-9.56 3.12 2.5-1.06 5.68-1.69 9.14-1.69 8.04 0 14.56 3.42 14.56 7.63 0 1.59-.92 3.06-2.51 4.28 4.01-2.12 6.41-4.97 5.98-7.73Z' opacity='.35'/><path fill='url(#ngr-swa_1-3)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M468 529.7c-11.4 0-20.3-5-20.3-11.3 0-3.2 2.2-6.1 6.3-8.3 3.7-2 8.7-3 14-3h0c11.4 0 20.3 5 20.3 11.3s-8.9 11.3-20.3 11.3Z'/><path fill='url(#li-gr-14)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M468 558.9c7.8 0 14 3.3 14 7.4s-6.2 7.3-14 7.3-14-3.3-14-7.4 6.2-7.3 14-7.3'/><path fill='url(#li-gr-15)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M467.8 545.2c-.9 0-1.6-.4-1.6-1v21.1s0 0 0 0c0 .5.7.9 1.6.9s1.6-.4 1.6-.9v-21c0 .5-.7.9-1.6.9Z'/><path fill='url(#li-gr-16)' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='m486.3 523.4-1.4 1.4c-2.2 4-8.8 7-17 7-8 0-14.8-3-16.9-7.1-.6-.6-1.2-1.1-1.6-1.7h0l16.8 21.3c.4.4.7.9 1.6.9s1.3-.5 1.6-1l17-20.8h-.1Z'/><path fill='url(#li-gr-17)' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M468 512h0c-4.6 0-9 1-12.2 2.7-3.5 1.9-5.5 4.4-5.5 7.2 0 1 .3 2 .7 2.8 2.1 4.1 8.8 7 17 7 8 0 14.7-2.8 16.9-6.9a6 6 0 0 0 .7-2.9c0-5.5-7.7-9.8-17.6-9.8Z'/><path fill='#fff' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M468 507h0a31 31 0 0 0-14 3.1c-4 2.2-6.3 5-6.3 8.3 0 6.3 8.9 11.3 20.3 11.3s20.3-5 20.3-11.3S479.4 507 468 507Zm0 21.3c-10.4 0-19-4.4-19-9.9s8.5-10 19-10c10.4 0 19 4.5 19 10s-8.5 10-19 10Z'/><path fill='url(#ngr-swa_1-4)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M468 529.7c-8.4 0-15.5-2.7-18.6-6.7h0l16.8 21.3c.4.4.7.9 1.6.9s1.2-.5 1.6-1l17-20.8h-.1c-3.3 3.8-10.2 6.3-18.3 6.3Z'/><g id='C-Olive-2'><path d='m458.6 517.8 7.6 9.3' class='gss-fc-37'/><circle cx='458.4' cy='517.7' r='3.1' fill='#93bf1f' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5'/><path d='m449.4 506.4 8.5 10.5' class='gss-fc-37'/></g></g></g>";
  string internal constant C_BONG_A = "<g transform='translate(-312,0)'><g id='C-Bong-A'><ellipse id='Shadow-5' cx='476' cy='591.7' class='gss-fc-90' rx='27' ry='17.7' transform='rotate(-18 475.9 591.6)'/><path d='M490 592a53.9 53.9 0 0 1-23.6 4.8c-8.9 0-17.2-1.7-23.5-4.8-4.2-2.2-7-4.8-8-7.5a32.3 32.3 0 0 0 63.3-.5c-.8 2.8-3.7 5.7-8.3 8Z' class='gss-fc-91'/><path fill='url(#ngr-swa_1-5)' stroke='#1d1d1b' stroke-miterlimit='10' d='M498.4 582.7Z'/><path fill='url(#ngr-swa_1-6)' stroke='#1d1d1b' stroke-miterlimit='10' d='M434.4 582.4c0 .7.2 1.4.4 2.1l-.4-2.4v.3Z'/><path d='M443 592a53.9 53.9 0 0 0 23.4 4.8c9 0 17.3-1.7 23.6-4.8 4.5-2.3 7.4-5.2 8.2-8l.2-1.3v-.3c0-3.3-3-6.8-8.5-9.5-6.2-3.1-14.5-4.9-23.5-4.9s-17.3 1.8-23.5 4.9c-5.2 2.6-8.3 6-8.5 9.2l.4 2.4c1 2.7 3.8 5.3 8.1 7.5Z' class='gss-fc-91'/><circle cx='466.5' cy='578.2' r='32.7' fill='url(#ngr-swa_1-7)' stroke='#1d1d1b' stroke-miterlimit='10'/><path fill='url(#ngr-swa_1-8)' stroke='#1d1d1b' stroke-miterlimit='10' d='M466.4 549.6a19 19 0 0 0-9 2c-2.2 1-3.4 2.5-3.4 3.9s1.2 2.8 3.3 3.9a20 20 0 0 0 9.1 2c3.5 0 6.8-.8 9.2-2 2-1.1 3.3-2.6 3.3-4s-1.2-2.7-3.3-3.8a20 20 0 0 0-9.2-2Z'/><path fill='url(#ngr-swa_1-9)' stroke='#1d1d1b' stroke-miterlimit='10' d='M478.9 481.4c0 1.4-1.2 2.8-3.3 4a20 20 0 0 1-9.2 1.9 19 19 0 0 1-9-2c-2.2-1-3.4-2.5-3.4-3.9v74c0 1.5 1.2 2.9 3.3 4a20 20 0 0 0 9.1 2c3.5 0 6.8-.8 9.2-2 2-1.1 3.3-2.5 3.3-4v-74Z'/><path fill='url(#ngr-swa_1-10)' stroke='#1d1d1b' stroke-miterlimit='10' d='M475.6 477.5c-2.4-1.2-5.7-2-9.2-2s-6.7.8-9 2c-2.2 1.1-3.4 2.6-3.4 4s1.2 2.7 3.3 3.8a20 20 0 0 0 9.1 2c3.5 0 6.8-.7 9.2-2 2-1 3.3-2.5 3.3-3.9s-1.2-2.8-3.3-3.9Z'/><path fill='url(#ngr-swa_1-11)' stroke='#1d1d1b' stroke-miterlimit='10' d='M496.7 547c-2.1-1.2-3.2-3.3-2.4-4.6l-14 22.9c-.9 1.2.2 3.3 2.3 4.7 2 1.3 4.4 1.4 5.2 0l14.1-22.8c-.8 1.3-3.1 1.2-5.2-.1Z'/><path fill='url(#ngr-swa_1-12)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='2' d='M499.6 542.5c-2.1-1.3-4.5-1.4-5.3-.1-.8 1.2.3 3.4 2.4 4.7 2 1.3 4.4 1.4 5.2.1.8-1.3-.2-3.4-2.3-4.7Z'/><g id='Bubbles'><circle cx='464.4' cy='572.8' r='3.2' class='gss-fc-93'/><circle cx='470.8' cy='579.7' r='1.8' class='gss-fc-93'/><circle cx='474.4' cy='589' r='6' class='gss-fc-93'/><circle cx='464.2' cy='601.3' r='4' class='gss-fc-93'/></g><path fill='url(#li-gr-36)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M479.7 476v5.4c0 3.8-6 7-13.2 7-7.2 0-13.1-3.1-13.1-7V476'/><path fill='#4c598e' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' d='M466.5 469.1c7.3 0 13.2 3.1 13.2 7s-6 6.8-13.2 6.8c-7.2 0-13.1-3-13.1-6.9 0-3.8 5.9-6.9 13.1-6.9'/><path fill='url(#li-gr-37)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M466.5 470.5a19 19 0 0 0-8.7 1.8c-2 1-3.1 2.4-3.1 3.7s1.1 2.7 3.1 3.7c2.3 1.2 5.4 1.9 8.7 1.9s6.4-.7 8.7-1.9c2-1 3.1-2.4 3.1-3.7s-1.1-2.6-3.1-3.7a19.2 19.2 0 0 0-8.7-1.8Z'/><ellipse cx='466.6' cy='475.8' class='gss-fc-100' rx='5' ry='2.7'/><path fill='none' stroke='#fff' stroke-linecap='round' stroke-miterlimit='10' stroke-width='.8' d='M466.7 484c-3.6 0-7-.8-9.6-2.1a10 10 0 0 1-2.8-2.2'/></g></g>";
  string internal constant C_BONG_B = "<g transform='translate(-312,90)'><g id='C-Bong-B'><ellipse id='Shadow-6' cx='471.2' cy='561' class='gss-fc-90' rx='11' ry='7.2' transform='rotate(-18 471.2 561)'/><path d='M477 561.1a22 22 0 0 1-9.6 2c-3.7 0-7-.7-9.6-2-1.7-.8-2.9-1.9-3.3-3a13.2 13.2 0 0 0 25.8-.2c-.3 1.2-1.5 2.3-3.4 3.2Z' class='gss-fc-89'/><path fill='url(#ngr-swa_1-13)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5' d='M480.4 557.4Z'/><path fill='url(#ngr-swa_1-14)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5' d='m454.3 557.3.2.8-.2-1v.2Z'/><path d='M457.8 561.1c2.5 1.3 6 2 9.6 2 3.6 0 7-.7 9.5-2 1.9-.9 3-2 3.4-3.2l.1-.5v-.1c0-1.4-1.3-2.8-3.5-4-2.5-1.2-5.9-1.9-9.5-1.9s-7 .7-9.6 2c-2.1 1-3.4 2.4-3.5 3.7l.2 1c.4 1.1 1.6 2.2 3.3 3Z' class='gss-fc-89'/><circle cx='467.4' cy='555.5' r='13.3' fill='url(#ngr-swa_1-15)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5'/><path fill='url(#ngr-swa_1-16)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5' d='M467.4 544c-1.4 0-2.8.2-3.7.7-.9.5-1.4 1-1.4 1.6s.5 1.1 1.3 1.6c1 .5 2.3.8 3.8.8 1.4 0 2.7-.3 3.7-.8.8-.5 1.3-1 1.3-1.6s-.5-1.1-1.3-1.6c-1-.5-2.3-.8-3.7-.8Z'/><path fill='url(#ngr-swa_1-17)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5' d='M472.4 516.2c0 .5-.5 1.1-1.3 1.5-1 .6-2.3.8-3.7.8a7 7 0 0 1-3.7-.8c-.9-.4-1.4-1-1.4-1.5v30.1c0 .6.5 1.1 1.3 1.6 1 .5 2.3.8 3.8.8 1.4 0 2.7-.3 3.7-.8.8-.5 1.3-1 1.3-1.6v-30.1Z'/><path fill='url(#ngr-swa_1-18)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5' d='M471 514.6c-.9-.5-2.2-.8-3.6-.8s-2.8.3-3.8.8c-.8.4-1.3 1-1.3 1.6s.5 1.1 1.3 1.5c1 .6 2.3.8 3.8.8 1.4 0 2.7-.2 3.7-.8.8-.4 1.3-1 1.3-1.5s-.5-1.2-1.3-1.6Z'/><path fill='url(#ngr-swa_1-19)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5' d='M479.7 542.9c-.9-.5-1.3-1.4-1-2l-5.7 9.4c-.3.5 0 1.4 1 1.9s1.7.6 2 0l5.8-9.3c-.3.6-1.3.5-2.1 0Z'/><path fill='url(#ngr-swa_1-20)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5' d='M480.9 541c-.9-.5-1.9-.6-2.2 0-.3.5.1 1.3 1 1.9s1.8.5 2.1 0c.3-.5-.1-1.4-1-1.9Z'/><g id='Bubbles-2'><circle cx='466.5' cy='553.4' r='1.3' class='gss-fc-93'/><circle cx='469.1' cy='556.1' r='.7' class='gss-fc-93'/><circle cx='470.6' cy='559.9' r='2.5' class='gss-fc-93'/><circle cx='466.5' cy='565' r='1.6' class='gss-fc-93'/></g><path fill='url(#li-gr-38)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M472.8 514v2.2c0 1.5-2.4 2.8-5.4 2.8-3 0-5.3-1.3-5.3-2.8V514'/><path fill='#4c598e' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M467.4 511.2c3 0 5.3 1.2 5.3 2.8s-2.3 2.8-5.3 2.8-5.3-1.3-5.3-2.8 2.3-2.8 5.3-2.8'/><path fill='url(#li-gr-39)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.3' d='M467.4 511.7c-1.3 0-2.6.3-3.5.8-.8.4-1.3 1-1.3 1.5s.5 1 1.3 1.5c.9.5 2.2.7 3.5.7a9 9 0 0 0 3.5-.7c.8-.5 1.3-1 1.3-1.5s-.5-1.1-1.3-1.5c-.9-.5-2.2-.8-3.5-.8Z'/><ellipse cx='467.4' cy='513.9' class='gss-fc-100' rx='2' ry='1.1'/><path fill='none' stroke='#fff' stroke-linecap='round' stroke-miterlimit='10' stroke-width='.3' d='M467.5 517.2c-1.5 0-2.9-.3-4-.9-.4-.2-.8-.5-1-.8'/></g></g>";
  string internal constant C_FRIDGE_A = "<g transform='translate(-322,20)'><g id='C-Fridge-A'><path fill='#1d1d1b' d='m403 616 84-50h5l54 30c3 2 3 8 0 10l-86 49h-6l-51-29c-4-2-4-8 0-10z' opacity='.3' style='mix-blend-mode:multiply'/><rect width='9.3' height='19.4' x='400' y='604' class='g-fri-sm-cls-81' rx='4.6' ry='4.6'/><rect width='9.3' height='19.4' x='454' y='635' class='g-fri-sm-cls-81' rx='4.6' ry='4.6'/><rect width='9.3' height='19.4' x='527' y='593' class='g-fri-sm-cls-81' rx='4.6' ry='4.6'/><path fill='url(#g-fri-sm-cls-lg)' stroke='#000' stroke-miterlimit='10' d='M475 427c-2-2-4-2-6-1l-69 39c-4 2-6 6-6 11v132c0 3 2 6 5 8l57 32c2 2 5 2 7 0l3-1 73-184-64-36z'/><path fill='url(#d)' stroke='#000' stroke-miterlimit='10' d='M542 468v131c0 3-1 5-3 6l-76 44c-2 1-4-1-4-3l-1-134c0-4 3-9 7-11l69-38c4-2 8 1 8 5z'/><circle cx='532' cy='523.6' r='4.7' class='g-fri-sm-cls-80'/><rect width='25.2' height='3.6' x='510' y='528' class='g-fri-sm-cls-80' rx='1.8' ry='1.8' transform='rotate(-29 523 529)'/><path fill='none' stroke='#1d1d1b' stroke-linecap='round' stroke-linejoin='round' d='m396 471 63 37m-59-42 63 36'/><path d='M458 618h-1l-7-5a1 1 0 1 1 1-3l7 5 9-5a1 1 0 1 1 1 3l-9 5h-1z' class='g-fri-sm-cls-80'/><path d='M504 508c-7 4-13 11-13 15s6 3 13-1 14-11 14-15-6-3-14 1' class='g-fri-sm-cls-80' style='isolation:isolate'/><path fill='none' stroke='#fff' stroke-linecap='round' stroke-linejoin='round' stroke-width='3' d='m485 497-16 8s-6 4-6 11v66'/><path d='M459 548h-1l-8-5-1-2 2-1 8 5 8-5a1 1 0 1 1 2 3l-10 5z' class='g-fri-sm-cls-80'/></g></g>";
  string internal constant C_FRIDGE_B = "<g transform='translate(-322,20)'><g id='C-Fridge-B'><path fill='#1d1d1b' d='m422 595 60-36h4l38 21c3 2 3 6 0 7l-61 36h-4l-36-21c-3-2-3-6-1-7z' opacity='.3' style='mix-blend-mode:multiply'/><rect width='6.7' height='13.9' x='419' y='586' class='g-fri-sm-cls-81' rx='3.3' ry='3.3'/><rect width='6.7' height='13.9' x='458' y='608' class='g-fri-sm-cls-81' rx='3.3' ry='3.3'/><rect width='6.7' height='13.9' x='511' y='578' class='g-fri-sm-cls-81' rx='3.3' ry='3.3'/><path fill='url(#c)' stroke='#000' stroke-miterlimit='10' d='M473 458h-4l-50 28c-3 1-4 4-4 8v95l3 6 41 23h6l2-1 52-132-46-27z'/><path fill='url(#b)' stroke='#000' stroke-miterlimit='10' d='M521 488v94l-2 5-54 31c-2 1-4 0-4-2v-96c0-3 2-6 5-8l49-27c3-2 6 0 6 3z'/><circle cx='514' cy='528.2' r='3.4' class='g-fri-sm-cls-80'/><rect width='18.1' height='2.6' x='498' y='531' class='g-fri-sm-cls-80' rx='1.3' ry='1.3' transform='rotate(-29 507 532)'/><path fill='none' stroke='#1d1d1b' stroke-linecap='round' stroke-linejoin='round' d='m416 491 45 26m-42-31 45 27'/><path d='M461 596h-1l-5-4a1 1 0 1 1 1-1l5 3 6-4 2 1-1 1-6 4h-1z' class='g-fri-sm-cls-80'/><path d='M494 517c-5 3-10 8-10 11s5 2 10-1c6-3 10-8 10-11s-4-2-10 1' class='g-fri-sm-cls-80' style='isolation:isolate'/><path fill='none' stroke='#fff' stroke-linecap='round' stroke-linejoin='round' stroke-width='3' d='m480 509-11 6s-5 3-5 8l1 47'/><path d='m461 546-6-4a1 1 0 1 1 1-2l5 3 6-3h2l-1 2-6 4h-1z' class='g-fri-sm-cls-80'/></g></g>";
  string internal constant C_PLINTH_GLOBAL_A = "";
  string internal constant C_PLINTH_GLOBAL_B = "";
  
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 6005) {
      return C_MARTINI_B;
    } else if (assetID == 6006) {
      return C_BONG_A;
    } else if (assetID == 6007) {
      return C_BONG_B;
    } else if (assetID == 6008) {
      return C_FRIDGE_A;
    } else if (assetID == 6009) {
      return C_FRIDGE_B;
    } else if (assetID == 6010) {
      return C_PLINTH_GLOBAL_A;
    } else if (assetID == 6011) {
      return C_PLINTH_GLOBAL_B;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 6005) {
      return 5;
    } else if (assetID == 6006) {
      return 1;
    } else if (assetID == 6007) {
      return 1;
    } else if (assetID == 6008) {
      return 5;
    } else if (assetID == 6009) {
      return 5;
    } else if (assetID == 6010) {
      return 5;
    } else if (assetID == 6011) {
      return 5;
    } else {
      return 0;
    }
  }
}