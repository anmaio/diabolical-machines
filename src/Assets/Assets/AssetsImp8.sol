// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AssetsImp8 {

  string internal constant C_CACTUS_CHUNK = "<g id='g-u-cactuschunk'><g id='g-u-shadow-13' opacity='0.3' style='mix-blend-mode:multiply'><g id='g-s-g17' style='isolation:isolate'><path id='g-s-path141' fill='#1d1d1b' d='M496.33,647.19c-10.6-4.48-26.77-2.47-36.04,4.47s-8.18,16.23,2.43,20.71c10.6,4.48,26.77,2.47,36.04-4.47s8.18-16.23-2.43-20.71'/></g></g><g id='g-s-g18' transform='translate(.000001 0)'><path id='g-u-path-c2l-s1' fill='var(--c2l)' stroke='#1d1d1b' stroke-miterlimit='10' d='M447.95,633.86l6.84,33.1c0,1.46.89,2.87,2.53,4.11v0c.71.54,1.57,1.04,2.56,1.51c3.43,1.6,8,2.47,12.88,2.47s9.44-.88,12.84-2.47c.96-.45,1.78-.94,2.48-1.46v0c1.65-1.24,2.54-2.65,2.53-4.11l5.94-34.5-48.62,1.35Z'/><path id='g-u-path-c2l-s12' fill='var(--c2l)' stroke='#000' stroke-miterlimit='10' d='M495.33,630.92v0c0,0,.02.04.03.07l-.02-.07Z'/></g><g id='g-u-crown'><path id='g-u-path-c2b-s1' fill='var(--c2b)' stroke='#1d1d1b' stroke-linejoin='round' d='M497.77,628.45l-.24-.66c0,0-.02-.05-.03-.08-1.04-2.44-3.38-4.77-7.03-6.66-10.17-5.28-26.67-5.28-36.78,0-3.73,1.95-6.07,4.35-7.04,6.87-.01.03-.02.06-.03.08l-.03.08c-1.52,4.26.89,8.83,7.22,12.12c10.17,5.28,26.67,5.28,36.78,0c6.12-3.2,8.51-7.61,7.19-11.77Z'/></g><g id='g-u-soil' transform='translate(0 0.000001)'><path id='g-s-path142' fill='#1d1d1b' stroke='#1d1d1b' stroke-linejoin='round' d='M491.24,635.67c-.87.65-1.9,1.26-3.1,1.82-4.25,1.99-9.94,3.09-16.03,3.09s-11.8-1.1-16.08-3.09c-1.24-.58-2.31-1.21-3.2-1.88c0,0,0,0,0,0-2.06-1.55-3.16-3.31-3.17-5.13c0-2.59,2.22-5.06,6.26-6.95c4.25-1.99,9.94-3.09,16.03-3.09s11.8,1.1,16.08,3.09c4.1,1.91,6.36,4.4,6.37,7.01c0,1.82-1.1,3.59-3.17,5.13'/></g><g id='g-u-cactus' transform='translate(.000001 0)'><path id='g-s-path143' fill='#317f2d' stroke='#1d1d1b' stroke-linejoin='round' d='M456.08,598.24c0,0-8.96,0-11.19-4.1s-7.84-16.05-7.09-18.66s2.99-11.19,1.87-15.3-3.36-13.43-2.99-16.79s2.61-14.93,2.61-17.54-.75-8.96-1.87-11.57-1.87-17.16-.75-20.52s0-12.69,5.22-13.06s7.46,8.58,7.46,14.93s1.12,22.39,0,25.37c0,0,3.36,6.72,2.61,12.69s-2.61,14.55-2.61,14.55s3.36,7.84,2.99,12.31-.75,12.31-.75,12.31s2.24,13.43,7.09,15.67-2.61,9.7-2.61,9.7Z'/><path id='g-s-path144' fill='#317f2d' stroke='#1d1d1b' stroke-linejoin='round' d='M487.61,615.24c0,0,8.95.23,11.3-3.81s8.25-15.84,7.57-18.47-2.69-11.27-1.47-15.34c1.23-4.07,3.71-13.34,3.42-16.71s-2.57-22.56-2.57-22.56s1.4-3.97,2.58-6.55s2.31-17.11,1.28-20.5.33-12.68-4.88-13.19-7.68,8.39-7.85,14.73c-.16,6.34.85,22.27,1.89,25.28c0,0-6.08,6.71-5.49,12.7s2.23,14.62,2.23,14.62-3.56,7.75-3.3,12.23.43,12.33.43,12.33-2.59,13.37-7.49,15.48s2.36,9.77,2.36,9.77Z'/><path id='g-s-path145' fill='#317f2d' stroke='#1d1d1b' stroke-linejoin='round' d='M459.36,384.47c-5.81.77-7.8,10.14-8.19,26.52-.25,10.53,3.02,40.43,3.02,40.43s-1.9,14-1.56,20.28c.52,9.49,5.07,22.23,5.07,22.23s-3.9,9.75-3.51,15.21s2.73,13.65,2.73,13.65-3.12,16.38-2.73,23.4s1.56,15.21,1.95,16.38.5,11.03.5,11.03-3.62,13.54-2.84,17.44s4.7,12.41,4.7,12.41-2.75,9.81-2.36,14.1c.24,2.68,1.71,9.34,2.77,13.94.65,2.82,3.11,4.85,6,4.96l1.52.06c2.4.09,4.51-1.54,5.03-3.88c1.2-5.45,3.25-14.82,3.79-17.8.78-4.29-1.95-13.26-1.95-13.26s3.51-9.36,3.51-14.04-3.75-15.79-3.75-15.79s2.19-21.64,2.19-25.93-4.68-20.67-4.68-20.67s3.9-9.75,4.29-14.43-2.34-16.38-2.34-16.38s1.17-15.05.88-21.67c-.5-11.83-4.5-22.52-4.5-22.52s1.77-37.96,1.77-41.47.39-25.74-11.31-24.18Z'/><path id='g-s-path146' fill='#317f2d' stroke='#1d1d1b' stroke-linejoin='round' d='M480.65,636.64c-2.61.02-7.24.53-8.24-1.88-1.34-3.25-2.94-8.11-2.7-12.4.33-5.86,3.28-21.18,4.41-26.87.27-1.38.08-2.8-.53-4.06-1.37-2.83-3.64-8.14-3.07-11.01.81-4.03,3.63-14.52,4.03-16.94.32-1.9.38-7.54.4-9.87c0-.66-.09-1.31-.29-1.94-.85-2.73-3.2-10.89-2.53-15.22.81-5.24,2.42-13.31,2.42-15.33s-4.3-21.61-3.92-26.94c.05-.76,1.29-10.43,1.74-13.95.1-.77-.09-1.52-.13-2.29-1.01-20.52-1.12-34.44,5.34-35.52c9.68-1.61,7.1,17.43,7.5,23.08.32,4.51-1.49,14.93-1.9,17.5-.11.69-.1,1.38.01,2.07.5,2.91,3.93,8.9,4.43,16.42.38,5.74-2.1,13.26-2.1,15.73c0,4.63,2.73,6.08,2.73,12.16c0,1.28-2.87,8.21-2.52,9.44c1.14,3.93,2.96,9.79,1.72,15.38s-1.71,10.41-1.91,12.76c-.07.87.03,1.72.3,2.55.94,2.88,3.23,10.21,3.23,13.73c0,2.74-1.38,6.25-2.44,8.53-.71,1.54-.8,3.28-.23,4.88.99,2.76,2.41,7.31,2.67,11.2.4,6.05-.43,18.56-2.44,21.78-1.12,1.79-3.1,6.99-5.98,7.02Z'/><path id='g-s-path147' fill='none' stroke='#379e32' stroke-linejoin='round' d='M503.75,502.78c-.23,7.18-.47,14.41-1.97,21.44-.61,2.87,1.44,4.8,1.38,7.73-.11,4.72-1.12,10.34-1.9,14.99-.26,1.57-.82,3.07-1.17,4.62-1.63,7.3,1.49,15.1-.46,22.32-.43,1.58-1.1,3.13-1.18,4.77-.08,1.55.37,3.07.69,4.59c1.74,8.39-.93,17.57-6.9,23.71'/><path id='g-s-path148' fill='none' stroke='#379e32' stroke-linejoin='round' d='M478.13,443.59c2.61,6.54,1.81,13.88.92,20.87-2.03,15.95-4.28,32.42.07,47.9.93,3.32,2.17,6.61,2.35,10.05.38,7.49-4.31,14.63-3.58,22.1.56,5.77,4.33,11.04,3.99,16.83-.13,2.19-.84,4.29-1.34,6.42-2.2,9.35-.26,19.09.41,28.67.77,10.92-.13,21.95-2.65,32.6'/><path id='g-s-path149' fill='none' stroke='#379e32' stroke-linejoin='round' d='M441.92,484.7c.47,10.9.94,21.8,1.42,32.7.24,5.43.47,10.91-.56,16.25-.85,4.42-2.55,8.91-1.53,13.3.96,4.1,4.19,7.4,5.05,11.52c1.34,6.41-3.35,12.9-2.2,19.35.77,4.34,4.02,7.75,7.12,10.88'/><path id='g-s-path150' fill='none' stroke='#379e32' stroke-linejoin='round' d='M458.93,387.53c-2.8,9.2,3.21,38.62,1.35,50.85s-.35,26.69,1.06,38.98c.92,8,3.91,15.92,2.7,23.88-.61,4-2.27,7.79-2.93,11.78-1.85,11.18,4.23,22.09,5.08,33.39c1.12,15.01-7.04,30.17-3.24,44.73.59,2.28,1.48,4.5,1.66,6.85.19,2.48-.42,4.95-.85,7.4-1.58,8.92-.83,18.23,2.14,26.79'/><path id='g-s-path151' fill='none' stroke='#379e32' stroke-linejoin='round' d='M467.09,395.43l4.17-3.71'/><path id='g-s-path152' fill='none' stroke='#379e32' stroke-linejoin='round' d='M453.29,407.17c-1.97-.73-3.78-1.89-5.25-3.38'/><path id='g-s-path153' fill='none' stroke='#379e32' stroke-linejoin='round' d='M460.12,415.51l3.35-3.11'/><path id='g-s-path154' fill='none' stroke='#379e32' stroke-linejoin='round' d='M469.92,443.96c1.31-.7,2.46-1.68,3.36-2.86'/><path id='g-s-path155' fill='none' stroke='#379e32' stroke-linejoin='round' d='M449.81,456.16c1.31,1.46,2.97,2.61,4.8,3.33'/><path id='g-s-path156' fill='none' stroke='#379e32' stroke-linejoin='round' d='M464.89,473.38c1.03-1.49,2.24-2.86,3.59-4.07'/><path id='g-s-path157' fill='none' stroke='#379e32' stroke-linejoin='round' d='M457.47,484.61c-2.29-.24-4.54-.86-6.62-1.84'/><path id='g-s-path158' fill='none' stroke='#379e32' stroke-linejoin='round' d='M463.95,504.05c1.35-.58,2.62-1.33,3.79-2.23'/><path id='g-s-path159' fill='none' stroke='#379e32' stroke-linejoin='round' d='M460.04,516.1c-1.6-.71-2.89-2.1-3.48-3.74'/><path id='g-s-path160' fill='none' stroke='#379e32' stroke-linejoin='round' d='M465.1,536.02l3.39-2.34'/><path id='g-s-path161' fill='none' stroke='#379e32' stroke-linejoin='round' d='M465.6,550.19c-1.49-.62-2.77-1.73-3.6-3.11'/><path id='g-s-path162' fill='none' stroke='#379e32' stroke-linejoin='round' d='M464.17,566.92l4.55-3.35'/><path id='g-s-path163' fill='none' stroke='#379e32' stroke-linejoin='round' d='M457.43,580.35l-4.04-6'/><path id='g-s-path164' fill='none' stroke='#379e32' stroke-linejoin='round' d='M470.11,540.45l4.57,2.35'/><path id='g-s-path165' fill='none' stroke='#379e32' stroke-linejoin='round' d='M470.14,504.02c1.44,1.32,3.05,2.46,4.78,3.37'/><path id='g-s-path166' fill='none' stroke='#379e32' stroke-linejoin='round' d='M474.89,482.28c-1.51-1.6-3.03-3.19-4.54-4.79'/><path id='g-s-path167' fill='none' stroke='#379e32' stroke-linejoin='round' d='M484.03,470.75l3.83-3.59'/><path id='g-s-path168' fill='none' stroke='#379e32' stroke-linejoin='round' d='M481.54,444.66c.28-1.78.74-3.53,1.37-5.22'/><path id='g-s-path169' fill='none' stroke='#379e32' stroke-linejoin='round' d='M485.42,508.05c1.01-2.13,2.14-4.2,3.39-6.2'/><path id='g-s-path170' fill='none' stroke='#379e32' stroke-linejoin='round' d='M480.16,530.29c1.05-1.55,2.37-2.92,3.88-4.03'/><path id='g-s-path171' fill='none' stroke='#379e32' stroke-linejoin='round' d='M485.66,561.15l3.37-4.53'/><path id='g-s-path172' fill='none' stroke='#379e32' stroke-linejoin='round' d='M475.42,582.24c1.77,1.83,3.69,3.51,5.74,5.02'/><path id='g-s-path173' fill='none' stroke='#379e32' stroke-linejoin='round' d='M506.51,500.17c.56-1.55,1.39-3,2.42-4.28'/><path id='g-s-path174' fill='none' stroke='#379e32' stroke-linejoin='round' d='M494.31,510.95c1.28,1.59,2.83,2.97,4.55,4.07'/><path id='g-s-path175' fill='none' stroke='#379e32' stroke-linejoin='round' d='M506.52,547.79l4.07-4.55'/><path id='g-s-path176' fill='none' stroke='#379e32' stroke-linejoin='round' d='M492.38,566.94l2.66,4.05'/><path id='g-s-path177' fill='none' stroke='#379e32' stroke-linejoin='round' d='M505.08,588.45l3.59-4.31'/><path id='g-s-path178' fill='none' stroke='#379e32' stroke-linejoin='round' d='M495.99,591.33c.54,1.4,1.46,2.65,2.64,3.58'/><path id='g-s-path179' fill='none' stroke='#379e32' stroke-linejoin='round' d='M497.19,548.98c.77,1.7,1.73,3.31,2.87,4.78'/><path id='g-s-path180' fill='none' stroke='#379e32' stroke-linejoin='round' d='M442.16,480.56c-.51-1.95-.75-3.97-.72-5.98'/><path id='g-s-path181' fill='none' stroke='#379e32' stroke-linejoin='round' d='M434.27,495.63c1.55,1.66,3.32,3.12,5.26,4.32'/><path id='g-s-path182' fill='none' stroke='#379e32' stroke-linejoin='round' d='M450.28,526.48l3.83-4.79'/><path id='g-s-path183' fill='none' stroke='#379e32' stroke-linejoin='round' d='M435.7,540.61l4.32,4.05'/><path id='g-s-path184' fill='none' stroke='#379e32' stroke-linejoin='round' d='M449.58,565.97c.91-1.44,2.04-2.73,3.34-3.84'/><path id='g-s-path185' fill='none' stroke='#379e32' stroke-linejoin='round' d='M435,572.89l4.78,5.27'/><path id='g-s-path186' fill='none' stroke='#379e32' stroke-linejoin='round' d='M489.08,611.68l2.38-3.6'/><path id='g-s-path187' fill='none' stroke='#379e32' stroke-linejoin='round' d='M477.77,608.62c-1.51-.83-2.75-2.13-3.52-3.67'/><path id='g-s-path188' fill='none' stroke='#379e32' stroke-linejoin='round' d='M481.85,625.28l3.38-4.76'/><path id='g-s-path189' fill='none' stroke='#379e32' stroke-linejoin='round' d='M468.69,597.3c.68-1.6,1.67-3.06,2.9-4.29'/><path id='g-s-path190' fill='none' stroke='#379e32' stroke-linejoin='round' d='M454.12,606.16c1.13,1.7,2.51,3.23,4.07,4.54'/></g><path id='g-u-path-c2b-s12' fill='var(--c2b)' stroke='#1d1d1b' stroke-linejoin='round' d='M452.51,655.89c5.82,2.28,12.89,3.54,20.35,3.54s13.98-1.17,19.64-3.3l1.43-8.3c-5.93,2.48-13.28,3.84-21.07,3.84-8.24,0-15.98-1.53-22.11-4.29l1.76,8.51Z'/></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 6024) {
      return C_CACTUS_CHUNK;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 6024) {
      return 5;
    } else {
      return 0;
    }
  }
}