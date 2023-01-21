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

import "../src/Assets/MachinesDevices/MachinesDevicesImp1.sol";
import "../src/Assets/MachinesDevices/MachinesDevicesImp2.sol";
import "../src/Assets/MachinesDevices/MachinesDevicesImp3.sol";

import "../src/Assets/TraitBase.sol";
import "../src/AssetRetriever.sol";

import "../src/GlobalSVG.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

contract CliffordScript is Script {
    MachinesDevicesImp1 public machineDevicesImp1;
    MachinesDevicesImp2 public machineDevicesImp2;
    MachinesDevicesImp3 public machineDevicesImp3;

    TraitBase public machineDevices;

    AssetRetriever public assetRetriever;

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

        // Machine Devices
        machineDevicesImp1 = new MachinesDevicesImp1();
        machineDevicesImp2 = new MachinesDevicesImp2();
        machineDevicesImp3 = new MachinesDevicesImp3();
        address[] memory machineDevicesImpsAds = new address[](3);
        machineDevicesImpsAds[0] = address(machineDevicesImp1);
        machineDevicesImpsAds[1] = address(machineDevicesImp2);
        machineDevicesImpsAds[2] = address(machineDevicesImp3);
        machineDevices = new TraitBase(machineDevicesImpsAds);

        // Asset Retriever
        address[] memory traitBases = new address[](1);
        traitBases[0] = address(machineDevices);
        assetRetriever = new AssetRetriever(traitBases); // Add the address of each TraitBase

        cypherRoom = new CypherRoom();
        altar = new Altar(address(assetRetriever));
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

        // machine.setCypherRoom(address(cypherRoom));
        // machine.setAltar(address(altar));
        // machine.setBeast(address(beast));
        // machine.setDrills(address(drills));
        // machine.setNose(address(nose));
        // machine.setTubes(address(tubes));
        // machine.setConveyorbelt(address(conveyorbelt));

        machine.setAllWorkstations([address(conveyorbelt), address(drills), address(nose), address(beast), address(altar), address(tubes), address(cypherRoom)]);

        // metadata.setHandleRandom(handleRandom);
        // clifford.setHandleRandom(handleRandom);
        compose.setMetadata(metadata);
        machine.setMetadata(address(metadata));

        // setUp();

        address to = 0xB2a61F4dE7d8C1985cb5565CFCBD7F1A18CBF123;
        clifford.publicMint(to, 1);
        console.log(clifford.tokenURI(0));

        vm.stopBroadcast();
    }
}
