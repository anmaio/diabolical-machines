// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import "forge-std/Script.sol";
import "ERC721A/ERC721A.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract FakeClifford is ERC721A {
    constructor() ERC721A("Clifford", "Cliff") {
        
    }

    function publicMint(uint amount) public {
        _mint(msg.sender, amount);
    }

    function tokenURI(uint256 tokenId) public pure override returns (string memory) {
        return string.concat("https://gallerydevukssa.blob.core.windows.net/token-uri-metadata-test1/", Strings.toString(tokenId), ".json");
    }
}

contract FakeCliffordScript is Script {
    FakeClifford public fakeClifford;

    function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    vm.startBroadcast(deployerPrivateKey);

    fakeClifford = new FakeClifford();

    // mint 6000 tokens in batches of 50
    for (uint256 i = 0; i < 1; i++) {
      fakeClifford.publicMint(1);
    }

    vm.stopBroadcast();
  }
}