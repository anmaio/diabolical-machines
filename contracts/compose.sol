// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";
import "./helper.sol";


contract Compose {

    Helper.HTML private _html;
   
    constructor() {        
        _html.baseURI = "https://anma.mypinata.cloud/ipfs/QmZjvU6vAfDSQEBJ2fDGRSYu65aoG459CXAWV5g1MxBLbp/";
        _html.header = "<!DOCTYPE html> <html lang=''>  <meta charset='utf-8'>  <title>html-ipfs-test</title>  <head><style>img    {position:absolute;top: 0px;left: 0px;}#layer1{z-index: 10;}#layer2{z-index: 20;}#layer3{z-index: 30;}#layer4{z-index: 40;}#layer5{z-index: 50;}#layer6{z-index: 60;}#layer7{z-index: 70;}</style></head> <body> <canvas id='c'></canvas>";
        _html.imgOpen = "<img id='layer";
        _html.imgSrc = "' src='";
        _html.folder01 = "BG/";
        _html.folder02 = "body/";
        _html.folder03 = "Eyes/";
        _html.folder04 = "Mouths/";
        _html.folder05 = "beard/";
        _html.folder06 = "Glasses/";
        _html.folder07 = "Outfits/";
        _html.imgClose = ".png'/>";
        _html.footer = "</body> </html>";

    }
    // Composes HTML string, populates with IPFS sourced image layers and base64 encode
	function composeHTML(Helper.Trait memory traitData) public view returns (string memory) {       
        string memory output1 = (string(abi.encodePacked(_html.imgOpen,"1",_html.imgSrc,_html.baseURI,_html.folder01,traitData.trait01,_html.imgClose)));
        string memory output2 = (string(abi.encodePacked(output1,_html.imgOpen,"2",_html.imgSrc,_html.baseURI,_html.folder02,traitData.trait02,_html.imgClose)));
        string memory output3 = (string(abi.encodePacked(output2,_html.imgOpen,"3",_html.imgSrc,_html.baseURI,_html.folder03,traitData.trait03,_html.imgClose)));
        string memory output4 = (string(abi.encodePacked(output3,_html.imgOpen,"4",_html.imgSrc,_html.baseURI,_html.folder04,traitData.trait04,_html.imgClose)));
        string memory output5 = (string(abi.encodePacked(output4,_html.imgOpen,"5",_html.imgSrc,_html.baseURI,_html.folder05,traitData.trait05,_html.imgClose)));
        string memory output6 = (string(abi.encodePacked(output5,_html.imgOpen,"6",_html.imgSrc,_html.baseURI,_html.folder06,traitData.trait06,"_r",_html.imgClose)));
        string memory output7 = (string(abi.encodePacked(output6,_html.imgOpen,"7",_html.imgSrc,_html.baseURI,_html.folder07,traitData.trait07,_html.imgClose)));  
        string memory outputFinal = Base64.encode(bytes(string(abi.encodePacked(_html.header,output7,_html.footer))));
        return outputFinal;
	}
}