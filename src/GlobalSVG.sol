// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// TEMP STYLES

import "./styles/altar/AltarCSS1.sol";

// import "./styles/drills/DrillsCSS1.sol";

// import "./styles/noses/NosesCSS1.sol";

import "./styles/assets/AssetsCSS1.sol";

import "./styles/apparatus/ApparatusCSS1.sol";
import "./styles/apparatus/ApparatusCSS2.sol";
import "./styles/apparatus/ApparatusCSS3.sol";

import "./styles/cells/CellsCSS1.sol";
import "./styles/cells/CellsCSS2.sol";
import "./styles/cells/CellsCSS3.sol";

import "./styles/tubes/TubesCSS1.sol";
import "./styles/tubes/TubesCSS2.sol";

import "./styles/beast/BeastCSS1.sol";
import "./styles/beast/BeastCSS2.sol";
import "./styles/beast/BeastCSS3.sol";

import "./styles/conveyorBelt/ConveyorBeltCSS1.sol";
import "./styles/conveyorBelt/ConveyorBeltCSS2.sol";
import "./styles/conveyorBelt/ConveyorBeltCSS3.sol";

import "./styles/character/CharacterCSS1.sol";
import "./styles/character/CharacterCSS2.sol";

// TEMP DEFS

import "./defs/altar/AltarDefs1.sol";
import "./defs/altar/AltarDefs2.sol";
import "./defs/altar/AltarDefs3.sol";

// import "./defs/drills/DrillsDefs1.sol";

// import "./defs/noses/NosesDefs1.sol";

import "./defs/assets/AssetsDefs1.sol";
import "./defs/assets/AssetsDefs2.sol";

import "./defs/apparatus/ApparatusDefs1.sol";
import "./defs/apparatus/ApparatusDefs2.sol";

import "./defs/cells/CellsDefs1.sol";
import "./defs/cells/CellsDefs2.sol";

import "./defs/tubes/TubesDefs1.sol";

import "./defs/beast/BeastDefs1.sol";
import "./defs/beast/BeastDefs2.sol";

import "./defs/conveyorBelt/ConveyorBeltDefs1.sol";

import "./defs/props/PropsDefs1.sol";

import "./CommonSVG.sol";

contract GlobalSVG {

  function getClosingSVG() external pure returns (string memory) {
    return string.concat(
      "</g>",
      "</svg>"
    );
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
      CommonSVG.getshellColours(machine, colourValue)
    );

    output = string.concat(
      output,

      ApparatusDefs1.getPart(),
      ApparatusDefs2.getPart(),

      AltarDefs1.getPart(),
      AltarDefs2.getPart(),
      AltarDefs3.getPart()
      // DrillsDefs1.getPart()
    );

    output = string.concat(
      output,
      // NosesDefs1.getPart(),
      CellsDefs1.getPart(),
      CellsDefs2.getPart(),
      TubesDefs1.getPart(),
      ConveyorBeltDefs1.getPart()
    );

    output = string.concat(
      output,
      AssetsDefs1.getPart(),
      AssetsDefs2.getPart(),
      PropsDefs1.getPart(),
      BeastDefs1.getPart(),
      BeastDefs2.getPart()
    );

    output = string.concat(
      output,
      CommonSVG.SCRIPT,
      CommonSVG.STYLE,
      ApparatusCSS1.getPart(),
      ApparatusCSS2.getPart(),
      ApparatusCSS3.getPart()
    );

    output = string.concat(
      output,

      AltarCSS1.getPart(),
      // DrillsCSS1.getPart(),
      // NosesCSS1.getPart(),
      CellsCSS1.getPart(),
      CellsCSS2.getPart(),
      CellsCSS3.getPart()
    );

    output = string.concat(
      output,
      TubesCSS1.getPart(),
      TubesCSS2.getPart(),
      BeastCSS1.getPart(),
      BeastCSS2.getPart(),
      BeastCSS3.getPart()
    );

    output = string.concat(
      output,
      ConveyorBeltCSS1.getPart(),
      ConveyorBeltCSS2.getPart(),
      ConveyorBeltCSS3.getPart()
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