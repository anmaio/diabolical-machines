// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

library SoundImp2 {

  string internal constant PART = "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";

  function getPart() external pure returns (string memory) {
    return PART;
  }
  
}