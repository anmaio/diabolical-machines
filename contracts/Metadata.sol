// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "./Compose.sol";

contract Metadata is Ownable {
    Compose private _compose;

    // storage image base uri
    string private _imageURI = "https://apidevukssaoutput.blob.core.windows.net/output/";

    // storage of each traits name and base64 PNG data
    mapping(uint256 => Helper.Trait) public traitData;

    // tokenId and initial traits emmitted when a nft is minted
    event InitialTraitValuesSet(uint256 tokenId, Helper.Trait traitData);

    constructor(Compose compose) {
        _compose = compose;
    }

    // Function initial trait values pseudo randomly generated
    function initialTraitValues(uint256 _tokenId) external {
        uint256 random = randomNumber();
        traitData[_tokenId].trait01 = Strings.toString(random % 14);
        traitData[_tokenId].trait02 = Strings.toString(random % 5);
        traitData[_tokenId].trait03 = Strings.toString(random % 5);
        traitData[_tokenId].trait04 = Strings.toString(random % 2);
        traitData[_tokenId].trait05 = Strings.toString(random % 9);
        traitData[_tokenId].trait06 = Strings.toString(random % 5);
        traitData[_tokenId].trait07 = Strings.toString(random % 7);
        emit InitialTraitValuesSet(_tokenId, traitData[_tokenId]);
    }

    // Function to update image base uri
    // @dev Needs onlyOwner but not sure if working yet
    function updateImageURI(string memory _newImageUri) public {
        _imageURI = _newImageUri;
    }

    // Function to generate pseudo random number
    function randomNumber() public view returns (uint256) {
        uint256 number = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)));
        return number + 1;
    }

    // Function build metadata for a given token
    function buildMetadata(uint256 _tokenId) public view returns (string memory) {
        string memory jsonInitial = 
                string(
                    abi.encodePacked(
                        '{"name": "Onion # ',
                        Strings.toString(_tokenId),
                        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
                        traitData[_tokenId].trait01,
                        '}, {"trait_type": "Trait 2", "value":',
                        traitData[_tokenId].trait02,
                        '}, {"trait_type": "Trait 3", "value":',
                        traitData[_tokenId].trait03,
                        '}, {"trait_type": "Trait 4", "value":',
                        traitData[_tokenId].trait04,
                        '}, {"trait_type": "Trait 5", "value":',
                        traitData[_tokenId].trait05,
                        '}, {"trait_type": "Trait 6", "value":',
                        traitData[_tokenId].trait06,
                        '}, {"trait_type": "Trait 7", "value":',
                        traitData[_tokenId].trait07,
                        "}],"
                    )               
            );

        string memory jsonFinal = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        jsonInitial,
                        '"image": "',
                        _imageURI,
                        Strings.toString(_tokenId),
                        '.png", "animation_url": "data:text/html;base64,',
                        _compose.composeHTML(traitData[_tokenId]),
                        '"}'
                    )
                )
            )
        );

        

        string memory output = string(abi.encodePacked("data:application/json;base64,", jsonFinal));
        return output;
    }
}
