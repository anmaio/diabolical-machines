// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract ConveyorImp8 {

  string internal constant CB_SAW_A_A = "<g id='cb-u-saw-a'><g id='cb-u-saws-anims-a' mask='url(#cb-u-saw-cps-a)'><g id='cb-u-c-saw-anim-a' clip-path='url(#cb-u-c-saw-cp-a)'><g id='cb-u-c-sgrp-a'><g style='animation:cb-u-saws-a-all-grp_to__to 20000ms linear 999 normal forwards' transform='translate(703.78 317.49)'><g id='cb-u-saws-a-all-grp' transform='translate(-703.78 -317.49)'><g id='cb-u-saw-a-a' transform='translate(1 0)'><path id='cb-s-path264' fill='#fff' stroke='#221e1f' d='M638.67,247.26c15.84-51.7,58.04-61.96,93.77-22.8s52.2,112.87,36.59,163.81c-15.61,50.93-57.81,61.19-93.77,22.8-35.97-38.4-52.43-112.11-36.59-163.81Z'/><path id='cb-s-path265' fill='#c6f7f6' d='M645.49,255.02c14.14-46.15,51.82-55.31,83.72-20.35s46.6,100.77,32.66,146.24-51.61,54.63-83.72,20.35-46.81-100.09-32.66-146.24Z'/><path id='cb-s-path266' fill='#fff' d='M687.3,399.47c-13.44-12.8-23.36-29.58-29.71-46.94-1.81-4.94-3.32-9.98-4.56-15.09-.6-2.5-4.46-1.44-3.86,1.06c4.48,18.52,12.73,36.29,24.31,51.44c3.35,4.39,6.98,8.55,10.98,12.36c1.86,1.78,4.7-1.05,2.83-2.83Z'/><path id='cb-s-path267' fill='#fff' d='M692.16,402.75c-2.57,0-2.58,4,0,4s2.58-4,0-4Z'/></g></g></g></g><clipPath id='cb-u-c-saw-cp-a'><path id='cb-s-path270' fill='none' d='M780.16,505.36c1.09-115.91-158.77-218.49-156.28-78.61v23.38l52.14,30.09l51.99,30.05c28.63,16.53,51.96,30.01,51.96,30.01c0-9.95-.02-12.46.19-34.91Z'/></clipPath></g><mask id='cb-u-saw-cps-a'><g style='animation:cb-s-path271_to__to 20000ms linear 999 normal forwards' transform='translate(734.12 424.66)'><path id='cb-s-path271' fill='#fff' stroke='#3f5787' stroke-width='0' d='M649.33,439.946137l49.91,28.63524l3.447217,82.146892L801.012571,539.73L796.33423,374.71L614.171395,322.589999l-54.141394,97.714534L627.9,448.749999l21.43-8.803862Z' transform='translate(-706.12 -436.66)'/></g></mask></g></g>";
  string internal constant CB_SAW_A_B = "<g id='cb-u-saw-a'><g id='cb-u-saws-anims-a' mask='url(#cb-u-saw-cps-a)'><g id='cb-u-c-saw-anim-a' clip-path='url(#cb-u-c-saw-cp-a)'><g id='cb-u-c-sgrp-a'><g style='animation:cb-u-saws-a-all-grp_to__to 20000ms linear 999 normal forwards' transform='translate(703.78 317.49)'><g id='cb-u-saws-a-all-grp' transform='translate(-703.78 -317.49)'><g id='cb-u-saw-a-b' transform='matrix(.97 0 0 0.97 14.05295 5.55295)'><path id='cb-s-polyline8' fill='#fff' stroke='#221e1f' d='M702 268.07 696.59 269.85 690.61 262.52 685.93 265.63 679.48 259.17 675.65 263.54 668.92 258.1 666.02 263.62 659.15 259.34 657.26 265.87 650.43 262.84 649.61 270.23 642.98 268.54 643.23 276.6 636.97 276.29 638.3 284.82 632.57 285.91 634.93 294.7 629.87 297.14 633.21 305.97 628.93 309.71 633.17 318.37 629.79 323.33 634.83 331.6 632.42 337.64 638.13 345.33 636.76 352.29 643 359.2 642.7 366.94 649.31 372.9 650.09 381.21 656.92 386.08 658.77 394.76 665.64 398.41 668.49 407.25 675.23 409.6 679.03 418.37 685.49 419.36 690.14 427.85 696.14 427.45 701.53 435.46 706.94 433.69 712.93 441.01 717.61 437.9 724.05 444.36 727.89 440 734.62 445.43 737.52 439.91 744.39 444.2 746.27 437.67 753.11 440.68 753.93 433.3 760.56 434.98 760.3 426.93 766.56 427.23 765.24 418.71 770.97 417.63 768.61 408.84 773.67 406.39 770.33 397.56 774.6 393.81 770.37 385.16 773.74 380.21 768.71 371.94 771.11 365.9 765.41 358.21 766.78 351.24 760.54 344.33 760.84 336.59 754.22 330.63 753.44 322.32 746.61 317.45 744.77 308.77 737.9 305.12 735.04 296.28 728.3 293.94 724.5 285.16 718.04 284.18 713.4 275.68 707.39 276.08 702 268.07'/><path id='cb-u-path-g3-s12' fill='var(--g3)' d='M727.3,433.09l5.73,4.62l2.57-4.89l5.82,3.63l1.64-5.67l5.84,2.58.7-6.31l5.75,1.46-.21-6.83l5.54.27-1.13-7.24l5.19-.98-2.04-7.58l4.67-2.25-2.94-7.79l4-3.51-3.83-7.84l3.2-4.69-4.65-7.65l2.29-5.77-5.36-7.22l1.31-6.68-5.93-6.56.29-7.43-6.32-5.69-.75-7.98-6.55-4.67-1.76-8.31-6.6-3.5-2.71-8.4-6.46-2.25-3.57-8.25-6.17-.95-4.3-7.87-5.7.38-4.88-7.26-5.07,1.67-5.29-6.47-4.32,2.88-5.57-5.59-3.48,3.96-5.73-4.63-2.57,4.9-5.82-3.63-1.64,5.68-5.83-2.58-.7,6.32-5.75-1.47.22,6.84-5.54-.28l1.13,7.24-5.19.98l2.04,7.58-4.67,2.25l2.95,7.79-4.01,3.5l3.84,7.83-3.2,4.7l4.65,7.65-2.29,5.77l5.36,7.22-1.31,6.68l5.93,6.57-.29,7.43l6.32,5.7.75,7.97l6.55,4.68l1.76,8.3l6.6,3.5l2.72,8.4L679,405.6l3.57,8.25l6.17.94l4.3,7.86l5.69-.38l4.88,7.25l5.07-1.66l5.29,6.47l4.32-2.87l5.57,5.58l3.47-3.96Z'/></g></g></g></g><clipPath id='cb-u-c-saw-cp-a'><path id='cb-s-path270' fill='none' d='M780.16,505.36c1.09-115.91-158.77-218.49-156.28-78.61v23.38l52.14,30.09l51.99,30.05c28.63,16.53,51.96,30.01,51.96,30.01c0-9.95-.02-12.46.19-34.91Z'/></clipPath></g><mask id='cb-u-saw-cps-a'><g style='animation:cb-s-path271_to__to 20000ms linear 999 normal forwards' transform='translate(734.12 424.66)'><path id='cb-s-path271' fill='#fff' stroke='#3f5787' stroke-width='0' d='M649.33,439.946137l49.91,28.63524l3.447217,82.146892L801.012571,539.73L796.33423,374.71L614.171395,322.589999l-54.141394,97.714534L627.9,448.749999l21.43-8.803862Z' transform='translate(-706.12 -436.66)'/></g></mask></g></g>";
  string internal constant CB_SAW_A_C = "<g id='cb-u-saw-a'><g id='cb-u-saws-anims-a' mask='url(#cb-u-saw-cps-a)'><g id='cb-u-c-saw-anim-a' clip-path='url(#cb-u-c-saw-cp-a)'><g id='cb-u-c-sgrp-a'><g style='animation:cb-u-saws-a-all-grp_to__to 20000ms linear 999 normal forwards' transform='translate(703.78 317.49)'><g id='cb-u-saws-a-all-grp' transform='translate(-703.78 -317.49)'><g id='cb-u-saw-a-c' transform='matrix(.96 0 0 0.96 20.082999 4.084476)'><path id='cb-s-path268' fill='url(#cb-s-path260-fill)' stroke='#1d1d1b' d='M702.32,267.35c-40.68-23.49-73.89-4.58-74.02,42.17-.13,46.74,32.86,103.87,73.54,127.36c40.67,23.48,73.87,4.57,74.01-42.17.13-46.74-32.86-103.87-73.53-127.35'/><path id='cb-s-path269' fill='none' stroke='#fff' stroke-width='2' d='M734.87,435.09v0c-8.1,0-17.47-2.94-27.1-8.5-17.9-10.33-34.85-28.31-47.73-50.61-12.87-22.29-19.93-45.89-19.87-66.43'/></g></g></g></g><clipPath id='cb-u-c-saw-cp-a'><path id='cb-s-path270' fill='none' d='M780.16,505.36c1.09-115.91-158.77-218.49-156.28-78.61v23.38l52.14,30.09l51.99,30.05c28.63,16.53,51.96,30.01,51.96,30.01c0-9.95-.02-12.46.19-34.91Z'/></clipPath></g><mask id='cb-u-saw-cps-a'><g style='animation:cb-s-path271_to__to 20000ms linear 999 normal forwards' transform='translate(734.12 424.66)'><path id='cb-s-path271' fill='#fff' stroke='#3f5787' stroke-width='0' d='M649.33,439.946137l49.91,28.63524l3.447217,82.146892L801.012571,539.73L796.33423,374.71L614.171395,322.589999l-54.141394,97.714534L627.9,448.749999l21.43-8.803862Z' transform='translate(-706.12 -436.66)'/></g></mask></g></g>";

  string internal constant CB_SAW_C_A = "<g id='cb-u-saw-c' transform='translate(1 1)'><g id='cb-u-saws-anims-c' mask='url(#cb-u-saw-cps-c)'><g id='cb-u-c-saw-anim-c' clip-path='url(#cb-u-c-saw-cp-c)' transform='translate(-.216675 0)'><g id='cb-u-c-sgrp-c'><g style='animation:cb-u-saws-c-all-grp_to__to 20000ms linear 999 normal forwards' transform='translate(703.78 317.49)'><g id='cb-u-saws-c-all-grp' transform='translate(-700 -318)'><g id='cb-u-saw-c-a'><path id='cb-s-path256' fill='#fff' stroke='#221e1f' d='M638.67,247.26c15.84-51.7,58.04-61.96,93.77-22.8s52.2,112.87,36.59,163.81c-15.61,50.93-57.81,61.19-93.77,22.8-35.97-38.4-52.43-112.11-36.59-163.81Z'/><path id='cb-s-path257' fill='#c6f7f6' d='M645.49,255.02c14.14-46.15,51.82-55.31,83.72-20.35s46.6,100.77,32.66,146.24-51.61,54.63-83.72,20.35-46.81-100.09-32.66-146.24Z'/><path id='cb-s-path258' fill='#fff' d='M687.3,399.47c-13.44-12.8-23.36-29.58-29.71-46.94-1.81-4.94-3.32-9.98-4.56-15.09-.6-2.5-4.46-1.44-3.86,1.06c4.48,18.52,12.73,36.29,24.31,51.44c3.35,4.39,6.98,8.55,10.98,12.36c1.86,1.78,4.7-1.05,2.83-2.83Z'/><path id='cb-s-path259' fill='#fff' d='M692.16,402.75c-2.57,0-2.58,4,0,4s2.58-4,0-4Z'/></g></g></g></g><clipPath id='cb-u-c-saw-cp-c'><path id='cb-s-path262' fill='#3d4676' stroke='#1d1d1b' d='M779.98,420.01c-.21,22.45,0,110.31,0,120.26c0,0-23.34-13.48-51.96-30.01v0c0,0-51.99-30.05-51.99-30.05l-52.14-30.09L624,330.3L779.99,420Z'/></clipPath></g><mask id='cb-u-saw-cps-c'><g style='animation:cb-s-path263_to__to 20000ms linear 999 normal forwards' transform='translate(734.12 424.66)'><path id='cb-s-path263' fill='#fff' stroke='#3f5787' stroke-width='0' d='M649.33,439.946137l49.91,28.63524l3.447217,82.146892L801.012571,539.73L796.33423,374.71L558.582075,239.742061l1.447926,180.562472L627.9,448.749999l21.43-8.803862Z' transform='translate(-706.12 -436.66)'/></g></mask></g></g>";
  string internal constant CB_SAW_C_B = "<g id='cb-u-saw-c' transform='translate(1 1)'><g id='cb-u-saws-anims-c' mask='url(#cb-u-saw-cps-c)'><g id='cb-u-c-saw-anim-c' clip-path='url(#cb-u-c-saw-cp-c)' transform='translate(-.216675 0)'><g id='cb-u-c-sgrp-c'><g style='animation:cb-u-saws-c-all-grp_to__to 20000ms linear 999 normal forwards' transform='translate(703.78 317.49)'><g id='cb-u-saws-c-all-grp' transform='translate(-700 -318)'><g id='cb-u-saw-c-b' transform='matrix(.97 0 0 0.97 14.05295 5.55295)'><path id='cb-s-polyline7' fill='#fff' stroke='#221e1f' d='M702 268.07 696.59 269.85 690.61 262.52 685.93 265.63 679.48 259.17 675.65 263.54 668.92 258.1 666.02 263.62 659.15 259.34 657.26 265.87 650.43 262.84 649.61 270.23 642.98 268.54 643.23 276.6 636.97 276.29 638.3 284.82 632.57 285.91 634.93 294.7 629.87 297.14 633.21 305.97 628.93 309.71 633.17 318.37 629.79 323.33 634.83 331.6 632.42 337.64 638.13 345.33 636.76 352.29 643 359.2 642.7 366.94 649.31 372.9 650.09 381.21 656.92 386.08 658.77 394.76 665.64 398.41 668.49 407.25 675.23 409.6 679.03 418.37 685.49 419.36 690.14 427.85 696.14 427.45 701.53 435.46 706.94 433.69 712.93 441.01 717.61 437.9 724.05 444.36 727.89 440 734.62 445.43 737.52 439.91 744.39 444.2 746.27 437.67 753.11 440.68 753.93 433.3 760.56 434.98 760.3 426.93 766.56 427.23 765.24 418.71 770.97 417.63 768.61 408.84 773.67 406.39 770.33 397.56 774.6 393.81 770.37 385.16 773.74 380.21 768.71 371.94 771.11 365.9 765.41 358.21 766.78 351.24 760.54 344.33 760.84 336.59 754.22 330.63 753.44 322.32 746.61 317.45 744.77 308.77 737.9 305.12 735.04 296.28 728.3 293.94 724.5 285.16 718.04 284.18 713.4 275.68 707.39 276.08 702 268.07'/><path id='cb-u-path-g3-s1' fill='var(--g3)' d='M727.3,433.09l5.73,4.62l2.57-4.89l5.82,3.63l1.64-5.67l5.84,2.58.7-6.31l5.75,1.46-.21-6.83l5.54.27-1.13-7.24l5.19-.98-2.04-7.58l4.67-2.25-2.94-7.79l4-3.51-3.83-7.84l3.2-4.69-4.65-7.65l2.29-5.77-5.36-7.22l1.31-6.68-5.93-6.56.29-7.43-6.32-5.69-.75-7.98-6.55-4.67-1.76-8.31-6.6-3.5-2.71-8.4-6.46-2.25-3.57-8.25-6.17-.95-4.3-7.87-5.7.38-4.88-7.26-5.07,1.67-5.29-6.47-4.32,2.88-5.57-5.59-3.48,3.96-5.73-4.63-2.57,4.9-5.82-3.63-1.64,5.68-5.83-2.58-.7,6.32-5.75-1.47.22,6.84-5.54-.28l1.13,7.24-5.19.98l2.04,7.58-4.67,2.25l2.95,7.79-4.01,3.5l3.84,7.83-3.2,4.7l4.65,7.65-2.29,5.77l5.36,7.22-1.31,6.68l5.93,6.57-.29,7.43l6.32,5.7.75,7.97l6.55,4.68l1.76,8.3l6.6,3.5l2.72,8.4L679,405.6l3.57,8.25l6.17.94l4.3,7.86l5.69-.38l4.88,7.25l5.07-1.66l5.29,6.47l4.32-2.87l5.57,5.58l3.47-3.96Z'/></g></g></g></g><clipPath id='cb-u-c-saw-cp-c'><path id='cb-s-path262' fill='#3d4676' stroke='#1d1d1b' d='M779.98,420.01c-.21,22.45,0,110.31,0,120.26c0,0-23.34-13.48-51.96-30.01v0c0,0-51.99-30.05-51.99-30.05l-52.14-30.09L624,330.3L779.99,420Z'/></clipPath></g><mask id='cb-u-saw-cps-c'><g style='animation:cb-s-path263_to__to 20000ms linear 999 normal forwards' transform='translate(734.12 424.66)'><path id='cb-s-path263' fill='#fff' stroke='#3f5787' stroke-width='0' d='M649.33,439.946137l49.91,28.63524l3.447217,82.146892L801.012571,539.73L796.33423,374.71L558.582075,239.742061l1.447926,180.562472L627.9,448.749999l21.43-8.803862Z' transform='translate(-706.12 -436.66)'/></g></mask></g></g>";
  string internal constant CB_SAW_C_C = "<g id='cb-u-saw-c' transform='translate(1 1)'><g id='cb-u-saws-anims-c' mask='url(#cb-u-saw-cps-c)'><g id='cb-u-c-saw-anim-c' clip-path='url(#cb-u-c-saw-cp-c)' transform='translate(-.216675 0)'><g id='cb-u-c-sgrp-c'><g style='animation:cb-u-saws-c-all-grp_to__to 20000ms linear 999 normal forwards' transform='translate(703.78 317.49)'><g id='cb-u-saws-c-all-grp' transform='translate(-700 -318)'><g id='cb-u-saw-c-c' transform='matrix(.96 0 0 0.96 20.082999 4.084476)'><path id='cb-s-path260' fill='url(#cb-s-path260-fill)' stroke='#1d1d1b' d='M702.32,267.35c-40.68-23.49-73.89-4.58-74.02,42.17-.13,46.74,32.86,103.87,73.54,127.36c40.67,23.48,73.87,4.57,74.01-42.17.13-46.74-32.86-103.87-73.53-127.35'/><path id='cb-s-path261' fill='none' stroke='#fff' stroke-width='2' d='M734.87,435.09v0c-8.1,0-17.47-2.94-27.1-8.5-17.9-10.33-34.85-28.31-47.73-50.61-12.87-22.29-19.93-45.89-19.87-66.43'/></g></g></g></g><clipPath id='cb-u-c-saw-cp-c'><path id='cb-s-path262' fill='#3d4676' stroke='#1d1d1b' d='M779.98,420.01c-.21,22.45,0,110.31,0,120.26c0,0-23.34-13.48-51.96-30.01v0c0,0-51.99-30.05-51.99-30.05l-52.14-30.09L624,330.3L779.99,420Z'/></clipPath></g><mask id='cb-u-saw-cps-c'><g style='animation:cb-s-path263_to__to 20000ms linear 999 normal forwards' transform='translate(734.12 424.66)'><path id='cb-s-path263' fill='#fff' stroke='#3f5787' stroke-width='0' d='M649.33,439.946137l49.91,28.63524l3.447217,82.146892L801.012571,539.73L796.33423,374.71L558.582075,239.742061l1.447926,180.562472L627.9,448.749999l21.43-8.803862Z' transform='translate(-706.12 -436.66)'/></g></mask></g></g>";

  string internal constant CB_CURTAINS = "<g id='cb-u-curtains' transform='translate(0 7)'><path id='cb-u-path-c3b-s121' fill='var(--c3b)' stroke='#000' d='M747.07,396.26c0,0,12.35,81.43,33.4,106.59c0,0-12.36,17.09-16.47,24.25-1.56,2.72,5.06,7.06,14.16,11.61s14.34,3.58,17.44,1.51-2.14-35.65-2.14-35.65s17.79-68.47,19.24-72.4-65.63-35.91-65.63-35.91Z'/><path id='cb-s-path322' fill='none' stroke='#221e1f' d='M780.3,502.57c0,0,1.26,2.53,7.67,2.48c5.25-.04,5.63-.85,5.63-.85'/><path id='cb-s-path323' fill='none' stroke='#221e1f' d='M784.92,503.64c-.5-.99-16.35-44.26-17.5-62.26'/><path id='cb-s-path324' fill='none' stroke='#221e1f' d='M787.4,503.64c0,0-2.81-41.28-1.49-56.64'/><path id='cb-u-path-c3b-s122' fill='var(--c3b)' stroke='#000' d='M669.82,352.21c0,0-27.41,58.46-45.91,65.06c0,0,11.89,30.05,11.89,32.7s-7.93,2.31-14.2-.99c-6.28-3.3-23.34-11.89-22.68-16.51s11.89-22.79,11.89-22.79l-4.96-95.78l63.96,38.31Z'/><path id='cb-s-path325' fill='none' stroke='#221e1f' d='M610.82,409.68c0,0,3.2,7.57,13.1,7.59'/><path id='cb-s-path326' fill='none' stroke='#221e1f' d='M615.12,416.65c0,0,25.97-27.45,33.46-50.13'/><path id='cb-s-path327' fill='none' stroke='#221e1f' d='M614.89,413.2c0,0,12.11-25.76,14.75-48.44'/><g id='cb-s-g201'><g id='cb-s-g202'><rect id='cb-u-rectangle-c3b-s1' width='1.86' height='15.87' fill='var(--c3b)' stroke='#1d1d1b' rx='0' ry='0' transform='translate(783.6 506.71)'/><rect id='cb-u-rectangle-c3b-s12' width='1.86' height='18.42' fill='var(--c3b)' stroke='#1d1d1b' rx='0' ry='0' transform='translate(785.54 506.71)'/><rect id='cb-u-rectangle-c3b-s13' width='1.86' height='15.87' fill='var(--c3b)' stroke='#1d1d1b' rx='0' ry='0' transform='translate(787.47 506.79)'/></g><ellipse id='cb-u-ellipse-c3b-s1' fill='var(--c3b)' stroke='#1d1d1b' rx='4.97' ry='4.86' transform='translate(786.41 506.12)'/></g><g id='cb-s-g203'><g id='cb-s-g204'><rect id='cb-u-rectangle-c3b-s14' width='1.86' height='15.87' fill='var(--c3b)' stroke='#1d1d1b' rx='0' ry='0' transform='translate(613.18 416.65)'/><rect id='cb-u-rectangle-c3b-s15' width='1.86' height='18.42' fill='var(--c3b)' stroke='#1d1d1b' rx='0' ry='0' transform='translate(615.12 416.65)'/><rect id='cb-u-rectangle-c3b-s16' width='1.86' height='15.87' fill='var(--c3b)' stroke='#1d1d1b' rx='0' ry='0' transform='translate(617.05 416.74)'/></g><ellipse id='cb-u-ellipse-c3b-s12' fill='var(--c3b)' stroke='#1d1d1b' rx='4.97' ry='4.86' transform='translate(615.99 416.07)'/></g><g id='cb-u-c-pole'><path id='cb-u-path-c2b-s149' fill='url(#cb-u-path-c2b-s149-fill)' stroke='#1d1d1b' stroke-width='0.5' d='M817.49,430.64L600.27,303.76v0c-.8-.44-2.12.38-2.96,1.83-.85,1.47-.88,3.03-.08,3.49l217.2,126.87l3.06-5.31Z'/><ellipse id='cb-u-ellipse-c2b-s117' fill='url(#cb-u-ellipse-c2b-s117-fill)' stroke='#1d1d1b' stroke-width='0.5' rx='3.06' ry='1.68' transform='matrix(.5-.866025 0.866025 0.5 815.905609 433.245037)'/></g></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 12040) {
      return CB_SAW_A_A;
    } else if (assetID == 12041) {
      return CB_SAW_A_B;
    } else if (assetID == 12042) {
      return CB_SAW_A_C;
    } else if (assetID == 12043) {
      return CB_SAW_C_A;
    } else if (assetID == 12044) {
      return CB_SAW_C_B;
    } else if (assetID == 12045) {
      return CB_SAW_C_C;
    } else if (assetID == 12046) {
      return CB_CURTAINS;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 12040) {
      return 2;
    } else if (assetID == 12041) {
      return 3;
    } else if (assetID == 12042) {
      return 4;
    } else if (assetID == 12043) {
      return 1;
    } else if (assetID == 12044) {
      return 3;
    } else if (assetID == 12045) {
      return 5;
    } else if (assetID == 12046) {
      return 3;
    } else {
      return 0;
    }
  }
}