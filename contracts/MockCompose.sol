// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Compose.sol";
import "./Helper.sol";

contract MockCompose is Compose {
    // storage of each traits name and base64 PNG data
    mapping(uint256 => Helper.Trait) public traitData;

    // Function initial trait values pseudo randomly generated
    function initialTraitValues(uint256 _tokenId) external {
        uint256 random = randomNumber();
        traitData[_tokenId].trait01 = Strings.toString(random);
        traitData[_tokenId].trait02 = Strings.toString(random % 5);
        traitData[_tokenId].trait03 = Strings.toString(random % 5);
        traitData[_tokenId].trait04 = Strings.toString(random % 2);
        traitData[_tokenId].trait05 = Strings.toString(random % 9);
        traitData[_tokenId].trait06 = Strings.toString(random % 5);
        traitData[_tokenId].trait07 = Strings.toString(random % 7);
    }

    function randomNumber() public view returns (uint8) {
        uint8 number = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % 14);
        return (number + 1);
    }

    function testComposeHTML(uint256 id) public view returns (string memory html) {
        html = composeHTML(traitData[id]);
    }

    function testComposeHTMLWithSB(uint256 id) public view returns (string memory html) {
        html = composeHTMLWithSB(traitData[id]);
    }
}
