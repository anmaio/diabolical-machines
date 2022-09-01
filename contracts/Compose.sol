// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./Helper.sol";

contract Compose {
    Helper.HTML private _html;

    string[] public folders = ["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"];

    uint public constant TOTAL_LAYERS = 6;
    uint public constant FLOOR_LAYERS = 2;

    constructor() {
        _html.baseURI = "https://anma.mypinata.cloud/ipfs/QmYSYKJrnZhFB3KUVXvWGimC7n39pscMMcqVWKvgqWqy4a/";
        _html
            .header = "<!DOCTYPE html> <html lang=''>  <meta charset='utf-8'>  <title>html-ipfs-test</title>  <head><style>img{position:absolute;top: 0px;left: 0px; height:100vh;}#layer1{z-index: 10;}#layer2{z-index: 20;}#layer3{z-index: 30;}#layer4{z-index: 40;}#layer5{z-index: 50;}#layer6{z-index: 60;}#layer7{z-index: 70;}</style></head> <body> <canvas id='c'></canvas>";
        _html.imgOpen = "<img id='layer";
        _html.imgSrc = "' src='";
        _html.imgClose = ".png'/>";
        _html.footer = "</body> </html>";
    }

    // Composes HTML string, populates with IPFS sourced image layers and base64 encode
    function composeHTML(uint[] memory positions, string[9] memory floor) public view returns (string memory) {
        string memory output = composeAllExceptFloor(positions);
        output = string.concat(output, composeFloor(floor));
        output = Base64.encode(bytes(string.concat(output, _html.footer)));
        return output;
    }

    function composeAllExceptFloor(uint[] memory positions) public view returns (string memory) {
        string memory output = _html.header;
        for (uint256 i = 0; i < (TOTAL_LAYERS - FLOOR_LAYERS); i++) {
            if (positions[TOTAL_LAYERS - i - 1] != 9) {
                output = string.concat(
                    output,
                    _html.imgOpen,
                    Strings.toString(i + 1),
                    _html.imgSrc,
                    _html.baseURI,
                    folders[TOTAL_LAYERS - i - 1],
                    Strings.toString(positions[TOTAL_LAYERS - i - 1]),
                    _html.imgClose
                );
            }
        }
        return output;
    }

    function composeFloor(string[9] memory floor) public view returns (string memory) {
        string[] memory floorLayers = new string[](FLOOR_LAYERS);
        uint count = 0;
        for (uint256 i = 0; i < floor.length; i++) {
            if (keccak256(abi.encodePacked(floor[i])) != keccak256(abi.encodePacked("")) && keccak256(abi.encodePacked(floor[i])) != keccak256(abi.encodePacked("x"))) {
                floorLayers[count] = string.concat(floor[i], Strings.toString(i));
                count++;
            }
        }

        string memory output;
        for (uint256 i = 0; i < count; i++) {
            
                output = string.concat(
                    output,
                    _html.imgOpen,
                    Strings.toString(TOTAL_LAYERS - FLOOR_LAYERS + i + 1),
                    _html.imgSrc,
                    _html.baseURI,
                    "f/",
                    floorLayers[count - i - 1],
                    _html.imgClose
                );
        }

        return output;
    }

    // function to update html baseURI
    function updateBaseURI(string memory baseURI) public {
        _html.baseURI = baseURI;
    }
}
