// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Clifford.sol";
import "../src/Compose.sol";
import "../src/Metadata.sol";
import "../src/VRFv2Consumer.sol";
import "../src/SharedAssets.sol";

contract CliffordTest is Test {
    SharedAssets public sharedAssets;
    Compose public compose;
    Metadata public metadata;
    VRFv2Consumer public vrfV2Consumer;
    Clifford public clifford;

    function setUp() public {
        sharedAssets = new SharedAssets();
        compose = new Compose(sharedAssets);
        metadata = new Metadata(compose);
        // vrfV2Consumer = new VRFv2Consumer(address(clifford));

        // metadata.setVRFConsumer(vrfV2Consumer);
        // clifford.setVRFConsumer(vrfV2Consumer);
    }

    function testItDeploys() public {
        clifford = new Clifford(metadata);
    }
}
