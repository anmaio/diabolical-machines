// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

library SoundImp11 {

  string internal constant PART = "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go8Tmg2gTudjlY0t6TMTwAPfss0SZTU1aMxi8/FyzDNGmFkwZLH/86lXSxy4GlvG+ZX5sfjisEzOGCz0Pcz/+xDE5oJEfDspTaREAKSHI0nujBDJs9jnB4Bw1TEYHFIcA7natScRHrUCD3rNX5VazRf11BvAAyGCVzMiMHNZCpAxtS4D7khAzBTTU0Ye3diLMmEurqJM7ILO0DIuyuhr6UThnqpCAP/7EsTpg8ZQQxgvaYJQhIbjwdwYURTEgDBN5m78yehODsJLDgctdVjL3/nVVQgEoVuWDkhlVCxw9thgSfd2O0UARAI+jYc0AhEjFvAAAdIIfoWL3dyITdTsy5LJ7f75UeMtmlfF8+D/4v/7EMTpgkVINxoO+YCAmYYkKdykSHQ21u/22AxXwBRSBEBQR34YldPh3/3JrfN1WYmAZ0LMgf6WNtHRqBy1ZVczoVZowA1w4KVTDrWzKIMRYCVNXalJxjZFWL4/1lAAXArXwSS7AWtN//sSxOqDRYgvGC9lIkDBiSMJ3KRA13zDTRHCsdokx0samHgEnGySRxS48TCgDBT841hRPejwjjeXLM4nH+oAXmhuAAMOoXGr5AEEhrKFQ+2yjoI+jWDcriEqZO9fGu9MV7AAMtkuoICy//sQxOYDRDQtIE5gQmCxBiLF3jAIAREMEZcNBwZFM888+/r+fe/VEkBOTaDcpme5TtnqsgAAAAIMIAAAADGj0FqoFXwNoBYDQhaF6FDN0bnR+vKIwu1duifGmJ+xRom+rzQVlYSux/7/+xLE6INEsDEeTmTCQKmF5IneFFQjnSiebVard//v1e5qx5CjWxb/7/iR9/99BesMxvmKUsxlAUAXCgIC0IKyCv4M8K6CtgroRwU////xF0xBTUUzLjEwMFVVVVVVVVVVVVVVVVVVVVX/+xDE6oNGKD8gT3DiwLGHo0HuFGBVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVf/7EsTlAEUwNSate0AAugvrdYyeBlVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVf/7EMTjA0TMMSgtdmCImQekQcRhGVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//sSxOYARHg7NS0d5XCYBiXqttAEVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//sQxOsACfSZKTm3gAB9Bd5DiiABVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVU=\",spark=\"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";

  function getPart() external pure returns (string memory) {
    return PART;
  }
  
}