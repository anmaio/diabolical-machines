// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "ERC721A/ERC721A.sol";
import "base64-sol/base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract BasicNFT is ERC721A {

    string baseURI = "https://gallerydevukssa.blob.core.windows.net/token-uri-metadata/";

    constructor() ERC721A("Clifford", "Cliff")  {
      
    }

    function setBaseURI(string memory _baseURI) public {
        baseURI = _baseURI;
    }

    function mint(uint256 quantity) public {
        _mint(msg.sender, quantity);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return string.concat(baseURI, Strings.toString(tokenId), ".json");
    }
}
