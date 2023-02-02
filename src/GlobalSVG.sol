// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// TEMP STYLES
// import "./styles/beast/BeastCSS1.sol";
// import "./styles/beast/BeastCSS2.sol";
// import "./styles/beast/BeastCSS3.sol";

// import "./styles/nose/NosesCSS1.sol";
// import "./styles/nose/NosesCSS2.sol";
// import "./styles/nose/NosesCSS3.sol";
// import "./styles/nose/NosesCSS4.sol";
// import "./styles/nose/NosesCSS5.sol";

import "./styles/altar/AltarCSS1.sol";
import "./styles/altar/AltarCSS2.sol";
import "./styles/altar/AltarCSS3.sol";
import "./styles/altar/AltarCSS4.sol";

// import "./styles/conveyorbelt/ConveyorbeltCSS1.sol";
// import "./styles/conveyorbelt/ConveyorbeltCSS2.sol";

// import "./styles/tubes/TubesCSS1.sol";

// import "./styles/drills/DrillsCSS.sol";

import "./styles/assets/AssetsCSS1.sol";

// TEMP DEFS
// import "./defs/beast/BeastDefs.sol";

// import "./defs/nose/NosesDefs1.sol";
// import "./defs/nose/NosesDefs2.sol";
// import "./defs/nose/NosesDefs3.sol";
// import "./defs/nose/NosesDefs4.sol";

import "./defs/altar/AltarDefs1.sol";
import "./defs/altar/AltarDefs2.sol";
import "./defs/altar/AltarDefs3.sol";

// import "./defs/conveyorbelt/ConveyorbeltDefs.sol";

// import "./defs/tubes/TubesDefs1.sol";
// import "./defs/tubes/TubesDefs2.sol";
// import "./defs/tubes/TubesDefs3.sol";

// import "./defs/drills/DrillsDefs1.sol";
// import "./defs/drills/DrillsDefs2.sol";
// import "./defs/drills/DrillsDefs3.sol";
// import "./defs/drills/DrillsDefs4.sol";
// import "./defs/drills/DrillsDefs5.sol";
// import "./defs/drills/DrillsDefs6.sol";
// import "./defs/drills/DrillsDefs7.sol";
// import "./defs/drills/DrillsDefs8.sol";

import "./defs/assets/AssetsDefs1.sol";
import "./defs/assets/AssetsDefs2.sol";

import "./defs/props/PropsDefs1.sol";

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

  function getOpeningSVG(string memory machine, bytes memory digits, uint state) external pure returns (string memory) {

    string memory output = string.concat(
      CommonSVG.SVG_START,
      CommonSVG.DEFS,
      CommonSVG.getshellColours(machine, digits, state)
      // BeastDefs.getPart(),

      // NosesDefs1.getPart(),
      // NosesDefs2.getPart(),
      // NosesDefs3.getPart(),
      // NosesDefs4.getPart()
    );

    output = string.concat(
      output, 

      AltarDefs1.getPart(),
      AltarDefs2.getPart(),
      AltarDefs3.getPart()

      // ConveyorbeltDefs.getPart(),
      // TubesDefs1.getPart(),
      // TubesDefs2.getPart(),
      // TubesDefs3.getPart()
    );

    output = string.concat(
      output,
      AssetsDefs1.getPart(),
      AssetsDefs2.getPart(),
      PropsDefs1.getPart()
    );

    // output = string.concat(
    //   output,
    //   DrillsDefs1.getPart(),
    //   DrillsDefs2.getPart(),
    //   DrillsDefs3.getPart(),
    //   DrillsDefs4.getPart(),
    //   DrillsDefs5.getPart(),
    //   DrillsDefs6.getPart(),
    //   DrillsDefs7.getPart(),
    //   DrillsDefs8.getPart()
    // );

    output = string.concat(
      output,
      CommonSVG.SCRIPT,
      CommonSVG.STYLE
      // TubesCSS1.getPart(),
      // BeastCSS1.getPart(),
      // BeastCSS2.getPart(),
      // BeastCSS3.getPart()
    );

    output = string.concat(
      output,

      // NosesCSS1.getPart(),
      // NosesCSS2.getPart(),
      // NosesCSS3.getPart(),
      // NosesCSS4.getPart(),
      // NosesCSS5.getPart(),

      AltarCSS1.getPart(),
      AltarCSS2.getPart()
    );

    return string.concat(
      output,
      AltarCSS3.getPart(),
      AltarCSS4.getPart(),
      AssetsCSS1.getPart(),
      // ConveyorbeltCSS1.getPart(),
      // ConveyorbeltCSS2.getPart(),
      // DrillsCSS.getPart(),
      CommonSVG.STYLE_CLOSE
    );
  }
}