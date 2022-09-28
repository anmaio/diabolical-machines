// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./Helper.sol";

contract Compose {
    Helper.HTML private _html;

    string[] public folders = ["s/shell", "r/frame", "r/clock", "l/frame", "f/altar", "f/props"];
    string[] public folderFunctions = [
        ", f: 'placeShellObject', u: '",
        ", f: 'placeRightWallObject', u: '",
        ", f: 'placeRightWallObject', u: '",
        ", f: 'placeLeftWallObject', u: '",
        ", f: 'placeFloorObject', u: '",
        ", f: 'placeFloorObject', u: '"
    ];

    constructor() {
        // _html.baseURI = "https://anma.mypinata.cloud/ipfs/QmYSYKJrnZhFB3KUVXvWGimC7n39pscMMcqVWKvgqWqy4a/";
        _html.baseURI = "https://anma.mypinata.cloud/ipfs/QmfXLhvWWb6oA2eY3iCwZewPNJzcDyXKnYmhNo6kjex97o/";
        _html
            .header = "<!DOCTYPE html><html lang=''><head><meta charset='UTF-8'><title>html-ipfs-test</title><style></style></head><body><canvas id='canvas'></canvas>";
        _html
            .script = "<script>var bw=600; var bh=bw; var sqW=bw / 6; var sqH=bh / 6; const canvas=document.getElementById('canvas'); const context=canvas.getContext('2d'); const shellObjectArray=[ [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]; const floorGridArray=[ [bw * 0.333333, bh * 0.5], [bw * 0.5, bh * 0.427], [bw * 0.66666, bh * 0.35333], [bw * 0.17, bh * 0.427], [bw * 0.333333, bh * 0.35333], [bw * 0.5, bh * 0.28], [2, bh * 0.35333], [bw * 0.17, bh * 0.28], [bw * 0.333333, bh * 0.206668]]; const leftWallGridArray=[ [2, bh * 0.5], [bw * 0.16666, bh * 0.416666], [bw * 0.3333333, bh * 0.353333], [2, bh * 0.35333], [bw * 0.16666, bh * 0.25], [bw * 0.3333333, bh * 0.16666], [2, bh * 0.144], [2+ bw * 0.16666, bh * 0.074], [2+ bw * 0.333333, 0.06999999999999999]]; const rightWallGridArray=[ [bw * 0.5, bh * 0.353333], [bw * 0.66666, bh * 0.416666], [bw * 0.83333, bh * 0.5], [bw * 0.5, bh * 0.166666], [bw * 0.66666, bh * 0.25], [bw * 0.83333, bh * 0.353333], [bw * 0.5, 0], [bw * 0.66666, bh * 0.083333], [bw * 0.83333, bh * 0.16666]]; canvas.width=bw + 10; canvas.height=bh + 10; function placeShellObject(id, position){var img=data.filter(o=> o.id==id)[0].b; context.drawImage(img, (shellObjectArray[position][0]), (shellObjectArray[position][1]), sqW * 6, sqH * 6);}; function placeFloorObject(id, position){var img=data.filter(o=> o.id==id)[0].b; context.drawImage(img, (floorGridArray[position][0]), (floorGridArray[position][1]), sqW * 2, sqH * 3);}function placeLeftWallObject(id, position){var img=data.filter(o=> o.id==id)[0].b; context.drawImage(img, (leftWallGridArray[position][0]), (leftWallGridArray[position][1]), sqW * 2, sqH * 2);}function placeRightWallObject(id, position){var img=data.filter(o=> o.id==id)[0].b; context.drawImage(img, (rightWallGridArray[position][0]), (rightWallGridArray[position][1]), sqW * 2, sqH * 2);}function run(){var k=0; for (var i in data){var a=data[i]; k++; window[a.f](a.id,a.p);}}function prepare(){data=data.filter(o=> o.f !='placeFloorObject').sort((a, b)=> b.p - a.p).concat(data.filter(o=> o.f=='placeFloorObject').sort((a, b)=> b.p - a.p)); let k=0; for (let i in data){let asset=data[i]; const img=new Image(); img.id=asset.id; img.src=asset.u; img.onload=()=>{k++; data.filter(obj=> obj.id==img.id)[0].b=img; if (k==data.length){setTimeout(run, 60)}}}}var data=[ ";
        // _html.script = "<script> var bw = 600; var bh = bw;let sqW = bw / 6;let sqH = bh / 6; const canvas = document.getElementById('canvas');const context = canvas.getContext('2d');const shellObjectArray = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]; const floorGridArray = [    [bw * 0.333333, bh * 0.5],    [bw * 0.5, bh * 0.427],    [bw * 0.66666, bh * 0.35333],    [bw * 0.17, bh * 0.427],    [bw * 0.333333, bh * 0.35333],    [bw * 0.5, bh * 0.28],    [2, bh * 0.35333],    [bw * 0.17, bh * 0.28],    [bw * 0.333333, bh * 0.206668]];const leftWallGridArray = [    [2, bh * 0.5],    [bw * 0.16666, bh * 0.416666],    [bw * 0.3333333, bh * 0.353333],    [2, bh * 0.35333],    [bw * 0.16666, bh * 0.25],    [bw * 0.3333333, bh * 0.16666],    [2, bh * 0.144],    [2+ bw * 0.16666, bh * 0.074],    [2+ bw * 0.333333, 0.06999999999999999]]; const rightWallGridArray = [    [bw * 0.5, bh * 0.353333],    [bw * 0.66666, bh * 0.416666],    [bw * 0.83333, bh * 0.5],    [bw * 0.5, bh * 0.166666],    [bw * 0.66666, bh * 0.25],    [bw * 0.83333, bh * 0.353333],    [bw * 0.5, 0],    [bw * 0.66666, bh * 0.083333],    [bw  * 0.83333, bh * 0.16666]]; canvas.width = bw+10; canvas.height = bh+10; function placeShellObject(id, position) { let img = data.filter(o => o.id == id)[0].b; context.drawImage(img, (shellObjectArray[position][0]), (shellObjectArray[position][1]), sqW * 6, sqH * 6); }; function placeFloorObject(id, position) { let img = data.filter(o => o.id == id)[0].b; context.drawImage(img, (floorGridArray[position][0]), (floorGridArray[position][1]), sqW * 2, sqH * 3); } function placeLeftWallObject(id, position) { let img = data.filter(o => o.id == id)[0].b; context.drawImage(img, (leftWallGridArray[position][0]), (leftWallGridArray[position][1]), sqW * 2, sqH * 2); } function placeRightWallObject(id, position) { let img = data.filter(o => o.id == id)[0].b; context.drawImage(img, (rightWallGridArray[position][0]), (rightWallGridArray[position][1]), sqW * 2, sqH * 2); } function run() { let k = 0; for (let i in data) { let a = data[i]; k++; window[a.f](a.id,a.p); } } function prepare() { data = data.filter(o => o.f != 'placeFloorObject').sort((a, b) => b.p - a.p).concat(data.filter(o => o.f == 'placeFloorObject').sort((a, b) => b.p - a.p)) let k = 0; for (let i in data) { let asset = data[i] const img = new Image(); img.id = asset.id; img.src = asset.u; img.onload = () => { k++; data.filter(obj => obj.id == img.id)[0].b = img; if (k == data.length) { setTimeout(run, 60) } } } } let data = [ ";
        _html.id = ",{ id: ";
        _html.quotation = "'";
        _html.prePosition = "', p: ";
        _html.postPosition = "}";
        _html.functionShell = ", f: 'placeShellObject', u: '";
        _html.functionRightWall = ", f: 'placeRightWallObject', u: '";
        _html.functionLeftWall = ", f: 'placeLeftWallObject', u: '";
        _html.functionFloor = ", f: 'placeFloorObject', u: '";
        _html.fileExtension = ".png";
        _html.arrayClose = "];";
        _html.footer = "prepare(); </script> </body> </html> ";
    }

    // Composes HTML string, populates with IPFS sourced image layers and base64 encode
    function composeHTML(uint256[] memory positions) public view returns (string memory) {
        string memory output = composeData(positions);
        output = Base64.encode(bytes(string.concat(_html.header, _html.script, output, _html.footer)));
        return output;
    }

    function composeData(uint256[] memory positions) public view returns (string memory) {
        string memory output = "{ id: ";
        for (uint256 i = 0; i < positions.length; i++) {
            if (i != 0) {
                output = string.concat(output, _html.id);
            }
            if (positions[i] != 9) {
                output = string.concat(
                    output,
                    Strings.toString(i),
                    folderFunctions[i],
                    _html.baseURI,
                    folders[i],
                    _html.fileExtension,
                    _html.prePosition,
                    Strings.toString(positions[i]),
                    _html.postPosition
                );
            }
        }
        output = string.concat(output, _html.arrayClose);
        return output;
    }

    // function to update html baseURI
    function updateBaseURI(string memory baseURI) public {
        _html.baseURI = baseURI;
    }
}
