// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./SharedAssets.sol";

contract Compose {
    SharedAssets private _sharedAssets;

    // string[] public folders = ["s/shell", "r/frame", "r/clock", "l/frame", "f/altar", "f/props"];
    // string[] public objects = [RIGHT_FRAME, RIGHT_CLOCK, LEFT_FRAME, ALTAR, PROPS];

    // string[18] internal floorGridArray = [
    //     "280.666386", // 0
    //     "174.014456", // 0
    //     "143.14000000000001", // 1
    //     "235.76000000000002", // 1
    //     "2", // 2
    //     "297.50386", // 2
    //     "421", // 3
    //     "235.76000000000002", // 3
    //     "280.666386", // 4
    //     "297.50386", // 4
    //     "143.14000000000001", // 5
    //     "359.534", // 5
    //     "561.32772", // 6
    //     "297.50386", // 6
    //     "421", // 7
    //     "359.534", // 7
    //     "280.666386", // 8
    //     "421" // 8
    // ];

    // floorGridArray.toString() 312,360,156,450,0,540,468,450,312,540,156,630,624,540,468,630,312,720

    string[18] internal floorGridArray = [
      "312",
      "360",
      "156",
      "450",
      "0",
      "540",
      "468",
      "450",
      "312",
      "540",
      "156",
      "630",
      "624",
      "540",
      "468",
      "630",
      "312",
      "720"
    ];

    // leftWallGridArray.toString() 0,540,156,450,312,360,0,360,156,270,312,180,0,180,156,90,312,0

    string[18] internal leftWallGridArray = [
      "0",
      "540",
      "156",
      "450",
      "312",
      "360",
      "0",
      "360",
      "156",
      "270",
      "312",
      "180",
      "0",
      "180",
      "156",
      "90",
      "312",
      "0"
    ];

    // rightWallGridArray.toString() 312,360,468,450,624,540,312,180,468,270,624,360,312,0,468,90,624,180

    string[18] internal rightWallGridArray = [
      "312",
      "360",
      "468",
      "450",
      "624",
      "540",
      "312",
      "180",
      "468",
      "270",
      "624",
      "360",
      "312",
      "0",
      "468",
      "90",
      "624",
      "180"
    ];

    // string[18] internal leftWallGridArray = [
    //     "2", // 5
    //     "421",
    //     "140.32772", // 6
    //     "350.832772",
    //     "280.6666386", // 7
    //     "297.506386",
    //     "2", // 8
    //     "297.50386",
    //     "140.32772", // 9
    //     "210.5",
    //     "280.6666386", // 1
    //     "140.32772",
    //     "2", // 2
    //     "121.24799999999999",
    //     "142.32772", // 3
    //     "62.308",
    //     "282.666386", // 4
    //     "0.06999999999999999"
    // ];

    // string[18] internal rightWallGridArray = [
    //     "421", // 5
    //     "297.506386",
    //     "561.32772", // 6
    //     "350.832772",
    //     "701.66386", // 7
    //     "421",
    //     "421", // 8
    //     "140.332772",
    //     "561.32772", // 9
    //     "210.5",
    //     "701.66386", // 1
    //     "297.506386",
    //     "421", // 2
    //     "0",
    //     "561.32772", // 3
    //     "70.166386",
    //     "701.66386", // 4
    //     "140.32772"
    // ];

    constructor(SharedAssets sharedAssets) {
        _sharedAssets = sharedAssets;
    }

    // compose SVG
    function composeSVG(string[] memory objects, uint256[] memory indexes) public view returns (string memory) {
        string memory svgStart = _sharedAssets.getSvgStart();
        string memory style = _sharedAssets.getStyle();
        string memory shell = _sharedAssets.getObjects("shell");
        string memory data = composeData(objects, indexes);
        string memory svgEnd = _sharedAssets.getSvgEnd();
        // return all svg's concatenated together and base64 encoded
        return Base64.encode(bytes(string.concat(svgStart, style, shell, data, svgEnd)));
    }

    function composeData(string[] memory objects, uint256[] memory indexes) internal view returns (string memory) {
        string memory output;

        // string[2] memory testRObjects = ["frame", "clock"];
        // string[1] memory testLObjects = ["frame"];
        // string[2] memory testFObjects = ["props", "altar"];

        for (uint256 i = 0; i < indexes.length; i++) {
            output = string.concat(output, _sharedAssets.getGStart());
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
                output = string.concat(output, floorGridArray[2 * indexes[i]], ",", floorGridArray[2 * indexes[i] + 1]);
            }

            output = string.concat(
                output,
                _sharedAssets.getGMid(),
                _sharedAssets.getObjects(objects[i]),
                _sharedAssets.getGEnd()
            );
        }
        return output;
    }
}
