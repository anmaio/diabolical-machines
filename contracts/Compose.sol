// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./Helper.sol";

contract Compose {
    Helper.HTML private _html;

    string[7] public folders = ["backgrounds/", "bodys/", "eyes/", "glasses/", "mouths/", "outfits/", "beards/"];

    constructor() {
        _html.baseURI = "https://anma.mypinata.cloud/ipfs/QmcQ6J1rbMNWbaEGt5m5vWLB3VzYNCQiuJHFxc9iZJgmPt/";
        _html.header = "<!DOCTYPE html> <html lang=''>  <meta charset='utf-8'>  <title>html-ipfs-test</title>  <head><style>img{position:absolute;top: 0px;left: 0px; height:100vh;}#layer1{z-index: 10;}#layer2{z-index: 20;}#layer3{z-index: 30;}#layer4{z-index: 40;}#layer5{z-index: 50;}#layer6{z-index: 60;}#layer7{z-index: 70;}</style></head> <body> <canvas id='c'></canvas>";
        _html.imgOpen = "<img id='layer";
        _html.imgSrc = "' src='";
        _html.imgClose = ".png'/>";
        _html.footer = "</body> </html>";
    }

    // Composes HTML string, populates with IPFS sourced image layers and base64 encode
    function composeHTML(string[7] memory traitData) public view returns (string memory) {
        string memory output = _html.header;
        for (uint256 i = 0; i < 7; i++) {
            if (keccak256(abi.encodePacked(traitData[i])) != keccak256(abi.encodePacked("none"))) {
                output = string.concat(output, _html.imgOpen, Strings.toString(i + 1), _html.imgSrc, _html.baseURI, folders[i], traitData[i], _html.imgClose);
            }
        }
        output = Base64.encode(bytes(string.concat(output, _html.footer)));
        return output;
    }
}
