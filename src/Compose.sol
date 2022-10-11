// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./SharedAssets.sol";

contract Compose {
    SharedAssets private _sharedAssets;

    // string[] public folders = ["s/shell", "r/frame", "r/clock", "l/frame", "f/altar", "f/props"];
    // string[] public objects = [RIGHT_FRAME, RIGHT_CLOCK, LEFT_FRAME, ALTAR, PROPS];

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

    constructor(SharedAssets sharedAssets) {
        _sharedAssets = sharedAssets;
    }

    // compose SVG
    function composeSVG(string[] memory objectList, uint256[] memory indexes) public view returns (string memory) {
        string memory svgStart = _sharedAssets.getSvgStart();
        string memory style = _sharedAssets.getStyle();
        string memory shell = _sharedAssets.getShell();
        // objects behind the machine
        // machine
        // objects in front of the machine
        string memory objects = composeObjects(objectList, indexes);
        string memory svgEnd = _sharedAssets.getSvgEnd();
        // return all svg's concatenated together and base64 encoded
        return Base64.encode(bytes(string.concat(svgStart, style, shell, objects, svgEnd)));
    }

    function composeObjects(string[] memory objectList, uint256[] memory indexes) internal view returns (string memory) {
        string memory output;

        for (uint256 i = 0; i < indexes.length; i++) {
            output = string.concat(output, _sharedAssets.getGTransform());
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
                _sharedAssets.getObject(objectList[i], indexes[i]),
                _sharedAssets.getGEnd()
            );
        }
        return output;
    }
}
