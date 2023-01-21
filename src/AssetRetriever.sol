// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IAssetFromTrait {
  function getAssetFromTrait(uint assetID) external view returns (string memory);
}

contract AssetRetriever is Ownable {
  // TRAIT TYPES

  // Machines & Devices 0->17
  
  // Pipes, Tubes, Structures 18->45
  
  // Machine & Device Parts 46->78
  
  // Activation Devices 79->82
  
  // Lights & Eyes 83->108
  
  // Holes & Tunnels 109->118
  
  // Floob & Excretion 119->139
  
  // Exploded Machines 140->222

  // machineDevices, pipesTubesStructures, machineDeviceParts, activationDevices, lightsEyes, holesTunnels, floobExcretion, explodedMachines
  address[] internal traitTypes;

  constructor(address[] memory addresses) {
    traitTypes = addresses;
  }

  // SETTERS

  // function setSingleAddress(uint index, address addressToSet) external onlyOwner {
  //   traitTypes[index] = addressToSet;
  // }

  // function setAllAddresses(address[] memory addresses) external onlyOwner {
  //   traitTypes = addresses;
  // }

  function getAsset(uint assetID) external view returns (string memory) {
    string memory asset = "";
    for (uint i = 0; i < traitTypes.length; i++) {
      asset = IAssetFromTrait(traitTypes[i]).getAssetFromTrait(assetID);
      if (bytes(asset).length > 0) {
        return asset;
      }
    }
    return asset;
  }
}