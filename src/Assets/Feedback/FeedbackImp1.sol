// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract FeedbackImp1 {

  string internal constant C_FEEDBACK_A = "<g id='nos-u-c-feedback-a'><g id='nos-u-group'><g id='nos-u-detail'><path id='nos-s-path1' fill='url(#c0l)' stroke='#171d35' d='M265.74 712.89c-6.82-3.55-15.99-2.7-26.03 3.21-20.95 12.33-38.1 42.38-38.1 66.76 0 .35 0 .7.01 1.05l.06 46.54v.76l-9.7-6.29V779.6l-.04-2.19c0-24.39 17.14-54.43 38.1-66.76 10.22-6.02 19.54-6.68 26.4-2.9 1.72.81 9.29 5.15 9.29 5.15Z'/></g><path id='nos-s-path2' fill='url(#nos-s-path2-fill)' stroke='#1d1d1b' d='m277.7 787.79-76.12 43.49V781.3c-.74-56.66 78.78-105.43 76.12-37.09v43.58Z'/></g><path id='nos-s-path3' fill='url(#c2b)' stroke='#231f20' d='M211.23 779.52v32.55l17.69-10.11c0-.14-.02-.28-.02-.42 0-9.3 6.54-20.76 14.53-25.46s14.53-.83 14.53 8.61c0 .23-.02.47-.03.7l14.24-8.13v-27.43c2.13-54.72-61.54-15.67-60.94 29.69Z'/><g style='animation:nos-u-tube-2_tr__tr 20000ms linear 999 normal forwards' transform='rotate(-74.13 647.8049 231.4522)'><g id='nos-u-tube-2' transform='translate(-248.02 -791.2676)'><path id='nos-s-path4' fill='url(#nos-s-path4-fill)' stroke='#1d1d1b' d='M248.51 787.07c.54.57.02 1.92-1.15 3.02s-2.55 1.52-3.09.95l-20.18-21.46c-.54-.57-.02-1.92 1.15-3.02s2.55-1.52 3.09-.95l20.18 21.46Z'/><ellipse id='nos-s-ellipse1' fill='url(#c0l)' stroke='#171d35' rx='2.9' ry='1.42' transform='rotate(-43.09 1085.2397 97.4066)'/></g></g></g>";
  string internal constant C_FEEDBACK_B = "<g id='nos-u-c-feedback-b'><g id='nos-u-group-2'><path id='nos-s-polygon8' fill='url(#nos-s-polygon8-fill)' stroke='#1d1d1b' d='M289.55 710.41v75.47l-98.25 56.6v-75.41l98.25-56.66z'/><g id='nos-u-detail-2'><path id='nos-s-polygon9' fill='url(#c0l)' stroke='#1d1d1b' d='m182.47 762.04 98.48-56.64 8.6 5.02-98.25 56.65-8.83-5.03z'/><path id='nos-s-polygon10' fill='url(#c0l)' stroke='#1d1d1b' d='M182.47 837.4v-75.36l8.83 5.03v75.41l-8.83-5.08z'/></g></g><g id='nos-u-c-gauge-f'><path id='nos-s-polygon11' stroke='#000000' d='m200.3 772.27 80.25-46.28v54.69l-80.25 46.23v-54.64z'/><g id='nos-u-clip-group' clip-path='url(#nos-u-clipping-paths)'><g id='nos-u-lines' style='animation:nos-u-lines-anim_to__to 20000ms linear 999 normal forwards' transform='translate(194.385 804.1125)'><g id='nos-u-lines-anim' transform='translate(-194.385 -804.1125)'><path id='nos-u-line-a' fill='none' stroke='#ffffff' d='M198.885 802.118 337.5 721.405'/><path id='nos-u-line-a_a' fill='none' stroke='#ffffff' d='m204.27 798.82 11.88-6.84 3.35-19.09 17.35 21.96v-21.51l11.85 11.12-1.94-16.68 6.77 6.77-1.69-19.34L264.65 776l4.28-14.4 9.27-5.33' transform='translate(-78 45)'/><path id='nos-u-copy-of-line-a_a' fill='none' stroke='#ffffff' d='m204.27 798.82 11.88-6.84 3.35-19.09 17.35 21.96v-21.51l11.85 11.12-1.94-16.68 6.77 6.77-1.69-19.34L264.65 776l4.28-14.4 9.27-5.33' transform='translate(-221 127)'/><path id='nos-u-copy-of-line-a_a2' fill='none' stroke='#ffffff' d='m204.27 798.82 11.88-6.84 3.35-19.09 17.35 21.96v-21.51l11.85 11.12-1.94-16.68 6.77 6.77-1.69-19.34L264.65 776l4.28-14.4 9.27-5.33' transform='translate(-151 87)'/><path id='nos-u-copy-of-line-a_a-2' fill='none' stroke='#ffffff' d='m204.27 798.82 11.88-6.84 3.35-19.09 17.35 21.96v-21.51l11.85 11.12-1.94-16.68 6.77 6.77-1.69-19.34L264.65 776l4.28-14.4 9.27-5.33' transform='translate(-294 169)'/></g></g><clipPath id='nos-u-clipping-paths'><path id='nos-u-lines-mask' d='m200.3 772.27 80.25-46.28v54.69l-80.25 46.23v-54.64z'/></clipPath></g></g></g>";
  string internal constant C_FEEDBACK_C = "<g id='nos-u-c-feedback-c'><g id='nos-s-g1'><path id='nos-s-polygon4' fill='url(#nos-s-polygon4-fill)' stroke='#1d1d1b' d='M291.96 708.68v69.47l-98.25 56.61v-69.41l98.25-56.67z'/><g id='nos-u-detail-3'><path id='nos-s-polygon5' fill='url(#c0l)' stroke='#1d1d1b' d='m184.88 760.32 98.48-56.64 8.6 5.02-98.25 56.65-8.83-5.03z'/><path id='nos-s-polygon6' fill='url(#c0l)' stroke='#1d1d1b' d='M184.88 829.67v-69.35l8.83 5.03v69.41l-8.83-5.09z'/></g><g id='nos-u-c-gauge-i'><path id='nos-s-polygon7' stroke='#000000' d='m202.71 770.55 80.25-46.29v48.69l-80.25 46.24v-48.64z'/><g id='nos-u-mask-group' mask='url(#nos-u-masks)'><g id='nos-s-g2' style='animation:nos-u-line-anim_to__to 20000ms linear 999 normal forwards' transform='translate(192.12 800.02)'><g id='nos-u-line-anim' transform='translate(-211.12 -790.02)'><path id='nos-u-line_a' fill='url(#c2b)' d='m209.94 813.87 2.36-1.37v-46.33l-2.36 1.36v46.34z'/></g></g><mask id='nos-u-masks' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='nos-u-linemask' stroke='#000000' d='m202.71 770.55 80.25-46.29v48.69l-80.25 46.24v-48.64z'/></mask></g></g></g></g>";
  string internal constant C_FEEDBACK_D = "<g id='nos-u-c-feedback-d'><g id='nos-s-g3'><path id='nos-s-polygon12' fill='url(#nos-s-polygon12-fill)' stroke='#1d1d1b' d='M291.96 732.79v41.44l-98.25 56.61v-41.39l98.25-56.66z'/><g id='nos-u-detail-4'><path id='nos-s-polygon13' fill='url(#c0l)' stroke='#1d1d1b' d='m184.88 784.42 98.48-56.64 8.6 5.02-98.25 56.65-8.83-5.03z'/><path id='nos-s-polygon14' fill='url(#c0l)' stroke='#1d1d1b' d='M184.88 825.75v-41.33l8.83 5.03v41.39l-8.83-5.09z'/></g></g><g id='nos-u-guage-e'><path id='nos-s-path7' fill='#ffffff' stroke='#000000' d='m216.08 786.94-6.42 3.7c-4.3 2.48-6.95 7.07-6.95 12.04v.81c0 5.24 5.67 8.51 10.2 5.9l3.17-1.83v-20.62Z'/><path id='nos-s-polygon15' fill='#ffffff' stroke='#000000' d='M216.08 786.94v20.62l13.38-7.71v-20.63l-13.38 7.72z'/><path id='nos-s-polygon16' fill='#ffffff' stroke='#000000' d='M229.46 779.22v20.63l13.37-7.7v-20.64l-13.37 7.71z'/><path id='nos-s-polygon17' fill='#ffffff' stroke='#000000' d='M242.83 771.51v20.64l13.38-7.71V763.8l-13.38 7.71z'/><path id='nos-s-polygon18' fill='#ffffff' stroke='#000000' d='m256.21 784.44 13.37-7.7v-20.66l-13.37 7.72v20.64z'/><path id='nos-s-path8' fill='#ffffff' stroke='#000000' d='M269.58 756.08v20.66l7.15-4.12c3.85-2.22 6.22-6.32 6.22-10.77v-1.14c0-5.49-5.94-8.92-10.69-6.18l-2.68 1.55Z'/></g><g id='nos-u-guage-e_a'><path fill='#ff0000' stroke='#000000' d='m216.08 786.94-6.42 3.7c-4.3 2.48-6.95 7.07-6.95 12.04v.81c0 5.24 5.67 8.51 10.2 5.9l3.17-1.83v-20.62Z' opacity='0' style='animation:nos-s-path9_c_o 20000ms linear 999 normal forwards'/><path fill='#ff0000' stroke='#000000' d='M216.08 786.94v20.62l13.38-7.71v-20.63l-13.38 7.72z' opacity='0' style='animation:nos-s-polygon19_c_o 20000ms linear 999 normal forwards'/><path fill='#ff0000' stroke='#000000' d='M229.46 779.22v20.63l13.37-7.7v-20.64l-13.37 7.71z' opacity='0' style='animation:nos-s-polygon20_c_o 20000ms linear 999 normal forwards'/><path fill='#ff0000' stroke='#000000' d='M242.83 771.51v20.64l13.38-7.71V763.8l-13.38 7.71z' opacity='0' style='animation:nos-s-polygon21_c_o 20000ms linear 999 normal forwards'/><path fill='#ff0000' stroke='#000000' d='m256.21 784.44 13.37-7.7v-20.66l-13.37 7.72v20.64z' opacity='0' style='animation:nos-s-polygon22_c_o 20000ms linear 999 normal forwards'/><path fill='#ff0000' stroke='#000000' d='M269.58 756.08v20.66l7.15-4.12c3.85-2.22 6.22-6.32 6.22-10.77v-1.14c0-5.49-5.94-8.92-10.69-6.18l-2.68 1.55Z' opacity='0' style='animation:nos-s-path10_c_o 20000ms linear 999 normal forwards'/></g></g>";
  string internal constant C_FEEDBACK_E = "<g id='as-u-c-feedback-e'><g id='as-u-c-feedback-e-gr-c1-s1'><path id='as-s-path289' d='m431.35 723.91-115.67 66.08v-75.94c-1.13-86.1 119.71-160.21 115.67-56.36v66.22Z' fill='url(#as-s-path289-fill-c1-s1)' stroke='#1d1d1b'/><path id='as-s-path290' d='m200.18 722.31 115.51 67.49v-75.75c-.51-39.11 24.14-75.75 50.83-94.35 2.33-1.71 4.7-3.3 7.11-4.72 9.74-5.73 18.94-8.32 27.02-8.04 3.48.01 6.79.54 9.86 1.63-17.04-9.79-110.01-63.2-112.38-64.31-10.42-5.73-24.58-4.73-40.11 4.41-31.84 18.74-57.89 64.39-57.89 101.45l.05 3.34v68.86Z' fill='var(--c1b)' stroke='#000'/><path id='as-s-polygon85' fill='var(--c1b)' stroke='#000' d='M315.85 789.89h0z'/><path id='as-s-path291' d='M310.16 782.94s.35-59.8.35-69.36c0-21.94 5.07-33.23 9.91-44.59 7.08-16.63 23.01-37.08 33.62-46.36C368.19 610.24 382.7 606 382.7 606' fill='none' stroke='#fff' stroke-width='3'/><path id='as-s-line23' fill='none' stroke='#fff' stroke-width='3' d='m215.21 618.49 93.48 51.8'/></g><path id='as-s-path292' d='M330.35 711.33v49.47l26.88-15.36c0-.22-.03-.42-.03-.64 0-14.13 9.94-31.55 22.08-38.69 12.14-7.15 22.08-1.26 22.08 13.09 0 .35-.03.71-.05 1.06l21.64-12.36v-41.68c3.24-83.15-93.51-23.82-92.61 45.12Z' fill='#ffed69' stroke='#221e1f'/><g id='as-u-m-guage-hand-c1-s1_tr' transform='rotate(-149.7 290.022 312.529)'><g id='as-u-m-guage-hand-c1-s1' transform='translate(-382.7 -728.7)'><path id='as-s-path293' d='M390.11 727.86c-.5 1.08-2.7 1.12-4.91.09s-3.59-2.75-3.08-3.83l18.9-40.58c.5-1.08 2.7-1.12 4.91-.09s3.59 2.75 3.08 3.83l-18.9 40.58Z' fill='url(#as-s-path293-fill-c1-s1)' stroke='#1d1d1b'/><ellipse id='as-s-ellipse14' rx='2.16' ry='4.41' transform='rotate(-64.9 741.699 24.092)' fill='var(--c1b)' stroke='#171d35'/></g></g></g>";

  string internal constant C_GAUGE_A = "<g id='nos-u-c-gauge-a-2'><path id='nos-s-path5' fill='url(#c2b)' stroke='#231f20' d='M211.23 779.52v32.55l17.69-10.11c0-.14-.02-.28-.02-.42 0-9.3 6.54-20.76 14.53-25.46s14.53-.83 14.53 8.61c0 .23-.02.47-.03.7l14.24-8.13v-27.43c2.13-54.72-61.54-15.67-60.94 29.69Z'/><g style='animation:nos-u-tube-22_tr__tr 20000ms linear 999 normal forwards' transform='rotate(-74.13 647.8049 231.4522)'><g id='nos-u-tube-22' transform='translate(-248.02 -791.2676)'><path id='nos-s-path6' fill='url(#nos-s-path4-fill)' stroke='#1d1d1b' d='M248.51 787.07c.54.57.02 1.92-1.15 3.02s-2.55 1.52-3.09.95l-20.18-21.46c-.54-.57-.02-1.92 1.15-3.02s2.55-1.52 3.09-.95l20.18 21.46Z'/><ellipse id='nos-s-ellipse2' fill='url(#c0l)' stroke='#171d35' rx='2.9' ry='1.42' transform='rotate(-43.09 1085.2397 97.4066)'/></g></g></g>";

  string internal constant C_GAUGE_O = "<g id='drl-u-c-guage-o-3' transform='translate(150 47)'><path id='drl-s-path160' fill='url(#c2b)' stroke='#231f20' d='M317.47 553.51v-27.16c-.5-21.7-19.76-35.42-39.64-38.21-16.38-2.29-38.21 4.23-37.36 24.54v29.13c3.98 1.44 9.63 3.35 16.58 5.23.05-2.27.1-4.27.17-5.23 1.07-10.11 9.05-14.73 18.92-12.89 10.09 1.88 18.16 10.03 18.9 20.47v4.08c7.15.48 14.68.55 22.44.03Z'/><g style='animation:drl-u-g_hand_tr__tr 20000ms linear 999 normal forwards' transform='rotate(-110 329.211 178.822)'><g id='drl-u-g_hand' transform='translate(-273.77 -549.34)'><path id='drl-s-path161' fill='url(#drl-s-path161-fill)' stroke='#1d1d1b' d='M272.74 545.52c-.72.37-.68 1.86.08 3.32s1.95 2.35 2.67 1.98l26.9-13.94c.72-.37.68-1.86-.08-3.32s-1.95-2.35-2.67-1.98l-26.9 13.94Z'/><ellipse id='drl-s-ellipse2' fill='url(#c0l)' stroke='#171d35' rx='1.46' ry='2.98' transform='rotate(-27.41 1245.8209 -350.0762)'/></g></g></g>";
  string internal constant C_GAUGE_P = "<g id='drl-u-c-guage-p-3' transform='translate(150 47)'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#drl-u-c-g3-bg'/><g id='drl-u-mask-group' mask='url(#drl-u-masks)'><g id='drl-u-c-g3-lns'><path fill='none' stroke='#fff' d='M237.11 509s41.42 18.7 94.94 11.61' style='animation:drl-u-line-a-5_c_o 20000ms linear 999 normal forwards'/><g style='animation:drl-u-line_t_to__to 20000ms linear 999 normal forwards'><g style='animation:drl-u-line_t_ts__ts 20000ms linear 999 normal forwards' transform='translate(284.575 518.2652)'><path fill='none' stroke='#fff' d='M227.66 504.34s18.48 8.47 24.53 10.01l7.38-16.07s2.64 38.64 2.31 37.54 5.06-12.33 5.06-12.33l2.53 9.8 6.06-13.65 12.44 1.54 6.83-16.84s2.64 33.8 2.64 33.91 4.95-16.29 4.95-16.29h9.8l3.3-10.13 3.52 10.13 19.6296-.78' opacity='0' style='animation:drl-u-line_t_c_o 20000ms linear 999 normal forwards' transform='translate(-284.575 -518.2652)'/></g></g></g><mask id='drl-u-masks' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#drl-u-c-g3-bg' id='drl-u-c-g3-msk'/></mask></g></g>";
  string internal constant C_GAUGE_Q = "<g id='drl-u-c-guage-q-3' transform='translate(150 47)'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#drl-u-c-g3-bg' id='drl-s-path162'/><g id='drl-u-mask-group2' mask='url(#drl-u-masks2)'><g style='offset-path:path(&quot;M229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966C258.557864,518.258914,313.59339,525.327326,339.799995,515.214966L229.799995,502.214966L229.799995,502.214966L229.799995,502.214966&quot;);offset-rotate:0deg;animation:drl-u-line-a-6_to__to 20000ms linear 999 normal forwards'><path id='drl-u-line-a-6' fill='url(#c2b)' d='M245.34 544.0475c1.58.6415 3.22 1.283 4.92 1.9125v-58.0994c-1.67-.6058-3.31-1.2354-4.92-1.9006v58.0875Z' transform='translate(-247.8 -511.215)'/></g><mask id='drl-u-masks2' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='drl-u-mask' fill='url(#c2l)' d='m334.33 542.5798-.44-46.3898c-29.99 4.21-71.98-.135-99.27-12.715v47.488c21.07 8.95 61.68 18.1368 99.71 11.6168Z'/></mask></g></g>";
  string internal constant C_GAUGE_R = "<g id='drl-u-c-guage-r-3' transform='translate(150 47)'><g id='drl-u-c-g-bgd'><path id='drl-s-path150' fill='url(#c2l)' stroke='#1d1d1b' d='M249.39 501.61c-3.7-2.53-8.75-1.6-11.3 2.09-2.56 3.7-1.64 8.78 2.07 11.34.44.3 4.5 3.04 11.92 5.97v-17.87c-1.71-.89-2.62-1.49-2.69-1.53Z'/><path id='drl-s-path151' fill='url(#c2l)' stroke='#1d1d1b' d='M267.45 508.91c-7.3-1.92-12.49-4.26-15.38-5.77v17.87c4.12 1.63 9.28 3.31 15.44 4.68v-16.77s-.04 0-.06-.01Z'/><path id='drl-s-path152' fill='url(#c2l)' stroke='#1d1d1b' d='M267.51 525.7c4.6 1.02 9.75 1.86 15.44 2.36v-16.4c-6.12-.62-11.29-1.65-15.44-2.74v16.77Z'/><path id='drl-s-path153' fill='url(#c2l)' stroke='#1d1d1b' d='M298.39 512.19c-5.66.16-10.82-.06-15.44-.52v16.4c3.68.33 7.58.51 11.71.51 1.22 0 2.47-.02 3.73-.05V512.2Z'/><path id='drl-s-path154' fill='url(#c2l)' stroke='#1d1d1b' d='M298.39 528.52c4.86-.13 10.01-.52 15.44-1.23v-16.46c-5.49.79-10.65 1.22-15.44 1.36v16.33Z'/><path id='drl-s-path155' fill='url(#c2l)' stroke='#1d1d1b' d='M322.6 525.92c4.43-.82 7.35-5.08 6.53-9.5-.82-4.43-5.08-7.35-9.5-6.53-1.98.37-3.9.67-5.8.94v16.46c2.85-.37 5.77-.82 8.77-1.38Z'/></g><g id='drl-u-c-guage-r_a-3'><path fill='url(#c5d)' stroke='#1d1d1b' d='M249.39 501.61c-3.7-2.53-8.75-1.6-11.3 2.09-2.56 3.7-1.64 8.78 2.07 11.34.44.3 4.5 3.04 11.92 5.97v-17.87c-1.71-.89-2.62-1.49-2.69-1.53Z' opacity='0' style='animation:drl-s-path156_c_o 20000ms linear 999 normal forwards'/><path fill='url(#c5d)' stroke='#1d1d1b' d='M267.45 508.91c-7.3-1.92-12.49-4.26-15.38-5.77v17.87c4.12 1.63 9.28 3.31 15.44 4.68v-16.77s-.04 0-.06-.01Z' opacity='0' style='animation:drl-s-path157_c_o 20000ms linear 999 normal forwards'/><path fill='url(#c5d)' stroke='#1d1d1b' d='M267.51 525.7c4.6 1.02 9.75 1.86 15.44 2.36v-16.4c-6.12-.62-11.29-1.65-15.44-2.74v16.77Z' opacity='0' style='animation:drl-s-path158_c_o 20000ms linear 999 normal forwards'/><path fill='url(#c5d)' stroke='#1d1d1b' d='M298.39 512.19c-5.66.16-10.82-.06-15.44-.52v16.4c3.68.33 7.58.51 11.71.51 1.22 0 2.47-.02 3.73-.05V512.2Z' opacity='0' style='animation:drl-s-path159_c_o 20000ms linear 999 normal forwards'/></g></g>";

  

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 4000) {
      return C_FEEDBACK_A;
    } else if (assetID == 4001) {
      return C_FEEDBACK_B;
    } else if (assetID == 4002) {
      return C_FEEDBACK_C;
    } else if (assetID == 4003) {
      return C_FEEDBACK_D;
    } else if (assetID == 4004) {
      return C_FEEDBACK_E;
    } else if (assetID == 4009) {
      return C_GAUGE_A;
    } else if (assetID == 4027) {
      return C_GAUGE_O;
    } else if (assetID == 4028) {
      return C_GAUGE_P;
    } else if (assetID == 4029) {
      return C_GAUGE_Q;
    } else if (assetID == 4030) {
      return C_GAUGE_R;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 4000) {
      return 3;
    } else if (assetID == 4001) {
      return 2;
    } else if (assetID == 4002) {
      return 2;
    } else if (assetID == 4003) {
      return 1;
    } else if (assetID == 4009) {
      return 1;
    } else if (assetID == 4027) {
      return 2;
    } else if (assetID == 4028) {
      return 3;
    } else if (assetID == 4029) {
      return 2;
    } else if (assetID == 4030) {
      return 1;
    } else {
      return 0;
    }
  }
}