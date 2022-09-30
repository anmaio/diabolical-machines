// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "hardhat/console.sol";
import "./Compose.sol";
import "./VRFv2Consumer.sol";

contract Metadata is Ownable {
    Compose private _compose;
    VRFv2Consumer private _VRF;

    string[] public floorTraits = ["altar", "props"];
    uint256[] public floorProbabilities = [100, 100];
    string[] public leftWallTraits = ["frame"];
    uint256[] public leftWallProbabilities = [100];
    string[] public rightWallTraits = ["frame", "clock"];
    uint256[] public rightWallProbabilities = [100, 100];

    uint256 public constant MAX_GRID_INDEX = 8;
    uint256 public constant NUMBER_OF_SHELLS = 6;
    uint256 public constant NUM_OF_TRAITS = 6;

    // tokenId -> [position]
    mapping(uint256 => uint256[]) public traitPositions;

    string[9] public emptyGrid;

    string[9] public noRow1Grid = ["x", "x", "x", "", "", "", "", "", ""];
    string[9] public leftWallPositions;
    string[9] public rightWallPositions;

    // A grid might look like this:
    // string[9] public exampleGrid = [
    //     "x", "x", "x",
    //     "clock", "", "",
    //     "", "", "frame"
    // ];

    // storage image base uri
    string private _imageURI = "https://bepocdevukssaoutput.blob.core.windows.net/output/";

    constructor(Compose compose) {
        _compose = compose;
    }

    // set vrf consumer
    function setVRFConsumer(VRFv2Consumer vrf) public onlyOwner {
        _VRF = vrf;
    }

    function pickPosition(
        string[9] memory grid,
        string memory object,
        uint256 rand
    ) public pure returns (string[9] memory newGrid, uint256 index) {
        // require the grid not to be full
        require(!isGridFull(grid), "Grid is full");
        // loop through the grid until a position is found that is not taken
        for (uint256 i = 0; i < grid.length; i++) {
            if (keccak256(abi.encodePacked(grid[rand])) == keccak256(abi.encodePacked(""))) {
                grid[rand] = object;
                return (grid, rand);
            }
            rand = (rand + 1) % grid.length;
        }
        // return invalid index if no position is found
        return (grid, MAX_GRID_INDEX + 1);
    }

    // selecting the walls and floor could be moved into the same function
    // probably only worth doing if we get a stack too deep error

    // alternative to generateRightWallPositions
    function getRWPositions(uint256 _tokenId) public view returns (uint256[] memory) {
        uint256 uintVrf = _VRF.getNumberFromId(_tokenId);
        bytes memory vrf = uintToBytes(uintVrf);
        vrf = slice(vrf, 1, rightWallTraits.length * 2);
        uint256 rand = uint256(keccak256(vrf));
        // start with an empty grid
        string[9] memory newGrid = noRow1Grid;
        uint256[] memory viewTraitPositons = new uint256[](rightWallTraits.length);
        for (uint256 i = 0; i < rightWallTraits.length; i++) {
            uint256 probability = rand % 100;
            uint256 index = 9;
            if (probability < rightWallProbabilities[i]) {
                // cannot go on the bottom row of the wall
                uint256 position = (rand % 6) + 3;
                (newGrid, index) = pickPosition(newGrid, rightWallTraits[i], position);
            }
            rand = rand / 100;
            viewTraitPositons[i] = index;
        }
        return viewTraitPositons;
    }

    // alternative to generateLeftWallPositions
    function getLWPositions(uint256 _tokenId) public view returns (uint256[] memory) {
        uint256 uintVrf = _VRF.getNumberFromId(_tokenId);
        bytes memory vrf = uintToBytes(uintVrf);
        vrf = slice(vrf, 1 + rightWallTraits.length * 2, leftWallTraits.length * 2);
        uint256 rand = uint256(keccak256(vrf));
        // start with an empty grid
        string[9] memory newGrid = noRow1Grid;
        uint256[] memory viewTraitPositons = new uint256[](leftWallTraits.length);
        for (uint256 i = 0; i < leftWallTraits.length; i++) {
            uint256 probability = rand % 100;
            uint256 index = 9;
            if (probability < leftWallProbabilities[i]) {
                // cannot go on the bottom row of the wall
                uint256 position = (rand % 6) + 3;
                (newGrid, index) = pickPosition(newGrid, leftWallTraits[i], position);
            }
            rand = rand / 100;
            viewTraitPositons[i] = index;
        }
        return viewTraitPositons;
    }

    // alternative to generateFloorPositions
    function getFPositions(uint256 _tokenId) public view returns (uint256[] memory) {
        uint256 uintVrf = _VRF.getNumberFromId(_tokenId);
        bytes memory vrf = uintToBytes(uintVrf);
        vrf = slice(vrf, 1 + rightWallTraits.length * 2 + leftWallTraits.length * 2, floorTraits.length * 2);
        uint256 rand = uint256(keccak256(vrf));
        // start with an empty grid
        string[9] memory newGrid = emptyGrid;
        uint256[] memory viewTraitPositons = new uint256[](floorTraits.length);
        for (uint256 i = 0; i < floorTraits.length; i++) {
            uint256 probability = rand % 100;
            uint256 index = 9;
            if (probability < floorProbabilities[i]) {
                uint256 position = rand % 9;
                (newGrid, index) = pickPosition(newGrid, floorTraits[i], position);
            }
            rand = rand / 100;
            viewTraitPositons[i] = index;
        }
        return viewTraitPositons;
    }

    // slice array of bytes
    function slice(
        bytes memory data,
        uint256 start,
        uint256 len
    ) internal pure returns (bytes memory) {
        bytes memory b = new bytes(len);
        for (uint256 i = 0; i < len; i++) {
            b[i] = data[i + start];
        }
        return b;
    }

    // check a given grid is not full
    function isGridFull(string[9] memory grid) public pure returns (bool) {
        for (uint256 i = 0; i < grid.length; i++) {
            if (keccak256(abi.encodePacked(grid[i])) == keccak256(abi.encodePacked(""))) {
                return false;
            }
        }
        return true;
    }

    function uintToBytes(uint256 x) public pure returns (bytes memory b) {
        b = new bytes(32);
        assembly {
            mstore(add(b, 32), x)
        } //  first 32 bytes = length of the bytes value
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

    // alternative selctShell
    function getShell() public pure returns (uint256[] memory shellNumber) {
        uint256 shell = 8;
        uint256[] memory shellArray = new uint256[](1);
        shellArray[0] = shell;
        return shellArray;
    }

    // get all indexes for a given tokenId by combining arrays
    function getIndexes(uint256 _tokenId) public view returns (uint256[] memory indexes) {
        uint256[] memory allIndexes = combineUintArrays(
            getRWPositions(_tokenId),
            combineUintArrays(getLWPositions(_tokenId), getFPositions(_tokenId))
        );
        return allIndexes;
    }

    //["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"]
    // Function build metadata for a given token
    function buildMetadata(uint256 _tokenId) public view returns (string memory) {
        string memory jsonInitial = string.concat(
            '{"name": "Clifford # ',
            Strings.toString(_tokenId),
            '", "description": "Clifford nft description", "attributes": [{"trait_type": "Right Frame", "value":"',
            Strings.toString(getRWPositions(_tokenId)[0]),
            '"}, {"trait_type": "Right Clock", "value":"',
            Strings.toString(getRWPositions(_tokenId)[1]),
            '"}, {"trait_type": "Left Frame", "value":"',
            Strings.toString(getLWPositions(_tokenId)[0]),
            '"}, {"trait_type": "Altar", "value":"',
            Strings.toString(getFPositions(_tokenId)[0]),
            '"}, {"trait_type": "Props", "value":"',
            Strings.toString(getFPositions(_tokenId)[1]),
            '"}],',
            '"image": "',
            _imageURI,
            Strings.toString(_tokenId),
            '.png", "animation_url": "data:text/html;base64,'
        );

        string memory jsonFinal = Base64.encode(
            bytes(string.concat(jsonInitial, _compose.composeSVG(getIndexes(_tokenId)), '"}'))
        );

        string memory output = string.concat("data:application/json;base64,", jsonFinal);
        return output;
    }
}
