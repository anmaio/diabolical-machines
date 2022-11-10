// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./SharedAssets.sol";
import "./Machine.sol";
import "./CommonSVG.sol";
import "./Metadata.sol";

contract Compose {
  SharedAssets private _sharedAssets;
  Machine private _machine;
  Metadata private _metadata;

  bool internal globalFlip = false;

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

  function setMetadata(Metadata metadata) public {
    _metadata = metadata;
  }

  // set the value of global flip to its opposite
  function changeGlobalFlip() public {
      globalFlip = !globalFlip;
  }

  function combineStringArrays(string[] memory a, string[] memory b) public pure returns (string[] memory) {
    string[] memory c = new string[](a.length + b.length);
    for (uint256 i = 0; i < a.length; i++) {
        c[i] = a[i];
    }
    for (uint256 i = 0; i < b.length; i++) {
        c[i + a.length] = b[i];
    }
    return c;
  }

  function combineUintArrays(uint256[] memory a, uint256[] memory b) public pure returns (uint256[] memory) {
      uint256[] memory c = new uint256[](a.length + b.length);
      for (uint256 i = 0; i < a.length; i++) {
          c[i] = a[i];
      }
      for (uint256 i = 0; i < b.length; i++) {
          c[i + a.length] = b[i];
      }
      return c;
  }

  function getIndexesFromGrid(string[9] memory grid) public pure returns (uint256[] memory indexes) {
    uint count = 0;
    uint256[] memory tempArray = new uint256[](9);
    for (uint256 i = 0; i < grid.length; i++) {
      if (keccak256(abi.encodePacked(grid[i])) != keccak256(abi.encodePacked("")) && keccak256(abi.encodePacked(grid[i])) != keccak256(abi.encodePacked("x"))) {
        tempArray[count] = i;
        count++;
      }
    }
    uint[] memory indexArray = new uint[](count);
    for (uint256 i = 0; i < count; i++) {
      indexArray[i] = tempArray[i];
    }
    return indexArray;
  }

  // compose SVG
  function composeSVG(uint _tokenId) public view returns (string memory) {
    // objects behind the machine
    // machine
    // objects in front of the machine
    string memory svgStart = CommonSVG.SVG_START;
    // string memory script = "";
    string memory script = CommonSVG.SCRIPT;
    string memory style = CommonSVG.STYLE;
    string memory shell = _sharedAssets.getShell();
    
    string memory objects = composeObjects(_tokenId);
    string memory closingGTags = CommonSVG.G2_END;
    string memory svgEnd = CommonSVG.SVG_END;
    // return all svg's concatenated together and base64 encoded
    return Base64.encode(bytes(string.concat(svgStart, script, style, shell, objects, closingGTags, svgEnd)));
  }

  function composeObjects(uint _tokenId) internal view returns (string memory) {
    uint rWLength = getIndexesFromGrid(_metadata.getRWGrid(_tokenId)).length;
    uint lWLength = getIndexesFromGrid(_metadata.getLWGrid(_tokenId)).length;
    uint fLength = getIndexesFromGrid(_metadata.getFGrid(_tokenId)).length;

    string[] memory objectList = combineStringArrays(_metadata.getObjectsFromGrid(_metadata.getRWGrid(_tokenId)), combineStringArrays(_metadata.getObjectsFromGrid(_metadata.getLWGrid(_tokenId)), _metadata.getObjectsFromGrid(_metadata.getFGrid(_tokenId))));
    uint[] memory indexes = combineUintArrays(combineUintArrays(getIndexesFromGrid(_metadata.getRWGrid(_tokenId)), getIndexesFromGrid(_metadata.getLWGrid(_tokenId))), getIndexesFromGrid(_metadata.getFGrid(_tokenId)));
    string memory machine = _metadata.getMachine(_tokenId);
    bool leftAlign = _metadata.getLeftAligned(_tokenId);

    if (globalFlip) {
      leftAlign = !leftAlign;
    }

    string memory output;
    uint leftOffset = 0;
    uint rightOffset = 0;

    if (leftAlign) {
        leftOffset = 18;
    } else {
        rightOffset = 18;
    }

    for (uint256 i = 0; i < indexes.length; i++) {
      if (indexes[i] != 9) {
        output = string.concat(output, CommonSVG.G_TRANSFORM);
        // rw
        if (i < rWLength) {
            output = string.concat(
                output,
                combinedWallArray[2 * indexes[i] + rightOffset],
                ",",
                combinedWallArray[2 * indexes[i] + 1 + rightOffset]
            );
        // lw
        } else if (i < rWLength + lWLength) {
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

        output = string.concat(output, CommonSVG.G_MID);

        if (keccak256(abi.encodePacked(objectList[i])) == keccak256(abi.encodePacked(machine))) {
          output = string.concat(output, _machine.getMachineSVG(machine, indexes[i], leftAlign, _tokenId));
        } else {
          output = string.concat(output, _sharedAssets.getObjectSVG(objectList[i], indexes[i], leftAlign));
        }

        output = string.concat(output, CommonSVG.G_END);
      }
    }
    return output;
  }
}
