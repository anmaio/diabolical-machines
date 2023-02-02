// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract AssetsImp5 {

  string internal constant C_AZTECL_A = "<g id='C-AztecL-A' class='gss-109' clip-path='url(#clippath-1)' transform='translate(-234 -365)'><path d='m682.44 390.51 18.63 34.11-.13-44.8-18.51 10.69m-38.94 22.48 18.88 33.97.52-.3 18.62-55.62-38.02 21.95m-38.94 22.48 18.87 33.97.52-.3 18.62-55.62-38.01 21.95m-38.94 22.48 18.87 33.97.52-.3L603.62 436l-38.01 21.95m-38.94 22.48 18.87 33.97.52-.3 18.62-55.62-38.01 21.95m-38.94 22.48 18.87 33.97.52-.3 18.62-55.62-38.01 21.95m-38.95 22.49 18.88 33.97.52-.3 18.62-55.62-38.02 21.95m-38.94 22.48 18.88 33.97.52-.3 18.62-55.62-38.01 21.95m-38.94 22.48 18.88 33.97.52-.3 18.62-55.62-38.01 21.95m-38.94 22.48 18.87 33.97.52-.3 18.62-55.62-38.01 21.95m-38.94 22.48 18.87 33.97.52-.3 18.62-55.62-38.01 21.95M254.1 637.8l18.87 33.97.52-.3 18.62-55.62-38.02 21.95m-19.19 11.08.13 44.8 18.14-55.35-18.27 10.55' class='gss-85'/><path d='m700.95 379.82.13 44.8.53-.31v1.3l-.13-46.1-.53.31M234.36 649.21l.13 44.8.53-.31-.13-44.8-.53.31' class='gss-95'/><path d='m681.97 391.08 18.52 33.88-37.01 21.36 18.49-55.24' class='gss-88'/><path d='M701.62 425.61v.39l.16-.09-.16-.29m-20.1-34.57-18.62 55.62.59-.34 18.49-55.24 18.51 33.88.59-.34-18.63-34.11-.93.54'/><path d='m643.03 413.56 18.75 33.75-37.24 21.5 18.49-55.25' class='gss-88'/><path d='m642.57 413.53.93-.54 18.87 33.98-.59.34-18.75-33.75-18.49 55.25-.59.34 18.62-55.62'/><path d='m604.09 436.04 18.75 33.75-37.24 21.5 18.49-55.25' class='gss-88'/><path d='m603.63 436.01.93-.53 18.87 33.97-.59.34-18.75-33.75-18.49 55.25-.59.34 18.62-55.62'/><path d='m565.15 458.53 18.75 33.74-37.24 21.5 18.49-55.24' class='gss-88'/><path d='m564.69 458.49.93-.53 18.87 33.97-.59.34-18.75-33.74-18.49 55.24-.59.34 18.62-55.62'/><path d='m526.21 481.01 18.75 33.74-37.24 21.51 18.49-55.25' class='gss-88'/><path d='m525.75 480.98.93-.54 18.87 33.97-.59.34-18.75-33.74-18.49 55.25-.59.34 18.62-55.62'/><path d='m487.27 503.49 18.75 33.75-37.24 21.5 18.49-55.25' class='gss-88'/><path d='m486.81 503.46.93-.54 18.87 33.98-.59.34-18.75-33.75-18.49 55.25-.59.34 18.62-55.62'/><path d='m448.33 525.98 18.75 33.74-37.24 21.5 18.49-55.24' class='gss-88'/><path d='m447.86 525.94.93-.53 18.88 33.97-.59.34-18.75-33.74-18.49 55.24-.59.34 18.61-55.62'/><path d='m409.39 548.46 18.75 33.74-37.24 21.5 18.49-55.24' class='gss-88'/><path d='m408.92 548.43.93-.54 18.88 33.97-.59.34-18.75-33.74-18.49 55.24-.59.34 18.61-55.61'/><path d='m370.45 570.94 18.75 33.74-37.25 21.51 18.5-55.25' class='gss-88'/><path d='m369.98 570.91.93-.54 18.88 33.97-.59.34-18.75-33.74-18.5 55.25-.58.34 18.61-55.62'/><path d='m331.51 593.42 18.75 33.75-37.25 21.5 18.5-55.25' class='gss-88'/><path d='m331.04 593.39.93-.54 18.87 33.98-.58.34-18.75-33.75-18.5 55.25-.58.34 18.61-55.62'/><path d='m292.57 615.9 18.75 33.75-37.25 21.5 18.5-55.25' class='gss-88'/><path d='m292.1 615.87.93-.53 18.87 33.97-.58.34-18.75-33.75-18.5 55.25-.59.34 18.62-55.62'/><path d='m253.63 638.39 18.75 33.74-36.77 21.23 18.02-54.97' class='gss-88'/><path d='m234.49 695.32-.15.46.15-.09v-.38m18.67-56.96-18.14 55.34.59-.34 18.02-54.96 18.75 33.74.58-.34-18.87-33.97-.92.53'/><path d='m235.02 694.31 466.06-269.08.04 11.99L235.06 706.3l-.04-11.99' class='gss-97'/><path d='m234.49 694 .53-.3.01-.01.58-.33 36.77-21.23.58-.34.52-.3.59-.34 37.25-21.5.58-.34.53-.3.58-.34 37.25-21.5.58-.34.53-.3.58-.34 37.25-21.51.59-.34.52-.3.59-.34 37.24-21.5.59-.34.52-.3.59-.34 37.24-21.5.59-.34.52-.3.59-.34 37.24-21.5.59-.34.52-.3.59-.34 37.24-21.51.59-.34.52-.3.59-.34 37.24-21.5.59-.34.52-.3.59-.34 37.24-21.5.59-.34.52-.3.59-.34 37.24-21.5.59-.34.52-.3.59-.35 37.01-21.36.58-.34h.01l.53-.31.01 1.3v.39l.03 10.92-.53.3-.04-11.99-466.06 269.08.04 11.99-.53.31-.03-10.92-.01-.37V694'/><path d='m235.15 707.06 465.88-268.97.02 6.59-465.88 268.97-.02-6.59' class='gss-82'/><path d='M701.05 444.68 235.17 713.66l-.02-6.59 465.88-268.98.02 6.59M234.44 706.66l.02 8.22 467.3-269.8-.02-8.22-.09.05-.53.31L235.06 706.3l-.53.31-.09.05'/><path d='m234.94 635.33 465.89-268.98.03 12.71-465.88 268.98-.04-12.71' class='gss-82'/><path d='M700.86 379.06 234.98 648.04l-.04-12.71 465.88-268.98.04 12.71M234.23 634.93l.04 14.34.09-.05.53-.31 18.27-10.55.92-.53 38.02-21.95.93-.54 38.01-21.95.93-.54 38.01-21.95.93-.54 38.01-21.95.93-.54 38.01-21.95.93-.54 38.02-21.95.93-.54 38.01-21.95.93-.54 38.01-21.95.93-.54 38.01-21.95.93-.54 38.01-21.95.93-.54 38.02-21.95.93-.54 18.51-10.69.53-.31.09-.05-.04-14.34-467.3 269.8'/></g>";
  string internal constant C_AZTECR_A = "<g id='C-AztecR-A' class='gss-109' clip-path='url(#clippath)' transform='translate(234 -366)'><path d='m253.56 390.51-18.51-10.69-.13 44.8 18.63-34.11m38.94 22.48-38.02-21.95 18.62 55.62.52.3 18.88-33.97m38.94 22.48-38.01-21.95 18.62 55.62.52.3 18.87-33.97m38.94 22.48L332.36 436l18.62 55.62.52.3 18.87-33.97m38.94 22.48-38.01-21.95 18.62 55.62.52.3 18.87-33.97m38.94 22.48-38.01-21.95 18.62 55.62.52.3 18.87-33.97m38.95 22.49-38.02-21.95 18.62 55.62.52.3 18.88-33.97m38.94 22.48-38.01-21.95 18.62 55.62.52.3 18.88-33.97m38.94 22.48-38.01-21.95 18.62 55.62.52.3 18.88-33.97m38.94 22.48-38.01-21.95 18.62 55.62.52.3 18.87-33.97m38.94 22.48-38.01-21.95 18.62 55.62.52.3 18.87-33.97m38.94 22.48-38.02-21.95 18.62 55.62.52.3 18.87-33.97m19.19 11.08-18.27-10.55 18.14 55.34.13-44.79' class='gss-85'/><path d='m235.05 379.82-.53-.31-.13 46.1v-1.3l.53.31.13-44.8m466.59 269.39-.53-.31-.13 44.8.53.31.13-44.8' class='gss-95'/><path d='m254.03 391.08-18.52 33.88 37.01 21.36-18.49-55.24' class='gss-88'/><path d='m234.38 425.61-.16.29.16.09v-.39m20.1-34.57-.93-.54-18.63 34.11.59.34 18.51-33.88 18.49 55.24.59.34-18.62-55.62'/><path d='m292.97 413.56-18.75 33.75 37.24 21.5-18.49-55.25' class='gss-88'/><path d='m293.43 413.53-.93-.54-18.87 33.98.59.34 18.75-33.75 18.49 55.25.59.34-18.62-55.62'/><path d='m331.91 436.04-18.75 33.75 37.24 21.5-18.49-55.25' class='gss-88'/><path d='m332.37 436.01-.93-.53-18.87 33.97.59.34 18.75-33.75 18.49 55.25.59.34-18.62-55.62'/><path d='m370.85 458.53-18.75 33.74 37.24 21.5-18.49-55.24' class='gss-88'/><path d='m371.31 458.49-.93-.53-18.87 33.97.59.34 18.75-33.74 18.49 55.24.59.34-18.62-55.62'/><path d='m409.79 481.01-18.75 33.74 37.24 21.51-18.49-55.25' class='gss-88'/><path d='m410.25 480.98-.93-.54-18.87 33.97.59.34 18.75-33.74 18.49 55.25.59.34-18.62-55.62'/><path d='m448.73 503.49-18.75 33.75 37.24 21.5-18.49-55.25' class='gss-88'/><path d='m449.19 503.46-.93-.54-18.87 33.98.59.34 18.75-33.75 18.49 55.25.59.34-18.62-55.62'/><path d='m487.67 525.98-18.75 33.74 37.24 21.5-18.49-55.24' class='gss-88'/><path d='m488.14 525.94-.93-.53-18.88 33.97.59.34 18.75-33.74 18.49 55.24.59.34-18.61-55.62'/><path d='m526.61 548.46-18.75 33.74 37.24 21.5-18.49-55.24' class='gss-88'/><path d='m527.08 548.43-.93-.54-18.88 33.97.59.34 18.75-33.74 18.49 55.24.59.34-18.61-55.61'/><path d='m565.55 570.94-18.75 33.74 37.25 21.51-18.5-55.25' class='gss-88'/><path d='m566.02 570.91-.93-.54-18.88 33.97.59.34 18.75-33.74 18.5 55.25.58.34-18.61-55.62'/><path d='m604.49 593.42-18.75 33.75 37.25 21.5-18.5-55.25' class='gss-88'/><path d='m604.96 593.39-.93-.54-18.87 33.98.58.34 18.75-33.75 18.5 55.25.58.34-18.61-55.62'/><path d='m643.43 615.9-18.75 33.75 37.25 21.5-18.5-55.25' class='gss-88'/><path d='m643.9 615.87-.93-.53-18.87 33.97.58.34 18.75-33.75 18.5 55.25.59.34-18.62-55.62'/><path d='m682.37 638.39-18.75 33.74 36.77 21.23-18.02-54.97' class='gss-88'/><path d='M701.51 695.32v.38l.15.09-.15-.46m-18.67-56.96-.92-.53-18.87 33.97.58.34 18.75-33.74 18.02 54.96.59.34-18.14-55.34'/><path d='M700.98 694.31 234.92 425.23l-.04 11.99L700.94 706.3l.04-11.99' class='gss-97'/><path d='m701.51 694-.53-.3-.01-.01-.58-.33-36.77-21.23-.58-.34-.52-.3-.59-.34-37.25-21.5-.58-.34-.53-.3-.58-.34-37.25-21.5-.58-.34-.53-.3-.58-.34-37.25-21.51-.59-.34-.52-.3-.59-.34-37.24-21.5-.59-.34-.52-.3-.59-.34-37.24-21.5-.59-.34-.52-.3-.59-.34-37.24-21.5-.59-.34-.52-.3-.59-.34-37.24-21.51-.59-.34-.52-.3-.59-.34-37.24-21.5-.59-.34-.52-.3-.59-.34-37.24-21.5-.59-.34-.52-.3-.59-.34-37.24-21.5-.59-.34-.52-.3-.59-.35-37.01-21.36-.58-.34h-.01l-.53-.31-.01 1.3v.39l-.03 10.92.53.3.04-11.99 466.06 269.08-.04 11.99.53.31.03-10.92.01-.37V694'/><path d='M700.85 707.06 234.97 438.09l-.02 6.59 465.88 268.97.02-6.59' class='gss-82'/><path d='m234.95 444.68.02-6.59 465.88 268.98-.02 6.59-465.88-268.98m466.61 261.98-.09-.05-.53-.31-466.06-269.08-.53-.31-.09-.05-.02 8.22 467.3 269.8.02-8.22'/><path d='M701.06 635.33 235.17 366.35l-.03 12.71 465.88 268.98.04-12.71' class='gss-82'/><path d='m235.14 379.06.04-12.71 465.88 268.98-.04 12.71-465.88-268.98m466.63 255.87-467.3-269.8-.04 14.34.09.05.53.31 18.51 10.69.93.54 38.02 21.95.93.54 38.01 21.95.93.54 38.01 21.95.93.54 38.01 21.95.93.54 38.01 21.95.93.54 38.02 21.95.93.54 38.01 21.95.93.54 38.01 21.95.93.54 38.01 21.95.93.54 38.01 21.95.93.54 38.02 21.95.92.53 18.27 10.55.53.31.09.05.04-14.34'/></g>";
  
  
  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 6016) {
      return C_AZTECL_A;
    } else if (assetID == 6017) {
      return C_AZTECR_A;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 6016) {
      return 5;
    } else if (assetID == 6017) {
      return 5;
    } else {
      return 0;
    }
  }
}