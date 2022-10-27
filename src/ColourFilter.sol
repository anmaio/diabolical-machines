// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

library ColourFilter {
  string internal constant SEPIA = ".343 .669 .119 0 0 .249 .626 .130 0 0 .172 .334 .111 0 0 .000 .000 .000 1 0";
  string internal constant INVERT = "-1 0 0 1 1 0 0 -1 0 1 0 0 0 0 0 1 0";
  string internal constant BLUE = "0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0";
  string internal constant GREEN = "0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0";
  string internal constant RED = "0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0";
  string internal constant DARKEN = ".5 0 0 0 0 0 .5 0 0 0 0 0 .5 0 0 0 0";
  string internal constant LIGHTEN = "1.5 0 0 0 0 0 1.5 0 0 0 0 0 1.5 0 0 0 0";
  string internal constant GRAYSCALE = ".2126 .7152 .0722 0 0 .2126 .7152 .0722 0 0 .2126 .7152 .0722 0 0 0 0 0";
  string internal constant SOFTEN = "0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0";
  string internal constant CONTRAST = "1.2 0 0 0 -.2 0 1.2 0 0 -.2 0 1.2 0 -.2 0 0 0 0 1 0";
  string internal constant BRIGHTNESS = "1 0 0 0 .2 0 1 0 0 .2 0 1 0 .2 0 0 0 0 1 0";
  string internal constant SATURATE = ".393 .769 .189 0 0 .349 .686 .168 0 0 .272 .534 .131 0 0 0 0 0";

  // get the filter
  function getFilter(string memory _filter) internal pure returns (string memory) {
    if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("sepia"))) {
      return SEPIA;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("invert"))) {
      return INVERT;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("blue"))) {
      return BLUE;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("green"))) {
      return GREEN;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("red"))) {
      return RED;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("darken"))) {
      return DARKEN;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("lighten"))) {
      return LIGHTEN;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("grayscale"))) {
      return GRAYSCALE;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("soften"))) {
      return SOFTEN;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("contrast"))) {
      return CONTRAST;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("brightness"))) {
      return BRIGHTNESS;
    } else if (keccak256(abi.encodePacked(_filter)) == keccak256(abi.encodePacked("saturate"))) {
      return SATURATE;
    } else {
      return "";
    }
  }
}