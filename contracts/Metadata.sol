// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "hardhat/console.sol";
import "./Compose.sol";

contract Metadata is Ownable {
    Compose private _compose;

    string[] public floorTraits = ["altar", "props"];
    uint[] public floorProbabilities = [100, 50];
    string[] public wall1Traits = ["frame"];
    uint[] public wall1Probabilities = [100];
    string[] public wall2Traits = ["frame", "clock"];
    uint[] public wall2Probabilities = [50, 100];

    uint public constant MAX_GRID_INDEX = 8;
    uint public constant NUMBER_OF_SHELLS = 6;

    // tokenId -> [position]
    mapping(uint => uint[]) public traitPositions;

    mapping(uint => string[9]) public tokenToFloorPositions;
    mapping(uint => string[9]) public tokenToWall1Positions;
    mapping(uint => string[9]) public tokenToWall2Positions;

    string[9] public emptyGrid;

    string[9] public noRow1Grid = [
        "x", "x", "x",
        "", "", "",
        "", "", ""
    ];
    string[9] public wall1Positions;
    string[9] public wall2Positions;

    // A grid might look like this:
    // string[9] public exampleGrid = [
    //     "x", "x", "x",
    //     "clock", "", "",
    //     "", "", "frame"
    // ];

    // storage image base uri
    string private _imageURI = "https://bepocdevukssaoutput.blob.core.windows.net/output/";

    // tokenId and initial traits emmitted when a nft is minted
    event InitialTraitValuesSet(uint256 tokenId, uint[] traitIndexes);

    constructor(Compose compose) {
        _compose = compose;
    }

    function pickPosition(string[9] memory grid, string memory object, uint rand) public pure returns(string[9] memory newGrid, uint index) {
        // require the grid not to be full
        require(!isGridFull(grid), "Grid is full");
        // loop through the grid until a position is found that is not taken
        for (uint i = 0; i < grid.length; i++) {
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
    function generateFloorPositions(uint _tokenId, uint rand) public returns (uint newRand) {
        // start with an empty grid
        string[9] memory newGrid = emptyGrid;
        for (uint i = 0; i < floorTraits.length; i++) {
            uint probability = rand % 100;
            uint index = 9;
            if (probability < floorProbabilities[i]) {
                uint position = rand % 9;
                (newGrid, index) = pickPosition(newGrid, floorTraits[i], position);
            }
            rand  = rand / 100;
            traitPositions[_tokenId].push(index);
        }
        tokenToFloorPositions[_tokenId] = newGrid;
        return rand;
    }

    // will only be called on mint
    function generateWall1Positions(uint _tokenId, uint rand) public returns (uint newRand) {
        // start with an empty grid
        string[9] memory newGrid = noRow1Grid;
        for (uint i = 0; i < wall1Traits.length; i++) {
            uint probability = rand % 100;
            uint index = 9;
            if (probability < wall1Probabilities[i]) {
                // cannot go on the bottom row of the wall
                uint position = (rand % 6) + 3;
                (newGrid, index) = pickPosition(newGrid, wall1Traits[i], position);
            }
            rand  = rand / 100;
            traitPositions[_tokenId].push(index);
        }
        tokenToWall1Positions[_tokenId] = newGrid;
        return rand;
    }

    // will only be called on mint
    function generateWall2Positions(uint _tokenId, uint rand) public returns (uint newRand) {
        // start with an empty grid
        string[9] memory newGrid = noRow1Grid;
        for (uint i = 0; i < wall2Traits.length; i++) {
            uint probability = rand % 100;
            uint index = 9;
            if (probability < wall2Probabilities[i]) {
                // cannot go on the bottom row of the wall
                uint position = (rand % 6) + 3;
                (newGrid, index) = pickPosition(newGrid, wall2Traits[i], position);
            }
            rand  = rand / 100;
            traitPositions[_tokenId].push(index);
        }
        tokenToWall2Positions[_tokenId] = newGrid;
        return rand;
    }

    // isolated to function in case we want to change the logic later
    function selectShell(uint _tokenId, uint rand) public {
        traitPositions[_tokenId].push(rand % NUMBER_OF_SHELLS);
    }

    function generateAllPositions(uint _tokenId) public {
        uint rand = randomNumber();
        rand = generateFloorPositions(_tokenId, rand);
        rand = generateWall1Positions(_tokenId, rand);
        rand = generateWall2Positions(_tokenId, rand);
        selectShell(_tokenId, rand);
        emit InitialTraitValuesSet(_tokenId, traitPositions[_tokenId]);
    }

    // pseudo random number between min and max
    function randomNumberRange(uint min, uint max) public view returns (uint) {
        return min + (uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % (max - min + 1));
    }

    // Function to generate pseudo random number
    function randomNumber() public view returns (uint256) {
        uint256 number = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)));
        return number;
    }

    // check a given grid is not full
    function isGridFull(string[9] memory grid) public pure returns (bool) {
        for (uint i = 0; i < grid.length; i++) {
            if (keccak256(abi.encodePacked(grid[i])) == keccak256(abi.encodePacked(""))) {
                return false;
            }
        }
        return true;
    }

    // get the floor grid for a given tokenId
    function getFloorPositions(uint _tokenId) public view returns (string[9] memory grid) {
        return tokenToFloorPositions[_tokenId];
    }

    // get the wall1 grid for a given tokenId
    function getWall1Positions(uint _tokenId) public view returns (string[9] memory grid) {
        return tokenToWall1Positions[_tokenId];
    }

    // get the wall2 grid for a given tokenId
    function getWall2Positions(uint _tokenId) public view returns (string[9] memory grid) {
        return tokenToWall2Positions[_tokenId];
    }
//["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"]
    // Function build metadata for a given token
    function buildMetadata(uint256 _tokenId) public view returns (string memory) {
        string memory jsonInitial = string.concat(
            '{"name": "Clifford # ',
            Strings.toString(_tokenId),
            '", "description": "Clifford nft description", "attributes": [{"trait_type": "Altar, "value":"',
            Strings.toString(traitPositions[_tokenId][0]),
            '"}, {"trait_type": "Props", "value":"',
            Strings.toString(traitPositions[_tokenId][1]),
            '"}, {"trait_type": "Left Frame", "value":"',
            Strings.toString(traitPositions[_tokenId][2]),
            '"}, {"trait_type": "Right Frame", "value":"',
            Strings.toString(traitPositions[_tokenId][3]),
            '"}, {"trait_type": "Clock", "value":"',
            Strings.toString(traitPositions[_tokenId][4]),
            '"}, {"trait_type": "Shell", "value":"',
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
                    _compose.composeHTML(traitPositions[_tokenId], tokenToFloorPositions[_tokenId]),
                    '"}'
                )
            )
        );

        string memory output = string.concat("data:application/json;base64,", jsonFinal);
        return output;
    }
}