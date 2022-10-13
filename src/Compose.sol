// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./SharedAssets.sol";
import "./Machine.sol";

contract Compose {
    SharedAssets private _sharedAssets;
    Machine private _machine;

    bool internal globalFlip = true;

    // string[] public folders = ["s/shell", "r/frame", "r/clock", "l/frame", "f/altar", "f/props"];
    // string[] public objects = [RIGHT_FRAME, RIGHT_CLOCK, LEFT_FRAME, ALTAR, PROPS];

    string[18] internal floorGridArray = [
      "312", // 0
      "360",
      "156", // 1
      "450",
      "0", // 2
      "540",
      "468", // 3
      "450",
      "312", // 4
      "540",
      "156", // 5
      "630",
      "624", // 6
      "540",
      "468", // 7
      "630",
      "312", // 8
      "720"
    ];

    string[18] internal altFloorGridArray = [
      "312", // 0
      "360",
      "468", // 3
      "450",
      "624", // 6
      "540",
      "156", // 1
      "450",
      "312", // 4
      "540",
      "468", // 7
      "630",
      "0", // 2
      "540",
      "156", // 5
      "630",
      "312", // 8
      "720"
    ];

    // string[18] internal leftWallGridArray = [
    //   "312", // 2
    //   "360",
    //   "156", // 1
    //   "450",
    //   "0", // 0
    //   "540",
    //   "312", // 5
    //   "180",
    //   "156", // 4
    //   "270",
    //   "0", // 3
    //   "360",
    //   "312", // 8
    //   "0",
    //   "156", // 7
    //   "90",
    //   "0", // 6
    //   "180"
    // ];

    // string[18] internal rightWallGridArray = [
    //   "312",
    //   "360",
    //   "468",
    //   "450",
    //   "624",
    //   "540",
    //   "312",
    //   "180",
    //   "468",
    //   "270",
    //   "624",
    //   "360",
    //   "312",
    //   "0",
    //   "468",
    //   "90",
    //   "624",
    //   "180"
    // ];

    // Right wall then Left wall
    string[36] internal combinedWallArray = [
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
      "180",
      "312", // 2
      "360",
      "156", // 1
      "450",
      "0", // 0
      "540",
      "312", // 5
      "180",
      "156", // 4
      "270",
      "0", // 3
      "360",
      "312", // 8
      "0",
      "156", // 7
      "90",
      "0", // 6
      "180"
    ];

    constructor(SharedAssets sharedAssets, Machine machine) {
        _sharedAssets = sharedAssets;
        _machine = machine;
    }

    // set the value of global flip to its opposite
    function changeGlobalFlip() public {
        globalFlip = !globalFlip;
    }

    // compose SVG
    function composeSVG(string[] memory objectList, uint256[] memory indexes, string memory machine, bool leftAlign) public view returns (string memory) {
        string memory svgStart = _sharedAssets.getSvgStart();
        string memory style = _sharedAssets.getStyle();
        string memory shell = _sharedAssets.getShell();
        // objects behind the machine
        // machine
        // objects in front of the machine
        if (globalFlip) {
          leftAlign = !leftAlign;
        }
        string memory objects = composeObjects(objectList, indexes, machine, leftAlign);
        string memory svgEnd = _sharedAssets.getSvgEnd();
        // return all svg's concatenated together and base64 encoded
        return Base64.encode(bytes(string.concat(svgStart, style, shell, objects, svgEnd)));
    }

    function composeObjects(string[] memory objectList, uint256[] memory indexes, string memory machine, bool leftAlign) internal view returns (string memory) {
        string memory output;
        uint leftOffset = 0;
        uint rightOffset = 0;

        if (leftAlign) {
            leftOffset = 18;
        } else {
            rightOffset = 18;
        }

        for (uint256 i = 0; i < indexes.length; i++) {
            output = string.concat(output, _sharedAssets.getGTransform());
            // rw
            if (i < 2) {
                output = string.concat(
                    output,
                    combinedWallArray[2 * indexes[i] + rightOffset],
                    ",",
                    combinedWallArray[2 * indexes[i] + 1 + rightOffset]
                );
            // lw
            } else if (i < 3) {
                output = string.concat(
                    output,
                    combinedWallArray[2 * indexes[i] + leftOffset],
                    ",",
                    combinedWallArray[2 * indexes[i] + 1 + leftOffset]
                );
            // floor
            } else {
              if (leftAlign) {
                output = string.concat(output, floorGridArray[2 * indexes[i]], ",", floorGridArray[2 * indexes[i] + 1]);
              } else {
                output = string.concat(output, altFloorGridArray[2 * indexes[i]], ",", altFloorGridArray[2 * indexes[i] + 1]);
              }
            }

            output = string.concat(output, _sharedAssets.getGMid());

            if (keccak256(abi.encodePacked(objectList[i])) == keccak256(abi.encodePacked(machine))) {
              output = string.concat(output, _machine.getMachineSVG(machine, indexes[i], leftAlign));
            } else {
              output = string.concat(output, _sharedAssets.getObject(objectList[i], indexes[i], leftAlign));
            }

            output = string.concat(output, _sharedAssets.getGEnd());
        }
        return output;
    }
}
