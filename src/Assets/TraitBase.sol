// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IAssetFromID {
  function getAssetFromID(uint assetID) external view returns (string memory);
}

contract TraitBase is Ownable {

  address[] internal implementationAddresses;
  uint[] internal implementationIndexes;

  constructor(address[] memory addresses, uint[] memory indexes) {
    implementationAddresses = addresses;
    implementationIndexes = indexes;
  }

  // SETTERS

  // function setIndexes(uint[] memory indexes) external onlyOwner {
  //   implementationIndexes = indexes;
  // }

  // function setSingleAddress(uint index, address addressToSet) external onlyOwner {
  //   implementationAddresses[index] = addressToSet;
  // }

  // function setAllAddresses(address[] memory addresses) external onlyOwner {
  //   implementationAddresses = addresses;
  // }

  function getAssetFromTrait(uint assetID) external view returns (string memory) {
    for (uint i = 0; i < implementationIndexes.length; i++) {
      if (assetID >= implementationIndexes[i] && assetID < implementationIndexes[i + 1]) {
        return IAssetFromID(implementationAddresses[i]).getAssetFromID(assetID);
      }
    }
    return "";
  }
}