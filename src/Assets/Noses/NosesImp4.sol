// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract NosesImp4 {

  string internal constant C_PANEL_RUNNER = "<g id='nos-u-runner' transform='translate(-141.54 -80.785)'><g id='nos-u-c-panel-runner-shapes2' transform='translate(2 2)'><path id='nos-s-polygon80' fill='url(#c0l)' stroke='#000000' d='m288.14 265.54 15.69 9.07 13.34-7.71-15.68-9.06-13.35 7.7z'/><path id='nos-s-polygon81' fill='url(#c0l)' stroke='#000000' d='m354.89 227.02 15.65 9.04 13.35-7.72-15.64-9.03-13.36 7.71z'/><path id='nos-s-polygon82' fill='url(#c0l)' stroke='#171d35' d='m301.49 257.84 15.68 9.06 13.34-7.71-15.68-9.06-13.34 7.71z'/><path id='nos-s-polygon83' fill='url(#c0l)' stroke='#000000' d='m261.45 280.94 15.71 9.08 13.34-7.71-15.7-9.07-13.35 7.7z'/><path id='nos-s-polygon84' fill='url(#c4d)' stroke='#000000' d='m274.8 273.24 15.7 9.07 13.33-7.7-15.69-9.07-13.34 7.7z'/><path id='nos-s-polygon85' fill='url(#c2l)' stroke='#000000' d='m141.55 350.14 15.65 9.2 13.26-7.66-15.78-9.12-13.13 7.58z'/><path id='nos-s-polygon86' fill='url(#c2l)' stroke='#000000' d='m328.18 242.43 15.67 9.05 13.34-7.71-15.66-9.04-13.35 7.7z'/><path id='nos-s-polygon87' fill='url(#c2l)' stroke='#000000' d='m314.83 250.13 15.68 9.06 13.34-7.71-15.67-9.05-13.35 7.7z'/><path id='nos-s-polygon88' fill='url(#c0l)' stroke='#171d35' d='m341.53 234.73 15.66 9.04 13.35-7.71-15.65-9.04-13.36 7.71z'/><path id='nos-s-polygon89' fill='url(#c4d)' stroke='#000000' d='m181.37 327.16 15.76 9.11 13.34-7.71-15.75-9.1-13.35 7.7z'/><path id='nos-s-polygon90' fill='url(#c0l)' stroke='#000000' d='m168.02 334.86 15.78 9.11 13.33-7.7-15.76-9.11-13.35 7.7z'/><path id='nos-s-polygon91' fill='url(#c0l)' stroke='#000000' d='m194.72 319.46 15.75 9.1 13.34-7.71-15.75-9.1-13.34 7.71z'/><path id='nos-s-polygon92' fill='url(#c0l)' stroke='#171d35' d='m154.68 342.56 15.78 9.12 13.34-7.71-15.78-9.11-13.34 7.7z'/><path id='nos-s-polygon93' fill='url(#c2l)' stroke='#000000' d='m221.41 304.05 15.74 9.09 13.33-7.7-15.72-9.09-13.35 7.7z'/><path id='nos-s-polygon94' fill='url(#c2l)' stroke='#000000' d='m234.76 296.35 15.72 9.09 13.34-7.71-15.72-9.08-13.34 7.7z'/><path id='nos-s-polygon95' fill='url(#c0l)' stroke='#171d35' d='m248.1 288.65 15.72 9.08 13.34-7.71-15.71-9.08-13.35 7.71z'/><path id='nos-s-polygon96' fill='url(#c0l)' stroke='#171d35' d='m208.06 311.75 15.75 9.1 13.34-7.71-15.74-9.09-13.35 7.7z'/><path id='nos-s-polygon97' fill='url(#c0l)' stroke='#000000' d='m475.03 157.69 15.56 8.99 13.34-7.71-15.56-8.99-13.34 7.71z'/><path id='nos-s-polygon98' fill='url(#c0l)' stroke='#171d35' d='m528.4 126.88 15.53 8.98 13.34-7.71-15.53-8.97-13.34 7.7z'/><path id='nos-s-polygon99' fill='url(#c0l)' stroke='#000000' d='m541.74 119.18 15.53 8.97 13.33-7.71-15.51-8.96-13.35 7.7z'/><path id='nos-s-polygon100' fill='url(#c4d)' stroke='#000000' d='m555.09 111.48 15.51 8.96 13.34-7.7-15.51-8.96-13.34 7.7z'/><path id='nos-s-polygon101' fill='url(#c2l)' stroke='#000000' d='m515.06 134.58 15.54 8.98 13.33-7.7-15.53-8.98-13.34 7.7z'/><path id='nos-s-polygon102' fill='url(#c0l)' stroke='#171d35' d='m595.12 88.38-13.34 7.7 15.49 8.95 13.34-7.7-15.49-8.95z'/><path id='nos-s-polygon103' fill='url(#c2l)' stroke='#000000' d='m501.71 142.28 15.55 8.99 13.34-7.71-15.54-8.98-13.35 7.7z'/><path id='nos-s-polygon104' fill='url(#c4d)' stroke='#000000' d='m368.25 219.31 15.64 9.03 13.36-7.72-15.63-9.03-13.37 7.72z'/><path id='nos-s-polygon105' fill='url(#c2l)' stroke='#000000' d='m623.67 89.78-15.52-8.92-13.03 7.52 15.49 8.95 13.06-7.55z'/><path id='nos-s-polygon106' fill='url(#c0l)' stroke='#000000' d='m568.43 103.78 15.51 8.96 13.33-7.71-15.49-8.95-13.35 7.7z'/><path id='nos-s-polygon107' fill='url(#c0l)' stroke='#171d35' d='m394.96 203.89 15.62 9.03 13.34-7.71-15.61-9.02-13.35 7.7z'/><path id='nos-s-polygon108' fill='url(#c2l)' stroke='#000000' d='m408.31 196.19 15.61 9.02 13.33-7.71-15.6-9.01-13.34 7.7z'/><path id='nos-s-polygon109' fill='url(#c0l)' stroke='#000000' d='m381.62 211.59 15.63 9.03 13.33-7.7-15.62-9.03-13.34 7.7z'/><path id='nos-s-polygon110' fill='url(#c2l)' stroke='#000000' d='m421.65 188.49 15.6 9.01 13.34-7.7-15.6-9.01-13.34 7.7z'/><path id='nos-s-polygon111' fill='url(#c0l)' stroke='#171d35' d='m488.37 149.98 15.56 8.99 13.33-7.7-15.55-8.99-13.34 7.7z'/><path id='nos-s-polygon112' fill='url(#c4d)' stroke='#000000' d='m461.68 165.39 15.58 9 13.33-7.71-15.56-8.99-13.35 7.7z'/><path id='nos-s-polygon113' fill='url(#c0l)' stroke='#000000' d='m448.34 173.09 15.58 9 13.34-7.7-15.58-9-13.34 7.7z'/><path id='nos-s-polygon114' fill='url(#c0l)' stroke='#171d35' d='m434.99 180.79 15.6 9.01 13.33-7.71-15.58-9-13.35 7.7z'/></g></g>";
  string internal constant C_PANEL_HEADDRESS_A = "";
  string internal constant C_WALLPAPER = "";
  string internal constant C_PANEL_RUNNER_TASSELS = "";

  string internal constant ALL_NOSES_WRAPPER = "<g style='animation:nos-u-a_to__to 20000ms linear 999 normal forwards' transform='translate(444.33 411.235)'><g id='nos-u-a' transform='translate(-444.33 -411.235)'>";
  string internal constant JUST_NOSE_WRAPPER = "<g style='animation:nos-u-noses-all_to__to 20000ms linear 999 normal forwards' transform='translate(658.6992 449.805)'><g id='nos-u-noses-all' transform='translate(-641 -460)'>";
  


  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 18008) {
      return C_PANEL_RUNNER;
    } else if (assetID == 18009) {
      return C_PANEL_HEADDRESS_A;
    } else if (assetID == 18010) {
      return C_WALLPAPER;
    } else if (assetID == 18011) {
      return C_PANEL_RUNNER_TASSELS;
    } else if (assetID == 18012) {
      return ALL_NOSES_WRAPPER;
    } else if (assetID == 18013) {
      return JUST_NOSE_WRAPPER;
    } else {
      return "";
    }
  }

  // add this to be excluded from coverage report
  // Not used in release 1 so should be excluded from coverage report
  function test() public {}
}