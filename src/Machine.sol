// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./GridHelper.sol";
import "./GlobalNumbers.sol";
import "./AssetRetriever.sol";

interface IMachine {
  function getMachine(uint rand, uint state, int baseline) external view returns (string memory);
  function getAllNumbersUsed(uint rand, uint state, int baseline) external pure returns (uint[] memory, string[] memory);
  function getGlobalAssetNumber(uint rand, uint state, uint version, int baseline) external pure returns (uint);
}

contract Machine {

  AssetRetriever internal immutable _assetRetriever;

  // conveyor belt
  // string[] public allMachines = ["Conveyorbelt", "Drills", "Noses", "Beast", "Altar", "Tubes"];
  string[] public allMachines = ["Altar", "Drills", "Noses"];

  mapping(string => string) public machineToProductivityTiers;
  mapping(string => address) public machineToWorkstation;

  constructor(address[3] memory workstations, AssetRetriever assetRetriever) {
    _assetRetriever = assetRetriever;

    for (uint i = 0; i < allMachines.length; ++i) {
      machineToWorkstation[allMachines[i]] = workstations[i];
    }

    machineToProductivityTiers["Altar"] = "020024027030032035038041045048051053054056060065069072";
    machineToProductivityTiers["Drills"] = "020024027030032035038041045048051053054056060065069072";
    machineToProductivityTiers["Noses"] = "020024027030032035038041045048051053054056060065069072";
  }

  //  @dev This function returns a random machine from the array of machines.
  //  @param rand The random number to be used to select a machine.
  //  @return The machine selected from the array of machines.
  function selectMachine(uint rand) external view returns (string memory) {
      // return allMachines[rand % allMachines.length];
      return allMachines[0];
  }

  // @dev This function returns the machine svg for a given machine.
  // @param machine The machine for which the svg is to be returned.
  // @param rand The random number to be used to select a machine.
  // @param state The state of the machine.
  // @return The machine svg for a given machine.
  function machineToGetter(string memory machine, uint rand, uint state, int baseline) external view returns (string memory) {
    return IMachine(machineToWorkstation[machine]).getMachine(rand, state, baseline);
  }

  // @dev This function returns the productivity value for a given machine.
  // @param machine The machine for which the productivity value is to be returned.
  // @param rand The random number to be used to select a machine.
  // @param state The state of the machine.
  // @return The productivity value for a given machine.
  function getProductivityValue(string memory machine, uint rand, uint state, int baseline) public view returns (uint) {
    (uint[] memory numbersUsed,) = IMachine(machineToWorkstation[machine]).getAllNumbersUsed(rand, state, baseline);
    uint productivityValue = 0;
    for (uint i = 0; i < numbersUsed.length; ++i) {
      productivityValue += _assetRetriever.getProductivity(numbersUsed[i]);
    }
    return productivityValue;
  }

  // @dev This function returns the productivity tier for a given machine.
  // @param machine The machine for which the productivity tier is to be returned.
  // @param rand The random number to be used to select a machine.
  // @param state The state of the machine.
  // @return The productivity tier for a given machine.
  function getProductivity(string memory machine, uint rand, uint state, int baseline) external view returns(string memory) {

    uint productivity = getProductivityValue(machine, rand, state, baseline);

    // slice ALTAR_COMBINED_PRODUCTIVITY_TIERS into 3 parts and cast to uint array
    uint[] memory productivityTiers = GridHelper.setUintArrayFromString(string(GridHelper.slice(bytes(machineToProductivityTiers[machine]), state*18, 18)), 6, 3);

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

  // @dev This function returns the name of the global asset for a given machine.
  // @param machine The machine for which the name of the global asset is to be returned.
  // @param rand The random number to be used to select a machine.
  // @param state The state of the machine.
  // @return The name of the global asset for a given machine.
  function getGlobalAssetName(uint rand, uint state, int baseline) external pure returns (string memory) {
    uint assetNumber = GlobalNumbers.getGlobalAssetNumber(rand, state, 0, baseline);

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

  // @dev This function returns the name of the expansion prop for a given machine.
  // @param machine The machine for which the name of the expansion prop is to be returned.
  // @param rand The random number to be used to select a machine.
  // @param state The state of the machine.
  // @return The name of the expansion prop for a given machine.
  function getExpansionPropName(uint rand, uint state, int baseline) external pure returns (string memory) {
    uint propNumber = GlobalNumbers.getExpansionPropsNumber(rand, state, baseline);

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

  // @dev This function returns the name of the character for a given machine.
  // @param machine The machine for which the name of the character is to be returned.
  // @param rand The random number to be used to select a machine.
  // @param state The state of the machine.
  // @return The name of the character for a given machine.
  function getCharacterName(uint rand, uint state, int baseline) external pure returns (string memory) {
    uint characterNumber = GlobalNumbers.getCharacterNumber(rand, state, baseline);

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