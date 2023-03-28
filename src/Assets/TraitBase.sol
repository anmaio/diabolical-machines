// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

interface IAssetFromID {
  function getAssetFromID(uint assetID) external view returns (string memory);
  function getProductivityFromID(uint assetID) external view returns (uint);
}

contract TraitBase {

  address[] internal implementationAddresses;

  constructor(address[] memory addresses) {
    implementationAddresses = addresses;
  }

  function getAssetFromTrait(uint assetID) external view returns (string memory) {
    string memory asset = "";
    for (uint i = 0; i < implementationAddresses.length;) {
      asset = IAssetFromID(implementationAddresses[i]).getAssetFromID(assetID);
      if (bytes(asset).length > 0) {
        return asset;
      }
      unchecked {
        ++i;
      }
    }
    return "";
  }

  function getProductivityFromTrait(uint assetID) external view returns (uint) {
    uint productivity = 0;
    for (uint i = 0; i < implementationAddresses.length;) {
      productivity = IAssetFromID(implementationAddresses[i]).getProductivityFromID(assetID);
      if (productivity > 0) {
        return productivity;
      }
      unchecked {
        ++i;
      }
    }
    return 0;
  }
}