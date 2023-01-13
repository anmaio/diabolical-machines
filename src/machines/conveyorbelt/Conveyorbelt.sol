// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "./ConveyorbeltAdditional1.sol";
import "./ConveyorbeltAdditional2.sol";

contract Conveyorbelt {
  
  // Each position is represented by 6 bytes, 3 for x and 3 for y
  bytes internal constant PIPE_POSITIONS = "000000000060000120000180000240000300000360000420000480";

  // Each position is represented by 8 bytes, 4 for x and 4 for y
  bytes internal constant DISC_POSITIONS = "00000000-0300018-0600036-0900054-1200072-1500090-1800108-2100126-2400144-2700162";

  function getMachine(bytes memory digits) external pure returns (string memory) {
    string memory output = "";
    output = string.concat(
      GridHelper.repeatGivenObject(conveyorbeltAdditional1.getPipes(), 9, PIPE_POSITIONS), 
      conveyorbeltAdditional1.getHole(), 
      conveyorbeltAdditional1.getBeltOpen()
    );

    return CommonSVG.groupTransform("-468", "-630", 
      string.concat(
        output,
        GridHelper.repeatGivenObject(conveyorbeltAdditional1.getBeltDisc(), 10, DISC_POSITIONS), 
        conveyorbeltAdditional1.getBeltClose(), 
        conveyorbeltAdditional2.getFloob(), 
        conveyorbeltAdditional2.getSlicer(), 
        conveyorbeltAdditional2.getLever()));
  }
}