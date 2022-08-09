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
import "./Metadata.sol";

contract Onion is ERC721, ERC721Enumerable, ERC721URIStorage, Pausable, Ownable, ERC721Burnable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    // uint256 public maxSupply;
    // bool public saleComplete = false;
    Metadata private _metadata;

    constructor(Metadata metadata) ERC721("Onion", "o") {
        _metadata = metadata;
    }

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

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _metadata.initialTraitValues(tokenId);
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
        return _metadata.buildMetadata(_tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
