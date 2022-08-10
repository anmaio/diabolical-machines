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
import "./compose.sol";

contract Onion is ERC721, ERC721Enumerable, ERC721URIStorage, Pausable, Ownable, ERC721Burnable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    // uint256 public maxSupply;
    // bool public saleComplete = false;
    Compose private _compose;

    constructor(Compose compose) ERC721("Onion", "o") {
        _compose = compose;
    }

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

    // storage of each traits name and base64 PNG data
    mapping(uint256 => Helper.Trait) public traitData;

    // array of background colours
    // string[4] public backgroundColours = ["blue", "green", "red", "white"];

    // array of worker states
    // string[2] public workerStates = ["idle", "working"];

    // Function to generate pseudo random number between 0 and 3
    function randomNumber() public view returns (uint8) {
        uint8 number = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % 14);
        return (number);
    }

    // Function initial trait values pseudo randomly generated
    function initialTraitValues(uint256 _tokenId) private {
        uint256 random = randomNumber();
        traitData[_tokenId].trait01 = string(abi.encodePacked(Strings.toString((random + 1))));
        traitData[_tokenId].trait02 = string(abi.encodePacked(Strings.toString((random % 5) + 1)));
        traitData[_tokenId].trait03 = string(abi.encodePacked(Strings.toString((random % 5) + 1)));
        traitData[_tokenId].trait04 = string(abi.encodePacked(Strings.toString((random % 2) + 1)));
        traitData[_tokenId].trait05 = string(abi.encodePacked(Strings.toString((random % 9) + 1)));
        traitData[_tokenId].trait06 = string(abi.encodePacked(Strings.toString((random % 5) + 1)));
        traitData[_tokenId].trait07 = string(abi.encodePacked(Strings.toString((random % 7) + 1)));
        emit InitialTraitValuesSet(_tokenId);
    }

    // Function to update a single trait value for a given token
    // function updateTraitValue(uint _tokenId, uint _traitNumber, string memory _value) public {

    // 	// only the owner of the nft can update the trait values
    // 	require(msg.sender == ownerOf(_tokenId), "Only the owner of the nft can update the trait values");

    // 	if (_traitNumber == 1) {
    // 		traitData[_tokenId].trait01 = _value;
    // 	} else if (_traitNumber == 2) {
    // 		traitData[_tokenId].trait02 = _value;
    // 	} else {
    // 		revert();
    // 	}

    // 	emit TraitValueChanged(_tokenId, _traitNumber, _value, msg.sender);
    // }

    // Function build metadata for a given token
    function buildMetadata(uint256 _tokenId) public view returns (string memory) {
        string memory imgSVG = Base64.encode(bytes("<svg version='1.1' xmlns='http://www.w3.org/2000/svg' id='frame'>    <script type='text/javascript'><![CDATA[  const frame = document.getElementById('frame'); function createrLayer(count) { layerArray = ['BG', 'body', 'Eyes', 'Mouths', 'Outfits', 'beard', 'beard']; const baseURI = 'https://anma.mypinata.cloud/ipfs/QmZjvU6vAfDSQEBJ2fDGRSYu65aoG459CXAWV5g1MxBLbp/';  var img = document.createElementNS('http://www.w3.org/2000/svg','image'); img.setAttribute('id', 'layer' + count); img.setAttribute('style', 'position:absolute;top: 0px;left: 0px; z-index: ' + count + '0;width: 45vw; height:45vw'); img.setAttributeNS('http://www.w3.org/1999/xlink','href',baseURI + layerArray[count - 1] + '/2.png'); frame.appendChild(img); } for (i = 1; i < 8; i++) {createrLayer(i); } ]]></script> </svg>"));

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Onion # ',
                        Strings.toString(_tokenId),
                        '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',
                        traitData[_tokenId].trait01,
                        '}, {"trait_type": "Trait 2", "value":',
                        traitData[_tokenId].trait02,
                        '}],"image": "data:image/svg+xml;base64,',
                        imgSVG,
                        '", "animation_url": "data:image/svg+xml;base64,',
                        imgSVG,
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
