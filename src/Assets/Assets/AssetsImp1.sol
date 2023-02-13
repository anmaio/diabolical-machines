// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AssetsImp1 {

  string internal constant C_LAVALAMP_A = "<g transform='translate(-312,0)'><g id='C-Lavalamp-A'><g id='g-ll-u-c-lavalamp-a' transform='translate(0 -2.8)'><ellipse id='g-ll-u-shadow' fill='#1d1d1b' opacity='.3' rx='16.2' ry='10.6' style='mix-blend-mode:multiply' transform='rotate(-18 2100.5 -1151.7)'/><path id='g-ll-s-pa86' fill='url(#g-ll-s-pa86-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='m484.4 609.2-7.7-25.8s-11.6-.6-11.3-.8c.3-.3-11.2.9-11.2.9l-7.4 24.9a4 4 0 0 0-.2 1.2c0 4.3 7.7 9 18.9 9s18.8-4.7 18.8-9v-.4h.1Z'/><path id='g-ll-s-pa87' fill='url(#g-ll-s-pa87-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='m484.4 557.7-15.3-2h-.4l-22 1.2 7.7 27.5h0c1 2.2 5.3 4.4 11 4.4s10-2.1 11-4.3h.1l7.9-26.8Z'/><path id='g-ll-u-c-connector' fill='url(#g-ll-u-c-connector-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M465.5 566c-11.1 0-18.9-4.8-18.9-9s7.8-9 18.9-9 18.9 4.7 18.9 9-7.8 9-19 9Z'/><g id='g-ll-u-mask-group' mask='url(#g-ll-u-masks)'><g id='g-ll-u-c-lava'><g style='animation:g-ll-s-pa88_to__to 14000ms linear 999 normal forwards' transform='translate(463.8 525.1)'><path id='g-ll-s-pa88' fill='url(#g-ll-s-pa88-fl)' d='M468.8 500.6c-5.7.2-7.8 6.4-6.6 10.1 1.2 3.7.1 12.2-2.8 17.4-1.6 3-8.4 9-6 15.5 2.3 6.6 16.5 8.5 19.4 1.6s-.4-15.9-1-19.6-.6-13 1.8-15.4 1-9.7-4.8-9.5Z' transform='translate(-463.8 -525.1)'/></g><g style='animation:g-ll-s-circle3_to__to 14000ms linear 999 normal forwards' transform='translate(459.9 497.1)'><circle id='g-ll-s-circle3' r='3.8' fill='url(#g-ll-s-circle3-fl)'/></g><g style='animation:g-ll-s-ellipse1_to__to 14000ms linear 999 normal forwards' transform='translate(471.9 550.5)'><ellipse id='g-ll-s-ellipse1' fill='url(#g-ll-s-ellipse1-fl)' rx='10.8' ry='10'/></g></g><mask id='g-ll-u-masks' width='400%' height='400%' x='-150%' y='-150%' mask-type='alpha'><path id='g-ll-u-c-lavalamp-lava-mask' fill='url(#g-ll-u-c-lavalamp-lava-mask-fl)' stroke='#1d1d1b' stroke-miterlimit='10' d='M476.7 483.8h-22.5l-7.6 73.1c0 4.3 7.8 9 18.9 9s18.8-4.7 18.8-9l-7.6-73.1Z' opacity='.8'/></mask></g><path id='g-ll-u-c-lavalamp-glass' fill='url(#g-ll-u-c-lavalamp-glass-fl)' stroke='#1d1d1b' stroke-miterlimit='10' d='M476.7 483.8h-22.5l-7.6 73.1c0 4.3 7.8 9 18.9 9s18.8-4.7 18.8-9l-7.6-73.1Z' opacity='.8'/><g id='g-ll-u-lid'><path id='g-ll-s-pa89' fill='url(#g-ll-s-pa89-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='m473.7 465-5-.5-11.5.8-3 18.5c0 2.5 4.7 5.3 11.3 5.3s11.2-2.8 11.2-5.3l-3-18.7Z'/><path id='g-ll-u-c-connector-2' fill='url(#g-ll-u-c-connector-2-fl)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' d='M465.5 469.3c-5 0-8.3-2-8.3-4s3.4-4 8.3-4 8.3 2.2 8.3 4-3.4 4-8.3 4Z'/></g></g><style id='css-vars-GLOBAL-ASSETS'>@keyframes g-ll-s-pa88_to__to{0%{transform:translate(463.762573px,525.095657px);animation-timing-function:cubic-bezier(.42,0,.58,1)}50%{transform:translate(465.762573px,550.095657px);animation-timing-function:cubic-bezier(.42,0,.58,1)}to{transform:translate(463.762573px,525.095657px)}}@keyframes g-ll-s-circle3_to__to{0%{transform:translate(459.89003px,497.150009px);animation-timing-function:cubic-bezier(.42,0,.58,1)}50%{transform:translate(459.89003px,510.150009px);animation-timing-function:cubic-bezier(.42,0,.58,1)}to{transform:translate(459.89003px,497.150009px)}}@keyframes g-ll-s-ellipse1_to__to{0%{transform:translate(471.85997px,550.490021px);animation-timing-function:cubic-bezier(.42,0,.58,1)}50%{transform:translate(471.85997px,541.490021px);animation-timing-function:cubic-bezier(.42,0,.58,1)}to{transform:translate(471.85997px,550.490021px)}}@keyframes g-ll-u-bbl_to__to{0%{transform:translate(464.369995px,615.820007px)}15.714286%,to{transform:translate(464.369995px,495.820007px)}}@keyframes g-ll-u-bbl2_to__to{0%,44.285714%{transform:translate(470.789993px,622.700043px)}54.285714%,to{transform:translate(470.789993px,512.700043px)}}@keyframes g-ll-u-bbl3_to__to{0%,22.857143%{transform:translate(474.450012px,631.96994px)}35.714286%,to{transform:translate(474.450012px,511.96994px)}}@keyframes g-ll-u-bbl4_to__to{0%,28.571429%{transform:translate(474.450012px,631.96994px)}45.714286%,to{transform:translate(474.450012px,511.96994px)}}@keyframes g-ll-u-bbl5_to__to{0%,22.857143%{transform:translate(474.450012px,631.96994px)}35.714286%,to{transform:translate(474.450012px,511.96994px)}}@keyframes g-ll-u-bbl6_to__to{0%,58.571429%{transform:translate(474.450012px,631.96994px)}72.857143%,to{transform:translate(474.450012px,511.96994px)}}@keyframes g-ll-u-bbl7_to__to{0%{transform:translate(464.210007px,644.340027px)}15.714286%,to{transform:translate(464.210007px,534.340027px)}}@keyframes g-ll-u-bbl8_to__to{0%,34.285714%{transform:translate(464.210007px,644.340027px)}51.428571%,to{transform:translate(464.210007px,534.340027px)}}@keyframes g-ll-u-bbl9_to__to{0%,7.142857%{transform:translate(464.210007px,644.340027px)}28.571429%,to{transform:translate(464.210007px,534.340027px)}}@keyframes g-ll-u-bbl10_to__to{0%,42.857143%{transform:translate(464.210007px,644.340027px)}54.285714%,to{transform:translate(464.210007px,534.340027px)}}@keyframes g-ll-u-bbl11_to__to{0%,34.285714%{transform:translate(464.369995px,615.820007px)}50%,to{transform:translate(464.369995px,495.820007px)}}@keyframes g-ll-u-bbl12_to__to{0%,7.142857%{transform:translate(464.369995px,615.820007px)}22.857143%,to{transform:translate(464.369995px,495.820007px)}}@keyframes g-ll-u-bbl13_to__to{0%,78.571429%{transform:translate(470.789993px,622.700043px)}88.571429%,to{transform:translate(470.789993px,512.700043px)}}@keyframes g-ll-u-bbl14_to__to{0%,51.428571%{transform:translate(470.789993px,622.700043px)}61.428571%,to{transform:translate(470.789993px,512.700043px)}}@keyframes g-ll-u-bbl15_to__to{0%,57.142857%{transform:translate(474.450012px,631.96994px)}70%,to{transform:translate(474.450012px,511.96994px)}}@keyframes g-ll-u-bbl16_to__to{0%,30%{transform:translate(474.450012px,631.96994px)}42.857143%,to{transform:translate(474.450012px,511.96994px)}}@keyframes g-ll-u-bbl17_to__to{0%,62.857143%{transform:translate(474.450012px,631.96994px)}80%,to{transform:translate(474.450012px,511.96994px)}}@keyframes g-ll-u-bbl18_to__to{0%,35.714286%{transform:translate(474.450012px,631.96994px)}52.857143%,to{transform:translate(474.450012px,511.96994px)}}.gss-31{stroke-linejoin:round;stroke-linecap:square;stroke:var(--c0l)}.gss-31,.gss-82,.gss-85{fill:var(--c1l)}.gss-88{fill:var(--c3d)}.gss-95{fill:var(--c0l)}.gss-97{fill:var(--c2l)}.gss-109{isolation:isolate}.gss-fc-12,.gss-fc-17,.gss-fc-37,.gss-fc-45{stroke-linejoin:round}.gss-fc-17,.gss-fc-37{stroke-linecap:square}.gss-fc-12,.gss-fc-51,.gss-fc-52,.gss-fc-53,.gss-fc-54{stroke:#1d1d1b}.gss-fc-17,.gss-fc-37{stroke:#171d35}.gss-fc-12,.gss-fc-17,.gss-fc-37,.gss-fc-45,.gss-fc-73{fill:none}.gss-fc-12,.gss-fc-45{stroke-linecap:round}.gss-fc-80,.gss-fc-81{stroke:#000}.gss-fc-85{fill:#4c598e}.gss-fc-37,.gss-fc-51,.gss-fc-52,.gss-fc-89{stroke-width:.5px}.gss-fc-90{fill:#1d1d1b}.gss-fc-51,.gss-fc-52,.gss-fc-53,.gss-fc-54,.gss-fc-80,.gss-fc-81,.gss-fc-89,.gss-fc-91{stroke-miterlimit:10}.gss-fc-89,.gss-fc-91{opacity:.8}.gss-fc-92,.gss-fc-93{fill:#fff}.gss-fc-94{fill:#fae676}.gss-fc-96{fill:#2c84a3}.gss-fc-45,.gss-fc-89,.gss-fc-91{stroke:#fff}.gss-fc-89,.gss-fc-91{fill:#f964bc}.gss-fc-90{mix-blend-mode:multiply}.gss-fc-100,.gss-fc-90{opacity:.3}.gss-fc-51,.gss-fc-53{fill:#83b280}.gss-fc-52,.gss-fc-54{fill:#4cb4ca}.gss-fc-80{fill:#c4c4c4}.gss-fc-81{fill:#b0b0b0}.gss-fc-100{fill:#221e1f;mix-blend-mode:color-burn}.gss-fc-109{isolation:isolate}.gss-fc-45{stroke-width:3px}.gss-fc-93{opacity:.45}.rg-G{fill:var(--c1l)}.rg-H{fill:var(--c0l)}.rg-I{fill:var(--c2l)}</style></g></g>";
  string internal constant C_LAVALAMP_B = "<g transform='translate(-312,90)'><g id='C-Lavalamp-B'><ellipse id='Shadow-2' cx='471.34' cy='579.46' class='gss-fc-90' rx='9.59' ry='6.28' transform='rotate(-18.49 471.2796 579.3921)'/><path fill='url(#li-gr-27)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='m477.72 580.93-4.56-15.24s-6.88-.38-6.69-.52c.19-.14-6.6.52-6.6.52l-4.39 14.73c-.08.25-.13.5-.13.74 0 2.52 4.58 5.33 11.16 5.33s11.16-2.81 11.16-5.33c0-.07 0-.15-.01-.22.03 0 .05-.02.05-.02Z'/><path fill='url(#li-gr-28)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='m477.68 550.45-9.02-1.17h-.23l-13.07.74 4.62 16.25h.03c.58 1.32 3.1 2.6 6.52 2.6s5.88-1.25 6.5-2.56h.03l4.64-15.86Z'/><path id='C-Connector-3' fill='url(#li-gr-29)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M466.51 555.35c-6.58 0-11.16-2.81-11.16-5.33s4.58-5.33 11.16-5.33 11.16 2.81 11.16 5.33-4.58 5.33-11.16 5.33Z'/><g id='C-Lava-2'><path fill='url(#li-gr-30)' d='M468.48 516.72c-3.36.08-4.61 3.75-3.91 5.94.7 2.19.08 7.19-1.64 10.32-.96 1.75-5 5.24-3.6 9.15 1.41 3.91 9.77 5 11.49.94 1.72-4.07-.23-9.38-.55-11.57-.31-2.19-.39-7.66 1.02-9.15 1.41-1.49.63-5.71-2.81-5.63Z'/><circle cx='463.2' cy='514.65' r='2.23' fill='url(#li-gr-31)'/><ellipse cx='470.28' cy='546.21' fill='url(#li-gr-32)' rx='6.36' ry='5.94'/></g><path fill='url(#li-gr-33)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5' d='m473.16 506.73-4.85.05-8.44-.05s-4.52 43.15-4.52 43.29c0 2.52 4.58 5.33 11.16 5.33s11.16-2.81 11.16-5.33c0-.47-4.52-43.29-4.52-43.29Z' opacity='.8'/><g id='Lid-2'><path fill='url(#li-gr-34)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='m471.4 495.69-3.01-.38-6.78.52s-1.74 10.81-1.74 10.89c0 1.5 2.73 3.17 6.65 3.17s6.65-1.67 6.65-3.17c0-.04-1.76-11.04-1.76-11.04Z'/><path id='C-Connector-4' fill='url(#li-gr-35)' stroke='#1d1d1b' stroke-linecap='square' stroke-linejoin='round' stroke-width='.5' d='M466.51 498.18c-2.89 0-4.91-1.23-4.91-2.34s2.01-2.34 4.91-2.34 4.91 1.23 4.91 2.34-2.01 2.34-4.91 2.34Z'/></g></g></g>";
  string internal constant C_CACTUS_A = "<g transform='translate(-312,0)'><g id='C-Cactus-A'><ellipse id='Shadow-3' cx='473.5' cy='607.6' class='gss-fc-100' rx='22.4' ry='13.4' transform='rotate(-17 473.6 607.8)'/><g id='C-Pot'><path d='M447 582.9V611c0 5.9 8.8 10.6 19.6 10.6s19.7-4.8 19.7-10.7v-28H447Z' class='gss-fc-54'/><ellipse cx='466.6' cy='582.8' class='gss-fc-54' rx='19.7' ry='10.8'/><path fill='#3d4676' stroke='#221e1f' stroke-miterlimit='10' d='M466.7 590.5c-9.7 0-16.5-4.1-16.5-7.8s6.8-7.9 16.5-7.9 16.4 4.2 16.4 7.9-6.8 7.8-16.4 7.8Z'/></g><g id='C-Cactus'><path d='M472.2 568.5a5.3 5.3 0 0 1-2-10.3l9-4c6.4-2.3 6.9-7.2 6.9-12.9v-24.6a5.3 5.3 0 1 1 10.6 0v24.6c0 4.9 0 17.8-13.6 22.9l-8.8 3.9c-.7.3-1.4.4-2.1.4Z' class='gss-fc-53'/><path d='M467 461.2a7.6 7.6 0 0 0-7.6 7.6v120.8a30.3 30.3 0 0 0 15.2-.1V468.8c0-4.2-3.4-7.6-7.6-7.6Z' class='gss-fc-53'/><path d='M467.5 546.1c-3.1-2.7-6.8.3-6.8.3s-2.5 2.6-7.4 2c-2.7-.4-3.5-1.3-3.5-6.4v-35.8c0-3-2.2-5.5-5.1-5.6s-5.5 2.3-5.5 5.3v36c0 3.8 0 15.3 12.7 17 1 .2 2 .2 3 .2 5.5 0 9.8-2.1 12.3-4.2 1.3-1 2-2.6 2-4.4 0-1.4-.3-3.2-1.6-4.4Z' class='gss-fc-53'/><path id='C-Spikes' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' d='M467.2 464.3V458m4.5 19.9 5.6-.7m-15.6-5.3-4.9-2.1m10.4 22.3 1.9-4m-11.8-5.8 4.5 2.5m10.4 27 5.5-2m-20.4-1.4 4.1 3.5m11 19.7 6.1-3.2m-21-4 3.9 1.9m30.9-12.2 3.8-4.8m-52.3-5.8a15 15 0 0 1-1.5-5.7M436 516l5.7 1.2m5.7 6.5 5.9-1.6m-15.9 9.7 4.1 1.9m3.5 7.2 3.4-2.6m-3.7 15.2-4.8 3.2m13.2.8.8 5.1m31.9-2 4.3 2.2m4.8-13.7 5.3-1.8m-16-23.3 5.3 4m6.4 6.7 4-3m-8.7 9-2.6-2m-7.8 15a7 7 0 0 1-1.6-3.7M466 521l3.2 4.1m-12 43.4 3.5 2.9m3.2 14.4 3.3-3.6m7.4-19.3 3.3-2.6m-11.4 9.8 2.2-5.2m5.2 15.9 3.4-4M457.5 550l-2-4.1'/></g></g></g>";
  string internal constant C_CACTUS_B = "<g transform='translate(-312,90)'><g id='C-Cactus-B'><ellipse id='Shadow-4' cx='470.79' cy='574.37' class='gss-fc-100' rx='11.4' ry='6.83' transform='rotate(-16.64 470.9215 574.4949)'/><g id='C-Pot-2'><path d='M457.29 561.8v14.3c.07 2.99 4.53 5.41 10.02 5.41s10.02-2.45 10.02-5.48V561.8h-20.04Z' class='gss-fc-52'/><ellipse cx='467.31' cy='561.76' class='gss-fc-52' rx='10.02' ry='5.48'/><path fill='#3d4676' stroke='#221e1f' stroke-miterlimit='10' stroke-width='.5' d='M467.32 565.68c-4.92 0-8.35-2.1-8.35-3.99s3.43-3.99 8.35-3.99 8.35 2.1 8.35 3.99-3.43 3.99-8.35 3.99Z'/></g><g id='C-Cactus-2'><path d='M470.13 554.48c-1.06 0-2.06-.62-2.5-1.66-.58-1.38.06-2.97 1.44-3.56l4.65-2.04c3.2-1.18 3.46-3.67 3.46-6.55v-12.53c0-1.5 1.21-2.71 2.71-2.71s2.71 1.21 2.71 2.71v12.53c0 2.47 0 9.02-6.95 11.62l-4.48 1.97c-.34.15-.7.22-1.06.22Z' class='gss-fc-51'/><path d='M467.49 499.94c-2.12 0-3.86 1.74-3.86 3.86v61.44c1.09.27 2.33.44 3.69.44 1.5 0 2.86-.2 4.03-.52v-61.35c0-2.12-1.74-3.86-3.86-3.86Z' class='gss-fc-51'/><path d='M467.77 543.11c-1.6-1.38-3.46.16-3.46.16s-1.3 1.31-3.76.98c-1.4-.19-1.78-.61-1.78-3.24v-18.2c0-1.49-1.14-2.78-2.63-2.83s-2.8 1.19-2.8 2.71v18.32c0 1.92 0 7.75 6.49 8.62.52.07 1.03.1 1.51.1 2.81 0 4.96-1.08 6.25-2.12.68-.55 1.07-1.37 1.06-2.24 0-.75-.18-1.65-.88-2.25Z' class='gss-fc-51'/><path id='C-Spikes-2' fill='none' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='.5' d='M467.61 501.49v-3.18m2.27 10.11 2.85-.36m-7.93-2.67-2.49-1.09m5.3 11.33.95-2m-5.98-2.97 2.27 1.29m5.27 13.74 2.79-1.06m-10.37-.68 2.11 1.74m5.59 10.06c1.03-.55 2.07-1.1 3.1-1.66m-10.63-2.03 1.93.96m15.71-6.21 1.93-2.43m-26.61-2.94c-.42-.9-.67-1.89-.72-2.89m-3.29 9.23 2.93.62m2.9 3.31c1-.28 1.99-.55 2.99-.83m-8.07 4.97c.69.31 1.39.63 2.08.94m1.75 3.67c.58-.44 1.16-.88 1.73-1.33m-1.87 7.76-2.45 1.6m6.71.42c.15.86.3 1.72.44 2.58m16.19-1.04 2.22 1.14m2.41-6.98 2.72-.92m-8.18-11.83 2.74 2.06m3.22 3.39 2.01-1.53m-4.39 4.54-1.33-.95m-3.93 7.57c-.47-.5-.76-1.16-.82-1.83m-6.71-14.83 1.62 2.11m-6.12 22.07 1.81 1.44m1.63 7.32c.55-.61 1.1-1.21 1.65-1.82m3.77-9.82 1.65-1.33m-5.75 4.99 1.1-2.6m2.66 8.05 1.7-2.04m-10.04-13.6c-.35-.7-.71-1.41-1.06-2.11'/></g></g></g>";
  string internal constant C_MARTINI_A = "<g transform='translate(-312,0)'><g id='C-Martini-A'><path fill='url(#ngr-swa_1)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='.86' d='M468 518.21c-24.18 0-43.13-10.55-43.13-24.03 0-6.79 4.75-13.01 13.36-17.53 8-4.19 18.57-6.5 29.76-6.5h0c24.18 0 43.13 10.55 43.13 24.03s-18.95 24.03-43.13 24.03Z'/><path fill='url(#li-gr-10)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='.86' d='M467.99 580.06c16.49 0 29.85 7 29.85 15.64s-13.37 15.64-29.85 15.64c-16.49 0-29.85-7-29.85-15.64s13.37-15.64 29.85-15.64'/><path fill='url(#li-gr-11)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='.86' d='M467.58 550.94c-1.91 0-3.46-.85-3.46-1.89v44.62s0 0 0 0c.02 1.03 1.56 1.87 3.46 1.87s3.46-.85 3.46-1.89v-44.6c0 1.05-1.55 1.89-3.46 1.89Z'/><path fill='url(#li-gr-12)' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' d='M506.82 504.82c-.89 1.03-1.91 2.01-3.04 2.94-4.61 8.6-18.71 14.71-35.85 14.71-17.29 0-31.49-6.22-35.97-14.95-1.31-1.11-2.49-2.29-3.46-3.53h-.08l35.69 45.06c.82.86 1.55 1.89 3.46 1.89s2.64-.87 3.46-1.89l35.99-44.23h-.21Z'/><path fill='url(#li-gr-13)' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' d='M467.93 480.75h0c-9.72 0-18.9 2-25.84 5.64-7.48 3.92-11.6 9.32-11.6 15.22 0 2.06.52 4.05 1.48 5.92 4.47 8.73 18.67 14.95 35.97 14.95 17.14 0 31.24-6.1 35.85-14.71 1.04-1.94 1.6-4 1.6-6.15 0-11.7-16.45-20.86-37.45-20.86Z'/><path fill='#fff' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round' d='M468 470.16h0c-11.19 0-21.76 2.31-29.76 6.5-8.62 4.51-13.36 10.74-13.36 17.53 0 13.47 18.95 24.03 43.13 24.03 24.18 0 43.13-10.55 43.13-24.03s-18.95-24.03-43.13-24.03Zm0 45.05c-22.16 0-40.13-9.41-40.13-21.03 0-11.61 17.97-21.03 40.13-21.03 22.16 0 40.13 9.41 40.13 21.03 0 11.61-17.97 21.03-40.13 21.03Z'/><path fill='url(#ngr-swa_1-2)' stroke='#000' stroke-linecap='square' stroke-linejoin='round' stroke-width='.86' d='M468 518.21c-17.87 0-32.87-5.77-39.49-14.21h-.08l35.69 45.06c.82.86 1.55 1.89 3.46 1.89s2.64-.87 3.46-1.89l35.99-44.23h-.21c-6.93 7.99-21.53 13.39-38.82 13.39Z'/><g id='C-Olive'><path d='m448.07 492.85 16.11 19.76' class='gss-fc-17'/><circle cx='447.74' cy='492.62' r='6.49' fill='#93bf1f' stroke='#171d35' stroke-linecap='square' stroke-linejoin='round'/><path d='m428.65 468.66 17.89 22.31' class='gss-fc-17'/></g></g></g>";
  
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 6000) {
      return C_LAVALAMP_A;
    } else if (assetID == 6001) {
      return C_LAVALAMP_B;
    } else if (assetID == 6002) {
      return C_CACTUS_A;
    } else if (assetID == 6003) {
      return C_CACTUS_B;
    } else if (assetID == 6004) {
      return C_MARTINI_A;
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
    } else {
      return 0;
    }
  }
}