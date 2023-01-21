// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IAssetFromID {
  function getAssetFromID(uint assetID) external view returns (string memory);
}

contract TraitBase is Ownable {

  address[] internal implementationAddresses;
  uint[] internal implementationIndexes;

  constructor(address[] memory addresses) {
    implementationAddresses = addresses;
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
    string memory asset = "";
    for (uint i = 0; i < implementationAddresses.length; i++) {
      asset = IAssetFromID(implementationAddresses[i]).getAssetFromID(assetID);
      if (bytes(asset).length > 0) {
        return asset;
      }
    }
    return "";
  }
}