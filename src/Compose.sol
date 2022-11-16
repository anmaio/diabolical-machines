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

  // Owner of the contract
  address internal _owner;

  bool internal globalFlip = false;

  // string[] public folders = ["s/shell", "r/frame", "r/clock", "l/frame", "f/altar", "f/props"];
  // string[] public objects = [RIGHT_FRAME, RIGHT_CLOCK, LEFT_FRAME, ALTAR, PROPS];

  // string[18] internal floorGridArray2 = [
  //   "312", // 0
  //   "360",
  //   "156", // 1
  //   "450",
  //   "0", // 2
  //   "540",
  //   "468", // 3
  //   "450",
  //   "312", // 4
  //   "540",
  //   "156", // 5
  //   "630",
  //   "624", // 6
  //   "540",
  //   "468", // 7
  //   "630",
  //   "312", // 8
  //   "720"
  // ];

  // Uses 1/10th of the gas compared to 2d arrays
  // Could be combined into one array but readability is already bad enough
  bytes internal constant floorGridArray = "312360156450000540468450312540156630624540468630312720";

  bytes internal constant altFloorGridArray = "312360468450624540156450312540468630000540156630312720";

  bytes internal constant combinedWallArray = "312360468450624540312180468270624360312000468090624180312360156450000540312180156270000360312000156090000180";

  // string[18] internal altFloorGridArray2 = [
  //   "312", // 0
  //   "360",
  //   "468", // 1
  //   "450",
  //   "624", // 2
  //   "540",
  //   "156", // 3
  //   "450",
  //   "312", // 4
  //   "540",
  //   "468", // 5
  //   "630",
  //   "0", // 6
  //   "540",
  //   "156", // 7
  //   "630",
  //   "312", // 8
  //   "720"
  // ];

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
  // string[36] internal combinedWallArray2 = [
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
  //   "180",
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

  constructor(SharedAssets sharedAssets, Machine machine) {
      _owner = msg.sender;
      _sharedAssets = sharedAssets;
      _machine = machine;
  }

  function setMetadata(Metadata metadata) public onlyOwner {
    _metadata = metadata;
  }

  // set the value of global flip to its opposite
  function changeGlobalFlip() public {
      globalFlip = !globalFlip;
  }

  // compose SVG
  function composeSVG(uint _tokenId) public view returns (string memory) {
    // objects behind the machine
    // machine
    // objects in front of the machine
    // string memory svgStart = CommonSVG.SVG_START;
    // // string memory script = "";
    // string memory script = CommonSVG.SCRIPT;
    // string memory style = CommonSVG.STYLE;
    // string memory shell = _sharedAssets.getShell();
    // start, script, style, shell
    string memory opening = CommonSVG.getOpeningSVG();
    
    string memory objects = composeObjects(_tokenId);
    string memory closing = CommonSVG.getClosingSVG();
    // return all svg's concatenated together and base64 encoded
    return Base64.encode(bytes(string.concat(opening, objects, closing)));
  }

  function composeObjects(uint _tokenId) internal view returns (string memory) {
    uint rWLength = GridHelper.getIndexesFromGrid(_metadata.getRWGrid(_tokenId)).length;
    uint lWLength = GridHelper.getIndexesFromGrid(_metadata.getLWGrid(_tokenId)).length;

    string[] memory objectList = GridHelper.combineStringArrays(GridHelper.getObjectsFromGrid(_metadata.getRWGrid(_tokenId)), GridHelper.combineStringArrays(GridHelper.getObjectsFromGrid(_metadata.getLWGrid(_tokenId)), GridHelper.getObjectsFromGrid(_metadata.getFGrid(_tokenId))));
    uint[] memory indexes = GridHelper.combineUintArrays(GridHelper.combineUintArrays(GridHelper.getIndexesFromGrid(_metadata.getRWGrid(_tokenId)), GridHelper.getIndexesFromGrid(_metadata.getLWGrid(_tokenId))), GridHelper.getIndexesFromGrid(_metadata.getFGrid(_tokenId)));
    string memory machine = _metadata.getMachine(_tokenId);
    bool leftAlign = _metadata.getLeftAligned(_tokenId);

    if (globalFlip) {
      leftAlign = !leftAlign;
    }

    string memory output;
    uint leftOffset = 0;
    uint rightOffset = 0;

    if (leftAlign) {
        leftOffset = 54;
    } else {
        rightOffset = 54;
    }

    for (uint256 i = 0; i < indexes.length; i++) {
      if (indexes[i] != 9) {
        output = string.concat(output, CommonSVG.G_TRANSFORM);
        // rw
        if (i < rWLength) {
          string memory floorX = string(GridHelper.slice(combinedWallArray, 6*indexes[i] + rightOffset, 3));
          string memory floorY = string(GridHelper.slice(combinedWallArray, 6*indexes[i] + rightOffset + 3, 3));
            output = string.concat(output, floorX, ",", floorY);
        // lw
        } else if (i < rWLength + lWLength) {
          string memory floorX = string(GridHelper.slice(combinedWallArray, 6*indexes[i] + leftOffset, 3));
          string memory floorY = string(GridHelper.slice(combinedWallArray, 6*indexes[i] + leftOffset + 3, 3));
          output = string.concat(output, floorX, ",", floorY);
        // floor
        } else {
          if (leftAlign) {
            // from 0, 6, 12 etc
            string memory floorX = string(GridHelper.slice(floorGridArray, 6*indexes[i], 3));
            // from 3, 9, 15 etc
            string memory floorY = string(GridHelper.slice(floorGridArray, 6*indexes[i] + 3, 3));
            output = string.concat(output, floorX, ",", floorY);
          } else {
            // from 0, 6, 12 etc
            string memory floorX = string(GridHelper.slice(altFloorGridArray, 6*indexes[i], 3));
            // from 3, 9, 15 etc
            string memory floorY = string(GridHelper.slice(altFloorGridArray, 6*indexes[i] + 3, 3));
            output = string.concat(output, floorX, ",", floorY);
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

  modifier onlyOwner() {
    require(msg.sender == _owner, "Only owner can call this function.");
    _;
  }
}
