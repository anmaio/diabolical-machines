// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

interface IAssetFromTrait {
  function getAssetFromTrait(uint assetID) external view returns (string memory);
  function getProductivityFromTrait(uint assetID) external view returns (uint);
}

contract AssetRetriever {

  address[] internal traitTypes;

  constructor(address[] memory addresses) {
    traitTypes = addresses;
  }

  function getAsset(uint assetID) public view returns (string memory) { // todo: refactor using %1k and /1k to remove the loop
    if (assetID == 0) {
      return "";
    }

    return IAssetFromTrait(traitTypes[assetID / 1000 - 1]).getAssetFromTrait(assetID);
  }

  function getProductivity(uint assetID) public view returns (uint) {
    if (assetID == 0) {
      return 0;
    }

    return IAssetFromTrait(traitTypes[assetID / 1000 - 1]).getProductivityFromTrait(assetID);
  }
}