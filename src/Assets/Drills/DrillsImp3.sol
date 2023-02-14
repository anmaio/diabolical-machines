// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract DrillsImp3 {

  string internal constant C_DRILL_HEADDRESS = "<g id='drl-u-c_drill-headdress' transform='translate(-155 89)'><g id='drl-s-g14'><path id='drl-s-path95' fill='url(#c2b)' stroke='#000' d='M695.51 393.47c16.6-8.7 26.12-19.9 26.12-30.75s-9.52-22.05-26.12-30.75c-19.1-10.01-44.73-15.52-72.18-15.52s-53.08 5.51-72.18 15.52c-16.6 8.7-26.12 19.9-26.12 30.75s9.52 22.05 26.12 30.75c19.1 10.01 44.73 15.52 72.18 15.52v11-11c27.45 0 53.08-5.51 72.18-15.52Z'/><path id='drl-s-path96' fill='url(#c5d)' stroke='#000' d='M623.33 403.99c-26.65 0-51.46-5.31-69.86-14.95-14.67-7.69-23.44-17.53-23.44-26.32s8.76-18.63 23.44-26.32c18.39-9.64 43.2-14.95 69.86-14.95s51.46 5.31 69.86 14.95c14.67 7.69 23.44 17.53 23.44 26.32s-8.76 18.63-23.44 26.32c-18.39 9.64-43.2 14.95-69.85 14.95Z'/><path id='drl-s-path97' fill='url(#c2l)' stroke='#000' d='M623.34 398.99c-25.86 0-49.85-5.11-67.54-14.38-12.61-6.61-20.76-15.2-20.76-21.89s8.15-15.28 20.76-21.89c17.69-9.27 41.68-14.37 67.54-14.37s49.84 5.1 67.54 14.37c12.61 6.61 20.76 15.2 20.76 21.89s-8.15 15.28-20.76 21.89c-17.69 9.27-41.68 14.37-67.53 14.37Z'/><path id='drl-s-path98' fill='url(#c0l)' stroke='#000' d='M624.45 374.04c-8.87 0-17.12-1.77-23.24-4.97-4.88-2.56-7.8-5.83-7.8-8.76s2.92-6.2 7.8-8.76c6.12-3.21 14.38-4.97 23.24-4.97s17.12 1.77 23.24 4.97c4.88 2.56 7.8 5.83 7.8 8.76s-2.92 6.2-7.8 8.76c-6.12 3.21-14.38 4.97-23.24 4.97Z'/><path id='drl-s-path99' fill='url(#c2l)' stroke='#000' d='M623.34 305.46c-60.36 0-109.29 25.64-109.29 57.27S562.98 420 623.34 420v-11c-27.45 0-53.08-5.51-72.18-15.52-16.6-8.7-26.12-19.91-26.12-30.75s9.52-22.05 26.12-30.75c19.1-10.01 44.73-15.52 72.18-15.52s53.08 5.51 72.18 15.52c16.6 8.7 26.12 19.91 26.12 30.75s-9.52 22.05-26.12 30.75c-19.1 10.01-44.73 15.52-72.17 15.52v11c60.36 0 109.29-25.64 109.29-57.27s-48.93-57.27-109.29-57.27Z'/></g><g id='drl-s-g15'><g id='drl-s-g16'><path id='drl-s-path100' fill='url(#c2l)' stroke='#000' d='M648.24 444.7c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path101' fill='url(#c2l)' stroke='#000' d='M648.24 467.59c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path102' fill='url(#c2l)' stroke='#000' d='M648.24 490.47c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path103' fill='url(#c2l)' stroke='#000' d='M648.24 513.35c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path104' fill='url(#c2l)' stroke='#000' d='M648.24 536.95c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path105' fill='url(#c2l)' stroke='#000' d='M648.24 559.83c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/></g><path id='drl-s-path106' fill='url(#c2l)' stroke='#000' d='M554.59 435.75c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path107' fill='url(#c2l)' stroke='#000' d='M554.59 458.63c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path108' fill='url(#c2l)' stroke='#000' d='M575.43 442.4c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path109' fill='url(#c2l)' stroke='#000' d='M575.43 465.28c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path110' fill='url(#c2l)' stroke='#000' d='M605.67 444.7c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path111' fill='url(#c2l)' stroke='#000' d='M605.67 467.59c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path112' fill='url(#c2l)' stroke='#000' d='M626.95 447.1c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path113' fill='url(#c2l)' stroke='#000' d='M626.95 469.98c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><g id='drl-s-g17'><path id='drl-s-path114' fill='url(#c2l)' stroke='#000' d='M534.23 426.52c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path115' fill='url(#c2l)' stroke='#000' d='M534.23 449.41c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path116' fill='url(#c2l)' stroke='#000' d='M534.23 472.29c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path117' fill='url(#c2l)' stroke='#000' d='M534.23 495.17c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path118' fill='url(#c2l)' stroke='#000' d='M534.23 518.77c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path119' fill='url(#c2l)' stroke='#000' d='M534.23 541.65c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/></g><g id='drl-s-g18'><path id='drl-s-path120' fill='url(#c2l)' stroke='#000' d='M516.82 410.99c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path121' fill='url(#c2l)' stroke='#000' d='M516.82 433.87c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path122' fill='url(#c2l)' stroke='#000' d='M516.82 456.75c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path123' fill='url(#c2l)' stroke='#000' d='M516.82 479.64c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path124' fill='url(#c2l)' stroke='#000' d='M516.82 503.23c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path125' fill='url(#c2l)' stroke='#000' d='M516.82 526.12c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/></g><g id='drl-s-g19'><path id='drl-s-path126' fill='url(#c2l)' stroke='#000' d='M667.64 443.11c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path127' fill='url(#c2l)' stroke='#000' d='M667.64 465.99c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path128' fill='url(#c2l)' stroke='#000' d='M667.64 488.88c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path129' fill='url(#c2l)' stroke='#000' d='M667.64 511.76c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path130' fill='url(#c2l)' stroke='#000' d='M667.64 535.35c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path131' fill='url(#c2l)' stroke='#000' d='M667.64 558.24c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/></g><g id='drl-s-g20'><path id='drl-s-path132' fill='url(#c2l)' stroke='#000' d='M688.34 439.29c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path133' fill='url(#c2l)' stroke='#000' d='M688.34 462.17c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path134' fill='url(#c2l)' stroke='#000' d='M688.34 485.05c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path135' fill='url(#c2l)' stroke='#000' d='M688.34 507.94c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path136' fill='url(#c2l)' stroke='#000' d='M688.34 531.53c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/><path id='drl-s-path137' fill='url(#c2l)' stroke='#000' d='M688.34 554.42c-4.09 0-7.06-4.96-7.06-11.8s2.97-11.8 7.06-11.8 7.06 4.96 7.06 11.8-2.97 11.8-7.06 11.8Zm0-18.18c-.61.56-1.74 2.8-1.74 6.38s1.13 5.82 1.74 6.38c.61-.56 1.73-2.8 1.73-6.38s-1.13-5.82-1.73-6.38Z'/></g><path id='drl-s-polygon1' fill='url(#c5d)' stroke='#000' d='m594.69 397.44 12.14 22.54-17.32 18.84-13.14-22.65 18.32-18.73z'/><path id='drl-s-polygon2' fill='url(#c2b)' stroke='#231f20' stroke-width='.5' d='m582.6 416.95 10.91-11.15 7.23 13.42-10.32 11.22-7.82-13.49z'/><circle id='drl-s-circle6' r='10.35' fill='url(#c2l)' stroke='#000' transform='translate(617.18 419.99)'/><circle id='drl-s-circle7' r='10.35' fill='url(#c2l)' stroke='#000' transform='translate(566.95 413.35)'/><circle id='drl-s-circle8' r='10.35' fill='url(#c2l)' stroke='#000' transform='translate(547.82 404.4)'/><circle id='drl-s-circle9' r='10.35' fill='url(#c2l)' stroke='#000' transform='translate(530.68 393.74)'/><circle id='drl-s-circle10' r='10.35' fill='url(#c2l)' stroke='#000' transform='translate(516.82 379.28)'/><circle id='drl-s-circle11' r='10.35' fill='url(#c2l)' stroke='#000' transform='translate(637.88 419.51)'/><circle id='drl-s-circle12' r='10.35' fill='url(#c2l)' stroke='#000' transform='translate(658.59 416.4)'/><circle id='drl-s-circle13' r='10.35' fill='url(#c2l)' stroke='#000' transform='translate(677.99 413.35)'/><circle id='drl-s-circle14' r='10.35' fill='url(#c2l)' stroke='#000' transform='translate(696.66 408.35)'/></g></g>";
  string internal constant C_TUBE_ROCK_TOP = "<g id='drl-u-c-tube-rock' transform='translate(-155 -189)'><g id='drl-s-g29'><path id='drl-s-path164' fill='#fb6364' stroke='#000' stroke-miterlimit='10' d='M642.49 635.66c0 5.53-8.55 10-19.09 10s-19.09-4.48-19.09-10V195.8c0-5.53 8.55-10 19.09-10s19.09 4.48 19.09 10v439.85Z'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#drl-s-path59' id='drl-s-path165' stroke-miterlimit='10'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#drl-s-path60' id='drl-s-path166' stroke-miterlimit='10'/><path id='drl-s-path167' fill='#fff' stroke='#000' stroke-miterlimit='10' d='m633.47 421.82-19.64 12.8c-3.99 2.6-7.26 6.63-9.53 11.51v48.54c2.27-4.89 5.53-8.94 9.53-11.55l19.64-12.8c3.99-2.93 6.96-6.4 9.02-10.35v-48.5c-2.06 3.95-5.03 7.42-9.02 10.35Z'/><path id='drl-s-path168' fill='#fff' stroke='#000' stroke-miterlimit='10' d='m633.47 527.26-19.64 12.8c-3.99 2.6-7.26 6.63-9.53 11.51v48.53c2.27-4.89 5.53-8.94 9.53-11.55l19.64-12.8c3.99-2.93 6.96-6.4 9.02-10.35v-48.5c-2.06 3.95-5.03 7.42-9.02 10.35Z'/></g><path id='drl-s-line6' fill='none' stroke='#fff' stroke-linecap='round' stroke-miterlimit='10' stroke-width='3' d='M611.81 192.09v444.04'/></g>";
  string internal constant C_TUBE_I = "";
  string internal constant C_HOLE_A_WRINKLE = "<g id='drl-u-hole-wrinkles' transform='translate(-622.5526 -720.255)'><path id='drl-s-path1' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M553.96 725.56c-.71-5.08-.44-10.25.83-15.3 2.12-8.4 7.99-20.35 23.88-29.54 8.44-4.88 18.68-8.21 29.67-9.73'/><path id='drl-s-path2' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M691.53 720.68c-.18 7.05-2.25 14.02-6.11 20.32-4.12 6.73-10.07 12.47-17.69 17.07-.62.4-1.18.74-1.79 1.08-9.47 5.31-21.13 8.73-33.53 9.91-3.07.29-6.19.45-9.33.46'/><path id='drl-s-path3' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M683.56 711.62c2.2 8.7.74 17.84-4.09 25.73-3.54 5.79-8.73 10.77-15.42 14.79-.52.34-1 .63-1.5.91-10.8 6.06-24.83 9.43-39.48 9.48-2.37 0-4.72-.07-7.05-.23'/><path id='drl-s-path4' fill='none' stroke='#1d1d1b' stroke-width='.5' d='M565.8 738.11c-4.95-8.05-6.46-17.33-4.24-26.13 1.79-7.1 6.82-17.24 20.6-25.21 10.74-6.21 24.78-9.67 39.52-9.72'/></g>";


  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 13015) {
      return C_DRILL_HEADDRESS;
    } else if (assetID == 13016) {
      return C_TUBE_ROCK_TOP;
    } else if (assetID == 13017) {
      return C_TUBE_I;
    } else if (assetID == 13018) {
      return C_HOLE_A_WRINKLE;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 13015) {
      return 1;
    } else if (assetID == 13016) {
      return 3;
    } else if (assetID == 13017) {
      return 3;
    } else if (assetID == 13018) {
      return 3;
    } else {
      return 0;
    }
  }
}