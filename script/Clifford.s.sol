// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Script.sol";
import "../src/Clifford.sol";
import "../src/Compose.sol";
import "../src/Metadata.sol";
import "../src/VRFv2Consumer.sol";
import "../src/SharedAssets.sol";
import "../src/Machine.sol";

contract CliffordScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);
        
        SharedAssets sharedAssets = new SharedAssets();
        Machine machine = new Machine();
        Compose compose = new Compose(sharedAssets, machine);
        Metadata metadata = new Metadata(compose, machine);
        Clifford clifford = new Clifford(metadata);
        VRFv2Consumer vrfV2Consumer = new VRFv2Consumer(address(clifford));
        
        metadata.setVRFConsumer(vrfV2Consumer);
        clifford.setVRFConsumer(vrfV2Consumer);

        vm.stopBroadcast();
    }
}
