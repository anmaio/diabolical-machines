// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AssetsImp3 {

  string internal constant C_BOOKS = "<g transform='translate(-312,0)'><g id='g-u-books'><path id='g-u-shadow-3' fill='#1d1d1b' d='M485.77 576.43 529.84 602.43 475.89 632.1 432.74 607.03 485.77 576.43z' opacity='0.3' style='mix-blend-mode:multiply'/><g id='g-u-c-book-a'><path id='g-u-polygon-c5b-s1' fill='var(--c5b)' stroke='#1d1d1b' stroke-linejoin='round' stroke-width='0.5' d='M471.73 575.57 515.8 601.01 461.85 631.24 418.7 606.17 471.73 575.57z'/><path id='g-u-polygon-c5b-s12' fill='var(--c5b)' stroke='#1d1d1b' stroke-linejoin='round' stroke-width='0.5' d='M515.8 601.01 515.8 609.92 461.85 640.16 461.85 631.24 515.8 601.01z'/><path id='g-s-polygon15' fill='#fff' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='0.5' d='M419.65 607.66 419.65 614.96 461.05 638.94 461.05 631.24 419.65 607.66z'/><path id='g-u-polygon-c5b-s13' fill='var(--c5b)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='0.5' d='M418.7 607.75 418.7 606.17 461.85 631.24 461.85 640.16 418.7 615.09 418.7 613.77 460.87 638.3 460.87 631.74 418.7 607.75z'/><g id='g-s-g9' style='isolation:isolate'><g id='g-s-g10' clip-path='url(#g-u-clippath-1)'><g id='g-s-g11'><path id='g-s-polyline1' fill='#f9d264' d='M491.7 615.73 487.5 621.42 491.72 622.57 495.95 616.54 491.7 615.73'/><path id='g-s-polyline2' fill='#f9d264' d='M498.02 612.09 497.39 612.45 497.41 619.28 498.03 618.92 498.02 612.09'/><path id='g-s-polyline3' fill='#f9d264' d='M486.04 619 485.41 619.36 485.43 626.2 486.06 625.84 486.04 619'/></g><clipPath id='g-u-clippath-1'><path id='g-s-polygon16' fill='none' d='M485.43 626.2 485.41 619.36 498.02 612.09 498.03 618.92 485.43 626.2z'/></clipPath></g></g></g><g id='g-u-c-book-b'><g id='g-s-g12' transform='translate(.000001 0)'><path id='g-u-polygon-c3l-s12' fill='var(--c3l)' stroke='#1d1d1b' stroke-linejoin='round' stroke-width='0.5' d='M472.96 569.68 512.23 592.34 464.16 619.28 425.72 596.94 472.96 569.68z'/><path id='g-u-polygon-c3l-s13' fill='var(--c3l)' stroke='#1d1d1b' stroke-linejoin='round' stroke-width='0.5' d='M512.23 592.34 512.23 600.29 464.16 627.23 464.16 619.28 512.23 592.34z'/><path id='g-s-polygon17' fill='#fff' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='0.5' d='M426.56 598.27 426.56 604.77 463.45 626.14 463.45 619.28 426.56 598.27z'/><path id='g-u-polygon-c3l-s14' fill='var(--c3l)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='0.5' d='M425.72 598.35 425.72 596.94 464.16 619.28 464.16 627.23 425.72 604.89 425.72 603.72 463.29 625.57 463.29 619.72 425.72 598.35z'/></g><g id='g-u-group-c3-s1' style='isolation:isolate'><path id='g-s-polyline4' fill='var(--c3b)' d='M490.31 606.49 487.33 608.22 487.34 613.07 490.33 611.34 490.31 606.49'/><path id='g-s-polyline5' fill='var(--c3b)' d='M491.91 605.57 491.23 605.96 491.24 610.81 491.92 610.42 491.91 605.57'/><path id='g-s-polyline6' fill='var(--c3b)' d='M510.32 595.19 509.65 595.58 509.66 600.43 510.34 600.04 510.32 595.19'/><path id='g-s-polyline7' fill='var(--c3b)' d='M466.41 619.68 465.73 620.07 465.75 624.92 466.43 624.53 466.41 619.68'/><path id='g-s-polyline8' fill='var(--c3b)' d='M486.4 608.75 485.73 609.14 485.74 613.99 486.42 613.6 486.4 608.75'/></g></g><g id='g-u-c-book-c'><path id='g-s-polygon18' fill='#fff' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='0.5' d='M468.15 569.68 507.42 592.34 459.34 619.28 420.9 596.94 468.15 569.68z'/><path id='g-u-polygon-c4l-s1' fill='var(--c4l)' stroke='#1d1d1b' stroke-linejoin='round' stroke-width='0.5' d='M468.15 561.74 507.42 584.4 459.34 611.34 420.9 589 468.15 561.74z'/><path id='g-u-polygon-c4l-s12' fill='var(--c4l)' stroke='#1d1d1b' stroke-linejoin='round' stroke-width='0.5' d='M507.42 584.4 507.42 592.34 459.34 619.28 459.34 611.34 507.42 584.4z'/><path id='g-s-polygon19' fill='#fff' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='0.5' d='M421.75 590.33 421.75 596.83 458.64 618.2 458.64 611.34 421.75 590.33z'/><path id='g-u-polygon-c4b-s1' fill='var(--c4b)' stroke='#1d1d1b' stroke-miterlimit='10' stroke-width='0.5' d='M420.9 590.41 420.9 589 459.34 611.34 459.34 619.28 420.9 596.94 420.9 595.77 458.47 617.63 458.47 611.78 420.9 590.41z'/><g id='g-u-group-c4-s1' style='isolation:isolate'><path id='g-s-polyline9' fill='var(--c4b)' d='M479.09 577.22 460.42 578.86 457.65 589.68 475.61 587.63 479.09 577.22'/><path id='g-s-polyline10' fill='var(--c4b)' d='M451.18 583.3 442.48 584.06 441.18 589.11 449.56 588.15 451.18 583.3'/><path id='g-s-polyline11' fill='var(--c4b)' d='M468.31 593.19 459.61 593.95 458.31 599 466.69 598.04 468.31 593.19'/></g><path id='g-u-polygon-c4b-s12' fill='var(--c4b)' d='M476.84 606.45 476.83 604.27 491.92 595.56 491.92 597.74 476.84 606.45z'/></g></g></g>";

  string internal constant C_FLYING_DUCKSL = "<g transform='translate(0,-360)'><g id='g-u-c-flying-ducksl'><g id='g-s-g27' transform='translate(-77.999999-50)'><g id='g-u-duck' transform='translate(.000001 0)'><path id='g-u-path-c4l-s1' fill='var(--c4l)' d='M410.15,577.22l.53,3.37-.4-.26c-.75-.48-1.68-.93-1.98-.87-.21,1.01-.79,10.68,1.55,15.59c1.77,3.7,5.35,6.6,7.49,8.32.82.67,1.42,1.15,1.68,1.48.97,1.21,1.48,4.9,1.5,5.05l.03.21-.19.12c-5.52,3.61-11.8,15.36-11.86,15.47l-.05.07c-.85,1.02-3.01,3.86-2.82,4.77.24,1.16,6.29-1.76,17.37-7.56.55-.29,1.09-.58,1.62-.89c5.54-3.2,9.91-7.33,13.01-12.32-.83-.28-2.82-1.39-2.8-5.5c0-2.06.51-4.88,1.92-8.72c0,0,.01-.02.03-.03c0,0,.01,0,.02-.01v0c.59-.34,6.57-1.38,8.71-2.43c0-.25.21-5.02,5.99-11.52c3.55-4,3.57-5.66,3.63-9.3v-.07c.05-3.25-.26-9.51-.33-10.85-1.95,2.02-6.25,9.98-6.29,10.06l-.07.1c-6.68,6.93-11.31,17.32-12.84,20.74-.51,1.14-.57,1.27-.7,1.34c0,0-.01,0-.02,0l-.1.05-.05-.08c-.06-.07-.76-.57-1.63-1.21-2.67-1.93-7.63-5.53-9.95-7.86-3.3-3.31-7.44-5.29-8.82-5.68-1.2-.34-3.3-1.24-4.16-1.61'/><path id='g-u-path-c1b-s19' fill='var(--c1b)' d='M465.16,582.87c.04.28.11.81.11,1.45c0,.93-.13,2.1-.66,3.09c2.94-1.7,6.16-3.81,6.5-4.39-.25-.38-3.17-.38-5.96-.15'/><path id='g-u-path-c1l-s12' fill='var(--c1l)' d='M436.79,595.52c0,0-.01,0-.02.01-.02.01-.03.02-.03.03-1.41,3.85-1.91,6.66-1.92,8.72-.01,4.11,1.97,5.22,2.8,5.5c0-.01.02-.03.02-.04.64-1.02,1.11-1.91,1.5-2.62.27-.5.48-.89.66-1.18c1.39-2.19,6.68-6.78,8.65-8.33.27-.22.61-.45.99-.7c0,0,0,0,.01,0-.02-2.57-.95-4.01-1.57-4.68-.05.02-.09.05-.14.07-.79.39-1.44.64-1.8.78-.14.06-.24.09-.27.11l-.18.1v-.21c0,0,0,0,0,0-2.15,1.05-8.12,2.08-8.71,2.43'/><path id='g-u-path-c4l-s12' fill='var(--c4l)' d='M460.59,585.76c-.54.31-.98.1-.98-.47s.43-1.29.97-1.6.97-.1.97.47-.43,1.29-.97,1.59m-1.35-3.09c-1.36.79-2.35,1.86-3.55,3.16-1.38,1.49-3.08,3.34-5.93,5.3-.16.11-.32.22-.48.32c1.02.92,1.19,3.49,1.21,4.84v0c0,0,.21-.12.21-.12c1.75-1,3.88-2.04,5.75-2.95.64-.31,1.24-.6,1.77-.87.19-.09.38-.2.58-.31c2.6-1.5,5.53-4.43,5.57-4.46l.06-.05c.06-.03.12-.07.18-.1.52-1,.66-2.16.66-3.09c0-.64-.06-1.17-.11-1.45-.04,0-.07,0-.11,0h-.06c0,0-.03-.05-.03-.05c0-.01-.66-1.31-2.62-1.19-.65.04-1.36.23-2.14.56-.34.14-.66.3-.96.48'/><path id='g-s-path375' fill='#fff' d='M447.9,592.24c.61.67,1.55,2.11,1.57,4.68.31-.2.66-.41,1.03-.63-.01-1.35-.18-3.92-1.21-4.84-.05.03-.09.06-.14.09-.14.08-.27.16-.41.24-.27.16-.55.31-.84.45'/><path id='g-s-path376' d='M460.58,583.69c-.54.31-.98,1.03-.97,1.6s.44.78.98.47.97-1.02.97-1.59-.44-.78-.97-.47'/><path id='g-s-path377' d='M410.68,580.58l-.53-3.37c.86.37,2.96,1.27,4.16,1.61c1.38.39,5.52,2.37,8.82,5.68c2.32,2.33,7.29,5.93,9.95,7.86.88.64,1.58,1.14,1.63,1.21l.05.08.1-.05c0,0,.01,0,.02,0c.13-.07.19-.21.7-1.34c1.53-3.42,6.16-13.82,12.84-20.74l.07-.1c.04-.08,4.34-8.04,6.29-10.06.07,1.34.38,7.6.33,10.85v.07c-.05,3.65-.07,5.3-3.63,9.3-5.78,6.5-5.98,11.27-5.99,11.52c0,0,0,0,0,0v.21c0,0,.18-.1.18-.1.04-.02.13-.06.27-.11.36-.14,1.02-.39,1.8-.78.05-.02.09-.05.14-.07.29-.14.57-.29.84-.45.14-.08.28-.16.41-.24.05-.03.09-.06.14-.09.16-.1.32-.2.48-.32c2.85-1.96,4.55-3.81,5.93-5.3c1.19-1.3,2.18-2.37,3.55-3.16.3-.17.62-.33.96-.48.78-.33,1.49-.52,2.14-.56c1.96-.12,2.61,1.18,2.62,1.19l.03.06h.06c0,0,.07-.01.11-.02c2.78-.23,5.71-.23,5.96.15-.34.59-3.57,2.69-6.5,4.39-.06.03-.12.07-.18.1l-.06.05c0,0-2.97,2.96-5.57,4.46-.19.11-.39.22-.58.31-.53.27-1.13.56-1.77.87-1.88.91-4,1.95-5.75,2.95l-.21.12v0c-.37.21-.72.43-1.03.63c0,0,0,0-.01,0-.38.24-.71.48-.99.7-1.97,1.55-7.25,6.14-8.65,8.33-.18.29-.39.68-.66,1.18-.39.71-.87,1.59-1.5,2.62c0,.01-.02.03-.02.04-3.1,4.99-7.47,9.12-13.01,12.32-.53.3-1.07.6-1.62.89-11.08,5.8-17.13,8.72-17.37,7.56-.19-.91,1.97-3.75,2.82-4.77l.05-.07c.06-.11,6.34-11.86,11.86-15.47l.19-.12-.03-.21c-.02-.16-.54-3.84-1.5-5.05-.26-.33-.86-.81-1.68-1.48-2.14-1.73-5.72-4.62-7.49-8.32-2.34-4.91-1.76-14.58-1.55-15.59.3-.06,1.23.39,1.98.87l.4.26m-1.05-4.14l.51,3.21c-.61-.36-1.51-.81-1.88-.59h-.01c-.08.06-.15.14-.2.24-.33.67-.95,10.96,1.48,16.09c1.79,3.74,5.39,6.65,7.54,8.39.78.64,1.4,1.13,1.65,1.45.8,1.01,1.3,3.94,1.43,4.73-5.5,3.76-11.42,14.71-11.89,15.59-.44.53-3.24,3.97-2.97,5.28.27,1.29,4.24-.38,17.7-7.43.56-.29,1.1-.59,1.64-.9c5.64-3.25,10.1-7.48,13.26-12.59.65-1.05,1.14-1.95,1.53-2.67.26-.48.46-.86.63-1.12c1.24-1.93,6.18-6.33,8.48-8.14.26-.21.57-.43.94-.67.32-.21.66-.41,1.02-.63l.21-.11c1.74-1,3.86-2.03,5.72-2.94.65-.31,1.25-.61,1.78-.87.2-.1.41-.21.62-.33c2.54-1.47,5.31-4.19,5.64-4.52c1.56-.9,6.47-3.8,6.95-4.84.06-.13.08-.25.04-.34-.26-.75-5.08-.4-6.2-.31-.15-.27-.89-1.36-2.77-1.24-.68.05-1.43.24-2.24.58-.35.15-.68.31-.99.49-1.46.84-2.52,1.99-3.71,3.29-1.42,1.54-3.02,3.29-5.81,5.21-.2.14-.4.27-.59.39-.14.09-.28.17-.42.25-.3.18-.62.34-.94.5-.76.37-1.41.63-1.76.77l-.14.05c.1-.95.8-5.28,5.77-10.86c3.75-4.21,3.78-6.07,3.83-9.78v-.07c.05-3.65-.34-11.07-.35-11.14v-.24c0,0-.22.19-.22.19-1.88,1.66-6.21,9.64-6.64,10.43-6.76,7.04-11.43,17.5-12.96,20.95-.16.35-.31.69-.41.9-.19-.16-.63-.48-1.54-1.14-2.66-1.93-7.62-5.51-9.93-7.84-3.33-3.34-7.5-5.33-8.9-5.72-1.5-.43-4.48-1.76-4.51-1.78l-.38-.16'/></g><g id='g-u-duck-075' transform='matrix(.75 0 0 0.75 147.592812 79.986183)'><path id='g-u-path-c4l-s13' fill='var(--c4l)' d='M410.15,577.22l.53,3.37-.4-.26c-.75-.48-1.68-.93-1.98-.87-.21,1.01-.79,10.68,1.55,15.59c1.77,3.7,5.35,6.6,7.49,8.32.82.67,1.42,1.15,1.68,1.48.97,1.21,1.48,4.9,1.5,5.05l.03.21-.19.12c-5.52,3.61-11.8,15.36-11.86,15.47l-.05.07c-.85,1.02-3.01,3.86-2.82,4.77.24,1.16,6.29-1.76,17.37-7.56.55-.29,1.09-.58,1.62-.89c5.54-3.2,9.91-7.33,13.01-12.32-.83-.28-2.82-1.39-2.8-5.5c0-2.06.51-4.88,1.92-8.72c0,0,.01-.02.03-.03c0,0,.01,0,.02-.01v0c.59-.34,6.57-1.38,8.71-2.43c0-.25.21-5.02,5.99-11.52c3.55-4,3.57-5.66,3.63-9.3v-.07c.05-3.25-.26-9.51-.33-10.85-1.95,2.02-6.25,9.98-6.29,10.06l-.07.1c-6.68,6.93-11.31,17.32-12.84,20.74-.51,1.14-.57,1.27-.7,1.34c0,0-.01,0-.02,0l-.1.05-.05-.08c-.06-.07-.76-.57-1.63-1.21-2.67-1.93-7.63-5.53-9.95-7.86-3.3-3.31-7.44-5.29-8.82-5.68-1.2-.34-3.3-1.24-4.16-1.61'/><path id='g-u-path-c1b-s110' fill='var(--c1b)' d='M465.16,582.87c.04.28.11.81.11,1.45c0,.93-.13,2.1-.66,3.09c2.94-1.7,6.16-3.81,6.5-4.39-.25-.38-3.17-.38-5.96-.15'/><path id='g-u-path-c1l-s13' fill='var(--c1l)' d='M436.79,595.52c0,0-.01,0-.02.01-.02.01-.03.02-.03.03-1.41,3.85-1.91,6.66-1.92,8.72-.01,4.11,1.97,5.22,2.8,5.5c0-.01.02-.03.02-.04.64-1.02,1.11-1.91,1.5-2.62.27-.5.48-.89.66-1.18c1.39-2.19,6.68-6.78,8.65-8.33.27-.22.61-.45.99-.7c0,0,0,0,.01,0-.02-2.57-.95-4.01-1.57-4.68-.05.02-.09.05-.14.07-.79.39-1.44.64-1.8.78-.14.06-.24.09-.27.11l-.18.1v-.21c0,0,0,0,0,0-2.15,1.05-8.12,2.08-8.71,2.43'/><path id='g-u-path-c4l-s14' fill='var(--c4l)' d='M460.59,585.76c-.54.31-.98.1-.98-.47s.43-1.29.97-1.6.97-.1.97.47-.43,1.29-.97,1.59m-1.35-3.09c-1.36.79-2.35,1.86-3.55,3.16-1.38,1.49-3.08,3.34-5.93,5.3-.16.11-.32.22-.48.32c1.02.92,1.19,3.49,1.21,4.84v0c0,0,.21-.12.21-.12c1.75-1,3.88-2.04,5.75-2.95.64-.31,1.24-.6,1.77-.87.19-.09.38-.2.58-.31c2.6-1.5,5.53-4.43,5.57-4.46l.06-.05c.06-.03.12-.07.18-.1.52-1,.66-2.16.66-3.09c0-.64-.06-1.17-.11-1.45-.04,0-.07,0-.11,0h-.06c0,0-.03-.05-.03-.05c0-.01-.66-1.31-2.62-1.19-.65.04-1.36.23-2.14.56-.34.14-.66.3-.96.48'/><path id='g-s-path378' fill='#fff' d='M447.9,592.24c.61.67,1.55,2.11,1.57,4.68.31-.2.66-.41,1.03-.63-.01-1.35-.18-3.92-1.21-4.84-.05.03-.09.06-.14.09-.14.08-.27.16-.41.24-.27.16-.55.31-.84.45'/><path id='g-s-path379' d='M460.58,583.69c-.54.31-.98,1.03-.97,1.6s.44.78.98.47.97-1.02.97-1.59-.44-.78-.97-.47'/><path id='g-s-path380' d='M410.68,580.58l-.53-3.37c.86.37,2.96,1.27,4.16,1.61c1.38.39,5.52,2.37,8.82,5.68c2.32,2.33,7.29,5.93,9.95,7.86.88.64,1.58,1.14,1.63,1.21l.05.08.1-.05c0,0,.01,0,.02,0c.13-.07.19-.21.7-1.34c1.53-3.42,6.16-13.82,12.84-20.74l.07-.1c.04-.08,4.34-8.04,6.29-10.06.07,1.34.38,7.6.33,10.85v.07c-.05,3.65-.07,5.3-3.63,9.3-5.78,6.5-5.98,11.27-5.99,11.52c0,0,0,0,0,0v.21c0,0,.18-.1.18-.1.04-.02.13-.06.27-.11.36-.14,1.02-.39,1.8-.78.05-.02.09-.05.14-.07.29-.14.57-.29.84-.45.14-.08.28-.16.41-.24.05-.03.09-.06.14-.09.16-.1.32-.2.48-.32c2.85-1.96,4.55-3.81,5.93-5.3c1.19-1.3,2.18-2.37,3.55-3.16.3-.17.62-.33.96-.48.78-.33,1.49-.52,2.14-.56c1.96-.12,2.61,1.18,2.62,1.19l.03.06h.06c0,0,.07-.01.11-.02c2.78-.23,5.71-.23,5.96.15-.34.59-3.57,2.69-6.5,4.39-.06.03-.12.07-.18.1l-.06.05c0,0-2.97,2.96-5.57,4.46-.19.11-.39.22-.58.31-.53.27-1.13.56-1.77.87-1.88.91-4,1.95-5.75,2.95l-.21.12v0c-.37.21-.72.43-1.03.63c0,0,0,0-.01,0-.38.24-.71.48-.99.7-1.97,1.55-7.25,6.14-8.65,8.33-.18.29-.39.68-.66,1.18-.39.71-.87,1.59-1.5,2.62c0,.01-.02.03-.02.04-3.1,4.99-7.47,9.12-13.01,12.32-.53.3-1.07.6-1.62.89-11.08,5.8-17.13,8.72-17.37,7.56-.19-.91,1.97-3.75,2.82-4.77l.05-.07c.06-.11,6.34-11.86,11.86-15.47l.19-.12-.03-.21c-.02-.16-.54-3.84-1.5-5.05-.26-.33-.86-.81-1.68-1.48-2.14-1.73-5.72-4.62-7.49-8.32-2.34-4.91-1.76-14.58-1.55-15.59.3-.06,1.23.39,1.98.87l.4.26m-1.05-4.14l.51,3.21c-.61-.36-1.51-.81-1.88-.59h-.01c-.08.06-.15.14-.2.24-.33.67-.95,10.96,1.48,16.09c1.79,3.74,5.39,6.65,7.54,8.39.78.64,1.4,1.13,1.65,1.45.8,1.01,1.3,3.94,1.43,4.73-5.5,3.76-11.42,14.71-11.89,15.59-.44.53-3.24,3.97-2.97,5.28.27,1.29,4.24-.38,17.7-7.43.56-.29,1.1-.59,1.64-.9c5.64-3.25,10.1-7.48,13.26-12.59.65-1.05,1.14-1.95,1.53-2.67.26-.48.46-.86.63-1.12c1.24-1.93,6.18-6.33,8.48-8.14.26-.21.57-.43.94-.67.32-.21.66-.41,1.02-.63l.21-.11c1.74-1,3.86-2.03,5.72-2.94.65-.31,1.25-.61,1.78-.87.2-.1.41-.21.62-.33c2.54-1.47,5.31-4.19,5.64-4.52c1.56-.9,6.47-3.8,6.95-4.84.06-.13.08-.25.04-.34-.26-.75-5.08-.4-6.2-.31-.15-.27-.89-1.36-2.77-1.24-.68.05-1.43.24-2.24.58-.35.15-.68.31-.99.49-1.46.84-2.52,1.99-3.71,3.29-1.42,1.54-3.02,3.29-5.81,5.21-.2.14-.4.27-.59.39-.14.09-.28.17-.42.25-.3.18-.62.34-.94.5-.76.37-1.41.63-1.76.77l-.14.05c.1-.95.8-5.28,5.77-10.86c3.75-4.21,3.78-6.07,3.83-9.78v-.07c.05-3.65-.34-11.07-.35-11.14v-.24c0,0-.22.19-.22.19-1.88,1.66-6.21,9.64-6.64,10.43-6.76,7.04-11.43,17.5-12.96,20.95-.16.35-.31.69-.41.9-.19-.16-.63-.48-1.54-1.14-2.66-1.93-7.62-5.51-9.93-7.84-3.33-3.34-7.5-5.33-8.9-5.72-1.5-.43-4.48-1.76-4.51-1.78l-.38-.16'/></g><g id='g-u-duck-05' transform='matrix(.5 0 0 0.5 292.185624 171.972366)'><path id='g-u-path-c4l-s15' fill='var(--c4l)' d='M410.15,577.22l.53,3.37-.4-.26c-.75-.48-1.68-.93-1.98-.87-.21,1.01-.79,10.68,1.55,15.59c1.77,3.7,5.35,6.6,7.49,8.32.82.67,1.42,1.15,1.68,1.48.97,1.21,1.48,4.9,1.5,5.05l.03.21-.19.12c-5.52,3.61-11.8,15.36-11.86,15.47l-.05.07c-.85,1.02-3.01,3.86-2.82,4.77.24,1.16,6.29-1.76,17.37-7.56.55-.29,1.09-.58,1.62-.89c5.54-3.2,9.91-7.33,13.01-12.32-.83-.28-2.82-1.39-2.8-5.5c0-2.06.51-4.88,1.92-8.72c0,0,.01-.02.03-.03c0,0,.01,0,.02-.01v0c.59-.34,6.57-1.38,8.71-2.43c0-.25.21-5.02,5.99-11.52c3.55-4,3.57-5.66,3.63-9.3v-.07c.05-3.25-.26-9.51-.33-10.85-1.95,2.02-6.25,9.98-6.29,10.06l-.07.1c-6.68,6.93-11.31,17.32-12.84,20.74-.51,1.14-.57,1.27-.7,1.34c0,0-.01,0-.02,0l-.1.05-.05-.08c-.06-.07-.76-.57-1.63-1.21-2.67-1.93-7.63-5.53-9.95-7.86-3.3-3.31-7.44-5.29-8.82-5.68-1.2-.34-3.3-1.24-4.16-1.61'/><path id='g-u-path-c1b-s111' fill='var(--c1b)' d='M465.16,582.87c.04.28.11.81.11,1.45c0,.93-.13,2.1-.66,3.09c2.94-1.7,6.16-3.81,6.5-4.39-.25-.38-3.17-.38-5.96-.15'/><path id='g-u-path-c1l-s14' fill='var(--c1l)' d='M436.79,595.52c0,0-.01,0-.02.01-.02.01-.03.02-.03.03-1.41,3.85-1.91,6.66-1.92,8.72-.01,4.11,1.97,5.22,2.8,5.5c0-.01.02-.03.02-.04.64-1.02,1.11-1.91,1.5-2.62.27-.5.48-.89.66-1.18c1.39-2.19,6.68-6.78,8.65-8.33.27-.22.61-.45.99-.7c0,0,0,0,.01,0-.02-2.57-.95-4.01-1.57-4.68-.05.02-.09.05-.14.07-.79.39-1.44.64-1.8.78-.14.06-.24.09-.27.11l-.18.1v-.21c0,0,0,0,0,0-2.15,1.05-8.12,2.08-8.71,2.43'/><path id='g-u-path-c4l-s16' fill='var(--c4l)' d='M460.59,585.76c-.54.31-.98.1-.98-.47s.43-1.29.97-1.6.97-.1.97.47-.43,1.29-.97,1.59m-1.35-3.09c-1.36.79-2.35,1.86-3.55,3.16-1.38,1.49-3.08,3.34-5.93,5.3-.16.11-.32.22-.48.32c1.02.92,1.19,3.49,1.21,4.84v0c0,0,.21-.12.21-.12c1.75-1,3.88-2.04,5.75-2.95.64-.31,1.24-.6,1.77-.87.19-.09.38-.2.58-.31c2.6-1.5,5.53-4.43,5.57-4.46l.06-.05c.06-.03.12-.07.18-.1.52-1,.66-2.16.66-3.09c0-.64-.06-1.17-.11-1.45-.04,0-.07,0-.11,0h-.06c0,0-.03-.05-.03-.05c0-.01-.66-1.31-2.62-1.19-.65.04-1.36.23-2.14.56-.34.14-.66.3-.96.48'/><path id='g-s-path381' fill='#fff' d='M447.9,592.24c.61.67,1.55,2.11,1.57,4.68.31-.2.66-.41,1.03-.63-.01-1.35-.18-3.92-1.21-4.84-.05.03-.09.06-.14.09-.14.08-.27.16-.41.24-.27.16-.55.31-.84.45'/><path id='g-s-path382' d='M460.58,583.69c-.54.31-.98,1.03-.97,1.6s.44.78.98.47.97-1.02.97-1.59-.44-.78-.97-.47'/><path id='g-s-path383' d='M410.68,580.58l-.53-3.37c.86.37,2.96,1.27,4.16,1.61c1.38.39,5.52,2.37,8.82,5.68c2.32,2.33,7.29,5.93,9.95,7.86.88.64,1.58,1.14,1.63,1.21l.05.08.1-.05c0,0,.01,0,.02,0c.13-.07.19-.21.7-1.34c1.53-3.42,6.16-13.82,12.84-20.74l.07-.1c.04-.08,4.34-8.04,6.29-10.06.07,1.34.38,7.6.33,10.85v.07c-.05,3.65-.07,5.3-3.63,9.3-5.78,6.5-5.98,11.27-5.99,11.52c0,0,0,0,0,0v.21c0,0,.18-.1.18-.1.04-.02.13-.06.27-.11.36-.14,1.02-.39,1.8-.78.05-.02.09-.05.14-.07.29-.14.57-.29.84-.45.14-.08.28-.16.41-.24.05-.03.09-.06.14-.09.16-.1.32-.2.48-.32c2.85-1.96,4.55-3.81,5.93-5.3c1.19-1.3,2.18-2.37,3.55-3.16.3-.17.62-.33.96-.48.78-.33,1.49-.52,2.14-.56c1.96-.12,2.61,1.18,2.62,1.19l.03.06h.06c0,0,.07-.01.11-.02c2.78-.23,5.71-.23,5.96.15-.34.59-3.57,2.69-6.5,4.39-.06.03-.12.07-.18.1l-.06.05c0,0-2.97,2.96-5.57,4.46-.19.11-.39.22-.58.31-.53.27-1.13.56-1.77.87-1.88.91-4,1.95-5.75,2.95l-.21.12v0c-.37.21-.72.43-1.03.63c0,0,0,0-.01,0-.38.24-.71.48-.99.7-1.97,1.55-7.25,6.14-8.65,8.33-.18.29-.39.68-.66,1.18-.39.71-.87,1.59-1.5,2.62c0,.01-.02.03-.02.04-3.1,4.99-7.47,9.12-13.01,12.32-.53.3-1.07.6-1.62.89-11.08,5.8-17.13,8.72-17.37,7.56-.19-.91,1.97-3.75,2.82-4.77l.05-.07c.06-.11,6.34-11.86,11.86-15.47l.19-.12-.03-.21c-.02-.16-.54-3.84-1.5-5.05-.26-.33-.86-.81-1.68-1.48-2.14-1.73-5.72-4.62-7.49-8.32-2.34-4.91-1.76-14.58-1.55-15.59.3-.06,1.23.39,1.98.87l.4.26m-1.05-4.14l.51,3.21c-.61-.36-1.51-.81-1.88-.59h-.01c-.08.06-.15.14-.2.24-.33.67-.95,10.96,1.48,16.09c1.79,3.74,5.39,6.65,7.54,8.39.78.64,1.4,1.13,1.65,1.45.8,1.01,1.3,3.94,1.43,4.73-5.5,3.76-11.42,14.71-11.89,15.59-.44.53-3.24,3.97-2.97,5.28.27,1.29,4.24-.38,17.7-7.43.56-.29,1.1-.59,1.64-.9c5.64-3.25,10.1-7.48,13.26-12.59.65-1.05,1.14-1.95,1.53-2.67.26-.48.46-.86.63-1.12c1.24-1.93,6.18-6.33,8.48-8.14.26-.21.57-.43.94-.67.32-.21.66-.41,1.02-.63l.21-.11c1.74-1,3.86-2.03,5.72-2.94.65-.31,1.25-.61,1.78-.87.2-.1.41-.21.62-.33c2.54-1.47,5.31-4.19,5.64-4.52c1.56-.9,6.47-3.8,6.95-4.84.06-.13.08-.25.04-.34-.26-.75-5.08-.4-6.2-.31-.15-.27-.89-1.36-2.77-1.24-.68.05-1.43.24-2.24.58-.35.15-.68.31-.99.49-1.46.84-2.52,1.99-3.71,3.29-1.42,1.54-3.02,3.29-5.81,5.21-.2.14-.4.27-.59.39-.14.09-.28.17-.42.25-.3.18-.62.34-.94.5-.76.37-1.41.63-1.76.77l-.14.05c.1-.95.8-5.28,5.77-10.86c3.75-4.21,3.78-6.07,3.83-9.78v-.07c.05-3.65-.34-11.07-.35-11.14v-.24c0,0-.22.19-.22.19-1.88,1.66-6.21,9.64-6.64,10.43-6.76,7.04-11.43,17.5-12.96,20.95-.16.35-.31.69-.41.9-.19-.16-.63-.48-1.54-1.14-2.66-1.93-7.62-5.51-9.93-7.84-3.33-3.34-7.5-5.33-8.9-5.72-1.5-.43-4.48-1.76-4.51-1.78l-.38-.16'/></g></g></g></g>";
  
  
  
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 6011) {
      return C_BOOKS;
    } else if (assetID == 6012) {
      return C_FLYING_DUCKSL;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 6011) {
      return 5;
    } else if (assetID == 6012) {
      return 5;
    } else {
      return 0;
    }
  }
}