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
  Noise private immutable _noise;

  constructor(Machine machine, GlobalSVG globalSVG, Noise noise) {
      _machine = machine;
      _globalSVG = globalSVG;
      _noise = noise;
  }

  function getMachine(uint rand) public view returns (string memory) {
    // uint randomNumber = GridHelper.bytesToUint(GridHelper.slice(rand, 10, 2));
    uint randomNumber = uint(GridHelper.getRandByte(rand, 10));

    return _machine.selectMachine(randomNumber);
  }

  //["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"]
  // Function build metadata for a given token
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
        
        // _imageURI,
        // Strings.toString(tokenId),
        // '.png", "animation_url": "data:image/svg+xml;base64,'
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

  function getProductivity(uint rand, int baseline) public view returns (string memory) {
    string memory machine = getMachine(rand);
    return _machine.getProductivity(machine, rand, baseline);
  }

  function getBaseColourValue(uint rand, int baseline) internal view returns (uint) {
    return GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 3)] + baseline);
  }

  function getColourIndexTier(uint rand, int baseline) public view returns(string memory) {
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

  // 0 = degraded, 1 = basic, 2 = embellished
  function getState(int baseline) public pure returns (uint) {
    if (baseline < 85) {
      return 0;
    } else if (baseline < 171) {
      return 1;
    } else {
      return 2;
    }
  }

  function getBaselineRarity(uint rand) public view returns (int) {
    int baselineDigits = int(GridHelper.constrainToHex(_noise.getNoiseArrayOne()[GridHelper.getRandByte(rand, 2)]));
    return baselineDigits;
  }

  // compose SVG
  function composeSVG(uint rand, int baseline) public view returns (string memory) {
    // return all svg's concatenated together and base64 encoded
    return Base64.encode(bytes(composeOnlyImage(rand, baseline)));
  }
  
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

    string memory opening = _globalSVG.getOpeningSVG(machine, colourValue);
    
    string memory objects = _machine.machineToGetter(machine, rand, baseline);
    string memory closing = _globalSVG.getClosingSVG();
    // return all svg's concatenated together and base64 encoded
    return string.concat(opening, _globalSVG.getShell(flip), objects, closing);
  }
}
