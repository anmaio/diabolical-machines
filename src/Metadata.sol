// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "base64-sol/base64.sol";
// import "./Clifford.sol";
import "./Machine.sol";
import "./GridHelper.sol";
import "./GlobalSVG.sol";

contract Metadata {
  Machine private _machine;
  // Clifford private _clifford;
  GlobalSVG private _globalSVG;

  constructor(Machine machine, GlobalSVG globalSVG) {
      _machine = machine;
      _globalSVG = globalSVG;
  }

  // function setClifford(Clifford clifford) public onlyOwner {
  //   _clifford = clifford;
  // }

  function getMachine(bytes memory rand) public view returns (string memory) {
    uint randomNumber = GridHelper.bytesToUint(GridHelper.slice(rand, 10, 2));

    string memory machine = _machine.selectMachine(randomNumber);
    return machine;
  }

  //["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"]
  // Function build metadata for a given token
  function buildMetadata(uint256 tokenId, bytes memory rand) public view returns (string memory) {
    string[3] memory allStates = ["Degraded", "Basic", "Embellished"];
    string memory jsonInitial = string.concat(
        '{"name": "Clifford # ',
        Strings.toString(tokenId),
        '", "description": "PUT DESCRIPTION HERE", "attributes": [{"trait_type": "Machine", "value":"',
        getMachine(rand),
        '"}, {"trait_type": "State", "value":"',
        allStates[getState(rand)],
        '"}, {"trait_type": "Productivity", "value":"',
        getProductivity(rand)
        
        // _imageURI,
        // Strings.toString(tokenId),
        // '.png", "animation_url": "data:image/svg+xml;base64,'
    );

    jsonInitial = string.concat(
        jsonInitial,
        '"}, {"trait_type": "Global Asset:", "value":"',
        getGlobalAssetName(rand),
        '"}, {"trait_type": "Expansion Prop:", "value":"',
        getExpansionPropName(rand),
        '"}],',
        '"image": "data:image/svg+xml;base64,'
    );

    string memory jsonFinal = Base64.encode(
      bytes(string.concat(jsonInitial, composeSVG(rand), '"}'))
    );
    string memory output = string.concat("data:application/json;base64,", jsonFinal);
    return output;
  }

  function getProductivity(bytes memory rand) public view returns (string memory) {
    uint state = getState(rand);
    string memory machine = getMachine(rand);
    return _machine.getProductivity(machine, rand, state);
  }

  function getGlobalAssetName(bytes memory rand) public view returns (string memory) {
    uint state = getState(rand);
    return _machine.getGlobalAssetName(rand, state);
  }

  function getExpansionPropName(bytes memory rand) public view returns (string memory) {
    uint state = getState(rand);
    return _machine.getExpansionPropName(rand, state);
  }

  // 0 = degraded, 1 = basic, 2 = embellished
  function getState(bytes memory digits) public pure returns (uint) {
    uint stateDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 1, 2));
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
  function composeSVG(bytes memory rand) public view returns (string memory) {
    // return all svg's concatenated together and base64 encoded
    return Base64.encode(bytes(composeOnlyImage(rand)));
  }

  
  function composeOnlyImage(bytes memory rand) public view returns (string memory) {
    // determine if flipped

    // 0 if not flipped, 1 if flipped
    uint isFlipped = GridHelper.stringToUint(string(rand)) % 2;
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
