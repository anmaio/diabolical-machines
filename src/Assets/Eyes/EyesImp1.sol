// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract EyesImp1 {
  string internal constant C_EYE_N = "<g id='ap-u-frame-c-eye-n-all'><g id='ap-u-frame-c-eye-n_idle'><g id='ap-u-frame-c-eye-n_idle_paths'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1731' opacity='.3' style='mix-blend-mode:color-burn'/><path id='ap-s-path1732' fill='none' stroke='#000000' d='M705.63 278.76c-.05-.03-.11-.07-.16-.1-31.52-18.2-57.25-3.54-57.35 32.68-.1 36.23 25.46 80.51 56.98 98.7 2.47 1.42 4.89 2.62 7.28 3.65 28.11 12.1 49.98-2.95 50.08-36.34.1-36.16-25.37-80.34-56.82-98.6Z'/><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1733' stroke-width='2'/><path id='ap-s-path1734' fill='url(#c4d)' stroke='#000000' d='M648.58 320.15c1.76 0 112.9 65.49 112.9 65.49'/></g></g><g id='ap-u-frame-c-eye-n_active' opacity='0'><g id='ap-u-frame-c-eye-n_active_group'><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1731' id='ap-s-path1735' opacity='.3' style='mix-blend-mode:color-burn'/><g id='ap-s-g356'><path id='ap-s-path1736' fill='url(#ap-s-path1736-fill)' stroke='#000000' d='M726.11 408.92c-2.39-1.03-4.81-2.23-7.28-3.65-31.52-18.2-57.08-62.48-56.98-98.7.05-17 5.75-29.24 15.05-35.56-1.5.13-2.97.35-4.38.69-14.69 3.45-24.34 17.51-24.4 39.66-.1 36.23 25.46 80.51 56.98 98.7 2.47 1.42 4.89 2.62 7.28 3.65 13.08 5.63 24.81 5.38 33.62.14.48-.28.94-.6 1.4-.91-6.42.56-13.62-.7-21.29-4Z'/><path id='ap-s-path1737' fill='url(#c3b)' stroke='#000000' d='M762.45 377.36c.1-36.16-25.37-80.34-56.82-98.6-.05-.03-.11-.07-.16-.1-10.39-6-20.15-8.4-28.57-7.66-9.29 6.33-15 18.56-15.05 35.56-.1 36.23 25.46 80.51 56.98 98.7 2.47 1.42 4.89 2.62 7.28 3.65 7.67 3.3 14.86 4.56 21.29 4 9.3-6.33 15.01-18.56 15.05-35.56Z'/></g><use xmlns:xlink='http://www.w3.org/1999/xlink' xlink:href='#ap-s-path1733' id='ap-s-path1738' stroke-width='2'/></g></g></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 5026) {
      return C_EYE_N;
    } else {
      return "";
    }
  }
}