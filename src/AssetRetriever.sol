// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IAssetFromTrait {
  function getAssetFromTrait(uint assetID) external view returns (string memory);
  function getProductivityFromTrait(uint assetID) external view returns (uint);
}

contract AssetRetriever is Ownable {

  address[] internal traitTypes;

  constructor(address[] memory addresses) {
    traitTypes = addresses;
  }

  function getAsset(uint assetID) public view returns (string memory) { // todo: refactor using %1k and /1k to remove the loop
    string memory asset = "";
    for (uint i = 0; i < traitTypes.length; i++) {
      asset = IAssetFromTrait(traitTypes[i]).getAssetFromTrait(assetID);
      if (bytes(asset).length > 0) {
        return asset;
      }
    }
    return asset;
  }

  function getProductivity(uint assetID) public view returns (uint) {
    uint productivity = 0;
    for (uint i = 0; i < traitTypes.length; i++) {
      productivity = IAssetFromTrait(traitTypes[i]).getProductivityFromTrait(assetID);
      if (productivity > 0) {
        return productivity;
      }
    }
    return productivity;
  }
}