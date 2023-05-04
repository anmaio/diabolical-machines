// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

library SoundImp2 {

  string internal constant PART = "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";

  function getPart() external pure returns (string memory) {
    return PART;
  }
  
}