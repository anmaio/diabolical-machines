// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AltarImp2 {
  string internal constant C_HEAD_B = "<g id='ap-u-c-orb-base-c-head-b-r'><path id='ap-s-path1942' fill='url(#ap-s-path1942-fill)' stroke='#1d1d1b' d='M780.1 780.91c37.96 0 68.74 16.13 68.74 36.02s-30.78 36.02-68.74 36.02-68.74-16.13-68.74-36.02 30.78-36.02 68.74-36.02'/><path id='ap-s-path1943' fill='url(#ap-s-path1943-fill)' stroke='#1d1d1b' d='M780.1 772.53c37.96 0 68.74 16.13 68.74 36.02s-30.78 36.02-68.74 36.02-68.74-16.13-68.74-36.02 30.78-36.02 68.74-36.02'/><path id='ap-s-path1944' fill='url(#ap-s-path1944-fill)' stroke='#1d1d1b' d='M780.1 764.15c37.96 0 68.74 16.13 68.74 36.02s-30.78 36.02-68.74 36.02-68.74-16.13-68.74-36.02 30.78-36.02 68.74-36.02'/><path id='ap-s-path1945' fill='url(#ap-s-path1945-fill)' stroke='#1d1d1b' d='M780.1 755.77c37.96 0 68.74 16.13 68.74 36.02s-30.78 36.02-68.74 36.02-68.74-16.13-68.74-36.02 30.78-36.02 68.74-36.02'/><path id='ap-s-path1946' fill='url(#ap-s-path1946-fill)' stroke='#1d1d1b' d='M780.1 747.39c37.96 0 68.74 16.13 68.74 36.02s-30.78 36.02-68.74 36.02-68.74-16.13-68.74-36.02 30.78-36.02 68.74-36.02'/><path id='ap-s-path1947' fill='url(#ap-s-path1947-fill)' stroke='#1d1d1b' d='M780.1 739.01c37.96 0 68.74 16.13 68.74 36.02s-30.78 36.02-68.74 36.02-68.74-16.13-68.74-36.02 30.78-36.02 68.74-36.02'/><g id='ap-u-c-dome-2'><path id='ap-s-path1948' fill='url(#ap-s-path1948-fill)' stroke='#1d1d1b' d='M887.76 639.37H669.17v58.87h-.07s.02.62.1 1.78c.04 1.04.13 2.08.27 3.11 2.13 20.58 16.3 99.08 108.54 99.18 101.31.12 109.72-77.47 109.72-102.43.01-.34.02-.68.02-1.02v-59.49Z'/><path id='ap-s-path1949' fill='url(#c1b)' stroke='#171d35' d='M778.47 582.1c60.36 0 109.29 25.64 109.29 57.27s-48.93 57.27-109.29 57.27S669.18 671 669.18 639.37s48.93-57.27 109.29-57.27'/><path id='ap-s-path1950' fill='url(#ap-s-path1950-fill)' stroke='#1d1d1b' d='M778.47 593.1c-27.45 0-53.08 5.51-72.18 15.52-16.6 8.7-26.12 19.9-26.12 30.75s9.52 22.05 26.12 30.75c19.1 10.01 44.73 15.52 72.18 15.52s53.08-5.51 72.18-15.52c16.6-8.7 26.12-19.9 26.12-30.75s-9.52-22.05-26.12-30.75c-19.1-10.01-44.73-15.52-72.18-15.52Z'/><ellipse id='ap-s-ellipse378' fill='url(#c5l)' opacity='.3' rx='30.07' ry='16.45' style='mix-blend-mode:color-burn' transform='translate(778.52 635.77)'/><path id='ap-s-path1951' fill='none' stroke='#ffffff' stroke-width='3' d='M778.47 702c-30.05 0-58.38-6.17-79.77-17.39-11.85-6.21-20.89-13.6-26.8-21.75'/></g><g id='ap-u-detail-14'><path id='ap-s-path1952' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M836.35 668.76c-1.08 0-2.09.22-2.85.61-.65.34-1.03.79-1.03 1.21s.38.87 1.03 1.21c.75.39 1.76.61 2.85.61 1.08 0 2.09-.22 2.85-.61.65-.34 1.03-.79 1.03-1.21s-.38-.87-1.03-1.21c-.75-.39-1.76-.61-2.85-.61Z'/><path id='ap-s-path1953' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M867.14 633.47c-1.08 0-2.09.22-2.85.61-.65.34-1.03.79-1.03 1.21s.38.87 1.03 1.21c.75.39 1.76.61 2.85.61 1.08 0 2.09-.22 2.85-.61.65-.34 1.03-.79 1.03-1.21s-.38-.87-1.03-1.21c-.75-.39-1.76-.61-2.85-.61Z'/><path id='ap-s-path1954' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M831.38 604.09c-1.08 0-2.09.22-2.85.61-.65.34-1.03.79-1.03 1.21s.38.87 1.03 1.21c.75.39 1.76.61 2.85.61 1.08 0 2.09-.22 2.85-.61.65-.34 1.03-.79 1.03-1.21s-.38-.87-1.03-1.21c-.75-.39-1.76-.61-2.85-.61Z'/><path id='ap-s-path1955' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M724.57 604.09c-1.08 0-2.09.22-2.85.61-.65.34-1.03.79-1.03 1.21s.38.87 1.03 1.21c.75.39 1.76.61 2.85.61 1.08 0 2.09-.22 2.85-.61.65-.34 1.03-.79 1.03-1.21s-.38-.87-1.03-1.21c-.75-.39-1.76-.61-2.85-.61Z'/><path id='ap-s-path1956' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M687.88 641.91c-1.08 0-2.09.22-2.85.61-.65.34-1.03.79-1.03 1.21s.38.87 1.03 1.21c.75.39 1.76.61 2.85.61 1.08 0 2.09-.22 2.85-.61.65-.34 1.03-.79 1.03-1.21s-.38-.87-1.03-1.21c-.75-.39-1.76-.61-2.85-.61Z'/><path id='ap-s-path1957' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M724.1 669.32c-1.08 0-2.09.22-2.85.61-.65.34-1.03.79-1.03 1.21s.38.87 1.03 1.21c.75.39 1.76.61 2.85.61 1.08 0 2.09-.22 2.85-.61.65-.34 1.03-.79 1.03-1.21s-.38-.87-1.03-1.21c-.75-.39-1.76-.61-2.85-.61Z'/><path id='ap-s-path1958' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M778.44 679.62c-1.08 0-2.09.22-2.85.61-.65.34-1.03.79-1.03 1.21s.38.87 1.03 1.21c.75.39 1.76.61 2.85.61 1.08 0 2.09-.22 2.85-.61.65-.34 1.03-.79 1.03-1.21s-.38-.87-1.03-1.21c-.75-.39-1.76-.61-2.85-.61Z'/><path id='ap-s-path1959' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M778.77 595.8c-1.08 0-2.09.22-2.85.61-.65.34-1.03.79-1.03 1.21s.38.87 1.03 1.21c.75.39 1.76.61 2.85.61 1.08 0 2.09-.22 2.85-.61.65-.34 1.03-.79 1.03-1.21s-.38-.87-1.03-1.21c-.75-.39-1.76-.61-2.85-.61Z'/></g></g>";
  string internal constant C_HEAD_C = "<g id='ap-u-c-orb-base-c-head-c-r'><path id='ap-s-path1960' fill='url(#ap-s-path1960-fill)' stroke='#1d1d1b' d='M889.16 707.58v97.52c0 31.63-48.93 57.27-109.3 57.27-60.36 0-109.29-25.64-109.29-57.27v-97.52'/><path id='ap-s-path1961' fill='url(#c1b)' stroke='#171d35' d='M779.86 650.31c60.36 0 109.29 25.64 109.29 57.27s-48.93 57.27-109.29 57.27-109.29-25.64-109.29-57.27 48.93-57.27 109.29-57.27'/><path id='ap-s-path1962' fill='none' stroke='#ffffff' stroke-width='3' d='M779.86 770.21c-30.05 0-58.38-6.17-79.77-17.39-11.85-6.21-20.89-13.6-26.8-21.75'/><g id='ap-u-c-cylinder-4'><path id='ap-s-path1963' fill='url(#ap-s-path1963-fill)' stroke='#1d1d1b' d='M879.63 689.2v13.01c0 28.82-44.59 52.19-99.6 52.19s-99.6-23.37-99.6-52.19V689.2'/><path id='ap-s-path1964' fill='url(#c1b)' stroke='#171d35' d='M780.02 637.01c55.01 0 99.6 23.37 99.6 52.19s-44.59 52.19-99.6 52.19-99.6-23.37-99.6-52.19 44.59-52.19 99.6-52.19'/></g><g id='ap-u-c-cylinder-5'><path id='ap-s-path1965' fill='url(#ap-s-path1965-fill)' stroke='#1d1d1b' d='M870.38 673.4v11.82c0 26.18-40.51 47.41-90.48 47.41s-90.48-21.23-90.48-47.41V673.4'/><path id='ap-s-path1966' fill='url(#c1b)' stroke='#171d35' d='M779.91 625.99c49.97 0 90.48 21.23 90.48 47.41s-40.51 47.41-90.48 47.41-90.48-21.23-90.48-47.41 40.51-47.41 90.48-47.41'/><path id='ap-s-path1967' fill='url(#ap-s-path1967-fill)' stroke='#1d1d1b' d='M779.91 711.8c22.74 0 43.97-4.57 59.8-12.86 13.78-7.22 21.68-16.53 21.68-25.55s-7.9-18.33-21.68-25.55c-15.82-8.29-37.06-12.86-59.8-12.86s-43.98 4.57-59.8 12.86c-13.78 7.22-21.68 16.53-21.68 25.55s7.9 18.33 21.68 25.55c15.82 8.29 37.06 12.86 59.8 12.86'/></g><g id='ap-u-detail-132'><path id='ap-s-path1968' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M826.88 696.73c-.85 0-1.65.17-2.24.48-.51.27-.81.62-.81.95s.3.68.81.95c.59.31 1.39.48 2.24.48s1.65-.17 2.24-.48c.51-.27.81-.62.81-.95s-.3-.68-.81-.95c-.59-.31-1.39-.48-2.24-.48Z'/><path id='ap-s-path1969' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M851.09 668.97c-.85 0-1.65.17-2.24.48-.51.27-.81.62-.81.95s.3.68.81.95c.59.31 1.39.48 2.24.48s1.65-.17 2.24-.48c.51-.27.81-.62.81-.95s-.3-.68-.81-.95c-.59-.31-1.39-.48-2.24-.48Z'/><path id='ap-s-path1970' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M822.97 645.87c-.85 0-1.65.17-2.24.48-.51.27-.81.62-.81.95s.3.68.81.95c.59.31 1.39.48 2.24.48s1.65-.17 2.24-.48c.51-.27.81-.62.81-.95s-.3-.68-.81-.95c-.59-.31-1.39-.48-2.24-.48Z'/><path id='ap-s-path1971' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M738.96 645.87c-.85 0-1.65.17-2.24.48-.51.27-.81.62-.81.95s.3.68.81.95c.59.31 1.39.48 2.24.48s1.65-.17 2.24-.48c.51-.27.81-.62.81-.95s-.3-.68-.81-.95c-.59-.31-1.39-.48-2.24-.48Z'/><path id='ap-s-path1972' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M710.1 675.62c-.85 0-1.65.17-2.24.48-.51.27-.81.62-.81.95s.3.68.81.95c.59.31 1.39.48 2.24.48s1.65-.17 2.24-.48c.51-.27.81-.62.81-.95s-.3-.68-.81-.95c-.59-.31-1.39-.48-2.24-.48Z'/><path id='ap-s-path1973' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M738.59 697.17c-.85 0-1.65.17-2.24.48-.51.27-.81.62-.81.95s.3.68.81.95c.59.31 1.39.48 2.24.48s1.65-.17 2.24-.48c.51-.27.81-.62.81-.95s-.3-.68-.81-.95c-.59-.31-1.39-.48-2.24-.48Z'/><path id='ap-s-path1974' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M781.33 705.27c-.85 0-1.65.17-2.24.48-.51.27-.81.62-.81.95s.3.68.81.95c.59.31 1.39.48 2.24.48s1.65-.17 2.24-.48c.51-.27.81-.62.81-.95s-.3-.68-.81-.95c-.59-.31-1.39-.48-2.24-.48Z'/><path id='ap-s-path1975' fill='url(#c1b)' stroke='#171d35' stroke-width='.5' d='M781.59 639.34c-.85 0-1.65.17-2.24.48-.51.27-.81.62-.81.95s.3.68.81.95c.59.31 1.39.48 2.24.48s1.65-.17 2.24-.48c.51-.27.81-.62.81-.95s-.3-.68-.81-.95c-.59-.31-1.39-.48-2.24-.48Z'/></g></g>";

  string internal constant DETAIL = "<g id='ap-u-m-frame-c-2' transform='translate(-.285 -.36)'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-u-shadow8' id='ap-u-shadow-25' opacity='.3' style='mix-blend-mode:multiply'/><path id='ap-s-polygon223' fill='url(#c0l)' stroke='#000000' d='M840.11 266.79 580.28 116.81l-7.85 4.5 259.84 149.98v.02l7.84-4.52z'/><path id='ap-s-polygon224' fill='url(#c0l)' stroke='#171d35' d='M840.12 266.79h-.01l-7.84 4.52.02 275.84v9.02l7.85-4.49-.02-284.89z'/><path id='ap-s-polygon225' fill='url(#c0l)' stroke='#000000' d='M832.27 271.31v-.02L580.28 125.84l-7.85-4.53.07 284.95 259.79 149.92v-.01l-.02-284.86z'/><path id='ap-s-polygon226' fill='url(#c1b)' stroke='#171d35' d='m580.5 401.64-.06-266.47 243.83 140.74.02 266.41L580.5 401.64z'/><path id='ap-s-polygon227' fill='url(#c1b)' stroke='#000000' d='m588.5 397.02-.06-248 227.83 131.51.02 247.94L588.5 397.02z'/><path id='ap-s-polygon228' fill='url(#c4d)' stroke='#000000' d='m596.5 392.4-.06-229.52 211.83 122.27.01 229.47L596.5 392.4z'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-line199' id='ap-s-line201' stroke-width='3'/></g>";

  string internal constant C_FRAME_C = "<g id='ap-u-c-frame-c'><g id='ap-u-c-frame-c-2'><g id='ap-s-g355' opacity='.3' style='mix-blend-mode:multiply'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1716' id='ap-s-path1722'/></g><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1717' id='ap-s-path1723'/><g id='ap-u-layer_68'><path id='ap-s-path1724' fill='url(#c4d)' stroke='#000000' d='M703.2 195.32c-71.6-41.34-130.04-8.04-130.28 74.23-.23 82.28 57.83 182.84 129.43 224.18s130.03 8.03 130.27-74.24c.23-82.27-57.83-182.83-129.42-224.17Z'/></g></g><g id='ap-u-detail-6'><path id='ap-s-path1725' fill='url(#c0l)' stroke='#000000' d='M703.2 195.32c-71.6-41.34-130.04-8.04-130.28 74.23-.23 82.28 57.83 182.84 129.43 224.18s130.03 8.03 130.27-74.24c.23-82.27-57.83-182.83-129.42-224.17Zm57.3 311.17c-17.28 0-36-5.75-55.64-17.09-70.22-40.54-127.16-139.16-126.93-219.84.15-53.67 25.87-87.01 67.12-87.01 17.29 0 36.01 5.75 55.65 17.09 70.21 40.54 127.15 139.15 126.92 219.82-.15 53.67-25.87 87.02-67.12 87.02Z'/><path id='ap-s-path1726' fill='url(#c1b)' stroke='#171d35' d='M700.7 199.65c-19.64-11.34-38.37-17.09-55.65-17.09-41.25 0-66.97 33.34-67.12 87.01-.23 80.68 56.71 179.3 126.93 219.84 19.64 11.34 38.36 17.09 55.64 17.09 41.25 0 66.97-33.34 67.12-87.02.23-80.67-56.71-179.29-126.92-219.82Zm59.8 301.84c-16.39 0-34.27-5.52-53.14-16.42-68.83-39.74-124.65-136.41-124.43-215.49.07-25.22 5.99-46.17 17.11-60.59 10.82-14.02 26.38-21.43 45.02-21.43 16.4 0 34.28 5.52 53.15 16.42 68.83 39.74 124.65 136.4 124.42 215.48-.07 25.23-5.99 46.18-17.11 60.6-10.82 14.02-26.38 21.43-45.02 21.43Z'/><path id='ap-s-path1727' fill='url(#c1b)' stroke='#000000' d='M698.2 203.98c-18.87-10.9-36.75-16.42-53.15-16.42-18.63 0-34.2 7.41-45.02 21.43-11.12 14.41-17.04 35.37-17.11 60.59-.22 79.08 55.59 175.75 124.43 215.49 18.87 10.89 36.75 16.42 53.14 16.42 18.63 0 34.2-7.41 45.02-21.43 11.12-14.42 17.04-35.37 17.11-60.6.22-79.08-55.59-175.74-124.42-215.48ZM801.55 477c-9.83 12.75-24.03 19.49-41.06 19.49-15.51 0-32.54-5.3-50.64-15.75C642.4 441.8 587.7 347.08 587.92 269.59c.07-24.11 5.62-44.01 16.07-57.55 9.83-12.75 24.03-19.49 41.06-19.49 15.51 0 32.55 5.3 50.65 15.75 67.45 38.94 122.14 133.66 121.92 211.14-.07 24.11-5.62 44.02-16.07 57.56Z'/></g></g>";
  string internal constant C_STEPS = "<g id='ap-u-steps'><path id='ap-s-polygon274' fill='url(#c0l)' stroke='#171d35' d='m581.65 639.05-14.09-8.19-14.2-8.25-14.2-8.25-14.22-8.27-14.5-8.43-41.73-24.24-18.39 10.62 41.76 24.26 14.5 8.43 14.23 8.27 14.19 8.25 14.2 8.25 14.09 8.19 42.08 24.45 18.4-10.62-42.12-24.47z'/><path id='ap-s-polygon275' fill='url(#c0l)' stroke='#000000' d='m605.37 674.14-42.04-24.43-14.09-8.18-14.19-8.26-14.24-8.27-14.23-8.27-14.5-8.43-41.76-24.26.1 36.66 41.66 24.21 14.5 8.43 14.23 8.27 14.24 8.27 14.19 8.25 14.09 8.19 42.15 24.49-.11-36.67z'/><path id='ap-s-polygon276' fill='url(#c0l)' stroke='#171d35' d='m563.34 686.33-14.09-8.19-14.2-8.25-14.19-8.25-14.23-8.27-14.5-8.42-41.73-24.25-18.39 10.62 41.76 24.27 14.5 8.43 14.23 8.26 14.2 8.25 14.19 8.25 14.09 8.19 42.08 24.46 18.4-10.62-42.12-24.48z'/><path id='ap-s-polygon277' fill='url(#c0l)' stroke='#000000' d='m587.06 721.43-42.04-24.44-14.08-8.18-14.2-8.25-14.24-8.27-14.23-8.28-14.5-8.42-41.76-24.27.1 36.67 41.66 24.2 14.5 8.43 14.23 8.27 14.24 8.27 14.2 8.26 14.08 8.18 42.15 24.49-.11-36.66z'/><path id='ap-s-polygon278' fill='url(#c0l)' stroke='#171d35' d='m545.06 733.59-14.09-8.19-14.19-8.25-14.2-8.25-14.23-8.26-14.5-8.43-41.73-24.25-18.39 10.62 41.76 24.27 14.5 8.43 14.23 8.26 14.2 8.25 14.19 8.26 14.1 8.18 42.08 24.46 18.39-10.62-42.12-24.48z'/><path id='ap-s-polygon279' fill='url(#c0l)' stroke='#000000' d='m568.79 768.69-42.05-24.43-14.08-8.19-14.2-8.25-14.24-8.27-14.23-8.28-14.5-8.42-41.76-24.27.1 36.67 41.66 24.21 14.5 8.42 14.23 8.27 14.24 8.28 14.2 8.25 14.08 8.18 42.15 24.5-.1-36.67z'/><path id='ap-s-polygon280' fill='url(#c0l)' stroke='#171d35' d='m526.8 780.93-14.09-8.19-14.2-8.25-14.2-8.25-14.22-8.27-14.51-8.43-41.72-24.25-18.39 10.62 41.76 24.27 14.5 8.43 14.22 8.27 14.2 8.25 14.2 8.25 14.09 8.19 42.08 24.45 18.39-10.62-42.11-24.47z'/><path id='ap-s-polygon281' fill='url(#c0l)' stroke='#000000' d='m550.52 816.02-42.04-24.43-14.09-8.19-14.19-8.25-14.24-8.27-14.24-8.27-14.49-8.43-41.76-24.27.1 36.67 41.66 24.21 14.49 8.42 14.24 8.28 14.24 8.27 14.19 8.25 14.09 8.19 42.14 24.49-.1-36.67z'/><path id='ap-s-polygon282' fill='url(#c0l)' stroke='#000000' d='m623.77 663.52.1 36.67.1 36.66.11 36.66.1 36.66-18.39 10.62-18.4 10.62-18.4 10.63-18.39 10.62-.11-36.67 18.4-10.61-.1-36.67 18.4-10.62-.11-36.66 18.4-10.62-.11-36.67 18.4-10.62z'/></g>";
  

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 7009) {
      return C_HEAD_B;
    } else if (assetID == 7010) {
      return C_HEAD_C;
    } else if (assetID == 7011) {
      return DETAIL;
    } else if (assetID == 7012) {
      return C_FRAME_C;
    } else if (assetID == 7013) {
      return C_STEPS;
    } else {
      return "";
    }
  }
}