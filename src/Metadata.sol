// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "./Clifford.sol";
import "./Machine.sol";
import "./GridHelper.sol";
import "./GlobalSVG.sol";

contract Metadata is Ownable {
  Machine private _machine;
  Clifford private _clifford;
  GlobalSVG private _globalSVG;

  constructor(Machine machine, GlobalSVG globalSVG) {
      _machine = machine;
      _globalSVG = globalSVG;
  }

  // set handle random
  function setClifford(Clifford clifford) public onlyOwner {
    _clifford = clifford;
  }

  function getMachine(uint tokenId) public view returns (string memory) {
    uint rand = GridHelper.bytesToUint(GridHelper.slice(getRandBytes(tokenId), 10, 2));

    string memory machine = _machine.selectMachine(rand);
    return machine;
  }

  // get the random number for the token
  function getRandBytes(uint tokenId) public view returns (bytes memory) {
    return bytes(Strings.toString(_clifford.getSeed(tokenId)));
  }

  //["f/altar", "f/props", "l/frame", "r/frame", "r/clock", "s/shell"]
  // Function build metadata for a given token
  function buildMetadata(uint256 tokenId) public view returns (string memory) {
    string memory jsonInitial = string.concat(
        '{"name": "Clifford # ',
        Strings.toString(tokenId),
        '", "description": "PUT DESCRIPTION HERE", "attributes": [{"trait_type": "Machine", "value":"',
        getMachine(tokenId),
        '"}],',
        '"image": "data:image/svg+xml;base64,'
        // _imageURI,
        // Strings.toString(tokenId),
        // '.png", "animation_url": "data:image/svg+xml;base64,'
    );

      string memory jsonFinal = Base64.encode(
          bytes(string.concat(jsonInitial, composeSVG(tokenId), '"}'))
      );
      string memory output = string.concat("data:application/json;base64,", jsonFinal);
      return output;
  }

  // 0 = degraded, 1 = basic, 2 = embellished
  function getState(bytes memory digits) public pure returns (uint) {
    uint stateDigits = GridHelper.bytesToUint(GridHelper.slice(digits, 0, 2));
    if (stateDigits < 20) {
      return 0;
    } else if (stateDigits < 70) {
      return 1;
    } else {
      return 2;
    }
    
    // return 0;
  }

  // compose SVG
  function composeSVG(uint tokenId) public view returns (string memory) {
    // return all svg's concatenated together and base64 encoded
    return Base64.encode(bytes(composeOnlyImage(tokenId)));
  }

  
  function composeOnlyImage(uint tokenId) public view returns (string memory) {
    // determine if flipped

    bytes memory rand = getRandBytes(tokenId);
    // 0 if not flipped, 1 if flipped
    uint isFlipped = GridHelper.stringToUint(string(rand)) % 2;
    string memory flip = "";
    if (isFlipped == 0) {
      flip = "1";
    } else {
      flip = "-1";
    }

    uint state = getState(rand);

    string memory opening = _globalSVG.getOpeningSVG(getMachine(tokenId), rand, state);
    
    string memory objects = composeObjects(tokenId);
    string memory closing = _globalSVG.getClosingSVG();
    // return all svg's concatenated together and base64 encoded
    return string.concat(opening, _globalSVG.getShell(flip), objects, closing);
  }

  function composeObjects(uint tokenId) internal view returns (string memory) {
  
    string memory machine = getMachine(tokenId);

    bytes memory rand = getRandBytes(tokenId);
    uint state = getState(rand);

    return _machine.machineToGetter(machine, rand, state);
  }
}
