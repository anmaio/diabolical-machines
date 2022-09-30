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
      "280.666386", // 0
      "174.014456", // 0
      "143.14000000000001", // 1
      "235.76000000000002", // 1
      "2", // 2
      "297.50386", // 2
      "421", // 3
      "235.76000000000002", // 3
      "280.666386", // 4
      "297.50386", // 4
      "143.14000000000001", // 5
      "359.534", // 5
      "561.32772", // 6
      "297.50386", // 6
      "421", // 7
      "359.534", // 7
      "280.666386", // 8
      "421" // 8
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
    function composeSVG(string[][3] memory objects, uint[] memory indexes) public view returns (string memory) {
        string memory svgStart = _sharedAssets.getSvgStart();
        string memory data = composeData(objects, indexes);
        string memory svgEnd = _sharedAssets.getSvgEnd();
        // return all svg's concatenated together and base64 encoded
        return Base64.encode(bytes(string.concat(svgStart, data, svgEnd)));
    }

    function composeData(string[][3] memory objects, uint[] memory indexes) public view returns (string memory) {
      string memory output;
      
      // string[2] memory testRObjects = ["frame", "clock"];
      // string[1] memory testLObjects = ["frame"];
      // string[2] memory testFObjects = ["props", "altar"];

      for (uint i = 0; i < indexes.length; i++) {
        output = string.concat(
          output,
          _sharedAssets.getGStart()
        );
        // rw
        if (i < 2) {
          output = string.concat(
            output,
            rightWallGridArray[2 * indexes[i]],
            ",",
            rightWallGridArray[2 * indexes[i] + 1]
          );
        // lw
        } else if (i < 3) {
          output = string.concat(
            output,
            leftWallGridArray[2 * indexes[i]],
            ",",
            leftWallGridArray[2 * indexes[i] + 1]
          );
        // floor
        } else {
          output = string.concat(
            output,
            floorGridArray[2 * indexes[i]],
            ",",
            floorGridArray[2 * indexes[i] + 1]
          );
        }

        output = string.concat(
          output,
          _sharedAssets.getGMid(),
          _sharedAssets.getObjects(i),
          _sharedAssets.getGEnd()
        );
        
      }
      return output;
    }

    // function composeData(string[] memory rwGrid, string[] memory lwGrid, string[] memory fGrid) public view returns (string memory) {
    //   string memory output;
    //   for (uint256 i = 0; i < positions.length; i++) {
    //     if (positions[i] != 9) {
    //       output = string.concat(
    //         output,
    //         _sharedAssets.getGStart()
    //       );
    //       // right wall
    //       if (i < 2) {
    //         output = string.concat(
    //           output,
    //           rightWallGridArray[2 * positions[i]],
    //           ",",
    //           rightWallGridArray[2 * positions[i] + 1]
    //         );
    //       } else if (i == 2) {
    //         output = string.concat(
    //           output,
    //           leftWallGridArray[2 * positions[i]],
    //           ",",
    //           leftWallGridArray[2 * positions[i] + 1]
    //         );
    //       } else if (i == 3) {
    //         // floor object 1 has higher index(needs to be placed first)
    //         output = string.concat(
    //           output,
    //           floorGridArray[2 * positions[i]],
    //           ",",
    //           floorGridArray[2 * positions[i] + 1]
    //         );
    //       }

    //       output = string.concat(
    //         output,
    //         _sharedAssets.getGMid(),
    //         _sharedAssets.getObjects(i),
    //         _sharedAssets.getGEnd()
    //       );
    //     }
    //   }
    //   return output;
    // }
}
