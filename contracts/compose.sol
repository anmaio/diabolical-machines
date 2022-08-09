// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "base64-sol/base64.sol";
import "./helper.sol";


contract Compose {

    string public baseURI = "https://anma.mypinata.cloud/ipfs/QmZjvU6vAfDSQEBJ2fDGRSYu65aoG459CXAWV5g1MxBLbp/";

    // Composes HTML string, populates with IPFS sourced image layers and base64 encode
	function composeHTML(Helper.Trait memory traitData) public view returns (string memory) {
		string[38] memory parts;
        parts[0] = "<!DOCTYPE html> <html lang=''>  <meta charset='utf-8'>  <title>html-ipfs-test</title>  <head><style>img    {position:absolute;top: 0px;left: 0px;}#layer1{z-index: 10;}#layer2{z-index: 20;#layer3{z-index: 30;#layer4{z-index: 40;#layer5{z-index: 50;#layer6{z-index: 60;#layer7{z-index: 70;}</style></head> <body style='background-color:grey; margin: 0'> <canvas id='c'></canvas><img id='layer1' src='";
        parts[1] = baseURI;
        parts[2] = "BG/";
        parts[3] = traitData.trait01;
        parts[4] = ".png'>";
        parts[5] = "<img id='layer2' src='";
        parts[6] =  baseURI;
        parts[7] = "body/";
        parts[8] = traitData.trait02;
        parts[9] = ".png'>";
        parts[10] = "<img id='layer3' src='";
        parts[11] =  baseURI;
        parts[12] = "eyes/";
        parts[13] = traitData.trait03;
        parts[14] = ".png'>";
        parts[15] = "<img id='layer4' src='";
        parts[16] =  baseURI;
        parts[17] = "mouth/";
        parts[18] = traitData.trait04;
        parts[19] = ".png'>";
        parts[20] = "<img id='layer5' src='";
        parts[21] =  baseURI;
        parts[22] = "beard/";
        parts[23] = traitData.trait05;
        parts[24] = ".png'>";
        parts[25] = "<img id='layer6' src='";
        parts[26] =  baseURI;
        parts[27] = "glasses/";
        parts[28] = traitData.trait06;
        parts[29] = ".png'>";
        parts[30] = "<img id='layer7' src='";
        parts[31] =  baseURI;
        parts[32] = "outfit/";
        parts[33] = traitData.trait07;
        parts[34] = ".png'>";
        parts[35] = "</body>";
        parts[36] = "</html>"; 

        string memory output = Base64.encode(bytes(string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7], parts[8], parts[9], parts[10], parts[11], parts[12], parts[13], parts[14]))));
       
        // uint8 i;
        // string memory output;
        // for(i = 1; i < parts.length; i++ ){
        // output = Base64.encode(bytes(string(abi.encodePacked(
        //      parts[i]
        // )))); 
        // }       
        return output;
	}
}