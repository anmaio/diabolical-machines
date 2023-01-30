// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "@openzeppelin/contracts/utils/Strings.sol";
import "./GridHelper.sol";

interface IMachine {
  function getMachine(bytes memory digits, uint state) external view returns (string memory);
  function getProductivityValue(bytes memory digits, uint state) external view returns (uint);
}

contract Machine {

  // conveyor belt
  string[] public allMachines = ["Conveyorbelt", "Drills", "Nose", "Beast", "Altar", "Tubes"];
  // TESTING
  string[] public machines = ["Altar"];

  mapping(string => string) public machineToProductivityTiers;
  mapping(string => address) public machineToWorkstation;

  constructor(address[6] memory workstations) {
    // machine.setAllWorkstations([address(conveyorbelt), address(drills), address(nose), address(beast), address(altar), address(tubes)]);
    for (uint i = 0; i < allMachines.length; ++i) {
      machineToWorkstation[allMachines[i]] = workstations[i];
    }

    machineToProductivityTiers["Altar"] = "020030040050020030040050020030040050";
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
}