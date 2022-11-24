// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Script.sol";
import "../src/Clifford.sol";
import "../src/Compose.sol";
import "../src/Metadata.sol";
import "../src/HandleRandom.sol";
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
        HandleRandom handleRandom = new HandleRandom(clifford);
        
        metadata.setHandleRandom(handleRandom);
        clifford.setHandleRandom(handleRandom);
        compose.setMetadata(metadata);

        address to = address(1337);
        clifford.publicMint(to, 1);
        console.log(clifford.tokenURI(0));

        vm.stopBroadcast();
    }
}
