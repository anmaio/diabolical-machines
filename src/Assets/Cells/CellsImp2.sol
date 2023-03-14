// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract CellsImp2 {

  string internal constant C_PUMP_A = "<g id='cs-u-m-machine-a'><g id='cs-u-c-lid-a_to' transform='translate(156.2 584.975)'><g id='cs-u-c-lid-a' transform='translate(-156.2 -584.975)'><path id='cs-u-path-c1-s16' d='M271.36 557.85v54.25c0 33.33-51.56 60.34-115.16 60.34S41.04 645.42 41.04 612.1v-54.25' fill='url(#cs-u-path-c1-s16-fill)' stroke='#1d1d1b'/><path id='cs-s-path398' d='M156.2 497.51c63.6 0 115.16 27.02 115.16 60.34 0 33.33-51.56 60.34-115.16 60.34S41.04 591.17 41.04 557.85c0-33.33 51.56-60.34 115.16-60.34' fill='#4c598e' stroke='#171d35'/><path id='cs-s-path399' d='M156.21 608.19c29.17 0 56.44-5.87 76.79-16.53 18.03-9.45 28.37-21.77 28.37-33.81s-10.34-24.36-28.37-33.81c-20.34-10.66-47.62-16.53-76.79-16.53s-56.44 5.87-76.79 16.53c-18.03 9.45-28.37 21.77-28.37 33.81s10.34 24.36 28.37 33.81c20.34 10.66 47.62 16.53 76.79 16.53' fill='url(#cs-s-path399-fill)' stroke='#1d1d1b'/><path id='cs-s-path400' d='M156.2 623.84c-31.66 0-61.51-6.51-84.05-18.32-12.48-6.54-22.01-14.33-28.24-22.92' fill='none' stroke='#fff' stroke-width='3'/><g id='cs-u-c-screws-a'><path id='cs-s-path401' d='M218.41 588.72c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='#4c598e' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path402' d='M251.03 551.33c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='#4c598e' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path403' d='M213.14 520.2c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='#4c598e' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path404' d='M99.97 520.2c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='#4c598e' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path405' d='M61.09 560.27c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='#4c598e' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path406' d='M99.48 589.31c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='#4c598e' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path407' d='M157.05 600.23c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='#4c598e' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path408' d='M157.4 511.41c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='#4c598e' stroke='#171d35' stroke-width='.5'/></g><g id='cs-u-c-screws-b'><path id='cs-s-path409' d='M267.35 602.84c-13.28 25.64-58.01 44.5-111.15 44.5-54.76 0-100.58-20.02-112.27-46.86' fill='none' stroke='#000'/><circle id='cs-s-circle25' r='2.56' transform='translate(135.14 646.34)' fill='#4c598e' stroke='#171d35'/><circle id='cs-s-circle26' r='2.56' transform='translate(100.37 640.07)' fill='#4c598e' stroke='#171d35'/><circle id='cs-s-circle27' r='2.56' transform='translate(73.62 629.37)' fill='#4c598e' stroke='#171d35'/><circle id='cs-s-circle28' r='2.56' transform='translate(51.66 612.19)' fill='#4c598e' stroke='#171d35'/><circle id='cs-s-circle29' r='2.56' transform='translate(171.46 647.18)' fill='#4c598e' stroke='#171d35'/><circle id='cs-s-circle30' r='2.56' transform='translate(207.37 641.48)' fill='#4c598e' stroke='#171d35'/><circle id='cs-s-circle31' r='2.56' transform='translate(237.77 629.93)' fill='#4c598e' stroke='#171d35'/><circle id='cs-s-circle32' r='2.56' transform='translate(260.02 613.32)' fill='#4c598e' stroke='#171d35'/></g></g></g><g id='cs-u-c-pump-a_a'><g id='cs-u-path-c2-s16_to' transform='translate(156.2 558.36)'><path id='cs-u-path-c2-s16' d='M156.2 498.02c63.6 0 115.16 27.02 115.16 60.34S219.8 618.7 156.2 618.7 41.04 591.68 41.04 558.36c0-33.33 51.56-60.34 115.16-60.34' transform='translate(-156.2 -558.36)' fill='url(#cs-u-path-c2-s16-fill)' stroke='#000'/></g><g id='cs-u-path-c2-s17_to' transform='translate(156.2 547.78)'><path id='cs-u-path-c2-s17' d='M156.2 487.44c63.6 0 115.16 27.02 115.16 60.34 0 33.33-51.56 60.34-115.16 60.34S41.04 581.1 41.04 547.78c0-33.33 51.56-60.34 115.16-60.34' transform='translate(-156.2 -547.78)' fill='url(#cs-u-path-c2-s17-fill)' stroke='#000'/></g><g id='cs-u-path-c2-s18_to' transform='translate(156.2 537.21)'><path id='cs-u-path-c2-s18' d='M156.2 476.87c63.6 0 115.16 27.02 115.16 60.34 0 33.33-51.56 60.34-115.16 60.34S41.04 570.53 41.04 537.21c0-33.33 51.56-60.34 115.16-60.34' transform='translate(-156.2 -537.21)' fill='url(#cs-u-path-c2-s18-fill)' stroke='#000'/></g><g id='cs-u-path-c2-s19_to' transform='translate(156.2 526.63)'><path id='cs-u-path-c2-s19' d='M156.2 466.29c63.6 0 115.16 27.02 115.16 60.34 0 33.33-51.56 60.34-115.16 60.34S41.04 559.95 41.04 526.63c0-33.33 51.56-60.34 115.16-60.34' transform='translate(-156.2 -526.63)' fill='url(#cs-u-path-c2-s19-fill)' stroke='#000'/></g><g id='cs-u-path-c2-s110_to' transform='translate(156.2 516.05)'><path id='cs-u-path-c2-s110' d='M156.2 455.71c63.6 0 115.16 27.02 115.16 60.34 0 33.33-51.56 60.34-115.16 60.34S41.04 549.37 41.04 516.05c0-33.33 51.56-60.34 115.16-60.34' transform='translate(-156.2 -516.05)' fill='url(#cs-u-path-c2-s110-fill)' stroke='#000'/></g><g id='cs-u-path-c2-s3_to' transform='translate(156.2 505.48)'><path id='cs-u-path-c2-s3' d='M156.2 445.14c63.6 0 115.16 27.02 115.16 60.34 0 33.33-51.56 60.34-115.16 60.34S41.04 538.8 41.04 505.48c0-33.33 51.56-60.34 115.16-60.34' transform='translate(-156.2 -505.48)' fill='url(#cs-u-path-c2-s3-fill)' stroke='#000'/></g><g id='cs-u-path-c2-s2_to' transform='translate(156.2 494.9)'><path id='cs-u-path-c2-s2' d='M156.2 434.56c63.6 0 115.16 27.02 115.16 60.34 0 33.33-51.56 60.34-115.16 60.34S41.04 528.22 41.04 494.9c0-33.33 51.56-60.34 115.16-60.34' transform='translate(-156.2 -494.9)' fill='url(#cs-u-path-c2-s2-fill)' stroke='#000'/></g><g id='cs-u-path-c2-s111_to' transform='translate(156.2 484.32)'><path id='cs-u-path-c2-s111' d='M156.2 423.98c63.6 0 115.16 27.02 115.16 60.34 0 33.33-51.56 60.34-115.16 60.34S41.04 517.64 41.04 484.32c0-33.33 51.56-60.34 115.16-60.34' transform='translate(-156.2 -484.32)' fill='url(#cs-u-path-c2-s111-fill)' stroke='#000'/></g></g><g id='cs-u-c-lid-a2'><path id='cs-u-path-c1-s17' d='M271.36 416.74v54.25c0 33.33-51.56 60.34-115.16 60.34S41.04 504.31 41.04 470.99v-54.25' fill='url(#cs-u-path-c1-s17-fill)' stroke='#1d1d1b'/><path id='cs-u-path-c1-s18' d='M156.2 356.4c63.6 0 115.16 27.02 115.16 60.34 0 33.33-51.56 60.34-115.16 60.34S41.04 450.06 41.04 416.74c0-33.33 51.56-60.34 115.16-60.34' fill='var(--c1l)' stroke='#171d35'/><path id='cs-u-path-c1-s19' d='M156.21 467.08c29.17 0 56.44-5.87 76.79-16.53 18.03-9.45 28.37-21.77 28.37-33.81s-10.34-24.36-28.37-33.81c-20.34-10.66-47.62-16.53-76.79-16.53s-56.44 5.87-76.79 16.53c-18.03 9.45-28.37 21.77-28.37 33.81s10.34 24.36 28.37 33.81c20.34 10.66 47.62 16.53 76.79 16.53' fill='url(#cs-u-path-c1-s19-fill)' stroke='#1d1d1b'/><path id='cs-u-path-c1-s110' d='M156.2 482.73c-31.66 0-61.51-6.51-84.05-18.32-12.48-6.54-22.01-14.33-28.24-22.92' fill='var(--c1l)' stroke='#fff' stroke-width='3'/><g id='cs-u-c-screws-a-c1-s1'><path id='cs-s-path410' d='M218.41 447.6c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='var(--c1b)' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path411' d='M251.03 410.21c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='var(--c1b)' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path412' d='M213.14 379.09c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='var(--c1b)' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path413' d='M99.97 379.09c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='var(--c1b)' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path414' d='M61.09 419.16c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='var(--c1b)' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path415' d='M99.48 448.2c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='var(--c1b)' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path416' d='M157.05 459.11c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='var(--c1b)' stroke='#171d35' stroke-width='.5'/><path id='cs-s-path417' d='M157.4 370.3c-1.15 0-2.22.23-3.02.65-.69.36-1.09.83-1.09 1.29s.4.92 1.09 1.29c.8.42 1.87.65 3.02.65s2.22-.23 3.02-.65c.69-.36 1.09-.83 1.09-1.29s-.4-.92-1.09-1.29c-.8-.42-1.87-.65-3.02-.65Z' fill='var(--c1b)' stroke='#171d35' stroke-width='.5'/></g><g id='cs-u-c-screws-b-c1-s1'><path id='cs-s-path418' d='M267.35 461.73c-13.28 25.64-58.01 44.5-111.15 44.5-54.76 0-100.58-20.02-112.27-46.86' fill='none' stroke='#000'/><circle id='cs-s-circle33' r='2.56' transform='translate(135.14 505.22)' fill='var(--c1b)' stroke='#171d35'/><circle id='cs-s-circle34' r='2.56' transform='translate(100.37 498.95)' fill='var(--c1b)' stroke='#171d35'/><circle id='cs-s-circle35' r='2.56' transform='translate(73.62 488.26)' fill='var(--c1b)' stroke='#171d35'/><circle id='cs-s-circle36' r='2.56' transform='translate(51.66 471.08)' fill='var(--c1b)' stroke='#171d35'/><circle id='cs-s-circle37' r='2.56' transform='translate(171.46 506.07)' fill='var(--c1b)' stroke='#171d35'/><circle id='cs-s-circle38' r='2.56' transform='translate(207.37 500.36)' fill='var(--c1b)' stroke='#171d35'/><circle id='cs-s-circle39' r='2.56' transform='translate(237.77 488.82)' fill='var(--c1b)' stroke='#171d35'/><circle id='cs-s-circle40' r='2.56' transform='translate(260.02 472.21)' fill='var(--c1b)' stroke='#171d35'/></g></g></g>";

  string internal constant C_BIT_A = "<g id='drl-u-c-bit-a'><g id='drl-s-g5'><g id='drl-u-c-bit'><path id='drl-s-path19' fill='url(#drl-s-path19-fill)' stroke='#000' stroke-width='1.01' d='M442.77 730.62c0-7.92 11.6-14.34 25.91-14.34s25.91 6.42 25.91 14.34v103.02c0 7.92-4.19 29.68-25.91 29.68-20.47 0-25.91-21.76-25.91-29.68V730.62Z'/><path id='drl-s-path20' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M460.96 857.25c0-2.02 3.12-3.65 6.97-3.65s6.97 1.64 6.97 3.65v4.57c0 2.02-1.13 7.56-6.97 7.56-5.51 0-6.97-5.54-6.97-7.56v-4.57Z'/><path id='drl-s-path21' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M484.43 852.34c-1.67-1.14-1.26-4.64.91-7.82s5.28-4.84 6.94-3.7l3.77 2.57c1.67 1.14 5.61 5.19 2.32 10.02-3.1 4.55-8.51 2.64-10.17 1.5l-3.77-2.57Z'/><path id='drl-s-path22' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M487.8 831.41c-1.96-.49-2.79-3.91-1.86-7.65s3.27-6.37 5.23-5.88l4.43 1.11c1.96.49 7.06 2.92 5.65 8.59-1.33 5.34-7.06 5.42-9.02 4.93l-4.43-1.11Z'/><path id='drl-s-path23' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M492.22 806.87c-2.02-.02-3.62-3.16-3.58-7.01s1.71-6.95 3.73-6.93l4.57.05c2.02.02 7.55 1.21 7.48 7.05-.06 5.51-5.62 6.91-7.63 6.89l-4.57-.05Z'/><path id='drl-s-path24' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M492.22 781.99c-2.02-.02-3.62-3.16-3.58-7.01s1.71-6.95 3.73-6.93l4.57.05c2.02.02 7.55 1.21 7.48 7.05-.06 5.51-5.62 6.91-7.63 6.89l-4.57-.05Z'/><path id='drl-s-path25' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M492.22 757.1c-2.02-.02-3.62-3.16-3.58-7.01s1.71-6.95 3.73-6.93l4.57.05c2.02.02 7.55 1.21 7.48 7.05-.06 5.51-5.62 6.91-7.63 6.89l-4.57-.05Z'/><path id='drl-s-path26' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M444.52 781.99c2.02-.02 3.62-3.16 3.58-7.01s-1.71-6.95-3.73-6.93l-4.57.05c-2.02.02-7.55 1.21-7.48 7.05.06 5.51 5.62 6.91 7.63 6.89l4.57-.05Z'/><path id='drl-s-path27' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M444.52 806.87c2.02-.02 3.62-3.16 3.58-7.01s-1.71-6.95-3.73-6.93l-4.57.05c-2.02.02-7.55 1.21-7.48 7.05.06 5.51 5.62 6.91 7.63 6.89l4.57-.05Z'/><path id='drl-s-path28' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M444.52 757.1c2.02-.02 3.62-3.16 3.58-7.01s-1.71-6.95-3.73-6.93l-4.57.05c-2.02.02-7.55 1.21-7.48 7.05.06 5.51 5.62 6.91 7.63 6.89l4.57-.05Z'/><path id='drl-s-path29' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M449.33 830.62c1.82-.86 1.97-4.38.33-7.86s-4.45-5.61-6.28-4.75l-4.13 1.95c-1.82.86-6.36 4.24-3.86 9.53 2.35 4.98 7.98 3.94 9.81 3.08l4.13-1.95Z'/><path id='drl-s-path30' fill='url(#c2b)' stroke='#000' stroke-width='.94' d='M445.27 840.94c1.56-1.28 4.8.09 7.25 3.07 2.44 2.98 3.16 6.43 1.6 7.71l-3.53 2.9c-1.56 1.28-6.56 3.93-10.26-.59-3.49-4.26-.14-8.9 1.42-10.18l3.53-2.9Z'/><g id='drl-s-g6'><path id='drl-s-path31' fill='url(#c0l)' d='M471.47 742.89c2.32 1.11 3.92 3.46 3.92 6.2 0 3.8-3.08 6.88-6.88 6.88-.27 0-.54-.02-.8-.05.9.43 1.9.68 2.96.68 3.8 0 6.88-3.08 6.88-6.88 0-3.53-2.66-6.43-6.08-6.83Z' opacity='.3' style='mix-blend-mode:color-burn'/><circle id='drl-s-circle1' r='6.88' fill='url(#c2b)' stroke='#000' stroke-width='.94' transform='translate(468.52 749.09)'/></g><g id='drl-s-g7'><path id='drl-s-path32' fill='url(#c0l)' d='M471.47 770.68c2.32 1.11 3.92 3.46 3.92 6.2 0 3.8-3.08 6.88-6.88 6.88-.27 0-.54-.02-.8-.05.9.43 1.9.68 2.96.68 3.8 0 6.88-3.08 6.88-6.88 0-3.53-2.66-6.43-6.08-6.83Z' opacity='.3' style='mix-blend-mode:color-burn'/><circle id='drl-s-circle2' r='6.88' fill='url(#c2b)' stroke='#000' stroke-width='.94' transform='translate(468.52 776.89)'/></g><g id='drl-s-g8'><path id='drl-s-path33' fill='url(#c0l)' d='M471.47 798.48c2.32 1.11 3.92 3.46 3.92 6.2 0 3.8-3.08 6.88-6.88 6.88-.27 0-.54-.02-.8-.05.9.43 1.9.68 2.96.68 3.8 0 6.88-3.08 6.88-6.88 0-3.53-2.66-6.43-6.08-6.83Z' opacity='.3' style='mix-blend-mode:color-burn'/><circle id='drl-s-circle3' r='6.88' fill='url(#c2b)' stroke='#000' stroke-width='.94' transform='translate(468.52 804.68)'/></g><g id='drl-s-g9'><path id='drl-s-path34' fill='url(#c0l)' d='M471.47 826.27c2.32 1.11 3.92 3.46 3.92 6.2 0 3.8-3.08 6.88-6.88 6.88-.27 0-.54-.02-.8-.05.9.43 1.9.68 2.96.68 3.8 0 6.88-3.08 6.88-6.88 0-3.53-2.66-6.43-6.08-6.83Z' opacity='.3' style='mix-blend-mode:color-burn'/><circle id='drl-s-circle4' r='6.88' fill='url(#c2b)' stroke='#000' stroke-width='.94' transform='translate(468.52 832.48)'/></g><path id='drl-s-path35' fill='url(#c0l)' d='M473.52 854.72s1.9.2 3.2 3 1.8 4.1 1.8 4.1l-3.7 1.1s.6-4.3.4-5.29-1.7-2.9-1.7-2.9Z' opacity='.3' style='mix-blend-mode:color-burn'/></g></g></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 9009) {
      return C_PUMP_A;
    } else if (assetID == 9012) {
      return C_BIT_A;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 9009) {
      return 3;
    } else if (assetID == 9012) {
      return 3;
    } else {
      return 0;
    }
  }
}