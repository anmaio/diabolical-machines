// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import 'base64-sol/base64.sol';
import './compose.sol';


contract Onion is ERC721, ERC721Enumerable, ERC721URIStorage, Pausable, Ownable, ERC721Burnable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    uint256 public maxSupply;
    bool public saleComplete = false;
    Compose private _compose;
    

    constructor(Compose compose) ERC721("Onion", "o") {
        _compose = compose;
    }

	// event is emitted when initial trait values are set
	event InitialTraitValuesSet(uint tokenId);

	// success event is emitted when a trait value is changed
	event TraitValueChanged(uint tokenId, uint traitId, string value, address owner);

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // struct to store each trait's data for metadata and rendering
    

	// storage of each traits name and base64 PNG data
  	mapping(uint256 => helper.Trait) public traitData;	

	// array of background colours 
	// string[4] public backgroundColours = ["blue", "green", "red", "white"];

	// array of worker states
	// string[2] public workerStates = ["idle", "working"];

	// Function to generate pseudo random number between 0 and 3
	function randomNumber() public view returns(uint8) {
		uint8 number = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)))%14);
        return (number+1);
	}

	// Function initial trait values pseudo randomly generated
	function initialTraitValues(uint _tokenId) private {
		uint random = randomNumber();
		traitData[_tokenId].trait01 = string(abi.encodePacked(random));
		traitData[_tokenId].trait02 = string(abi.encodePacked(random%5));
		traitData[_tokenId].trait03 = string(abi.encodePacked(random%5));
		traitData[_tokenId].trait04 = string(abi.encodePacked(random%2));
		traitData[_tokenId].trait05 = string(abi.encodePacked(random%9));
		traitData[_tokenId].trait06 = string(abi.encodePacked(random%5));
		traitData[_tokenId].trait07 = string(abi.encodePacked(random%7));
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
	function buildMetadata(uint _tokenId) public view returns (string memory) {
		string memory json = Base64.encode(bytes(string(abi.encodePacked(
			'{"name": "Onion #" ', Strings.toString(_tokenId), '", "description": "Onion nft description", "attributes": [{"trait_type": "Trait 1", "value":',traitData[_tokenId].trait01,'}, {"trait_type": "Trait 2", "value":',traitData[_tokenId].trait02,'}],"image": "https://anma.mypinata.cloud/ipfs/QmYDLv6aCMcE9oSngnYMAyKFzjWYCeyevKeqom9NU2c7Kh", "animation_url": "data:text/html;base64,', _compose.composeHTML(traitData[_tokenId]), '"}'))));
		string memory output = string(abi.encodePacked('data:application/json;base64,', json));
		return output;
	}

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
		initialTraitValues(tokenId);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return buildMetadata(_tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}