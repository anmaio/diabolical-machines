// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// STYLES

import "./styles/altar/AltarCSS1.sol";

import "./styles/assets/AssetsCSS1.sol";
import "./styles/assets/AssetsCSS2.sol";

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

// DEFS

import "./defs/patterns/PatternsDefs1.sol";
import "./defs/patterns/PatternsDefs2.sol";
import "./defs/patterns/PatternsDefs3.sol";
import "./defs/patterns/PatternsDefs4.sol";
import "./defs/patterns/PatternsDefs5.sol";
import "./defs/patterns/PatternsDefs6.sol";
import "./defs/patterns/PatternsDefs7.sol";
import "./defs/patterns/PatternsDefs8.sol";
import "./defs/patterns/PatternsDefs9.sol";
import "./defs/patterns/PatternsDefs10.sol";
import "./defs/patterns/PatternsDefs11.sol";
import "./defs/patterns/PatternsDefs12.sol";
import "./defs/patterns/PatternsDefs13.sol";
import "./defs/patterns/PatternsDefs14.sol";
import "./defs/patterns/PatternsDefs15.sol";
import "./defs/patterns/PatternsDefs16.sol";
import "./defs/patterns/PatternsDefs17.sol";

import "./defs/altar/AltarDefs1.sol";
import "./defs/altar/AltarDefs2.sol";
import "./defs/altar/AltarDefs3.sol";

// SOUND

import "./sound/SoundImp1.sol";
import "./sound/SoundImp2.sol";
import "./sound/SoundImp3.sol";

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

  function getShell(string memory flip, uint rand, int baseline, string memory dataInfo) external pure returns (string memory) {
    return string.concat(
      CommonSVG.SHELL_OPEN,
      flip,
      CommonSVG.SHELL_CLOSE,
      dataInfo,
      // "data-info=\"{'id':0,'RandomNumber':'107902980979898548990920576554000892204849709403626377894656421886843343448711','State':'Degraded','Machine':'Altar','Productivity':'Very High','ProductivityValue':'41','GlobalAsset':'Cactus','ExpansionProp':'Grate','Colour':'Common'}\" >",
      CommonSVG.createShellOpacity(rand, baseline)
    );
  }

  function getOpeningSVG(string memory machine, uint colourValue, uint rand, int baseline) external pure returns (string memory) {

    string memory output = string.concat(
      CommonSVG.SVG_START,
      CommonSVG.getshellColours(machine, colourValue),
      CommonSVG.createShellPattern(rand, baseline)
    );

    output = string.concat(
      output,
      PatternsDefs1.getPart(),
      PatternsDefs2.getPart(),
      PatternsDefs3.getPart(),
      PatternsDefs4.getPart(),
      PatternsDefs5.getPart(),
      PatternsDefs6.getPart()
    );

    output = string.concat(
      output,
      PatternsDefs7.getPart(),
      PatternsDefs8.getPart(),
      PatternsDefs9.getPart(),
      PatternsDefs10.getPart(),
      PatternsDefs11.getPart(),
      PatternsDefs12.getPart()
    );

    output = string.concat(
      output,
      PatternsDefs13.getPart(),
      PatternsDefs14.getPart(),
      PatternsDefs15.getPart(),
      PatternsDefs16.getPart(),
      PatternsDefs17.getPart()
    );

    output = string.concat(
      output,

      ApparatusDefs1.getPart(),
      ApparatusDefs2.getPart(),

      AltarDefs1.getPart(),
      AltarDefs2.getPart(),
      AltarDefs3.getPart()
    );

    output = string.concat(
      output,
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
      SoundImp1.getPart(),
      SoundImp2.getPart(),
      SoundImp3.getPart(),
      CommonSVG.TEMP_STYLE,
      CommonSVG.STYLE,
      ApparatusCSS1.getPart(),
      ApparatusCSS2.getPart(),
      ApparatusCSS3.getPart()
    );

    output = string.concat(
      output,

      AltarCSS1.getPart(),
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
      AssetsCSS2.getPart(),
      CharacterCSS1.getPart(),
      CharacterCSS2.getPart(),
      CommonSVG.STYLE_CLOSE
    );
  }
}