// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

library CharacterDefs1 {
  string internal constant PART = "<defs><path xmlns='http://www.w3.org/2000/svg' id='char-s-path137' fill='var(--r0)' stroke='#1d1d1b' stroke-width='.75' d='M377.79 513.13c.84-5.58 2.98-12.48 3.63-14.23.96-2.58 5.36-12.49 8.82-11.51 3.52.99.24 6.96-2.41 13.63-1.15 2.89-2.35 10.83-2.35 10.83'/><path xmlns='http://www.w3.org/2000/svg' id='char-s-path138' fill='var(--r0)' stroke='#1d1d1b' stroke-width='.75' d='M392.91 528.32s9.24-4.53 9.91-8.49-.85-9.25-2.64-9.1c-.06 0-.12.02-.18.03.9-.55 1.42-1.65.22-3.54-1.7-2.68-6.33-4.95-8.48-4.52-3.84.77-7.15 8.19-7.5 9.44m13.4 2.47c.1 1.47.1 2.54.13 3.64 0 .24-1.81.35-3.59.73-1.09-1.49-3.11-4.38-2.98-5.43.18-1.43 1.8-4.46 2.43-4.64s3.5 2.44 5.13 2.25c.03 0 .06 0 .09-.01-.89.57-1.33 1.69-1.2 3.46Z'/></defs>";

  function getPart() external pure returns (string memory) {
    return PART;
  }
}