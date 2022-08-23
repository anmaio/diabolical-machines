// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "hardhat/console.sol";
import "./Compose.sol";

contract Metadata is Ownable {
    Compose private _compose;

    uint public num_of_layers = 7;
    uint public numOfRarities = 3;
    uint public common = 80;
    uint public rare = 15;
    uint public legendary = 5;

    string[][] public allSubtraits;

    // storage image base uri
    string private _imageURI = "https://apidevukssaoutput.blob.core.windows.net/output/";

    mapping(uint256 => string[7]) public traitData;

    // tokenId and initial traits emmitted when a nft is minted
    event InitialTraitValuesSet(uint256 tokenId, string[7] traitData);

    constructor(Compose compose) {
        _compose = compose;
        putIntoArray();
    }

    // Function initial trait values pseudo randomly generated
    function setTraitValues(uint256 _tokenId, string[] memory subTraits) public {
        for (uint i = 0; i < subTraits.length; i++) {
            traitData[_tokenId][i] = subTraits[i];
        }
        emit InitialTraitValuesSet(_tokenId, traitData[_tokenId]);
    }

    function putIntoArray() public {
        // backgrounds
        allSubtraits.push(["red", "blue"]);
        allSubtraits.push(["silver", "gold"]);
        allSubtraits.push(["galaxy"]);
        // bodys
        allSubtraits.push(["black", "red"]);
        allSubtraits.push(["blue", "gold"]);
        allSubtraits.push(["cheetah"]);
        // eyes
        allSubtraits.push(["blue", "white"]);
        allSubtraits.push(["green", "red"]);
        allSubtraits.push(["gold"]);
        // glasses
        allSubtraits.push(["black", "blue"]);
        allSubtraits.push(["red", "silver"]);
        allSubtraits.push(["gold"]);
        // mouths
        allSubtraits.push(["smile"]);
        allSubtraits.push(["toothy"]);
        allSubtraits.push(["toothy"]); // toothy is repeated as there are only two mouths
        // outfits
        allSubtraits.push(["black vest", "sweater", "white vest"]);
        allSubtraits.push(["hippy", "xmas"]);
        allSubtraits.push(["president", "vitalik"]);
        // beards
        allSubtraits.push(["black", "blonde"]);
        allSubtraits.push(["ginger"]);
        allSubtraits.push(["old timer"]);
    }

    function determine_layer_rarity(uint percentage, bool isNone) public view returns (uint rarity) {
        if (isNone) {
            return 3;
        }
        if (percentage < common) {
            return 0;
        } else if (percentage < common + rare) {
            return 1;
        } else {
            return 2;
        }
    }

    function determineSubTraits(uint[] memory values, uint[] memory rarities, uint _tokenId) public returns (uint[] memory, uint[] memory, string[] memory) {
        string[] memory subTraits = new string[](num_of_layers);
        for (uint i = 0; i < num_of_layers; i++) {
            if (rarities[i] == 0) {
                string memory subtrait = allSubtraits[i * numOfRarities][values[i] % allSubtraits[i * numOfRarities].length];
                subTraits[i] = subtrait;
            } else if (rarities[i] == 1) {
                string memory subtrait = allSubtraits[i * numOfRarities + 1][values[i] % allSubtraits[i * numOfRarities + 1].length];
                subTraits[i] = subtrait;
            } else if (rarities[i] == 2) {
                string memory subtrait = allSubtraits[i * numOfRarities + 2][values[i] % allSubtraits[i * numOfRarities + 2].length];
                subTraits[i] = subtrait;
            } else {
                string memory subtrait = "none";
                subTraits[i] = subtrait;
            }
        }
        setTraitValues(_tokenId, subTraits);
    }

    function generateTraits(uint _tokenId) public {
        uint rand = randomNumber();
        uint[] memory values = new uint[](num_of_layers);
        uint[] memory optionalValues = new uint[](num_of_layers);
        (rand, values) = removeLastTwoDigits(rand);
        (rand, optionalValues) = removeLastDigit(rand);
        uint[] memory rarities = new uint[](num_of_layers);
        for (uint i = 0; i < num_of_layers; i++) {
            bool isNone = false;
            // glasses 20% chance of occuring
            if (i == 3 && optionalValues[i] >= 2) {
                isNone = true;
            // outfits 90% chance of occuring
            } else if (i == 5 && optionalValues[i] >= 9) {
                isNone = true;
            // beards 50% chance of occuring
            } else if (i == 6 && optionalValues[i] >= 5) {
                isNone = true;
            }
            rarities[i] = determine_layer_rarity(values[i], isNone);
        }
        (rand, values) = removeLastTwoDigits(rand);
        determineSubTraits(values, rarities, _tokenId);
    }

    function removeLastTwoDigits(uint number) public view returns (uint, uint[] memory) {
        uint[] memory values = new uint[](num_of_layers);
        for(uint i = 0; i < num_of_layers; i++) {
            values[i] = number % 100;
            number = number / 100;
        }
        return (number, values);
    }

    function removeLastDigit(uint number) public view returns (uint, uint[] memory) {
        uint[] memory values = new uint[](num_of_layers);
        for(uint i = 0; i < num_of_layers; i++) {
            values[i] = number % 10;
            number = number / 10;
        }
        return (number, values);
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
                
            string.concat(
                '{"name": "Onion # ',
                Strings.toString(_tokenId),
                '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":"',
                traitData[_tokenId][0],
                '"}, {"trait_type": "Trait 2", "value":"',
                traitData[_tokenId][1],
                '"}, {"trait_type": "Trait 3", "value":"',
                traitData[_tokenId][2],
                '"}, {"trait_type": "Trait 4", "value":"',
                traitData[_tokenId][3],
                '"}, {"trait_type": "Trait 5", "value":"',
                traitData[_tokenId][4],
                '"}, {"trait_type": "Trait 6", "value":"',
                traitData[_tokenId][5],
                '"}, {"trait_type": "Trait 7", "value":"',
                traitData[_tokenId][6],
                '"}],'
            );

        string memory jsonFinal = Base64.encode(
            bytes(
                string.concat(
                    jsonInitial,
                    '"image": "',
                    _imageURI,
                    Strings.toString(_tokenId),
                    '.png", "animation_url": "data:text/html;base64,',
                    _compose.composeHTML(traitData[_tokenId]),
                    '"}'
                )
            )
        );

        string memory output = string.concat("data:application/json;base64,", jsonFinal);
        return output;
    }
}
