// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Test.sol";
import "../src/Clifford.sol";
import "../src/Compose.sol";
import "../src/Metadata.sol";
import "../src/VRFv2Consumer.sol";
import "../src/SharedAssets.sol";
import "../src/Machine.sol";

contract CliffordTest is Test {
    SharedAssets public sharedAssets;
    Compose public compose;
    Machine public machine;
    Metadata public metadata;
    VRFv2Consumer public vrfV2Consumer;
    Clifford public clifford;

    function setUp() public {
        sharedAssets = new SharedAssets();
        compose = new Compose(sharedAssets);
        machine = new Machine();
        metadata = new Metadata(compose, machine);
        clifford = new Clifford(metadata);
        vrfV2Consumer = new VRFv2Consumer(address(clifford));

        metadata.setVRFConsumer(vrfV2Consumer);
        clifford.setVRFConsumer(vrfV2Consumer);
    }
    
    function testItReturnsRandom() public view {
        clifford.randomNumber();
    }

    function testSafeMint() public {
      address to = address(1337);
      clifford.safeMint(to);
      console.log(clifford.tokenURI(0));
    }
}
