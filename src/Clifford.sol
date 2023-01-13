// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
import "ERC721A/ERC721A.sol";
import "base64-sol/base64.sol";
import "./Metadata.sol";
import "./HandleRandom.sol";

contract Clifford is ERC721A, Ownable {
    // Counters.Counter private _tokenIdCounter;
    uint256 public constant MAX_SUPPLY = 10_000;
    // bool public saleComplete = false;
    Metadata private _metadata;

    HandleRandom private _handleRandom;

    constructor(Metadata metadata) ERC721A("Clifford", "o") {
        _metadata = metadata;
    }

    function setHandleRandom(HandleRandom handleRandom) public onlyOwner {
        _handleRandom = handleRandom;
    }

    function publicMint(address to, uint quantity) public {
      require(quantity <= 30, "Quantity too high"); // To prevent excessive first-time token transfer costs, please limit the quantity to a reasonable number (e.g. 30).
      uint startingSupply = totalSupply();
      require(startingSupply + quantity <= MAX_SUPPLY, "Max supply reached");
      _safeMint(to, quantity); //Safe minting is reentrancy safe since V3.
      _handleRandom.requestRandomNumbers(startingSupply, quantity);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return _metadata.buildMetadata(tokenId);
    }

    function withdrawMoney() external onlyOwner {
      (bool success, ) = msg.sender.call{value: address(this).balance}("");
      require(success, "Transfer failed.");
    }
}
