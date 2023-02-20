// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./GridHelper.sol";
import "./GlobalNumbers.sol";
import "./AssetRetriever.sol";

interface IMachine {
  function getMachine(bytes memory digits, uint state) external view returns (string memory);
  function getAllNumbersUsed(bytes memory digits, uint state) external pure returns (uint[] memory, string[] memory);
  function getGlobalAssetNumber(bytes memory digits, uint state, uint version) external pure returns (uint);
}

contract Machine {

  AssetRetriever internal _assetRetriever;

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

    machineToProductivityTiers["Altar"] = "024027030032041045048051056060065069";
    machineToProductivityTiers["Drills"] = "024027030032041045048051056060065069";
    machineToProductivityTiers["Noses"] = "024027030032041045048051056060065069";
  }

  function selectMachine(uint rand) external view returns (string memory) {
      // return machines[rand % machines.length];
      return allMachines[2];
  }

  function machineToGetter(string memory machine, bytes memory rand, uint state) external view returns (string memory) {
    return IMachine(machineToWorkstation[machine]).getMachine(rand, state);
  }

  function getProductivityValue(string memory machine, bytes memory digits, uint state) public view returns (uint) {
    (uint[] memory numbersUsed,) = IMachine(machineToWorkstation[machine]).getAllNumbersUsed(digits, state);
    uint productivityValue = 0;
    for (uint i = 0; i < numbersUsed.length; ++i) {
      productivityValue += _assetRetriever.getProductivity(numbersUsed[i]);
    }
    return productivityValue;
  }

  function getProductivity(string memory machine, bytes memory rand, uint state) external view returns(string memory) {

    uint productivity = getProductivityValue(machine, rand, state);

    // slice ALTAR_COMBINED_PRODUCTIVITY_TIERS into 3 parts and cast to uint array
    uint[] memory productivityTiers = GridHelper.setUintArrayFromString(string(GridHelper.slice(bytes(machineToProductivityTiers[machine]), state*12, 12)), 4, 3);

    if (productivity < productivityTiers[0]) {
      return "Very Low";
    } else if (productivity < productivityTiers[1]) {
      return "Low";
    } else if (productivity < productivityTiers[2]) {
      return "Medium";
    } else if (productivity < productivityTiers[3]) {
      return "High";
    } else {
      return "Very High";
    }
  }

  function getGlobalAssetName(bytes memory rand, uint state) external pure returns (string memory) {
    uint assetNumber = GlobalNumbers.getGlobalAssetNumber(rand, state, 0);

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

  function getExpansionPropName(bytes memory rand, uint state) external pure returns (string memory) {
    uint propNumber = GlobalNumbers.getExpansionPropsNumber(rand, state);

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
}