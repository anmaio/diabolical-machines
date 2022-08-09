// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import 'base64-sol/base64.sol';
import './helper.sol';


contract Compose {

    string public baseURI = 'https://anma.mypinata.cloud/ipfs/QmZjvU6vAfDSQEBJ2fDGRSYu65aoG459CXAWV5g1MxBLbp/';

    // Composes HTML string, populates with IPFS sourced image layers and base64 encode
	function composeHTML(helper.Trait memory traitData) public view returns (string memory) {
		string[36] memory parts;
        parts[0] = '<!DOCTYPE html> <html lang="">  <meta charset="utf-8">  <title>html-ipfs-test</title>  <head><style>img    {position:absolute;top: 0px;left: 0px;}#layer1{z-index: 10;}#layer2{z-index: 20;#layer3{z-index: 30;#layer4{z-index: 40;#layer5{z-index: 50;#layer6{z-index: 60;#layer7{z-index: 70;}</style></head> <body style="background-color:grey; margin: 0"> <canvas id="c"></canvas><img id="layer1" src="https://anma.mypinata.cloud/ipfs/QmZjvU6vAfDSQEBJ2fDGRSYu65aoG459CXAWV5g1MxBLbp/';
        // parts[1] = ;
        parts[1] = 'BG/';
        parts[2] = traitData.trait01;
        parts[3] = '.png">';
        parts[4] = '<img id="layer2" src="';
        parts[5] =  baseURI;
        parts[6] = 'body/';
        parts[7] = traitData.trait02;
        parts[8] = '.png">';
        parts[9] = '<img id="layer3" src="';
        parts[10] =  baseURI;
        parts[11] = 'eyes/';
        parts[12] = traitData.trait03;
        parts[13] = '.png">';
        parts[14] = '<img id="layer4" src="';
        parts[15] =  baseURI;
        parts[16] = 'mouth/';
        parts[17] = traitData.trait04;
        parts[18] = '.png">';
        parts[19] = '<img id="layer5" src="';
        parts[20] =  baseURI;
        parts[21] = 'beard/';
        parts[22] = traitData.trait05;
        parts[23] = '.png">';
        parts[24] = '<img id="layer6" src="';
        parts[25] =  baseURI;
        parts[26] = 'glasses/';
        parts[27] = traitData.trait06;
        parts[28] = '.png">';
        parts[29] = '<img id="layer7" src="';
        parts[30] =  baseURI;
        parts[31] = 'outfit/';
        parts[32] = traitData.trait07;
        parts[33] = '.png">';
        parts[34] = '</body>';
        parts[35] = '</html>'; 

        string memory output = Base64.encode(bytes(string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7], parts[8], parts[9]))));
        // , parts[10], parts[11], parts[12], parts[13], parts[14]))));
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