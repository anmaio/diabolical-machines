// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "base64-sol/base64.sol";
// import "./Clifford.sol";
import "./Machine.sol";
import "./GridHelper.sol";
import "./GlobalSVG.sol";

contract Metadata {
  Machine private immutable _machine;
  // Clifford private _clifford;
  GlobalSVG private immutable _globalSVG;

  constructor(Machine machine, GlobalSVG globalSVG) {
      _machine = machine;
      _globalSVG = globalSVG;
  }

  function getMachine(uint rand) public view returns (string memory) {
    // uint randomNumber = GridHelper.bytesToUint(GridHelper.slice(rand, 10, 2));
    uint randomNumber = GridHelper.getRandByte(rand, 10);

    return _machine.selectMachine(randomNumber);
  }

  //["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"]
  // Function build metadata for a given token
  function buildMetadata(uint256 tokenId, uint rand) public view returns (string memory) {
    string[3] memory allStates = ["Degraded", "Basic", "Embellished"];
    uint state = getState(rand);
    string memory jsonInitial = string.concat(
        '{"name": "Clifford # ',
        Strings.toString(tokenId),
        '", "description": "PUT DESCRIPTION HERE", "attributes": [{"trait_type": "Machine", "value":"',
        getMachine(rand),
        '"}, {"trait_type": "State", "value":"',
        allStates[state],
        '"}, {"trait_type": "Productivity", "value":"',
        getProductivity(rand)
        
        // _imageURI,
        // Strings.toString(tokenId),
        // '.png", "animation_url": "data:image/svg+xml;base64,'
    );

    jsonInitial = string.concat(
        jsonInitial,
        '"}, {"trait_type": "Global Asset:", "value":"',
        _machine.getGlobalAssetName(rand, state),
        '"}, {"trait_type": "Expansion Prop:", "value":"',
        _machine.getExpansionPropName(rand, state),
        '"}, {"trait_type": "Colour:", "value":"',
        getColourIndexTier(rand, state),
        '"}, {"trait_type": "Character:", "value":"',
        _machine.getCharacterName(rand, state),
        '"}],',
        '"image": "data:image/svg+xml;base64,'
    );

    string memory jsonFinal = Base64.encode(
      bytes(string.concat(jsonInitial, composeSVG(rand), '"}'))
    );
    string memory output = string.concat("data:application/json;base64,", jsonFinal);
    return output;
  }

  function getProductivity(uint rand) public view returns (string memory) {
    uint state = getState(rand);
    string memory machine = getMachine(rand);
    return _machine.getProductivity(machine, rand, state);
  }

  function getColourIndexTier(uint rand, uint state) public pure returns(string memory) {
    uint value = Environment.getColourIndex(rand, state);

    if (value == 0) {
      return "Very Common";
    } else if (value == 1) {
      return "Common";
    } else if (value == 2) {
      return "Very Uncommon";
    } else if (value == 3) {
      return "Uncommon";
    } else if (value == 4) {
      return "Rare";
    } else if (value == 5) {
      return "Very Rare";
    } else if (value == 6) {
      return "Ultra Rare";
    } else if (value == 7) {
      return "Legendary";
    } else {
      return "Unknown";
    }
    
  }

  // 0 = degraded, 1 = basic, 2 = embellished
  function getState(uint rand) public pure returns (uint) {
    uint stateDigits = GridHelper.getRandByte(rand, 2);
    if (stateDigits < 10) {
      return 0;
    } else if (stateDigits < 60) {
      return 1;
    } else {
      return 2;
    }
    
    // return 0;
  }

  // compose SVG
  function composeSVG(uint rand) public view returns (string memory) {
    // return all svg's concatenated together and base64 encoded
    return Base64.encode(bytes(composeOnlyImage(rand)));
  }

  
  function composeOnlyImage(uint rand) public view returns (string memory) {
    // determine if flipped

    // 0 if not flipped, 1 if flipped
    uint isFlipped = rand % 2;
    string memory flip = "";
    if (isFlipped == 0) {
      flip = "1";
    } else {
      flip = "-1";
    }

    uint state = getState(rand);
    string memory machine = getMachine(rand);

    string memory opening = _globalSVG.getOpeningSVG(machine, rand, state);
    
    string memory objects = _machine.machineToGetter(machine, rand, state);
    string memory closing = _globalSVG.getClosingSVG();
    // return all svg's concatenated together and base64 encoded
    return string.concat(opening, _globalSVG.getShell(flip), objects, closing);
  }
}
