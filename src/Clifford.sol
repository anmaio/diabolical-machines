// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "base64-sol/base64.sol";
import "./Metadata.sol";
import "./VRFv2Consumer.sol";

contract Clifford is ERC721, ERC721Enumerable, ERC721URIStorage, Pausable, Ownable, ERC721Burnable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    // uint256 public maxSupply;
    // bool public saleComplete = false;
    Metadata private _metadata;

    VRFv2Consumer private _VRF;

    constructor(Metadata metadata) ERC721("Clifford", "o") {
        _metadata = metadata;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function setVRFConsumer(VRFv2Consumer vrf) public onlyOwner {
        _VRF = vrf;
    }

    // Function to generate pseudo random number
    function randomNumber() public view returns (uint256) {
        uint256 number = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)));
        return number;
    }

    function safeMint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _VRF.requestRandomWords(tokenId);
    }

    function tokenURI(uint256 _tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return _metadata.buildMetadata(_tokenId);
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

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function _beforeConsecutiveTokenTransfer(
        address,
        address,
        uint256,
        uint96
    ) internal virtual override(ERC721, ERC721Enumerable) {
        revert("ERC721Enumerable: consecutive transfers not supported");
    }
}