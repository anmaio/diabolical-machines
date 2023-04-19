// // SPDX-License-Identifier: MIT
// pragma solidity 0.8.16;

// import "ERC721A/ERC721A.sol";
// import "base64-sol/base64.sol";
// import "@openzeppelin/contracts/utils/Strings.sol";

// contract BasicNFT is ERC721A {

//     string baseURI = "https://gallerydevukssa.blob.core.windows.net/token-uri-metadata/";

//     /**
//      * @notice Constructor for the ERC721A token "Clifford" with the symbol "Cliff"
//      */
//     constructor() ERC721A("Clifford", "Cliff")  {
      
//     }

//     /**
//      * @notice Sets the base URI for the contract
//      * @dev This function sets the base URI for the contract.
//      * @param _baseURI The base URI to be set
//      */
//     function setBaseURI(string memory _baseURI) public {
//         baseURI = _baseURI;
//     }

//     /**
//      * @notice This function allows the owner of the contract to mint a specified quantity of tokens.
//      * @dev This function is called by the owner of the contract to mint a specified quantity of tokens. It calls the _mint() function with the sender address and the quantity of tokens to be minted.
//      */
//     function mint(uint256 quantity) public {
//         _mint(msg.sender, quantity);
//     }

//     /**
//      * @notice tokenURI() function is used to return the tokenURI of a given tokenId.
//      * @dev tokenURI() function takes in a uint256 tokenId and returns a string memory. It concatenates the baseURI, tokenId and ".json" to form the tokenURI. 
//      */
//     function tokenURI(uint256 tokenId) public view override returns (string memory) {
//         return string.concat(baseURI, Strings.toString(tokenId), ".json");
//     }
// }
