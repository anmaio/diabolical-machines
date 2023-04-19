// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./GridHelper.sol";
import "./GlobalNumbers.sol";
import "./AssetRetriever.sol";

interface IMachine {
  function getMachine(uint rand, int baseline) external view returns (string memory);
  function getAllNumbersUsed(uint rand, int baseline) external pure returns (uint[] memory, string[] memory);
  function getGlobalAssetNumber(uint rand, uint version, int baseline) external pure returns (uint);
}

contract Machine {

  AssetRetriever internal immutable _assetRetriever;

  // string[] public allMachines = ["Altar", "Drills", "Noses", "Apparatus", "Cells", "Tubes", "Beast", "ConveyorBelt"];
  string[] public allMachines = ["Altar", "Apparatus", "Cells", "Tubes", "Beast", "ConveyorBelt"];

  mapping(string => string) public machineToProductivityTiers;
  mapping(string => address) public machineToWorkstation;

  constructor(address[6] memory workstations, AssetRetriever assetRetriever) {
    _assetRetriever = assetRetriever;

    for (uint i = 0; i < allMachines.length; ++i) {
      machineToWorkstation[allMachines[i]] = workstations[i];
    }

    machineToProductivityTiers["Altar"] = "020040060070080090";
    // machineToProductivityTiers["Drills"] = "020040060070080090";
    // machineToProductivityTiers["Noses"] = "020040060070080090";
    machineToProductivityTiers["Apparatus"] = "020040060070080090";
    machineToProductivityTiers["Cells"] = "020040060070080090";
    machineToProductivityTiers["Tubes"] = "020040060070080090";
    machineToProductivityTiers["Beast"] = "020040060070080090";
    machineToProductivityTiers["ConveyorBelt"] = "020040060070080090";
  }

  function selectMachine(uint rand) external view returns (string memory) {
      return allMachines[rand % allMachines.length];
      // return allMachines[7];
      // if (rand % 2 == 0) {
      //   return allMachines[5];
      // } else {
      //   return allMachines[6];
      // }
  }

  function machineToGetter(string memory machine, uint rand, int baseline) external view returns (string memory) {
    return IMachine(machineToWorkstation[machine]).getMachine(rand, baseline);
  }

  function getProductivityValue(string memory machine, uint rand, int baseline) public view returns (uint) {
    (uint[] memory numbersUsed,) = IMachine(machineToWorkstation[machine]).getAllNumbersUsed(rand, baseline);
    uint productivityValue = 0;
    for (uint i = 0; i < numbersUsed.length; ++i) {
      productivityValue += _assetRetriever.getProductivity(numbersUsed[i]);
    }
    return productivityValue;
  }

  function getProductivity(string memory machine, uint rand, int baseline) external view returns(string memory) {

    uint productivity = getProductivityValue(machine, rand, baseline);

    // slice COMBINED_PRODUCTIVITY_TIERS into 3 parts and cast to uint array
    uint[] memory productivityTiers = GridHelper.setUintArrayFromString(string(GridHelper.slice(bytes(machineToProductivityTiers[machine]), 0, 18)), 6, 3);

    uint sum = 0;
    uint index = 6;

    for (uint i = 0; i < productivityTiers.length; ++i) {
      sum += productivityTiers[i];
      if (productivity < sum) {
        index = i;
        break;
      }
    }

    if (index == 0) {
      return "Obsolete";
    } else if (index == 1) {
      return "Very Low";
    } else if (index == 2) {
      return "Low";
    } else if (index == 3) {
      return "Medium";
    } else if (index == 4) {
      return "High";
    } else if (index == 5) {
      return "Very High";
    } else {
      return "Unstable";
    }
  }

  function getGlobalAssetName(uint rand, int baseline) external pure returns (string memory) {
    uint assetNumber = GlobalNumbers.getGlobalAssetNumber(rand, baseline);

    if (assetNumber == 6000) {
      return "Lavalamp";
    } else if (assetNumber == 6002) {
      return "Cactus";
    } else if (assetNumber == 6004) {
      return "Martini";
    } else if (assetNumber == 6006) {
      return "Bong";
    } else if (assetNumber == 6008) {
      return "Fridge";
    } else {
      return "None";
    }
  }

  function getExpansionPropName(uint rand, int baseline) external pure returns (string memory) {
    uint propNumber = GlobalNumbers.getExpansionPropsNumber(rand, baseline);

    if (propNumber == 2000) {
      return "Crack";
    } else if (propNumber == 2001) {
      return "Grate";
    } else if (propNumber == 2002) {
      return "Pit";
    } else if (propNumber == 2003) {
      return "Stairs";
    } else if (propNumber == 2004) {
      return "Ladder";
    } else if (propNumber == 2005) {
      return "Recess A";
    } else if (propNumber == 2006) {
      return "Recess B";
    } else if (propNumber == 2007) {
      return "Recess C";
    } else {
      return "None";
    }
  }

  function getCharacterName(uint rand, int baseline) external pure returns (string memory) {
    uint characterNumber = GlobalNumbers.getCharacterNumber(rand, baseline);

    if (characterNumber == 20000) {
      return "Sitting";
    } else if (characterNumber == 20001) {
      return "Standing";
    } else if (characterNumber == 20002) {
      return "Collapsed";
    } else if (characterNumber == 20003) {
      return "Slouched";
    } else if (characterNumber == 20004) {
      return "Meditating";
    } else if (characterNumber == 20005) {
      return "Hunched";
    } else {
      return "None";
    }

  }
}