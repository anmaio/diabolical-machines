// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "base64-sol/base64.sol";
import "./Machine.sol";
import "./GridHelper.sol";
import "./GlobalSVG.sol";
import "./Noise.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Metadata {
  Machine private immutable _machine;
  // Clifford private _clifford;
  GlobalSVG private immutable _globalSVG;

  constructor(Machine machine, GlobalSVG globalSVG) {
      _machine = machine;
      _globalSVG = globalSVG;
  }

  /**
    * @dev Returns the machine based on the random number
    * @param rand The digits to use
    * @return The machine
   */

  function getMachine(uint rand) public view returns (string memory) {
    return _machine.selectMachine(rand);
  }

  /**
   * @dev build entire metadata for a given token
    * @param tokenId The token to build metadata for
    * @param rand The digits to use
    * @return The metadata
  */

  function buildMetadata(uint256 tokenId, uint rand) public view returns (string memory) {
    string[3] memory allStates = ["Degraded", "Basic", "Embellished"];
    int baseline = getBaselineRarity(rand);
    uint state = getState(baseline);
    string memory jsonInitial = string.concat(
        '{"name": "Clifford # ',
        Strings.toString(tokenId),
        '", "description": "PUT DESCRIPTION HERE", "attributes": [{"trait_type": "Machine", "value":"',
        getMachine(rand),
        '"}, {"trait_type": "State", "value":"',
        allStates[state],
        '"}, {"trait_type": "Productivity", "value":"',
        getProductivity(rand, baseline)
    );

    jsonInitial = string.concat(
        jsonInitial,
        '"}, {"trait_type": "Global Asset:", "value":"',
        _machine.getGlobalAssetName(rand, baseline),
        '"}, {"trait_type": "Expansion Prop:", "value":"',
        _machine.getExpansionPropName(rand, baseline),
        '"}, {"trait_type": "Colour:", "value":"',
        getColourIndexTier(rand, baseline),
        '"}, {"trait_type": "Character:", "value":"',
        _machine.getCharacterName(rand, baseline),
        '"}],',
        '"image": "data:image/svg+xml;base64,'
    );

    string memory jsonFinal = Base64.encode(
      bytes(string.concat(jsonInitial, composeSVG(rand, baseline), '"}'))
    );
    string memory output = string.concat("data:application/json;base64,", jsonFinal);
    return output;
  }

  /**
    * @dev Get the productivity based on the baseline rarity and random number
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return The productivity as a string
   */

  function getProductivity(uint rand, int baseline) public view returns (string memory) {
    string memory machine = getMachine(rand);
    return _machine.getProductivity(machine, rand, baseline);
  }

  /**
    * @dev Get the colour index based on the baseline rarity and random number
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return The colour index as a string
   */

  function getBaseColourValue(uint rand, int baseline) internal pure returns (uint) {
    return GridHelper.constrainToHex(Noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 3)] + baseline);
  }

  /**
    * @dev Get the colour index tier based on the baseline rarity and random number
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return The colour index tier as a string
   */

  function getColourIndexTier(uint rand, int baseline) public pure returns(string memory) {
    uint value = Environment.getColourIndex(getBaseColourValue(rand, baseline));

    uint singleStateValue = value % 8;
    uint doubleStateValue = value % 4;

    string memory colourTier = "";

    if (value < 4) {
      colourTier = string.concat("Very Degraded ", Strings.toString(doubleStateValue));
    } else if (value < 8) {
      colourTier = string.concat("Degraded ", Strings.toString(doubleStateValue));
    } else if (value < 16) {
      colourTier = string.concat("Basic ", Strings.toString(singleStateValue));
    } else if (value < 20) {
      colourTier = string.concat("Embellished ", Strings.toString(doubleStateValue));
    } else if (value < 24) {
      colourTier = string.concat("Very Embellished ", Strings.toString(doubleStateValue));
    } else {
      colourTier = "Unknown";
    }
    return colourTier;
  }

  /**
    * @dev Get the state based on the baseline rarity
    * @param baseline The baseline rarity
    * @return The state as an integer
   */
  
  function getState(int baseline) public pure returns (uint) {
    // 0 = degraded, 1 = basic, 2 = embellished
    if (baseline < 85) {
      return 0;
    } else if (baseline < 171) {
      return 1;
    } else {
      return 2;
    }
  }

  /**
    * @dev Get the baseline rarity based on the random number
    * @param rand The digits to use
    * @return The baseline rarity as an integer
   */

  function getBaselineRarity(uint rand) public pure returns (int) {
    int baselineDigits = int(GridHelper.constrainToHex(Noise.getNoiseArrayZero()[GridHelper.getRandByte(rand, 2)]));
    return baselineDigits;
  }

  /**
    * @dev Get the SVG for a given token base64 encoded
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return The SVG as a string
   */
  
  function composeSVG(uint rand, int baseline) public view returns (string memory) {
    // return all svg's concatenated together and base64 encoded
    return Base64.encode(bytes(composeOnlyImage(rand, baseline)));
  }

  /**
    * @dev Get the SVG for a given token not base64 encoded
    * @param rand The digits to use
    * @param baseline The baseline rarity
    * @return The SVG as a string
   */
  
  function composeOnlyImage(uint rand, int baseline) public view returns (string memory) {
    // determine if flipped

    // 0 if not flipped, 1 if flipped
    uint isFlipped = rand % 2;
    string memory flip = "";
    if (isFlipped == 0) {
      flip = "1";
    } else {
      flip = "-1";
    }

    string memory machine = getMachine(rand);

    uint colourValue = getBaseColourValue(rand, baseline);

    string memory opening = _globalSVG.getOpeningSVG(machine, colourValue, rand, baseline);
    
    string memory objects = _machine.machineToGetter(machine, rand, baseline);
    string memory closing = _globalSVG.getClosingSVG();
    // return all svg's concatenated together and base64 encoded
    return string.concat(opening, _globalSVG.getShell(flip, rand, baseline), objects, closing);
  }
}
