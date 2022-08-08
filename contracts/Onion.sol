// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "base64-sol/base64.sol";

contract Onion is ERC721, ERC721Enumerable, ERC721URIStorage, Pausable, Ownable, ERC721Burnable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    uint256 public maxSupply;
    bool public saleComplete = false;

    constructor() ERC721("Onion", "O") {}

    // event is emitted when initial trait values are set
    event InitialTraitValuesSet(uint256 tokenId);

    // success event is emitted when a trait value is changed
    event TraitValueChanged(uint256 tokenId, uint256 traitId, string value, address owner);

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // struct to store each trait's data for metadata and rendering
    struct Trait {
        string trait01;
        string trait02;
    }

    // storage of each traits name and base64 PNG data
    mapping(uint256 => Trait) public traitData;

    // array of background colours
    string[4] public backgroundColours = ["blue", "green", "red", "white"];

    // array of worker states
    string[2] public workerStates = ["idle", "working"];

    // Function to generate pseudo random number between 0 and 3
    function randomNumber() public view returns (uint8) {
        uint8 number = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % 4);
        return (number);
    }

    // Function initial trait values pseudo randomly generated
    function initialTraitValues(uint256 _tokenId) private {
        uint256 random = randomNumber();
        traitData[_tokenId].trait01 = backgroundColours[(random)];
        traitData[_tokenId].trait02 = workerStates[(random) % 2];
        emit InitialTraitValuesSet(_tokenId);
    }

    // Function to update a single trait value for a given token
    function updateTraitValue(
        uint256 _tokenId,
        uint256 _traitNumber,
        string memory _value
    ) public {
        // only the owner of the nft can update the trait values
        require(msg.sender == ownerOf(_tokenId), "Only the owner of the nft can update the trait values");

        if (_traitNumber == 1) {
            traitData[_tokenId].trait01 = _value;
        } else if (_traitNumber == 2) {
            traitData[_tokenId].trait02 = _value;
        } else {
            revert();
        }

        emit TraitValueChanged(_tokenId, _traitNumber, _value, msg.sender);
    }

    // Composes HTML string, populates with IPFS sourced image layers and base64 encode
    function composeHTML(uint256 _tokenId) public view returns (string memory) {
        string[9] memory parts;
        parts[
            0
        ] = '<!DOCTYPE html> <html lang="">  <meta charset="utf-8">  <title>html-ipfs-test</title>  <head><style>img    {position:absolute;top: 0px;left: 0px;}#layer1{z-index: 10;}#layer2{z-index: 20;}</style></head> <body style="background-color:grey; margin: 0"> <canvas id="c"></canvas><img id="layer1" src="';
        parts[
            1
        ] = "https://anma.mypinata.cloud/ipfs/QmYwF6ybRUa6BE63CbfZG2nrhFJZmy5Dt8oDMGkhBhmM9Y/backgrounds/background_";
        parts[2] = traitData[_tokenId].trait01;
        parts[3] = '.png">';
        parts[
            4
        ] = '<img id="layer2" src="https://anma.mypinata.cloud/ipfs/QmYwF6ybRUa6BE63CbfZG2nrhFJZmy5Dt8oDMGkhBhmM9Y/worker/';
        parts[5] = traitData[_tokenId].trait02;
        parts[6] = '.gif">';
        parts[7] = "</body>";
        parts[8] = "</html>";

        string memory output = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        parts[0],
                        parts[1],
                        parts[2],
                        parts[3],
                        parts[4],
                        parts[5],
                        parts[6],
                        parts[7],
                        parts[8]
                    )
                )
            )
        );
        return output;
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
                        composeHTML(_tokenId),
                        '"}'
                    )
                )
            )
        );
        string memory output = string(abi.encodePacked("data:application/json;base64,", json));
        return output;
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        initialTraitValues(tokenId);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) whenNotPaused {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 _tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return buildMetadata(_tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
