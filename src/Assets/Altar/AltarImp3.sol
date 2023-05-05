// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AltarImp3 {
  string internal constant C_STEPS_RUNNER = "<g id='ap-u-c-steps-detail'><path id='ap-s-polygon81' fill='url(#c3b)' stroke='#000000' d='m524.94 606.09-18.36 10.64 14.23 8.27 18.35-10.64-14.22-8.27z'/><path id='ap-s-polygon82' fill='url(#c4b)' stroke='#171d35' d='m510.44 597.66-18.36 10.64 14.5 8.43 18.36-10.64-14.5-8.43z'/><path id='ap-s-polygon83' fill='url(#c0b)' stroke='#000000' d='M539.16 614.36 520.81 625l14.19 8.25 18.36-10.64-14.2-8.25z'/><path id='ap-s-polygon84' fill='url(#c3b)' stroke='#000000' d='M553.36 622.61 535 633.25l14.2 8.25 18.36-10.64-14.2-8.25z'/><path id='ap-s-polygon85' fill='url(#c4b)' stroke='#171d35' d='M567.56 630.86 549.2 641.5l14.09 8.19 18.36-10.64-14.09-8.19z'/><path id='ap-s-polygon86' fill='url(#c3b)' stroke='#000000' d='M506.58 616.73v36.61l14.23 8.27V625l-14.23-8.27z'/><path id='ap-s-polygon87' fill='url(#c4b)' stroke='#171d35' d='M492.08 608.3v36.61l14.5 8.43v-36.61l-14.5-8.43z'/><path id='ap-s-polygon88' fill='url(#c3b)' stroke='#000000' d='M535.05 633.27v36.61l14.19 8.25v-36.6l-14.19-8.26z'/><path id='ap-s-polygon89' fill='url(#c0b)' stroke='#000000' d='M520.81 625v36.61l14.24 8.27v-36.61L520.81 625z'/><path id='ap-s-polygon90' fill='url(#c4b)' stroke='#171d35' d='M549.24 641.53v36.6l14.09 8.19v-36.61l-14.09-8.18z'/><path id='ap-s-polygon91' fill='url(#c3b)' stroke='#000000' d='m506.63 653.37-18.36 10.65 14.23 8.26 18.36-10.64-14.23-8.27z'/><path id='ap-s-polygon92' fill='url(#c4b)' stroke='#171d35' d='m492.13 644.95-18.36 10.64 14.5 8.43 18.36-10.65-14.5-8.42z'/><path id='ap-s-polygon93' fill='url(#c0b)' stroke='#000000' d='m520.86 661.64-18.36 10.64 14.2 8.25 18.35-10.64-14.19-8.25z'/><path id='ap-s-polygon94' fill='url(#c3b)' stroke='#000000' d='m535.05 669.89-18.35 10.64 14.19 8.25 18.36-10.64-14.2-8.25z'/><path id='ap-s-polygon95' fill='url(#c4b)' stroke='#171d35' d='m549.25 678.14-18.36 10.64 14.09 8.19 18.36-10.64-14.09-8.19z'/><path id='ap-s-polygon96' fill='url(#c3b)' stroke='#000000' d='M488.27 664.01v36.61l14.23 8.27v-36.6l-14.23-8.28z'/><path id='ap-s-polygon97' fill='url(#c4b)' stroke='#171d35' d='M473.77 655.59v36.6l14.5 8.43v-36.61l-14.5-8.42z'/><path id='ap-s-polygon98' fill='url(#c3b)' stroke='#000000' d='M516.74 680.56v36.61l14.2 8.25v-36.61l-14.2-8.25z'/><path id='ap-s-polygon99' fill='url(#c0b)' stroke='#000000' d='M502.5 672.29v36.6l14.24 8.28v-36.61l-14.24-8.27z'/><path id='ap-s-polygon100' fill='url(#c4b)' stroke='#171d35' d='M530.94 688.81v36.61l14.08 8.18v-36.61l-14.08-8.18z'/><path id='ap-s-polygon101' fill='url(#c3b)' stroke='#000000' d='m488.35 700.64-18.36 10.64 14.23 8.26 18.36-10.64-14.23-8.26z'/><path id='ap-s-polygon102' fill='url(#c4b)' stroke='#171d35' d='m473.85 692.21-18.36 10.64 14.5 8.43 18.36-10.64-14.5-8.43z'/><path id='ap-s-polygon103' fill='url(#c0b)' stroke='#000000' d='m502.58 708.9-18.36 10.64 14.2 8.25 18.36-10.64-14.2-8.25z'/><path id='ap-s-polygon104' fill='url(#c3b)' stroke='#000000' d='m516.78 717.15-18.36 10.64 14.19 8.26 18.36-10.65-14.19-8.25z'/><path id='ap-s-polygon105' fill='url(#c4b)' stroke='#171d35' d='m530.97 725.4-18.36 10.65 14.1 8.18 18.35-10.64-14.09-8.19z'/><path id='ap-s-polygon106' fill='url(#c3b)' stroke='#000000' d='M469.99 711.27v36.61l14.23 8.27v-36.6l-14.23-8.28z'/><path id='ap-s-polygon107' fill='url(#c4b)' stroke='#171d35' d='M455.49 702.85v36.61l14.5 8.42v-36.61l-14.5-8.42z'/><path id='ap-s-polygon108' fill='url(#c3b)' stroke='#000000' d='M498.46 727.82v36.61l14.2 8.25v-36.61l-14.2-8.25z'/><path id='ap-s-polygon109' fill='url(#c0b)' stroke='#000000' d='M484.22 719.55v36.6l14.24 8.28v-36.61l-14.24-8.27z'/><path id='ap-s-polygon110' fill='url(#c4b)' stroke='#171d35' d='M512.66 736.07v36.61l14.08 8.18v-36.6l-14.08-8.19z'/><path id='ap-s-polygon111' fill='url(#c3b)' stroke='#000000' d='m470.09 747.97-18.36 10.64 14.22 8.27 18.36-10.64-14.22-8.27z'/><path id='ap-s-polygon112' fill='url(#c4b)' stroke='#171d35' d='m455.58 739.54-18.35 10.64 14.5 8.43 18.36-10.64-14.51-8.43z'/><path id='ap-s-polygon113' fill='url(#c0b)' stroke='#000000' d='m484.31 756.24-18.36 10.64 14.2 8.25 18.36-10.64-14.2-8.25z'/><path id='ap-s-polygon114' fill='url(#c3b)' stroke='#000000' d='m498.51 764.49-18.36 10.64 14.2 8.25 18.36-10.64-14.2-8.25z'/><path id='ap-s-polygon115' fill='url(#c4b)' stroke='#171d35' d='m512.71 772.74-18.36 10.64 14.09 8.19 18.36-10.64-14.09-8.19z'/><path id='ap-s-polygon116' fill='url(#c3b)' stroke='#000000' d='M451.72 758.61v36.6l14.24 8.28v-36.61l-14.24-8.27z'/><path id='ap-s-polygon117' fill='url(#c4b)' stroke='#171d35' d='M437.23 750.18v36.61l14.49 8.42v-36.6l-14.49-8.43z'/><path id='ap-s-polygon118' fill='url(#c3b)' stroke='#000000' d='M480.2 775.15v36.61l14.19 8.25V783.4l-14.19-8.25z'/><path id='ap-s-polygon119' fill='url(#c0b)' stroke='#000000' d='M465.96 766.88v36.61l14.24 8.27v-36.61l-14.24-8.27z'/><path id='ap-s-polygon120' fill='url(#c4b)' stroke='#171d35' d='M494.39 783.4v36.61l14.09 8.19v-36.61l-14.09-8.19z'/></g>";
  string internal constant C_BASE_D_RUNNER = "<g id='ap-u-detail2'><g id='ap-u-rug'><path id='ap-s-polygon46' fill='url(#c0b)' stroke='#000000' d='M539.16 581.24v179.97l14.17 8.18V589.42l-14.17-8.18z'/><path id='ap-s-polygon47' fill='url(#c4b)' stroke='#000000' d='m524.99 573.06-14.17-8.18v179.97l14.17 8.18V573.06z'/><path id='ap-s-polygon48' fill='url(#c4b)' stroke='#171d35' d='m524.99 573.06-14.17-8.18v179.97l14.17 8.18V573.06z'/><path id='ap-s-polygon49' fill='url(#ap-s-polygon49-fill)' stroke='#000000' d='M524.99 573.06v179.97l14.17 8.18V581.24l-14.17-8.18z'/><path id='ap-s-polygon50' fill='url(#c3b)' stroke='#000000' d='M524.99 573.06v179.97l14.17 8.18V581.24l-14.17-8.18z'/><path id='ap-s-polygon51' fill='url(#ap-s-polygon51-fill)' stroke='#000000' d='m553.33 769.39 14.18 8.18V597.6l-14.18-8.18v179.97z'/><path id='ap-s-polygon52' fill='url(#c3b)' stroke='#000000' d='m553.33 769.39 14.18 8.18V597.6l-14.18-8.18v179.97z'/><path id='ap-s-polygon53' fill='url(#c4b)' stroke='#000000' d='M567.51 597.6v179.97l14.17 8.18V605.77l-14.17-8.17z'/><path id='ap-s-polygon54' fill='url(#c4b)' stroke='#171d35' d='M567.51 597.6v179.97l14.17 8.18V605.77l-14.17-8.17z'/></g></g>";
  string internal constant C_PLATE_B = "<g id='ap-u-plate-mask-g' mask='url(#ap-u-masks2)'><g style='animation:ap-u-c-plate-g_to__to 20000ms linear 999 normal forwards' transform='translate(623.3738 706.9956)'><g id='ap-u-c-plate-g' transform='translate(-623.3738 -486.9956)'><path id='ap-u-c-tube' fill='url(#ap-u-c-tube-fill)' stroke='#1d1d1b' d='M622.96 429.65c-5.29 0-9.58 2.35-9.58 5.24v84.21l-.01 49.81c6.34.67 12.84.7 19.17.1V434.89c0-2.89-4.29-5.24-9.58-5.24Z'/><g id='ap-u-c-plate'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path156'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path157'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path158'/></g></g></g><mask id='ap-u-masks2' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='ap-u-floob-mask' fill='url(#c2l)' stroke-width='2.16' d='M568.77 544.34c12.11 30.65 88.69 38.04 109.4547 0L753.99 374.015c-5-73.21-91.82-134.055-104.96-52.885L521.14 401.2l47.63 143.14Z' transform='translate(0 -1)'/></mask></g>";

  string internal constant C_HOLE_B = "";
  string internal constant C_HOLE_B_A3 = "<g style='animation:ap-u-frame-fa-hole_ts__ts 20000ms linear 999 normal forwards' transform='matrix(.26 0 0 .26 701.99 344.4173)'><g id='ap-u-frame-fa-hole' transform='translate(-701.99 -344.4173)'><g id='ap-u-frame-fa-hole-group'><path id='ap-s-path23' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M752.51 420.55c-4.6 3.99-9.92 7.07-15.78 9.07-9.74 3.32-25.43 5.21-44.87-4.67-10.33-5.25-20.26-13.29-28.88-23.26'/><path id='ap-s-path24' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M651.38 264.99c7.54-4.66 16.12-7.51 25.08-8.25 9.57-.79 19.2.8 28.63 4.71.79.3 1.5.59 2.22.92 11.29 5.14 21.91 13.61 30.62 24.31 2.16 2.65 4.19 5.44 6.1 8.34'/><path id='ap-s-path25' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M646.64 278.58c7.84-7.99 18.34-12.9 29.57-13.83 8.23-.68 16.6.73 24.86 4.17.67.26 1.26.49 1.87.77 12.88 5.86 24.87 16.57 33.74 30.13v0c1.43 2.2 2.77 4.43 4 6.7'/><path id='ap-s-path26' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M757.34 400.64c-4.81 10.14-13.08 17.64-23.29 21.12-8.23 2.81-21.58 4.35-38.43-4.22-13.14-6.68-25.65-18.43-35.23-33.07'/><g id='ap-s-g6'><path id='ap-s-path27' fill='url(#ap-s-path27-fill)' stroke='#1d1d1b' stroke-width='.5' d='M706.78 393.92c-25.65-13.04-46.87-46.3-48.32-75.71-.67-13.65 3.14-25.04 10.39-32.47-13.37 5.78-20.94 20.29-20.02 39.08 1.45 29.41 22.67 62.67 48.32 75.71 7.27 3.69 14.42 5.57 21.26 5.57 9 0 16.99-3.28 22.94-9.31-4.05 1.76-8.54 2.7-13.31 2.7-6.84 0-13.99-1.87-21.26-5.57Z'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path28' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path28' id='ap-s-path29' stroke-width='.5'/></g></g></g></g>";
  string internal constant C_HOLE_A_A2 = "<g style='animation:ap-u-c-hole-a_a2_ts__ts 20000ms linear 999 normal forwards' transform='matrix(.23 0 0 .23 623.239 538.9)'><g id='ap-u-c-hole-a_a2' transform='translate(-623.239 -538.9)'><path id='ap-s-path150' fill='url(#ap-s-path150-fill)' stroke='#1d1d1b' stroke-width='.5' d='M584.4 528.15c21.11-12.21 56.11-11.9 77.77.69 7.93 4.61 12.95 10.23 15.11 16.09 3.31-9.95-1.79-20.77-15.34-28.65-21.66-12.6-56.66-12.91-77.77-.69-13.37 7.73-18.15 18.64-14.47 28.75 1.94-5.96 6.81-11.63 14.7-16.2Z'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path151' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path152' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path153' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path154' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path155' stroke-width='.5'/></g></g>";
  string internal constant C_RUG_A = "<g transform='translate(130,330)'><svg viewBox='0 0 936 1080' width='650px' height='650px'><g id='ap-u-p-rug'><path id='ap-s-polygon212' fill='url(#c2l)' stroke='#171d35' d='m300.15 757.91 259.74 149.98 7.38-4.22-259.8-150.02-7.32 4.26z'/><path id='ap-s-polygon213' fill='url(#c5l)' stroke='#000000' d='m284.2 767.17 96.34 55.58 11.59 6.68 14.12 8.15 14.12 8.14 13 7.5 14.68 8.47 95.9 55.32 15.94-9.12-259.74-149.98-15.95 9.26z'/><path id='ap-s-polygon214' fill='url(#c2d)' stroke='#000000' d='m307.47 753.65 259.8 150.02 8.02-4.6-259.86-150.05-7.96 4.63z'/><path id='ap-s-polygon215' fill='url(#c5l)' stroke='#000000' d='m596 887.23-96.01-55.55-14.66-8.49-12.98-7.5-14.1-8.16-14.1-8.16-11.56-6.69-96.35-55.75-13.16 7.65L583 894.66l13-7.43z'/><path id='ap-s-polygon216' fill='url(#c2l)' stroke='#171d35' d='m323.08 744.58-7.65 4.44 259.86 150.05 7.71-4.41-259.92-150.08z'/></g></svg></g>";
  string internal constant C_RUG_B = "<g id='ap-u-c-rug-b'><g id='ap-s-g1'><path id='ap-s-polygon1' fill='url(#c3b)' stroke='#000000' d='m214.6 932.97 309.97-180.39 14.23 8.28-309.97 180.39-14.23-8.28z'/><path id='ap-s-polygon2' fill='url(#c4b)' stroke='#171d35' d='m200.1 924.55 309.97-180.39 14.5 8.42L214.6 932.97l-14.5-8.42z'/><path id='ap-s-polygon3' fill='url(#c3b)' stroke='#000000' d='m243.07 949.52 309.97-180.39 14.2 8.25-309.97 180.39-14.2-8.25z'/><path id='ap-s-polygon4' fill='url(#c0b)' stroke='#000000' d='M228.83 941.25 538.8 760.86l14.24 8.27-309.97 180.39-14.24-8.27z'/><path id='ap-s-polygon5' fill='url(#c4b)' stroke='#171d35' d='m257.27 957.77 309.97-180.39 14.08 8.18-309.97 180.39-14.08-8.18z'/><path id='ap-s-polygon6' fill='url(#c1b)' stroke='#000000' d='m200.1 924.55 309.97-180.39-14.77-8.32-309.97 180.39 14.77 8.32z'/><path id='ap-s-polygon7' fill='url(#c1b)' stroke='#000000' d='m286.46 974.57 309.53-180.46-14.67-8.55-309.97 180.39 15.11 8.62z'/></g></g>";
  string internal constant C_PLATE_A = "<g id='ap-u-plate-mask-g-na' mask='url(#ap-u-masks4)'><g style='animation:ap-u-c-plate-g2_to__to 20000ms linear 999 normal forwards' transform='translate(623.3738 876.9956)'><g id='ap-u-c-plate-g2' transform='translate(-623.3738 -486.9956)'><path id='ap-u-c-tube2' fill='url(#ap-u-c-tube-fill)' stroke='#1d1d1b' d='M622.96 429.65c-5.29 0-9.58 2.35-9.58 5.24v84.21l-.01 239.81c6.34.67 12.84.7 19.17.1V434.89c0-2.89-4.29-5.24-9.58-5.24Z'/><g id='ap-u-c-plate2'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path156' id='ap-s-path218'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path157' id='ap-s-path219'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path158' id='ap-s-path220'/></g></g></g><mask id='ap-u-masks4' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='ap-u-floob-mask3' fill='url(#c2l)' stroke-width='2.16' d='M568.77 724.34c12.11 30.65 88.69 38.04 109.4547 0L753.99 374.015c-5-73.21-91.82-134.055-104.96-52.885L521.14 401.2l47.63 323.14Z' transform='translate(0 -1)'/></mask></g>";

  string internal constant ALTAR_FLOOB_WRAPPER_OPEN = "<g id='ap-u-floobs-mask-g' mask='url(#ap-u-masks3)'><g style='animation:ap-u-floobs_to__to 20000ms linear 999 normal forwards' transform='translate(623.385 629.165)'><g id='ap-u-floobs' transform='translate(-624 -380)'>";
  string internal constant ALTAR_FLOOB_WRAPPER_CLOSE = "</g></g><mask id='ap-u-masks3' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='ap-u-floob-mask2' fill='url(#c2l)' stroke-width='2.16' d='M568.77 544.34c15.4 31.34 90.63 37.04 109.4547 0l64.884-135.518c11.7802-4.7646 19.4434-23.5593 17.4813-36.512-4.0623-86.6755-107.55-140.75-120.69-59.58L521.14 401.2l47.63 143.14Z'/></mask></g>";

  string internal constant FLOOR_HOLE = "<g style='animation:ap-u-c-hole-a_a2-na_ts__ts 20000ms linear 999 normal forwards' transform='matrix(.23 0 0 .23 623.239 718.9)'><g id='ap-u-c-hole-a_a2-na' transform='translate(-623.239 -538.9)'><path id='ap-s-path212' fill='url(#ap-s-path150-fill)' stroke='#1d1d1b' stroke-width='.5' d='M584.4 528.15c21.11-12.21 56.11-11.9 77.77.69 7.93 4.61 12.95 10.23 15.11 16.09 3.31-9.95-1.79-20.77-15.34-28.65-21.66-12.6-56.66-12.91-77.77-.69-13.37 7.73-18.15 18.64-14.47 28.75 1.94-5.96 6.81-11.63 14.7-16.2Z'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path151' id='ap-s-path213' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path152' id='ap-s-path214' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path153' id='ap-s-path215' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path154' id='ap-s-path216' stroke-width='.5'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path155' id='ap-s-path217' stroke-width='.5'/></g></g>";

  string internal constant NO_ALTAR_FLOOB_WRAPPER_OPEN = "<g id='ap-u-floobs-mask-g-na' mask='url(#ap-u-masks5)'><g style='animation:ap-u-floobs2_to__to 20000ms linear 999 normal forwards' transform='translate(623.385 799.165)'><g id='ap-u-floobs2' transform='translate(-624 -380)'>";
  string internal constant NO_ALTAR_FLOOB_WRAPPER_CLOSE = "</g></g><mask id='ap-u-masks5' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='ap-u-floob-mask4' fill='url(#c2l)' stroke-width='2.16' d='M568.77 724.34c15.4 31.34 90.63 37.04 109.4547 0l64.884-315.518c11.7802-4.7646 19.4434-23.5593 17.4813-36.512-4.0623-86.6755-107.55-140.75-120.69-59.58L521.14 401.2l47.63 323.14Z'/></mask></g>";

  // asset id's should increment by 1 and use each of the assets defined above
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 7014) {
      return C_STEPS_RUNNER;
    } else if (assetID == 7015) {
      return C_BASE_D_RUNNER;
    } else if (assetID == 7016) {
      return C_PLATE_B;
    } else if (assetID == 7017) {
      return C_HOLE_B;
    } else if (assetID == 7018) {
      return C_HOLE_B_A3;
    } else if (assetID == 7019) {
      return C_HOLE_A_A2;
    } else if (assetID == 7020) {
      return C_RUG_A;
    } else if (assetID == 7021) {
      return C_RUG_B;
    } else if (assetID == 7022) {
      return C_PLATE_A;
    } else if (assetID == 7023) {
      return ALTAR_FLOOB_WRAPPER_OPEN;
    } else if (assetID == 7024) {
      return ALTAR_FLOOB_WRAPPER_CLOSE;
    } else if (assetID == 7025) {
      return FLOOR_HOLE;
    } else if (assetID == 7026) {
      return NO_ALTAR_FLOOB_WRAPPER_OPEN;
    } else if (assetID == 7027) {
      return NO_ALTAR_FLOOB_WRAPPER_CLOSE;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 7014) {
      return 5;
    } else if (assetID == 7015) {
      return 5;
    } else if (assetID == 7016) {
      return 2;
    } else if (assetID == 7017) {
      return 3;
    } else if (assetID == 7018) {
      return 3;
    } else if (assetID == 7019) {
      return 3;
    } else if (assetID == 7020) {
      return 5;
    } else if (assetID == 7021) {
      return 5;
    } else if (assetID == 7022) {
      return 3;
    } else if (assetID == 7023) {
      return 3;
    } else if (assetID == 7024) {
      return 3;
    } else if (assetID == 7025) {
      return 3;
    } else if (assetID == 7026) {
      return 3;
    } else if (assetID == 7027) {
      return 3;
    } else {
      return 0;
    }
  }
}