// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Script.sol";
import "../src/Clifford.sol";
import "../src/Compose.sol";
import "../src/Metadata.sol";
import "../src/HandleRandom.sol";
import "../src/SharedAssets.sol";
import "../src/Machine.sol";

import "../src/machines/cypherRoom/CypherRoom.sol";
import "../src/machines/altar/Altar.sol";
import "../src/machines/beast/Beast.sol";
import "../src/machines/drills/Drills.sol";
import "../src/machines/nose/Nose.sol";
import "../src/machines/tubes/Tubes.sol";
import "../src/machines/conveyorbelt/Conveyorbelt.sol";

import "../src/GlobalSVG.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

contract CliffordScript is Script {
    CypherRoom public cypherRoom;
    Altar public altar;
    Beast public beast;
    Drills public drills;
    Nose public nose;
    Tubes public tubes;
    Conveyorbelt public conveyorbelt;

    SharedAssets public sharedAssets;
    Compose public compose;
    Machine public machine;
    Metadata public metadata;
    HandleRandom public handleRandom;
    Clifford public clifford;
    GlobalSVG public globalSVG;

    // function setUp() public {
        
    // }

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        cypherRoom = new CypherRoom();
        altar = new Altar();
        beast = new Beast();
        drills = new Drills();
        nose = new Nose();
        tubes = new Tubes();
        conveyorbelt = new Conveyorbelt();

        globalSVG = new GlobalSVG();
        sharedAssets = new SharedAssets();
        machine = new Machine();
        compose = new Compose(sharedAssets, machine, globalSVG);
        metadata = new Metadata(compose, machine);
        clifford = new Clifford(metadata);
        handleRandom = new HandleRandom(clifford);

        machine.setCypherRoom(cypherRoom);
        machine.setAltar(altar);
        machine.setBeast(beast);
        machine.setDrills(drills);
        machine.setNose(nose);
        machine.setTubes(tubes);
        machine.setConveyorbelt(conveyorbelt);

        metadata.setHandleRandom(handleRandom);
        clifford.setHandleRandom(handleRandom);
        compose.setMetadata(metadata);
        machine.setMetadata(metadata);

        // setUp();

        address to = 0xB2a61F4dE7d8C1985cb5565CFCBD7F1A18CBF123;
        clifford.publicMint(to, 1);
        console.log(clifford.tokenURI(0));

        vm.stopBroadcast();
    }
}
