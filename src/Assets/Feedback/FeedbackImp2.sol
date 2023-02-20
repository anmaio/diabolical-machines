// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract FeedbackImp2 {
  string internal constant C_ORB_A = "<g id='ap-u-c-orb-a-r_to' transform='translate(779.66 550.43)' style='animation-play-state: running;'><g id='ap-u-c-orb-a-r' transform='translate(-779.66 -570)'><ellipse id='ap-u-orb-23' fill='var(--g0)' stroke='#ffffff' rx='64.27' ry='64.36' transform='translate(779.66 550.43)'/><path id='ap-s-path2036' fill='var(--g1)' d='M802.17 490.21c15.76 11.73 26.03 30.46 26.03 51.64 0 35.54-28.77 64.36-64.27 64.36-7.93 0-15.49-1.51-22.51-4.14 10.69 7.96 23.9 12.72 38.24 12.72 35.49 0 64.27-28.81 64.27-64.36 0-27.6-17.38-51.08-41.76-60.22Z' opacity='.3' style='mix-blend-mode:color-burn'/><g id='ap-s-g384'><path id='ap-s-path2037' fill='url(#c5l)' d='M769.95 502.52c-1.31-4.04-6.2-7.94-10.71-6.08-4.9 2.02-9.15 4.44-13.31 7.73-3.56 2.82-6.5 6.12-9.22 9.75-5.52 7.37-8.53 16.14-9.46 25.24-.47 4.55 4.34 8.9 8.71 8.71 5.04-.23 8.1-3.73 8.67-8.49-.01.04-.02.06-.03.11.11-.39.13-.83.21-1.23.16-.9.36-1.79.58-2.68.41-1.61.96-3.17 1.52-4.73.14-.3.28-.61.42-.91.4-.82.82-1.64 1.27-2.43.85-1.51 1.83-2.9 2.8-4.33.18-.22.36-.44.55-.66.59-.7 1.21-1.38 1.84-2.04 1.18-1.23 2.46-2.34 3.76-3.44.31-.23.62-.45.94-.67.69-.47 1.39-.92 2.1-1.35s1.44-.83 2.18-1.21c.68-.35 3.71-1.66 1.09-.58 2.19-.9 3.96-1.87 5.2-4 1.09-1.87 1.56-4.62.88-6.71Z'/><path id='ap-s-path2038' fill='url(#c5l)' d='M744.67 539.16c0 .08-.03.15-.04.22.59-2.11.12-1.02.04-.22Z'/></g><path id='ap-s-path2039' fill='url(#c5l)' d='M737.86 558.26c-11.21 0-11.23 17.42 0 17.42 11.21 0 11.23-17.42 0-17.42Z'/></g></g>";
  string internal constant C_ORB_B = "<g id='ap-u-c-orb-b-r_to' transform='translate(779.66 550.43)' style='animation-play-state: running;'><g id='ap-u-c-orb-b-r' transform='translate(-780.47 -540)'><g id='ap-u-c-orb-5'><ellipse id='ap-u-orb-7' fill='var(--g0)' stroke='#ffffff' rx='43.03' ry='43.09' transform='translate(780.47 533.17)'/><path id='ap-s-path2032' fill='var(--g1)' d='M795.54 492.85c10.55 7.85 17.42 20.39 17.42 34.57 0 23.8-19.26 43.09-43.03 43.09-5.31 0-10.37-1.01-15.07-2.77 7.16 5.33 16 8.52 25.6 8.52 23.76 0 43.03-19.29 43.03-43.09 0-18.48-11.64-34.19-27.96-40.32Z' opacity='.3' style='mix-blend-mode:color-burn'/><g id='ap-s-g383'><path id='ap-s-path2033' fill='url(#c5l)' d='M773.97 501.09c-.87-2.7-4.15-5.32-7.17-4.07-3.28 1.35-6.13 2.97-8.91 5.17-2.39 1.89-4.35 4.1-6.17 6.53-3.7 4.94-5.71 10.81-6.33 16.9-.31 3.04 2.9 5.96 5.83 5.83 3.37-.15 5.42-2.5 5.8-5.68 0 .03-.01.04-.02.07.07-.26.09-.56.14-.82.11-.6.24-1.2.39-1.79.27-1.08.64-2.12 1.02-3.17.09-.2.19-.41.28-.61.27-.55.55-1.1.85-1.63.57-1.01 1.23-1.94 1.88-2.9.12-.15.24-.3.37-.44.4-.47.81-.92 1.23-1.36.79-.82 1.65-1.56 2.52-2.3l.63-.45c.46-.31.93-.61 1.4-.9.48-.29.96-.56 1.46-.81.45-.23 2.48-1.11.73-.39 1.47-.61 2.65-1.25 3.48-2.68.73-1.25 1.04-3.09.59-4.49Z'/><path id='ap-s-path2034' fill='url(#c5l)' d='M757.04 525.62c0 .05-.02.1-.03.15.39-1.41.08-.68.03-.15Z'/></g><path id='ap-s-path2035' fill='url(#c5l)' d='M752.48 538.41c-7.5 0-7.52 11.66 0 11.66 7.5 0 7.52-11.66 0-11.66Z'/></g></g></g>";
  string internal constant C_ORB_C = "<g id='ap-u-c-orb-c-r_to' transform='translate(779.66 550.43)' style='animation-play-state: running;'><g id='ap-u-c-orb-c-r' transform='translate(-780.79 -540)'><g id='ap-u-c-orb-22'><ellipse id='ap-u-orb-43' fill='var(--g0)' stroke='#ffffff' rx='13.5' ry='13.51' transform='translate(765.58 539.09)'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1846' id='ap-s-path2020' opacity='.3' style='mix-blend-mode:color-burn'/><g id='ap-s-g380'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1847' id='ap-s-path2021'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1848' id='ap-s-path2022'/></g><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1849' id='ap-s-path2023'/></g><g id='ap-u-c-orb-32'><ellipse id='ap-u-orb-52' fill='var(--g0)' stroke='#ffffff' rx='13.5' ry='13.51' transform='translate(784.76 514.71)'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1850' id='ap-s-path2024' opacity='.3' style='mix-blend-mode:color-burn'/><g id='ap-s-g381'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1851' id='ap-s-path2025'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1852' id='ap-s-path2026'/></g><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1853' id='ap-s-path2027'/></g><g id='ap-u-c-orb-42'><ellipse id='ap-u-orb-62' fill='var(--g0)' stroke='#ffffff' rx='13.5' ry='13.51' transform='translate(796 545.43)'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1854' id='ap-s-path2028' opacity='.3' style='mix-blend-mode:color-burn'/><g id='ap-s-g382'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1855' id='ap-s-path2029'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1856' id='ap-s-path2030'/></g><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1857' id='ap-s-path2031'/></g></g></g>";
  string internal constant C_ORB_D = "<g id='ap-u-c-orb-d-r_to' transform='translate(779.66 550.43)' style='animation-play-state: running;'><g id='ap-u-c-orb-d-r' transform='translate(-779.055 -540)'><g id='ap-u-c-orb-d-22'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon239' id='ap-s-polygon268'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon240' id='ap-s-polygon269'/><g id='ap-s-g385'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1858' id='ap-s-path2040'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1859' id='ap-s-path2041'/></g><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon241' id='ap-s-polygon270'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon242' id='ap-s-polygon271'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon243' id='ap-s-polygon272' opacity='.3' style='mix-blend-mode:color-burn'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-polygon244' id='ap-s-polygon273' opacity='.3' style='mix-blend-mode:color-burn'/></g></g></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 4035) {
      return C_ORB_A;
    } else if (assetID == 4036) {
      return C_ORB_B;
    } else if (assetID == 4037) {
      return C_ORB_C;
    } else if (assetID == 4038) {
      return C_ORB_D;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 4035) {
      return 4;
    } else if (assetID == 4036) {
      return 4;
    } else if (assetID == 4037) {
      return 4;
    } else if (assetID == 4038) {
      return 5;
    } else {
      return 0;
    }
  }
}