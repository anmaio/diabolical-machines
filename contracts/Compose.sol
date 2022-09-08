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
    uint256 public constant RIGHT_WALL_OBJECTS = 2;
    uint256 public constant LEFT_WALL_OBJECTS = 1;
    

    constructor() {
        // _html.baseURI = "https://anma.mypinata.cloud/ipfs/QmYSYKJrnZhFB3KUVXvWGimC7n39pscMMcqVWKvgqWqy4a/";
        _html.baseURI = "https://anma.mypinata.cloud/ipfs/QmfXLhvWWb6oA2eY3iCwZewPNJzcDyXKnYmhNo6kjex97o/";
        _html
            .header = "<!DOCTYPE html> <html lang=''>  <meta charset='utf-8'>  <title>html-ipfs-test</title>  <head><style></style></head> <body> <canvas id='canvas'></canvas>";
        _html
            .script = "<script> var bw = 600; var bh = bw;let sqW = bw / 6;let sqH = bh / 6; const canvas = document.getElementById('canvas');const context = canvas.getContext('2d'); const floorGridArray = [    [bw * 0.333333, bh * 0.5],    [bw * 0.5, bh * 0.416],    [bw * 0.66666, bh * 0.3333],    [bw * 0.17, bh * 0.415],    [bw * 0.33333, bh * 0.3333],    [bw * 0.5, bh * 0.25],    [0, bh * 0.333333],    [bw * 0.17, bh * 0.25],    [bw * 0.33333333333333, bh * 0.169]];const leftWallGridArray = [    [0, bh * 0.5],    [bw * 0.16666, bh * 0.416666],    [bw * 0.333333, bh * 0.33333],    [0, bh * 0.3333],    [bw * 0.16666, bh * 0.25],    [bw * 0.333333, bh * 0.16666],    [0, bh * 0.16666],    [bw * 0.16666, bh * 0.08333],    [bw * 0.33333, 0]]; const rightWallGridArray = [    [bw * 0.5, bh * 0.33333],    [bw * 0.66666, bh * 0.416666],    [bw * 0.83333, bh * 0.5],    [bw * 0., bh * 0.166666],    [bw * 0.66666, bh * 0.25],    [bw * 0.83333, bh * 0.33333],    [bw * 0.5, 0],    [bw * 0.66666, bh * 0.083333],    [bw  * 0.83333, bh * 0.16666]]; canvas.width = bw+10; canvas.height = bh+10; function placeObject(obj, position){    const img = new Image();    img.src = `${obj}`;   img.onload = () => {context.drawImage(img, Math.round(gridArray[position][0]), Math.round(gridArray[position][1]), 200, 300)}};function placeFloorObject(obj, position) {const img = new Image(); img.src = `${obj}`; img.onload = () => { context.drawImage(img, Math.round(floorGridArray[position][0]), Math.round(floorGridArray[position][1]), sqW * 2, sqH * 3); }}function placeLeftWallObject(obj, position) {const img = new Image(); img.src = `${obj}`;  img.onload = () => {context.drawImage(img, Math.round(leftWallGridArray[position][0]), Math.round(leftWallGridArray[position][1]), sqW * 2, sqH * 2);  }}function placeRightWallObject(obj, position) { const img = new Image(); img.src = `${obj}`; img.onload = () => { context.drawImage(img, Math.round(rightWallGridArray[position][0]), Math.round(rightWallGridArray[position][1]), sqW * 2, sqH * 2);  }}";
        _html.functionFloorOpen = "placeFloorObject('";
        _html.functionRightWallOpen = "placeRightWallObject('";
        _html.functionLeftWallOpen = "placeLeftWallObject('";
        _html.functionShellOpen = "placeLeftWallObject('";
        _html.functionArgSeparator = "',";
        _html.fileExtension = ".png";
        _html.functionClose = ");";
        _html.footer = "</script> </body> </html> ";
    }

    // Composes HTML string, populates with IPFS sourced image layers and base64 encode
    function composeHTML(uint256[] memory positions, string[9] memory floor) public view returns (string memory) {
        string memory output = composeAllExceptFloor(positions);
        output = string.concat(output, composeFloor(floor));
        output = Base64.encode(bytes(string.concat(_html.header, _html.script, output, _html.footer)));
        return output;
    }

    function composeAllExceptFloor(uint256[] memory positions) public view returns (string memory) {
        string memory output = "";
        for (uint256 i = 0; i < (TOTAL_LAYERS - FLOOR_LAYERS); i++) {
            uint256 object = positions[TOTAL_LAYERS - i - 1];
            string memory functionOpen;
            if (object != 9) {
                if (i == 0) {
                    functionOpen = _html.functionShellOpen;
                } else if (i <= RIGHT_WALL_OBJECTS) {
                    functionOpen = _html.functionRightWallOpen;
                } else {
                    functionOpen = _html.functionLeftWallOpen;
                }
                output = string.concat(
                    output,
                    functionOpen,
                    _html.baseURI,
                    folders[TOTAL_LAYERS - i - 1],
                    _html.fileExtension,
                    _html.functionArgSeparator,
                    Strings.toString(positions[TOTAL_LAYERS - i - 1]),
                    _html.functionClose
                );
            }
        }
        return output;
    }

    function composeFloor(string[9] memory floor) public view returns (string memory) {
        string[] memory floorLayers = new string[](FLOOR_LAYERS);
        uint256 count = 0;
        for (uint256 i = 0; i < floor.length; i++) {
            if (
                keccak256(abi.encodePacked(floor[i])) != keccak256(abi.encodePacked("")) &&
                keccak256(abi.encodePacked(floor[i])) != keccak256(abi.encodePacked("x"))
            ) {
                floorLayers[count] = string.concat(floor[i]);
                count++;
            }
        }

        string memory output = "";
        for (uint256 i = 0; i < count; i++) {
            output = string.concat(
                output,
                _html.functionFloorOpen,
                _html.baseURI,
                "f/",
                floorLayers[count - i - 1],
                _html.fileExtension,
                _html.functionArgSeparator,
                Strings.toString(i),
                _html.functionClose
            );
        }

        return output;
    }

    // function to update html baseURI
    function updateBaseURI(string memory baseURI) public {
        _html.baseURI = baseURI;
    }

   
}
