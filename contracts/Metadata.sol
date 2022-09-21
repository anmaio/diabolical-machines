// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "hardhat/console.sol";
import "./Compose.sol";

contract Metadata is Ownable {
    Compose private _compose;

    string[] public floorTraits = ["altar", "props"];
    uint256[] public floorProbabilities = [100, 100];
    string[] public leftWallTraits = ["frame"];
    uint256[] public leftWallProbabilities = [100];
    string[] public rightWallTraits = ["frame", "clock"];
    uint256[] public rightWallProbabilities = [100, 100];

    uint256 public constant MAX_GRID_INDEX = 8;
    uint256 public constant NUMBER_OF_SHELLS = 6;

    // tokenId -> [position]
    mapping(uint256 => uint256[]) public traitPositions;

    mapping(uint256 => string[9]) public tokenToFloorPositions;
    mapping(uint256 => string[9]) public tokenToLeftWallPositions;
    mapping(uint256 => string[9]) public tokenToRightWallPositions;

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

    // tokenId and initial traits emmitted when a nft is minted
    event InitialTraitValuesSet(uint256 tokenId, uint256[] traitIndexes);

    constructor(Compose compose) {
        _compose = compose;
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

    // will only be called on mint
    function generateFloorPositions(uint256 _tokenId, uint256 rand) public returns (uint256 newRand) {
        // start with an empty grid
        string[9] memory newGrid = emptyGrid;
        for (uint256 i = 0; i < floorTraits.length; i++) {
            uint256 probability = rand % 100;
            uint256 index = 9;
            if (probability < floorProbabilities[i]) {
                uint256 position = rand % 9;
                (newGrid, index) = pickPosition(newGrid, floorTraits[i], position);
            }
            rand = rand / 100;
            traitPositions[_tokenId].push(index);
        }
        tokenToFloorPositions[_tokenId] = newGrid;
        return rand;
    }

    // will only be called on mint
    function generateleftWallPositions(uint256 _tokenId, uint256 rand) public returns (uint256 newRand) {
        // start with an empty grid
        string[9] memory newGrid = noRow1Grid;
        for (uint256 i = 0; i < leftWallTraits.length; i++) {
            uint256 probability = rand % 100;
            uint256 index = 9;
            if (probability < leftWallProbabilities[i]) {
                // cannot go on the bottom row of the wall
                uint256 position = (rand % 6) + 3;
                (newGrid, index) = pickPosition(newGrid, leftWallTraits[i], position);
            }
            rand = rand / 100;
            traitPositions[_tokenId].push(index);
        }
        tokenToLeftWallPositions[_tokenId] = newGrid;
        return rand;
    }

    // will only be called on mint
    function generaterightWallPositions(uint256 _tokenId, uint256 rand) public returns (uint256 newRand) {
        // start with an empty grid
        string[9] memory newGrid = noRow1Grid;
        for (uint256 i = 0; i < rightWallTraits.length; i++) {
            uint256 probability = rand % 100;
            uint256 index = 9;
            if (probability < rightWallProbabilities[i]) {
                // cannot go on the bottom row of the wall
                uint256 position = (rand % 6) + 3;
                (newGrid, index) = pickPosition(newGrid, rightWallTraits[i], position);
            }
            rand = rand / 100;
            traitPositions[_tokenId].push(index);
        }
        tokenToRightWallPositions[_tokenId] = newGrid;
        return rand;
    }

    // isolated to function in case we want to change the logic later
    function selectShell(uint256 _tokenId, uint256 rand) public returns (uint256 newRand) {
        traitPositions[_tokenId].push(rand % NUMBER_OF_SHELLS);
        rand = rand / NUMBER_OF_SHELLS;
        return rand;
    }

    function generateAllPositions(uint256 _tokenId, uint rand) public {
        // rand = selectShell(_tokenId, rand);
        traitPositions[_tokenId].push(8);
        rand = generaterightWallPositions(_tokenId, rand);
        rand = generateleftWallPositions(_tokenId, rand);
        rand = generateFloorPositions(_tokenId, rand);
        emit InitialTraitValuesSet(_tokenId, traitPositions[_tokenId]);
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

    // get the floor grid for a given tokenId
    function getFloorPositions(uint256 _tokenId) public view returns (string[9] memory grid) {
        return tokenToFloorPositions[_tokenId];
    }

    // get the wall1 grid for a given tokenId
    function getleftWallPositions(uint256 _tokenId) public view returns (string[9] memory grid) {
        return tokenToLeftWallPositions[_tokenId];
    }

    // get the wall2 grid for a given tokenId
    function getrightWallPositions(uint256 _tokenId) public view returns (string[9] memory grid) {
        return tokenToRightWallPositions[_tokenId];
    }

    //["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"]
    // Function build metadata for a given token
    function buildMetadata(uint256 _tokenId) public view returns (string memory) {
        string memory jsonInitial = string.concat(
            '{"name": "Clifford # ',
            Strings.toString(_tokenId),
            '", "description": "Clifford nft description", "attributes": [{"trait_type": "Shell", "value":"',
            Strings.toString(traitPositions[_tokenId][0]),
            '"}, {"trait_type": "Right Frame", "value":"',
            Strings.toString(traitPositions[_tokenId][1]),
            '"}, {"trait_type": "Right Clock", "value":"',
            Strings.toString(traitPositions[_tokenId][2]),
            '"}, {"trait_type": "Left Frame", "value":"',
            Strings.toString(traitPositions[_tokenId][3]),
            '"}, {"trait_type": "Altar", "value":"',
            Strings.toString(traitPositions[_tokenId][4]),
            '"}, {"trait_type": "Props", "value":"',
            Strings.toString(traitPositions[_tokenId][5]),
            '"}],'
        );

        string memory jsonFinal = Base64.encode(
            bytes(
                string.concat(
                    jsonInitial,
                    '"image": "',
                    _imageURI,
                    Strings.toString(_tokenId),
                    '.png", "animation_url": "data:text/html;base64,',
                    // _compose.composeHTML(),
                    _compose.composeHTML(traitPositions[_tokenId]),
                    '"}'
                )
            )
        );

        string memory output = string.concat("data:application/json;base64,", jsonFinal);
        return output;
    }
}