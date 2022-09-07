// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./Helper.sol";

contract Compose {
    Helper.HTML private _html;

    string[] public folders = ["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"];

    uint256 public constant TOTAL_LAYERS = 6;
    uint256 public constant FLOOR_LAYERS = 2;

    constructor() {
        _html.baseURI = "https://anma.mypinata.cloud/ipfs/QmYSYKJrnZhFB3KUVXvWGimC7n39pscMMcqVWKvgqWqy4a/";
        _html
            .header = "<!DOCTYPE html> <html lang=''>  <meta charset='utf-8'>  <title>html-ipfs-test</title>  <head><style></style></head> <body> <canvas id='canvas'></canvas>";
        _html.script = "<script> var bw = 600; var bh = bw; const canvas = document.getElementById('canvas');const context = canvas.getContext('2d'); const gridArray = [    [bw * 0.333333, bh * 0.5],    [bw * 0.17, bh * 0.415],    [bw * 0.5, bh * 0.415],    [0, bh * 0.333333],    [bw * 0.33333, bh * 0.3333],    [bw * 0.66666, bh * 0.3333],    [bw * 0.17, bh * 0.25],    [bw * 0.5, bh * 0.25],    [bw * 0.33, bh * 0.175],]; canvas.width = bw+10; canvas.height = bh+10; function placeObject(obj, position){    const img = new Image();    img.src = `${obj}`;   img.onload = () => {context.drawImage(img, Math.round(gridArray[position][0]), Math.round(gridArray[position][1]), 200, 300)}};";
        _html.functionOpen = "placeObject('";
        _html.functionArgSeparator = "',";
        _html.fileExtension = ".png";
        _html.functionClose = ");";
        _html.footer = "</script> </body> </html> ";
    }

    // Placeholder function to place several floor images in the canvas element
    function composeHTML() public view returns (string memory) {
             string memory output = "";      
        for (uint256 i = 0; i < 4; i++) {
            output = string.concat(
                                    output,
                                    _html.functionOpen,
                                    _html.baseURI,
                                    folders[0],
                                    Strings.toString(i),
                                    _html.fileExtension,
                                    _html.functionArgSeparator,
                                    Strings.toString(i),
                                    _html.functionClose);
        }
        string memory finalOutput = Base64.encode(
            bytes(string.concat(_html.header, _html.script, output, _html.footer))
        );
        return finalOutput;
    }

    // Composes HTML string, populates with IPFS sourced image layers and base64 encode
    // function composeHTML(uint256[] memory positions, string[9] memory floor) public view returns (string memory) {
    //     string memory output = composeAllExceptFloor(positions);
    //     output = string.concat(composeFloor(floor));
    //     string memory output = Base64.encode(bytes(string.concat(_html.header, _html.scriptOpen, _html.scriptData, _html.scriptClose, _html.footer)));
    //     return output;
    // }

    // function composeAllExceptFloor(uint256[] memory positions) public view returns (string memory) {
    //     string memory output = _html.header;
    //     for (uint256 i = 0; i < (TOTAL_LAYERS - FLOOR_LAYERS); i++) {
    //         if (positions[TOTAL_LAYERS - i - 1] != 9) {
    //             output = string.concat(
    //                 output,
    //                 _html.imgOpen,
    //                 Strings.toString(i + 1),
    //                 _html.imgSrc,
    //                 _html.baseURI,
    //                 folders[TOTAL_LAYERS - i - 1],
    //                 Strings.toString(positions[TOTAL_LAYERS - i - 1]),
    //                 _html.imgClose
    //             );
    //         }
    //     }
    //     return output;
    // }

    // function composeFloor(string[9] memory floor) public view returns (string memory) {
    //     string[] memory floorLayers = new string[](FLOOR_LAYERS);
    //     uint256 count = 0;
    //     for (uint256 i = 0; i < floor.length; i++) {
    //         if (
    //             keccak256(abi.encodePacked(floor[i])) != keccak256(abi.encodePacked("")) &&
    //             keccak256(abi.encodePacked(floor[i])) != keccak256(abi.encodePacked("x"))
    //         ) {
    //             floorLayers[count] = string.concat(floor[i], Strings.toString(i));
    //             count++;
    //         }
    //     }

    //     string memory output;
    //     for (uint256 i = 0; i < count; i++) {
    //         output = string.concat(
    //             output,
    //             _html.imgOpen,
    //             Strings.toString(TOTAL_LAYERS - FLOOR_LAYERS + i + 1),
    //             _html.imgSrc,
    //             _html.baseURI,
    //             "f/",
    //             floorLayers[count - i - 1],
    //             _html.imgClose
    //         );
    //     }

    //     return output;
    // }

    // function to update html baseURI
    function updateBaseURI(string memory baseURI) public {
        _html.baseURI = baseURI;
    }
}
