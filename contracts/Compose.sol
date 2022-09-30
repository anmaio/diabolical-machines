// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./SharedAssets.sol";

contract Compose {
    SharedAssets private _sharedAssets;

    // string[] public folders = ["s/shell", "r/frame", "r/clock", "l/frame", "f/altar", "f/props"];
    // string[] public objects = [RIGHT_FRAME, RIGHT_CLOCK, LEFT_FRAME, ALTAR, PROPS];

    string[18] public floorGridArray = [
      "280.666386", // 5
      "421", // 5
      "421", // 6
      "359.534", // 6
      "561.32772", // 7
      "297.50386", // 7
      "143.14000000000001", // 8
      "359.534", // 8
      "280.666386", // 9
      "297.50386", // 9
      "421", // 1
      "235.76000000000002", // 1
      "2", // 2
      "297.50386", // 2
      "143.14000000000001", // 3
      "235.76000000000002", // 3
      "280.666386", // 4
      "174.014456" // 4
    ];

    string[18] public leftWallGridArray = [
      "2", // 5
      "421",
      "140.32772", // 6
      "350.832772",
      "280.6666386", // 7
      "297.506386",
      "2", // 8
      "297.50386",
      "140.32772", // 9
      "210.5",
      "280.6666386", // 1
      "140.32772",
      "2", // 2
      "121.24799999999999",
      "142.32772", // 3
      "62.308",
      "282.666386", // 4
      "0.06999999999999999"
    ];

    string[18] public rightWallGridArray = [
      "421", // 5
      "297.506386",
      "561.32772", // 6
      "350.832772",
      "701.66386", // 7
      "421",
      "421", // 8
      "140.332772",
      "561.32772", // 9
      "210.5",
      "701.66386", // 1
      "297.506386",
      "421", // 2
      "0",
      "561.32772", // 3
      "70.166386",
      "701.66386", // 4
      "140.32772"
    ];

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
      for (uint256 i = 0; i < positions.length; i++) {
        if (positions[i] != 9) {
          output = string.concat(
            output,
            _sharedAssets.getGStart()
          );
          // right wall
          if (i < 2) {
            output = string.concat(
              output,
              rightWallGridArray[2 * positions[i]],
              ",",
              rightWallGridArray[2 * positions[i] + 1]
            );
          } else if (i == 2) {
            output = string.concat(
              output,
              leftWallGridArray[2 * positions[i]],
              ",",
              leftWallGridArray[2 * positions[i] + 1]
            );
          } else {
            output = string.concat(
              output,
              floorGridArray[2 * positions[i]],
              ",",
              floorGridArray[2 * positions[i] + 1]
            );
          }

          output = string.concat(
            output,
            _sharedAssets.getGMid(),
            _sharedAssets.getObjects(i),
            _sharedAssets.getGEnd()
          );
        }
      }
      return output;
    }
}
