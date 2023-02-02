// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./GridHelper.sol";
import "./GlobalNumbers.sol";

interface IMachine {
  function getMachine(bytes memory digits, uint state) external view returns (string memory);
  function getProductivityValue(bytes memory digits, uint state) external view returns (uint);
  function getGlobalAssetNumber(bytes memory digits, uint state, uint version) external pure returns (uint);
}

contract Machine {

  // conveyor belt
  // string[] public allMachines = ["Conveyorbelt", "Drills", "Nose", "Beast", "Altar", "Tubes"];
  string[] public allMachines = ["Altar"];
  // TESTING
  string[] public machines = ["Altar"];

  mapping(string => string) public machineToProductivityTiers;
  mapping(string => address) public machineToWorkstation;

  constructor(address[1] memory workstations) {
    // machine.setAllWorkstations([address(conveyorbelt), address(drills), address(nose), address(beast), address(altar), address(tubes)]);
    for (uint i = 0; i < allMachines.length; ++i) {
      machineToWorkstation[allMachines[i]] = workstations[i];
    }

    machineToProductivityTiers["Altar"] = "021024026029037039042045051054056060";
  }

  function selectMachine(uint rand) external view returns (string memory) {
      return machines[rand % machines.length];
  }

  function machineToGetter(string memory machine, bytes memory rand, uint state) external view returns (string memory) {
    return IMachine(machineToWorkstation[machine]).getMachine(rand, state);
  }

  function getProductivity(string memory machine, bytes memory rand, uint state) external view returns(string memory) {

    uint productivity = IMachine(machineToWorkstation[machine]).getProductivityValue(rand, state);

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

  function getProductivityValue(string memory machine, bytes memory rand, uint state) external view returns (uint) {
    return IMachine(machineToWorkstation[machine]).getProductivityValue(rand, state);
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