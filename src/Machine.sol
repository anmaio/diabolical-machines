// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Machine {
  // conveyor belt
  string[] public machines = ["conveyorBelt"];
  uint[][] public conveyorBeltPositions = [[0,1,2], [3,4,5], [6,7,8]];
  uint[] public machineHeightPW = [1]; // Primary Wall
  uint[] public machineHeightSW = [1]; // Secondary Wall
  mapping(string => uint[][]) internal machineToPosition;
  mapping(string => uint[]) internal machineToHeight;

  constructor() {
    machineToPosition["conveyorBelt"] = conveyorBeltPositions;
    machineToHeight["conveyorBelt"] = [machineHeightPW[0], machineHeightSW[0]];
  }

  function selectMachine(uint rand) public view returns (string memory) {
    return machines[rand % machines.length];
  }

  function getMachinePositions(string memory machine, uint rand) public view returns (uint[] memory) {
    return machineToPosition[machine][rand % machineToPosition[machine].length];
  }

  function getMachineHeight(string memory machine) public view returns (uint[] memory) {
    return machineToHeight[machine];
  }
}