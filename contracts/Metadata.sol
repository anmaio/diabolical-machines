// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "./Compose.sol";

contract Metadata is Ownable {
    Compose private _compose;

    // storage of each traits name and base64 PNG data
    mapping(uint256 => Helper.Trait) public traitData;

    // event is emitted when initial trait values are set
    event InitialTraitValuesSet(uint256 tokenId);

    constructor(Compose compose) {
        _compose = compose;
    }

    // Function initial trait values pseudo randomly generated
    function initialTraitValues(uint256 _tokenId) external onlyOwner {
        uint256 random = randomNumber();
        traitData[_tokenId].trait01 = Strings.toString(random);
        traitData[_tokenId].trait02 = Strings.toString(random % 5);
        traitData[_tokenId].trait03 = Strings.toString(random % 5);
        traitData[_tokenId].trait04 = Strings.toString(random % 2);
        traitData[_tokenId].trait05 = Strings.toString(random % 9);
        traitData[_tokenId].trait06 = Strings.toString(random % 5);
        traitData[_tokenId].trait07 = Strings.toString(random % 7);
        emit InitialTraitValuesSet(_tokenId);
    }

    // Function to generate pseudo random number between 1 and 15
    function randomNumber() public view returns (uint8) {
        uint8 number = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % 14);
        return (number + 1);
    }

    // Function build metadata for a given token
    function buildMetadata(uint256 _tokenId) public view returns (string memory) {
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Onion #" ',
                        Strings.toString(_tokenId),
                        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
                        traitData[_tokenId].trait01,
                        '}, {"trait_type": "Trait 2", "value":',
                        traitData[_tokenId].trait02,
                        '}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,',
                        _compose.composeHTML(traitData[_tokenId]),
                        '"}'
                    )
                )
            )
        );
        string memory output = string(abi.encodePacked("data:application/json;base64,", json));
        return output;
    }
}
