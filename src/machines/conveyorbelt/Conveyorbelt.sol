// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "../../GridHelper.sol";

library Conveyorbelt {
  string internal constant HOLE = "<g id='c_b_n1-u-c-hole-a' style='display: inline-block;'><path id='c_b_n1-s-path3' d='M272.73,902.89c-.4-2.91-.23-5.87.51-8.76c1.23-4.81,4.61-11.64,13.73-16.87c4.85-2.78,10.71-4.67,17.01-5.51' fill='none' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='round' stroke-linejoin='round'/><path id='c_b_n1-s-path4' d='M351.52,900.37c-.12,4.04-1.32,8.02-3.54,11.62-2.37,3.84-5.79,7.12-10.16,9.74-.36.23-.68.42-1.03.62-5.43,3.02-12.11,4.96-19.22,5.61-1.76.16-3.55.24-5.34.24' fill='none' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='round' stroke-linejoin='round'/><path id='c_b_n1-s-path5' d='M346.97,895.17c1.24,4.99.39,10.21-2.39,14.72-2.04,3.31-5.02,6.15-8.86,8.44-.3.19-.57.36-.86.52-6.19,3.45-14.23,5.35-22.63,5.35v0c-1.36,0-2.7-.05-4.04-.15' fill='none' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='round' stroke-linejoin='round'/><path id='c_b_n1-s-path6' d='M279.49,910.1c-2.82-4.62-3.67-9.94-2.38-14.97c1.04-4.06,3.94-9.86,11.85-14.39c6.16-3.54,14.21-5.49,22.65-5.49' fill='none' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='round' stroke-linejoin='round'/><g id='c_b_n1-u-c-h-g_ts' transform='translate(312.476471,899.496277) scale(1,1)'><g id='c_b_n1-u-c-h-g' transform='translate(-312.476471,-899.496277)'><path id='c_b_n1-s-path7' d='M294.11,898.76c9.96-5.72,26.44-5.51,36.62.45c2.82,1.66,4.87,3.58,6.13,5.62c3.2-5.19,1.15-11.32-6.19-15.62-10.18-5.97-26.66-6.17-36.62-.45-7.19,4.12-9.14,10.2-5.91,15.48c1.22-2.01,3.21-3.9,5.98-5.48Z' fill='url(#c_b_n1-s-path7-fill)' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/><path id='c_b_n1-s-path8' d='M290.75,907.37c.97.88,2.1,1.71,3.41,2.48c10.03,5.88,26.51,6.08,36.62.45.19-.11.35-.22.53-.33c2.54-1.5,4.38-3.26,5.53-5.14-1.26-2.04-3.3-3.96-6.13-5.62-10.18-5.97-26.66-6.17-36.62-.45-2.77,1.59-4.75,3.47-5.98,5.48.66,1.08,1.52,2.13,2.62,3.12Z' fill='#1d1d1b' stroke='#1d1d1b' stroke-width='0.5' stroke-linecap='square' stroke-linejoin='round'/></g></g></g>";

  string internal constant PIPES = "<g id='c_b_n1-u-c-pipe-a'><path id='c_b_n1-s-path9' style='mix-blend-mode:multiply' d='M459.15,45.65c-2.41-1.64-5-1.59-6.83-.35l-138.1,79.63c-2.49-1.1-4.9-1.22-6.77-.09l-27.22,15.93c-.39.13-.77.28-1.12.49-1.87,1.13-2.89,3.3-3.08,6.02l-96.18,55.46c-2.57-1.19-5.06-1.34-6.98-.19l-27.22,15.93c-.39.13-.77.28-1.12.49-1.84,1.11-2.85,3.24-3.07,5.9l-3.09,1.78-.14.08-.46.27v.03c-.12.08-.22.18-.33.27L3.79,304.36l-.14.08-.46.27v.03c-1.47,1.06-2.4,2.92-2.25,5.34.17,6.19,3.87,12.58,9.23,15.71c2.03,1.27,4.14,1.32,5.78.48v0c0,0,.5-.28.5-.28l133.27-77.11c.28-.09.56-.19.82-.32v0c0,0,.5-.28.5-.28l3.59-2.08c2.31.9,4.53.95,6.27-.11.08-.05.16-.12.24-.17l.05.17l28.06-16.42c1.68-1.01,2.67-2.89,2.99-5.23l96.8-56.01c2.38.97,4.66,1.04,6.44-.04.08-.05.16-.12.24-.17l.05.17l28.06-16.42c1.72-1.04,2.71-2.97,3.01-5.38L464.26,67.07c2.09-.7,3.62-2.7,3.61-5.54v-.26c0-6.11-3.56-12.36-8.7-15.63Z' opacity='0.31' fill='#ee8260'/><g id='c_b_n1-s-g6'><g id='c_b_n1-s-g7'><path id='c_b_n1-s-path10' d='M459.15,28.99c-2.41-1.64-5-1.59-6.82-.35l-141.17,81.4c1.78-.93,4.13-.82,6.32.69c5.15,3.31,8.73,9.59,8.77,15.72.08,2.38-.92,4.22-2.44,5.23L464.24,50.41c2.09-.7,3.62-2.7,3.61-5.54v-.26c0-6.11-3.56-12.36-8.7-15.63Z' fill='#2c84a3' stroke='#26474e' stroke-linejoin='round'/><g id='c_b_n1-s-g8'><path id='c_b_n1-s-path11' d='M311.01,110.12l.14-.08c0,0-.09.05-.14.08Z' fill='#1d1d1b' stroke='#26474e' stroke-miterlimit='10'/><path id='c_b_n1-s-path12' d='M310.55,110.38v.03c.15-.11.3-.21.46-.3l-.46.27Z' fill='#ffeb00' stroke='#26474e' stroke-miterlimit='10'/><path id='c_b_n1-s-path13' d='M317.47,110.73c-2.19-1.51-4.54-1.62-6.32-.69l-.14.08c-.16.09-.31.19-.46.3-1.46,1.06-2.39,2.92-2.25,5.34.17,6.19,3.87,12.58,9.23,15.71c2.03,1.27,4.14,1.32,5.78.48v0c0,0,.5-.28.5-.28c1.52-1,2.53-2.85,2.44-5.23-.04-6.14-3.62-12.42-8.77-15.72Z' fill='#2c84a3' stroke='#26474e' stroke-linejoin='round'/></g></g><g id='c_b_n1-s-g9'><path id='c_b_n1-s-path14' d='M323.43,117.05c-4.52-7.49-11.67-11.47-15.97-8.87L279.4,124.6l11.56,9.06l4.8,18.08l28.06-16.42c4.31-2.59,4.13-10.77-.38-18.27Z' fill='#2c84a3' stroke='#26474e' stroke-linejoin='round'/><ellipse id='c_b_n1-s-ellipse1' rx='9.1' ry='15.84' transform='matrix(.856537-.516085 0.516085 0.856537 287.292081 138.181646)' fill='#2c84a3' stroke='#26474e' stroke-linejoin='round'/><path id='c_b_n1-s-path15' d='M286.37,128.94c-2.41-1.64-5-1.59-6.82-.35l-141.17,81.4c1.78-.93,4.13-.82,6.32.69c5.15,3.31,8.73,9.59,8.77,15.72.08,2.38-.92,4.22-2.44,5.23l140.45-81.27c2.09-.7,3.62-2.7,3.61-5.54v-.26c0-6.11-3.56-12.36-8.7-15.63Z' opacity='0.45' fill='#fff' stroke='#26474e' stroke-linejoin='round'/><g id='c_b_n1-s-g10'><g id='c_b_n1-s-g11'><path id='c_b_n1-s-path16' d='M138.23,210.07l.14-.08c0,0-.09.05-.14.08Z' fill='#1d1d1b' stroke='#26474e' stroke-miterlimit='10'/><path id='c_b_n1-s-path17' d='M137.77,210.34v.03c.15-.11.3-.21.46-.3l-.46.27Z' fill='#ffeb00' stroke='#26474e' stroke-miterlimit='10'/><path id='c_b_n1-s-path18' d='M144.69,210.68c-2.19-1.51-4.54-1.62-6.32-.69l-.14.08c-.16.09-.31.19-.46.3-1.46,1.06-2.39,2.92-2.25,5.34.17,6.19,3.87,12.58,9.23,15.71c2.03,1.27,4.14,1.32,5.78.48v0c0,0,.5-.28.5-.28c1.52-1,2.53-2.85,2.44-5.23-.04-6.14-3.62-12.42-8.77-15.72Z' fill='#2c84a3' stroke='#26474e' stroke-linejoin='round'/></g><ellipse id='c_b_n1-s-ellipse2' rx='5.48' ry='9.52' transform='matrix(.872667-.488317 0.488317 0.872667 144.432331 220.990558)' fill='#26474e'/></g></g><g id='c_b_n1-s-g12'><path id='c_b_n1-s-path19' d='M188.84,194.76c-4.52-7.49-11.67-11.47-15.97-8.87l-28.06,16.42l11.56,9.06l4.8,18.08l28.06-16.42c4.31-2.59,4.13-10.77-.38-18.27Z' fill='#2c84a3' stroke='#26474e' stroke-linejoin='round'/><ellipse id='c_b_n1-s-ellipse3' rx='9.1' ry='15.84' transform='matrix(.856537-.516085 0.516085 0.856537 152.695708 215.89306)' fill='#2c84a3' stroke='#26474e' stroke-linejoin='round'/><path id='c_b_n1-s-path20' d='M151.78,206.65c-2.41-1.64-5-1.59-6.82-.35L3.79,287.7c1.78-.93,4.13-.82,6.32.69c5.15,3.31,8.73,9.59,8.77,15.72.08,2.38-.92,4.22-2.44,5.23l140.45-81.27c2.09-.7,3.62-2.7,3.61-5.54v-.26c0-6.11-3.56-12.36-8.7-15.63Z' fill='#2c84a3' stroke='#26474e' stroke-linejoin='round'/><g id='c_b_n1-s-g13'><g id='c_b_n1-s-g14'><path id='c_b_n1-s-path21' d='M3.64,287.78l.14-.08c0,0-.09.05-.14.08Z' fill='#1d1d1b' stroke='#26474e' stroke-miterlimit='10'/><path id='c_b_n1-s-path22' d='M3.18,288.05v.03c.15-.11.3-.21.46-.3l-.46.27Z' fill='#ffeb00' stroke='#26474e' stroke-miterlimit='10'/><path id='c_b_n1-s-path23' d='M10.1,288.39c-2.19-1.51-4.54-1.62-6.32-.69l-.14.08c-.16.09-.31.19-.46.3-1.46,1.06-2.39,2.92-2.25,5.34.17,6.19,3.87,12.58,9.23,15.71c2.03,1.27,4.14,1.32,5.78.48v0c0,0,.5-.28.5-.28c1.52-1,2.53-2.85,2.44-5.23-.04-6.14-3.62-12.42-8.77-15.72Z' fill='#2c84a3' stroke='#26474e' stroke-linejoin='round'/></g><ellipse id='c_b_n1-s-ellipse4' rx='5.48' ry='9.52' transform='matrix(.872667-.488317 0.488317 0.872667 9.865888 298.713267)' fill='#26474e'/></g></g><g id='c_b_n1-s-g15' opacity='0.55'><path id='c_b_n1-s-path24' d='M17.47,289.48c-.69,0-1.36-.36-1.73-1-.55-.96-.23-2.18.72-2.73l131.77-76.58c.96-.56,2.18-.23,2.73.72s.23,2.18-.72,2.73L18.47,289.21c-.32.18-.66.27-1,.27Z' fill='#fff'/></g><g id='c_b_n1-s-g16' opacity='0.55'><path id='c_b_n1-s-path25' d='M324.37,113.23c-.69,0-1.36-.36-1.73-1-.55-.96-.23-2.18.72-2.73L455.13,32.91c.96-.56,2.18-.23,2.73.72.55.96.23,2.18-.72,2.73L325.37,112.94c-.32.18-.66.27-1,.27Z' fill='#fff'/></g><g id='c_b_n1-s-g17' opacity='0.55'><path id='c_b_n1-s-path26' d='M190.34,189.81c-.69,0-1.37-.36-1.74-1.01-.55-.96-.22-2.18.74-2.73l93.48-53.5c.96-.55,2.18-.22,2.73.74s.22,2.18-.74,2.73l-93.48,53.5c-.31.18-.65.26-.99.26Z' fill='#fff'/></g><g id='c_b_n1-s-g18' opacity='0.55'><path id='c_b_n1-s-path27' d='M293.77,127.12c-.7,0-1.38-.37-1.75-1.02-.54-.96-.2-2.18.76-2.72l20.55-11.54c.96-.54,2.18-.2,2.72.76s.2,2.18-.76,2.72l-20.55,11.54c-.31.17-.65.26-.98.26Z' fill='#fff'/></g></g></g>";

  string internal constant BELT_OPEN = "<g id='c_b_n1-u-m_conv-g' style='display: inline-block;'><g id='c_b_n1-u-m-hatch-back'><path id='c_b_n1-s-path161' d='M620,498.03l.79-73.31c-.48-28.1,5.32-48.5,17.24-60.64c7.67-7.81,17.9-11.94,29.57-11.94c21.09,0,46.05,12.99,68.49,35.64c31.81,32.11,50.57,75.33,50.19,115.63-.19,20.29-.19,24.27-.19,32.2v57.6L620,498.04Z' fill='#3d4676' stroke='#221e1f' stroke-linejoin='round'/><path id='c_b_n1-s-path162' d='M617.73,420.46c-.48-27,6.31-45.78,16.15-56.76c6.67-7.44,18.72-13.95,29.43-14.5' fill='none' stroke='#fff' stroke-width='3' stroke-linecap='round' stroke-miterlimit='10'/></g><g id='c_b_n1-u-m-conveyor'><polygon id='c_b_n1-s-polygon15' style='mix-blend-mode:color-burn' points='780,541.63 622.64,450.85 622.53,630.3 311.12,811.34 468.23,900.88 779.92,721.24 780,541.63' opacity='0.3' fill='#221e1f'/><path id='c_b_n1-s-path163' d='M780,544.74L481.23,717.77c-14.79,8.56-22.38,17.73-24.61,29.73-1.16,6.28-.08,11.29,2.91,13.4c1.09.78,2.46,1.17,4.07,1.17v0c2.2,0,4.82-.75,7.58-2.17c34.77-17.88,69.16-38.55,102.41-58.55c16.6-9.98,33.77-20.31,50.73-30.13l155.67-90.35v-36.13Z' fill='#51c4d7' stroke='#1d1d1b' stroke-miterlimit='10'/><path id='c_b_n1-s-path164' d='M457.21,764.18c3.69,2.62,9.19,2.69,15.8-.71c52.3-26.89,102.44-59.32,153.32-88.78C677.67,644.96,780,585.5,780,585.5v-4.79L624.33,671.23c-16.97,9.83-34.13,20.15-50.73,30.13-33.25,20-67.64,40.68-102.41,58.55-2.76,1.42-5.39,2.17-7.58,2.17v0c-.9,0-1.72-.14-2.47-.39' fill='#f2b6d3' stroke='#221e1f' stroke-linejoin='round'/>";

  string internal constant BELT_DISC = "<g id='c_b_n1-s-g110'><g id='c_b_n1-u-wall-disc'><path id='c_b_n1-s-path165' d='M766.51,558.65v0c0,0-.06-.04-.06-.04-.05-.03-.11-.06-.16-.09l-10.95-6.35c-2.81-2.01-6.87-1.94-11.36.71-8.44,4.98-15.35,17.11-15.35,26.96c0,4.94,1.73,8.44,4.53,10.08l11.57,6.68c2.78,1.66,6.61,1.48,10.83-.94c8.43-4.82,15.33-16.94,15.34-26.93c0-4.92-1.67-8.41-4.38-10.09Z' fill='#206c8e' stroke='#221e1f' stroke-miterlimit='10'/></g><path id='c_b_n1-s-path166' d='M771.16,568.85c0-10-6.9-14.1-15.34-9.13-8.44,4.98-15.35,17.11-15.35,26.96s6.9,13.96,15.34,9.13s15.35-16.96,15.35-26.96Z' fill='#ffed69' stroke='#221e1f' stroke-linecap='square' stroke-linejoin='round'/><path id='c_b_n1-s-path167' d='M764.22,568.6l.44-.6-2.2-1.26c-1.59-.9-3.76-.77-6.15.64-4.84,2.86-8.81,9.82-8.81,15.47c0,2.92,1.06,4.95,2.75,5.86v0c0,0,2.01,1.2,2.01,1.2l.52-.68c1.08-.06,2.27-.43,3.52-1.15c4.84-2.77,8.81-9.73,8.81-15.47c0-1.63-.33-2.98-.9-4.02Z' fill='#c4c4c4' stroke='#221e1f' stroke-linecap='square' stroke-linejoin='round'/><path id='c_b_n1-s-path168' d='M767.23,573.85c0-5.74-3.96-8.09-8.8-5.24-4.84,2.86-8.81,9.82-8.81,15.47s3.96,8.01,8.8,5.24s8.81-9.73,8.81-15.47Z' fill='#fff' stroke='#221e1f' stroke-linecap='square' stroke-linejoin='round'/></g>";

  string internal constant BELT_CLOSE = "<path id='c_b_n1-s-path205' d='M461.12,761.7c-.58-.19-1.12-.45-1.6-.79-2.98-2.12-4.07-7.13-2.91-13.4c2.23-12.01,9.82-21.18,24.61-29.73l298.77-173v-4.46c0,0-200.48,115.98-300.77,173.99-12.86,7.44-23.65,16.91-26.54,32.47-1.34,7.24-.04,12.96,3.18,16.24.42.42.86.81,1.34,1.15' fill='#f2b6d3' stroke='#1d1d1b' stroke-miterlimit='10'/><polyline id='c_b_n1-s-polyline1' points='457.46,763.75 457.73,763.92 457.12,764.42 457.16,763.78' fill='#1d1d1b'/><path id='c_b_n1-s-path206' d='M452.68,746.78c2.89-15.56,13.68-25.03,26.54-32.47C579.51,656.3,679.7,598.29,779.99,540.28L623.87,450.14L468.01,540.86l-.06-.03c0,0-84.22,48.65-130.57,75.43-3.37,1.95-6.54,3.78-9.47,5.47l-10.06,6.3c-11.96,7.58-24.93,24.88-20.21,40.11c1.09,3.53,2.72,5.74,4.68,6.99l-.03.04l25.47,14.67L339,696.26l116.86,66.76c-3.22-3.28-4.52-9-3.18-16.24Z' fill='#f2b6d3' stroke='#1d1d1b' stroke-miterlimit='10'/><path id='c_b_n1-s-path207' d='M302.54,675.32c-.73-1.46-1.37-3.04-1.81-4.47-4.72-15.23,8.25-32.52,20.21-40.11l10.06-6.3c2.92-1.69,6.09-3.52,9.47-5.47c46.36-26.79,130.57-75.43,130.57-75.43l.06.03l156.77-91.15-3.98-2.29-155.87,90.74-.06-.03c0,0-84.22,48.65-130.57,75.43-3.37,1.95-6.54,3.78-9.47,5.47l-10.06,6.3c-11.96,7.58-24.93,24.88-20.21,40.11c1.09,3.53,2.72,5.74,4.68,6.99l-.03.04.24.14Z' fill='#f2b6d3' stroke='#1d1d1b' stroke-miterlimit='10'/><path id='c_b_n1-s-path208' d='M776.2,538.05c-99.27,57.43-201.52,117-300.73,174.38-12.86,7.44-23.65,16.91-26.54,32.47-.97,5.23-.56,10.78.96,14.7l5.98,3.42c-3.22-3.28-4.52-9-3.18-16.24c2.89-15.56,13.68-25.03,26.54-32.47C579.52,656.3,679.71,598.29,780,540.28l-3.8-2.23Z' fill='#f2b6d3' stroke='#1d1d1b' stroke-miterlimit='10'/><g id='c_b_n1-s-g120'><line id='c_b_n1-s-line17' x1='301.88' y1='662.66' x2='304.05' y2='663.9' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/><line id='c_b_n1-s-line18' x1='308.33' y1='666.33' x2='443.04' y2='742.98' fill='none' stroke='#f7e0ea' stroke-miterlimit='10' stroke-dasharray='0,0,4.92,4.92'/><line id='c_b_n1-s-line19' x1='445.18' y1='744.2' x2='447.35' y2='745.44' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/></g><g id='c_b_n1-s-g121'><line id='c_b_n1-s-line20' x1='434.02' y1='567.49' x2='436.2' y2='568.73' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/><line id='c_b_n1-s-line21' x1='440.47' y1='571.16' x2='575.18' y2='647.82' fill='none' stroke='#f7e0ea' stroke-miterlimit='10' stroke-dasharray='0,0,4.92,4.92'/><line id='c_b_n1-s-line22' x1='577.32' y1='649.03' x2='579.5' y2='650.27' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/></g><g id='c_b_n1-s-g122'><line id='c_b_n1-s-line23' x1='356.5' y1='613.1' x2='358.67' y2='614.34' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/><line id='c_b_n1-s-line24' x1='362.95' y1='616.77' x2='497.66' y2='693.43' fill='none' stroke='#f7e0ea' stroke-miterlimit='10' stroke-dasharray='0,0,4.92,4.92'/><line id='c_b_n1-s-line25' x1='499.8' y1='694.65' x2='501.97' y2='695.88' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/></g><g id='c_b_n1-s-g123'><line id='c_b_n1-s-line26' x1='395.26' y1='590.3' x2='397.43' y2='591.53' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/><line id='c_b_n1-s-line27' x1='401.71' y1='593.97' x2='536.42' y2='670.62' fill='none' stroke='#f7e0ea' stroke-miterlimit='10' stroke-dasharray='0,0,4.92,4.92'/><line id='c_b_n1-s-line28' x1='538.56' y1='671.84' x2='540.73' y2='673.08' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/></g><g id='c_b_n1-u-lines'><g id='c_b_n1-s-g124'><line id='c_b_n1-s-line29' x1='593.86' y1='474.67' x2='596.03' y2='475.91' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/><line id='c_b_n1-s-line30' x1='600.3' y1='478.34' x2='735.02' y2='555' fill='none' stroke='#f7e0ea' stroke-miterlimit='10' stroke-dasharray='0,0,4.92,4.92'/><line id='c_b_n1-s-line31' x1='737.16' y1='556.21' x2='739.33' y2='557.45' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/></g><g id='c_b_n1-s-g125'><line id='c_b_n1-s-line32' x1='515.39' y1='519.91' x2='517.57' y2='521.14' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/><line id='c_b_n1-s-line33' x1='521.84' y1='523.58' x2='656.56' y2='600.23' fill='none' stroke='#f7e0ea' stroke-miterlimit='10' stroke-dasharray='0,0,4.92,4.92'/><line id='c_b_n1-s-line34' x1='658.69' y1='601.45' x2='660.87' y2='602.69' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/></g><g id='c_b_n1-s-g126'><line id='c_b_n1-s-line35' x1='554.16' y1='497.1' x2='556.33' y2='498.34' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/><line id='c_b_n1-s-line36' x1='560.61' y1='500.77' x2='695.32' y2='577.43' fill='none' stroke='#f7e0ea' stroke-miterlimit='10' stroke-dasharray='0,0,4.92,4.92'/><line id='c_b_n1-s-line37' x1='697.46' y1='578.64' x2='699.63' y2='579.88' fill='none' stroke='#f7e0ea' stroke-miterlimit='10'/></g></g><g id='c_b_n1-s-line38_to' transform='translate(701.904619,494.228828)'><line id='c_b_n1-s-line38' x1='471.04' y1='543.54' x2='620' y2='628.61' transform='translate(-545.520004,-586.074982)' fill='#f2b6d3' stroke='#1d1d1b' stroke-miterlimit='10'/></g><g id='c_b_n1-s-g127' style='mix-blend-mode:color-burn' opacity='0.3'><path id='c_b_n1-s-path209' style='mix-blend-mode:color-burn' d='M455.85,764.04c.14.09.22.12.22.12l-.22-.12Z' fill='#ee8260'/><path id='c_b_n1-s-path210' d='M301.12,674.46l154.73,89.58c-.87-.56-4.06-3.22-4.06-11.96L296.84,662.27c0,0,1.44,10.54,4.28,12.19Z' fill='#ee8260'/></g></g></g>";

  string internal constant FLOOB = "<g xmlns='http://www.w3.org/2000/svg' id='c_b_n1-u-m-hatch-a' style='display: inline-block;'><path id='c_b_n1-s-path211' d='M780.16,505.36c1.09-115.91-158.77-218.49-156.28-78.61v23.38l52.14,30.09v-50.93l51.97,29.97.02,51.01v0c28.63,16.53,51.96,30.01,51.96,30.01c0-9.95-.02-12.46.19-34.91Z' fill='#3d4676' stroke='#1d1d1b' stroke-miterlimit='10'/><g id='c_b_n1-u-c-floobhole'><polygon id='c_b_n1-s-polygon16' points='728.01,510.27 727.99,459.26 720.14,454.73 676.02,480.22 676.02,480.22 728.01,510.27' fill='#f2b6d3' stroke='#1d1d1b' stroke-miterlimit='10'/><polygon id='c_b_n1-s-polygon17' points='676.02,429.29 676.02,480.22 720.14,454.73 676.02,429.29' fill='#e59cc3' stroke='#1d1d1b' stroke-miterlimit='10'/></g><polygon id='c_b_n1-u-c-floob-a2' points='676.02,429.29 676.02,480.22 676.02,480.22 728.01,510.27 727.99,459.26 676.02,429.29' fill='#fae676' stroke='#000' stroke-linecap='round' stroke-linejoin='round'/><g id='c_b_n1-u-c-saw-a_a2' display='none'><g id='c_b_n1-s-g128' clip-path='url(#c_b_n1-u-clippath-1)'><g id='c_b_n1-s-g129'><g id='c_b_n1-u-c-saw'><path id='c_b_n1-s-path212' d='M638.67,309.31c15.84-51.7,58.04-61.96,93.77-22.8s52.2,112.87,36.59,163.81c-15.61,50.93-57.81,61.19-93.77,22.8-35.97-38.4-52.43-112.11-36.59-163.81Z' fill='#fff' stroke='#221e1f' stroke-linecap='square' stroke-linejoin='round'/><path id='c_b_n1-s-path213' d='M645.49,317.07c14.14-46.15,51.82-55.31,83.72-20.35s46.6,100.77,32.66,146.24-51.61,54.63-83.72,20.35-46.81-100.09-32.66-146.24Z' fill='#c6f7f6'/><path id='c_b_n1-s-path214' d='M687.3,461.52c-13.44-12.8-23.36-29.58-29.71-46.94-1.81-4.94-3.32-9.98-4.56-15.09-.6-2.5-4.46-1.44-3.86,1.06c4.48,18.52,12.73,36.29,24.31,51.44c3.35,4.39,6.98,8.55,10.98,12.36c1.86,1.78,4.7-1.05,2.83-2.83Z' fill='#fff'/><path id='c_b_n1-s-path215' d='M692.16,464.8c-2.57,0-2.58,4,0,4s2.58-4,0-4Z' fill='#fff'/></g></g><clipPath id='c_b_n1-u-clippath-1'><path id='c_b_n1-s-path216' d='M780.16,505.36c1.09-115.91-158.77-218.49-156.28-78.61v23.38l52.14,30.09l51.99,30.05c28.63,16.53,51.96,30.01,51.96,30.01c0-9.95-.02-12.46.19-34.91Z' fill='none'/></clipPath></g><path id='c_b_n1-s-path217' d='M779.97,540.27c0-9.95-.02-12.46.19-34.91c1.09-115.91-158.77-218.49-156.28-78.61v23.38' fill='none' stroke='#1d1d1b' stroke-miterlimit='10'/></g><g id='c_b_n1-u-c-floob-states'><g id='c_b_n1-u-clip-group' clip-path='url(#c_b_n1-u-clipping-paths)'><g id='c_b_n1-u-floob_to' style=\"offset-path:path('M834.5,388.409546C775.983659,421.490071,724.020883,456.986075,679.958008,482.455231C428.111938,621.33895,384.426995,633.076761,351.52,675.058894C297.330028,744.19344,308.000001,885.31,311.040002,1001.550842');offset-rotate:0deg\"><g id='c_b_n1-u-floob_ts' transform='scale(1,1)'><g id='c_b_n1-u-floob' transform='translate(-676.024994,-484.759995)'><polygon id='c_b_n1-s-polygon22' points='676.02,480.22 728.01,510.27 727.99,459.26 676.02,429.29 676.02,480.22 676.02,480.22' fill='#fae676' stroke='#000' stroke-linecap='round' stroke-linejoin='round'/><polygon id='c_b_n1-s-polygon23' points='624.04,510.18 676.04,540.23 676.01,489.22 624.04,459.25 624.04,510.18 624.04,510.18' fill='#fae676' stroke='#000' stroke-linecap='round' stroke-linejoin='round'/><polygon id='c_b_n1-s-polygon24' points='676.01,489.22 676.04,540.23 728.01,510.27 727.99,459.26 676.01,489.22' fill='#efc76c' stroke='#000' stroke-linecap='square' stroke-linejoin='round'/><polygon id='c_b_n1-s-polygon25' points='676.02,429.29 624.04,459.25 676.01,489.22 727.99,459.26 676.02,429.29' fill='#fae676' stroke='#000' stroke-linecap='round' stroke-linejoin='round'/><polyline id='c_b_n1-s-polyline3' points='673.53,490.56 627.06,464.2 626.87,490.94' fill='none' stroke='#fff' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'/><line id='c_b_n1-s-line41' x1='629.9' y1='459.27' x2='675.61' y2='433.28' fill='none' stroke='#fff' stroke-width='3' stroke-linecap='round' stroke-miterlimit='10'/></g></g></g><clipPath id='c_b_n1-u-clipping-paths'><path id='c_b_n1-u-clip-path' d='M677.26,429.95l52.92,26.982824-1.77,52.561756l72.635351,41.627743L464.239079,888.277102C407.393438,875.25,370.284161,937.213084,310.549997,935.022273c-48.649177,1.177038-99.232632-51.279497-150.076185-75.096746L3.789998,809.21L624.254063,448.95l53.005937-19Z' transform='translate(.000003 0)' fill='none' stroke='#3f5787' stroke-width='2.16'/></clipPath></g></g></g>";

  string internal constant SLICER = "<g id='c_b_n1-u-c-eyes-e_a' style='display: inline-block;'><g id='c_b_n1-u-c-eye-e_a'><g id='c_b_n1-u-disc'><path id='c_b_n1-s-path218' d='M648.71,314.21c0-11.91,8.22-16.79,18.27-10.86s18.27,20.38,18.27,32.11-8.22,16.62-18.27,10.86-18.27-20.2-18.27-32.11Z' fill='#fff' stroke='#221e1f' stroke-linecap='square' stroke-linejoin='round'/><path id='c_b_n1-s-path219' d='M655.9,318.71c0-6.83,4.72-9.64,10.48-6.23c5.77,3.4,10.48,11.7,10.48,18.43s-4.72,9.54-10.48,6.23c-5.77-3.3-10.48-11.6-10.48-18.43Z' fill='#206c8e' stroke='#221e1f' stroke-linecap='square' stroke-linejoin='round'/></g><ellipse id='c_b_n1-u-orb' rx='14.76' ry='14.78' transform='translate(653.42 332.12)' fill='#fae676' stroke='#221e1f' stroke-linejoin='round'/><path id='c_b_n1-s-path220' style='mix-blend-mode:color-burn' d='M658.58,318.29c3.62,2.69,5.98,7,5.98,11.86c0,8.16-6.61,14.78-14.76,14.78-1.82,0-3.56-.35-5.17-.95c2.46,1.83,5.49,2.92,8.78,2.92c8.15,0,14.76-6.62,14.76-14.78c0-6.34-3.99-11.73-9.59-13.83Z' opacity='0.3' fill='#221e1f'/><path id='c_b_n1-s-path221' style='mix-blend-mode:color-burn' d='M673.19,310.79c-4.81-1.01-9.73,2.18-12.31,7.47c4.36,2.57,7.3,7.3,7.3,12.74c0,2.69-.73,5.21-1.99,7.38.38.13.76.25,1.16.33c5.99,1.25,12.15-3.98,13.76-11.69s-1.93-14.97-7.92-16.23Z' opacity='0.3' fill='#e10613'/><g id='c_b_n1-s-g131'><path id='c_b_n1-s-path222' d='M651.19,321.12c-.3-.93-1.42-1.82-2.46-1.4-1.12.46-2.1,1.02-3.06,1.77-.82.65-1.49,1.41-2.12,2.24-1.27,1.69-1.96,3.71-2.17,5.8-.11,1.04,1,2.04,2,2c1.16-.05,1.86-.86,1.99-1.95c0,0,0,.01,0,.02.03-.09.03-.19.05-.28.04-.21.08-.41.13-.62.09-.37.22-.73.35-1.09.03-.07.06-.14.1-.21.09-.19.19-.38.29-.56.2-.35.42-.67.64-.99.04-.05.08-.1.13-.15.14-.16.28-.32.42-.47.27-.28.57-.54.86-.79.07-.05.14-.1.22-.15.16-.11.32-.21.48-.31s.33-.19.5-.28c.16-.08.85-.38.25-.13.5-.21.91-.43,1.2-.92.25-.43.36-1.06.2-1.54Z' fill='#fff'/><path id='c_b_n1-s-path223' d='M645.38,329.53c0,0,0,.03,0,.05.14-.48.03-.23,0-.05Z' fill='#fff'/></g><path id='c_b_n1-s-path224' d='M643.82,333.92c-2.57,0-2.58,4,0,4s2.58-4,0-4Z' fill='#fff'/></g><g id='c_b_n1-u-clip-group2' mask='url(#c_b_n1-u-clipping-paths2)'><g id='c_b_n1-u-c-saw-anim' clip-path='url(#c_b_n1-u-c-saw-cp)'><g id='c_b_n1-u-c-s_grp'><g id='c_b_n1-u-c-saw2_to' transform='translate(703.783325,317.485809)'><g id='c_b_n1-u-c-saw2' transform='translate(-703.783325,-317.485809)'><path id='c_b_n1-s-path226' d='M638.67,247.26c15.84-51.7,58.04-61.96,93.77-22.8s52.2,112.87,36.59,163.81c-15.61,50.93-57.81,61.19-93.77,22.8-35.97-38.4-52.43-112.11-36.59-163.81Z' fill='#fff' stroke='#221e1f' stroke-linecap='square' stroke-linejoin='round'/><path id='c_b_n1-s-path227' d='M645.49,255.02c14.14-46.15,51.82-55.31,83.72-20.35s46.6,100.77,32.66,146.24-51.61,54.63-83.72,20.35-46.81-100.09-32.66-146.24Z' fill='#c6f7f6'/><path id='c_b_n1-s-path228' d='M687.3,399.47c-13.44-12.8-23.36-29.58-29.71-46.94-1.81-4.94-3.32-9.98-4.56-15.09-.6-2.5-4.46-1.44-3.86,1.06c4.48,18.52,12.73,36.29,24.31,51.44c3.35,4.39,6.98,8.55,10.98,12.36c1.86,1.78,4.7-1.05,2.83-2.83Z' fill='#fff'/><path id='c_b_n1-s-path229' d='M692.16,402.75c-2.57,0-2.58,4,0,4s2.58-4,0-4Z' fill='#fff'/></g></g></g><clipPath id='c_b_n1-u-c-saw-cp'><path id='c_b_n1-s-path230' d='M780.16,505.36c1.09-115.91-158.77-218.49-156.28-78.61v23.38l52.14,30.09l51.99,30.05c28.63,16.53,51.96,30.01,51.96,30.01c0-9.95-.02-12.46.19-34.91Z' fill='none'/></clipPath></g><mask id='c_b_n1-u-clipping-paths2'><g id='c_b_n1-s-path231_to' transform='translate(734.124894,424.659135)'><path id='c_b_n1-s-path231' d='M649.33,439.946137l49.91,28.63524l3.447217,82.146892L801.012571,539.73L796.33423,374.71L614.171395,322.589999l-54.141394,97.714534L627.9,448.749999l21.43-8.803862Z' transform='translate(-706.124894,-436.659134)' fill='#fff' stroke='#3f5787' stroke-width='0'/></g></mask></g><g id='c_b_n1-u-c-eye-e_a2'><g id='c_b_n1-u-disc2'><path id='c_b_n1-s-path232' d='M722.09,353.52c0-11.91,8.22-16.79,18.27-10.86s18.27,20.38,18.27,32.11-8.22,16.62-18.27,10.86-18.27-20.2-18.27-32.11Z' fill='#fff' stroke='#221e1f' stroke-linecap='square' stroke-linejoin='round'/><path id='c_b_n1-s-path233' d='M729.28,358.02c0-6.83,4.72-9.64,10.48-6.23c5.77,3.4,10.48,11.7,10.48,18.43s-4.72,9.54-10.48,6.23c-5.77-3.3-10.48-11.6-10.48-18.43Z' fill='#206c8e' stroke='#221e1f' stroke-linecap='square' stroke-linejoin='round'/></g><ellipse id='c_b_n1-u-orb2' rx='14.76' ry='14.78' transform='translate(726.79 371.43)' fill='#fae676' stroke='#221e1f' stroke-linejoin='round'/><path id='c_b_n1-s-path234' style='mix-blend-mode:color-burn' d='M731.96,357.6c3.62,2.69,5.98,7,5.98,11.86c0,8.16-6.61,14.78-14.76,14.78-1.82,0-3.56-.35-5.17-.95c2.46,1.83,5.49,2.92,8.78,2.92c8.15,0,14.76-6.62,14.76-14.78c0-6.34-3.99-11.73-9.59-13.83Z' opacity='0.3' fill='#221e1f'/><path id='c_b_n1-s-path235' style='mix-blend-mode:color-burn' d='M746.56,350.1c-4.81-1.01-9.73,2.18-12.31,7.47c4.36,2.57,7.3,7.3,7.3,12.74c0,2.69-.73,5.21-1.99,7.38.38.13.76.25,1.16.33c5.99,1.25,12.15-3.98,13.76-11.69s-1.93-14.97-7.92-16.23Z' opacity='0.3' fill='#e10613'/><g id='c_b_n1-s-g132'><path id='c_b_n1-s-path236' d='M724.56,360.43c-.3-.93-1.42-1.82-2.46-1.4-1.12.46-2.1,1.02-3.06,1.77-.82.65-1.49,1.41-2.12,2.24-1.27,1.69-1.96,3.71-2.17,5.8-.11,1.04,1,2.04,2,2c1.16-.05,1.86-.86,1.99-1.95c0,0,0,.01,0,.02.03-.09.03-.19.05-.28.04-.21.08-.41.13-.62.09-.37.22-.73.35-1.09.03-.07.06-.14.1-.21.09-.19.19-.38.29-.56.2-.35.42-.67.64-.99.04-.05.08-.1.13-.15.14-.16.28-.32.42-.47.27-.28.57-.54.86-.79.07-.05.14-.1.22-.15.16-.11.32-.21.48-.31s.33-.19.5-.28c.16-.08.85-.38.25-.13.5-.21.91-.43,1.2-.92.25-.43.36-1.06.2-1.54Z' fill='#fff'/><path id='c_b_n1-s-path237' d='M718.76,368.84c0,0,0,.03,0,.05.14-.48.03-.23,0-.05Z' fill='#fff'/></g><path id='c_b_n1-s-path238' d='M717.19,373.23c-2.57,0-2.58,4,0,4s2.58-4,0-4Z' fill='#fff'/></g></g>";

  string internal constant LEVER = "<g xmlns='http://www.w3.org/2000/svg' id='c_b_n1-u-c-lever-a_a' style='display: inline-block;'><g id='c_b_n1-u-c-slot'><polygon id='c_b_n1-s-polygon31' points='865.57,441.77 853.92,435.13 853.99,545.18 865.5,551.91 865.57,441.77' fill='#206c8e' stroke='#221e1f' stroke-miterlimit='10'/><polygon id='c_b_n1-s-polygon32' points='865.57,441.77 853.92,435.13 853.99,545.18 865.5,551.91 865.57,441.77' fill='none'/><polygon id='c_b_n1-s-polygon33' points='837.01,387.13 832,389.94 837.03,392.79 882.62,418.6 887.63,415.74 837.01,387.13' fill='#4cb4ca' stroke='#1d1d1b' stroke-miterlimit='10'/><polygon id='c_b_n1-s-polygon34' points='882.62,418.6 882.17,599.27 887.08,596.36 887.63,415.74 882.62,418.6' fill='#4cb4ca' stroke='#1d1d1b' stroke-miterlimit='10'/><polygon id='c_b_n1-s-polygon35' points='853.81,544.95 853.74,434.9 848.74,432.05 848.88,547.82 853.81,544.95' fill='#4cb4ca' stroke='#1d1d1b' stroke-miterlimit='10'/><polygon id='c_b_n1-s-polygon36' points='853.99,545.18 849.07,548.06 865.49,557.67 865.5,551.91 853.99,545.18' fill='#4cb4ca' stroke='#1d1d1b' stroke-miterlimit='10'/><path id='c_b_n1-s-path239' d='M837.03,392.79l-5.02-2.84.55,180.09l49.62,29.23.45-180.67-45.6-25.81Zm12.04,155.27l-.14-115.77l4.99,2.85l11.64,6.64-.07,110.13v5.76c0,0-16.43-9.61-16.43-9.61Z' fill='#ffed69' stroke='#221e1f' stroke-miterlimit='10'/><rect id='c_b_n1-s-rect2' width='2.53' height='42.01' rx='1.26' ry='1.26' transform='translate(858.76 472.13)' fill='#221e1f'/><ellipse id='c_b_n1-s-ellipse33' rx='1.18' ry='1.4' transform='translate(835.1 395.77)' fill='#fb914a' stroke='#fcd056' stroke-width='0.25' stroke-miterlimit='10'/><ellipse id='c_b_n1-s-ellipse34' rx='1.18' ry='1.4' transform='translate(879.07 420.78)' fill='#fb914a' stroke='#fcd056' stroke-width='0.25' stroke-miterlimit='10'/><ellipse id='c_b_n1-s-ellipse35' rx='1.18' ry='1.4' transform='translate(835.68 568.26)' fill='#fb914a' stroke='#fcd056' stroke-width='0.25' stroke-miterlimit='10'/><ellipse id='c_b_n1-s-ellipse36' rx='1.18' ry='1.4' transform='translate(878.56 592.88)' fill='#fb914a' stroke='#fcd056' stroke-width='0.25' stroke-miterlimit='10'/><path id='c_b_n1-s-path240' style='mix-blend-mode:color-burn' d='M865.51,555.15c0,7.15-3.43,12.95-7.66,12.95s-7.66-5.8-7.66-12.95c0-5.72,2.2-10.57,5.25-12.28l.29-42.43l4.39.53v41.81c3.13,1.63,5.4,6.56,5.4,12.38Z' opacity='0.3' fill='#e10613'/><polygon id='c_b_n1-s-polygon37' points='882.62,418.6 882.17,599.27 887.08,596.36 887.63,415.74 882.62,418.6' fill='none'/></g><g id='c_b_n1-u-c-handle'><path id='c_b_n1-s-path241' d='M833.37,542.88c-.55.97-2.35.97-4.01,0-.83-.48-1.47-1.11-1.84-1.74-.36-.63-.45-1.26-.18-1.75l33.13-62.04v22.29l-27.11,43.23Z' fill='#f4f4f4' stroke='#221e1f' stroke-miterlimit='10'/><path id='c_b_n1-s-path242' d='M833.37,542.87c.27-.48.19-1.12-.18-1.75-.36-.63-1.01-1.26-1.84-1.74-1.66-.96-3.46-.95-4.01.01-.27.48-.19,1.12.18,1.75.36.63,1.01,1.26,1.84,1.74c1.66.96,3.46.96,4.01-.01Z' fill='#d8d8d8' stroke='#9361bc' stroke-miterlimit='10'/></g><g id='c_b_n1-s-g133'><circle id='c_b_n1-u-c-knob' r='10.79' transform='translate(830.3 541.1)' fill='#f69031' stroke='#221e1f' stroke-miterlimit='10'/><path id='c_b_n1-s-path243' style='mix-blend-mode:color-burn' d='M824.42,550.25c3.25.82,6.84.15,9.64-2.13c4.7-3.84,5.41-10.76,1.57-15.45-.86-1.05-1.87-1.89-2.98-2.53c2.21.56,4.26,1.79,5.81,3.69c3.83,4.7,3.13,11.62-1.57,15.45-3.65,2.98-8.64,3.22-12.48.98Z' opacity='0.3' fill='#221e1f'/><path id='c_b_n1-s-path244' d='M828.39,535.6c-1.62-1.99,1.47-4.52,3.09-2.52c1.62,1.99-1.47,4.52-3.09,2.52Z' fill='#fff'/><path id='c_b_n1-s-path245' d='M821.86,545.36c-.65-1.67-.86-3.55-.48-5.31.23-1.04.56-1.96,1.06-2.9.44-.82,1.01-1.51,1.67-2.16.34-.34,1-.49,1.46-.44.49.05,1.05.32,1.35.72.31.41.52.94.44,1.46-.07.47-.27.83-.56,1.17c0,0,0,0,.01-.01-.38.41-.69.86-.97,1.34-.21.43-.37.88-.5,1.35-.1.49-.15.99-.15,1.5.03.46.1.92.22,1.37.04.1.07.21.11.31.38.97.02,2.23-1.02,2.63-.97.38-2.23.02-2.63-1.02Z' fill='#fff'/></g></g>";

  // Each position is represented by 6 bytes, 3 for x and 3 for y
  bytes internal constant PIPE_POSITIONS = "000000000060000120000180000240000300000360000420000480000540";

  // Each position is represented by 8 bytes, 4 for x and 4 for y
  bytes internal constant DISC_POSITIONS = "00000000-0300018-0600036-0900054-1200072-1500090-1800108-2100126-2400144-2700162";

  function getMachine() external pure returns (string memory) {
    return CommonSVG.groupTransform("-468", "-630", string.concat(GridHelper.repeatGivenObject(PIPES, 9, PIPE_POSITIONS), HOLE, BELT_OPEN, GridHelper.repeatGivenObject(BELT_DISC, 10, DISC_POSITIONS), BELT_CLOSE, FLOOB, SLICER, LEVER));
  }
}