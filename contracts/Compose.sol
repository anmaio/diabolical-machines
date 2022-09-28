// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./SharedAssets.sol";

contract Compose {
    SharedAssets private _sharedAssets;

    // string[] public folders = ["s/shell", "r/frame", "r/clock", "l/frame", "f/altar", "f/props"];

    constructor(SharedAssets sharedAssets) {
        _sharedAssets = sharedAssets;
    }

    // compose SVG
    function composeSVG(uint256[] memory positions) public view returns (string memory) {
      string memory svgStart = _sharedAssets.getSvgStart();
      string memory data = composeData(positions);
      string memory svgEnd = _sharedAssets.getSvgEnd();
      // return all svg's concatenated together and base64 encoded
      return Base64.encode(bytes(string.concat(svgStart, data, svgEnd)));
    }

    function composeData(uint256[] memory positions) public view returns (string memory) {
      string memory output;
      uint x = 100;
      uint y = 100;
      for (uint256 i = 0; i < positions.length; i++) {
        if (positions[i] != 9) {
          output = string.concat(
            output,
            _sharedAssets.getGStart(),
            Strings.toString(x*i),
            ",",
            Strings.toString(y*i),
            _sharedAssets.getGMid(),
            _sharedAssets.getObjects(i),
            _sharedAssets.getGEnd()
          );
        }
      }
      return output;
    }
}
