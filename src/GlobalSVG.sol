// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// TEMP STYLES

import "./styles/altar/AltarCSS1.sol";

import "./styles/drills/DrillsCSS1.sol";

import "./styles/noses/NosesCSS1.sol";

import "./styles/assets/AssetsCSS1.sol";

import "./styles/character/CharacterCSS1.sol";
import "./styles/character/CharacterCSS2.sol";

// TEMP DEFS

import "./defs/altar/AltarDefs1.sol";
import "./defs/altar/AltarDefs2.sol";
import "./defs/altar/AltarDefs3.sol";

import "./defs/drills/DrillsDefs1.sol";

import "./defs/noses/NosesDefs1.sol";

import "./defs/assets/AssetsDefs1.sol";
import "./defs/assets/AssetsDefs2.sol";

import "./defs/props/PropsDefs1.sol";

import "./defs/character/CharacterDefs1.sol";

import "./CommonSVG.sol";

contract GlobalSVG {

  function getClosingSVG() external pure returns (string memory) {
    return string.concat(
      "</g>",
      // CommonSVG.G_END,
      "</svg>"
    );
    // return CommonSVG.SVG_END;
  }

  function getShell(string memory flip) external pure returns (string memory) {
    return string.concat(
      CommonSVG.SHELL_OPEN,
      flip,
      CommonSVG.SHELL_CLOSE
    );
  }

  function getOpeningSVG(string memory machine, uint colourValue) external pure returns (string memory) {

    string memory output = string.concat(
      CommonSVG.SVG_START,
      CommonSVG.DEFS,
      CommonSVG.getshellColours(machine, colourValue)
    );

    output = string.concat(
      output, 

      AltarDefs1.getPart(),
      AltarDefs2.getPart(),
      AltarDefs3.getPart(),
      DrillsDefs1.getPart()
    );

    output = string.concat(
      output,
      NosesDefs1.getPart()
    );

    output = string.concat(
      output,
      AssetsDefs1.getPart(),
      AssetsDefs2.getPart(),
      CharacterDefs1.getPart(),
      PropsDefs1.getPart()
    );

    output = string.concat(
      output,
      CommonSVG.SCRIPT,
      CommonSVG.STYLE
    );

    output = string.concat(
      output,

      AltarCSS1.getPart(),
      DrillsCSS1.getPart(),
      NosesCSS1.getPart()
    );

    return string.concat(
      output,
      AssetsCSS1.getPart(),
      CharacterCSS1.getPart(),
      CharacterCSS2.getPart(),
      CommonSVG.STYLE_CLOSE
    );
  }
}