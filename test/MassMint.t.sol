// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.12;

// import "forge-std/Test.sol";
// import "../src/Clifford.sol";
// import "../src/Compose.sol";
// import "../src/Metadata.sol";
// import "../src/HandleRandom.sol";
// import "../src/SharedAssets.sol";
// import "../src/Machine.sol";
// import "@openzeppelin/contracts/utils/Strings.sol";

// contract MassMintTest is Test {

//     SharedAssets public sharedAssets;
//     Compose public compose;
//     Machine public machine;
//     Metadata public metadata;
//     HandleRandom public handleRandom;
//     Clifford public clifford;

//     function setUp() public {
//         sharedAssets = new SharedAssets();
//         machine = new Machine();
//         compose = new Compose(sharedAssets, machine);
//         metadata = new Metadata(compose, machine);
//         clifford = new Clifford(metadata);
//         handleRandom = new HandleRandom(clifford);

//         metadata.setHandleRandom(handleRandom);
//         clifford.setHandleRandom(handleRandom);
//         compose.setMetadata(metadata);
//         machine.setMetadata(metadata);

//         setupMint();
//     }

//     function setupMint() public {
//       address to = address(1337);
      

//       // ERC721A has the ability to mint multiple tokens at once
//       // Using single mints for now while randomness is Psuedo Random and dependant on block.timestamp
//       for (uint256 i = 0; i < 10000; i++) {
//         vm.roll(i*99);
//         vm.warp(i*99);
//         vm.difficulty(i*99);
//         // to, quantity
//         clifford.publicMint(to, 1);
//       }


//       // for (uint256 i = 0; i < 5; i++) {
//       //   console.log("Minted token: ", i);
//       //   uint rand = handleRandom.getRandomNumber(i);
//       //   console.log("rand: ", rand);
//       //   console.log("metadata slice: ", metadata.getRandAndSlice(i, 8, 8));
//       // }

//       // console.log(clifford.tokenURI(0));
//       // console.log(compose.composeOnlyImage(0));
//       // vm.writeFile("images/test.svg", compose.composeOnlyImage(0));
//     }

//     // repeat until 10000

//     function testFileOutput1() public {
//       for (uint256 i = 0; i < 40; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput2() public {
//       for (uint256 i = 40; i < 80; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput3() public {
//       for (uint256 i = 80; i < 120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput4() public {
//       for (uint256 i = 120; i < 160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput5() public {
//       for (uint256 i = 160; i < 200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput6() public {
//       for (uint256 i = 200; i < 240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput7() public {
//       for (uint256 i = 240; i < 280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput8() public {
//       for (uint256 i = 280; i < 320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput9() public {
//       for (uint256 i = 320; i < 360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput10() public {
//       for (uint256 i = 360; i < 400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput11() public {
//       for (uint256 i = 400; i < 440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput12() public {
//       for (uint256 i = 440; i < 480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput13() public {
//       for (uint256 i = 480; i < 520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput14() public {
//       for (uint256 i = 520; i < 560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput15() public {
//       for (uint256 i = 560; i < 600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput16() public {
//       for (uint256 i = 600; i < 640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput17() public {
//       for (uint256 i = 640; i < 680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput18() public {
//       for (uint256 i = 680; i < 720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput19() public {
//       for (uint256 i = 720; i < 760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput20() public {
//       for (uint256 i = 760; i < 800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput21() public {
//       for (uint256 i = 800; i < 840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput22() public {
//       for (uint256 i = 840; i < 880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput23() public {
//       for (uint256 i = 880; i < 920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput24() public {
//       for (uint256 i = 920; i < 960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput25() public {
//       for (uint256 i = 960; i < 1000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput26() public {
//       for (uint256 i = 1000; i < 1040; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput27() public {
//       for (uint256 i = 1040; i < 1080; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput28() public {
//       for (uint256 i = 1080; i < 1120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput29() public {
//       for (uint256 i = 1120; i < 1160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput30() public {
//       for (uint256 i = 1160; i < 1200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput31() public {
//       for (uint256 i = 1200; i < 1240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput32() public {
//       for (uint256 i = 1240; i < 1280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput33() public {
//       for (uint256 i = 1280; i < 1320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput34() public {
//       for (uint256 i = 1320; i < 1360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput35() public {
//       for (uint256 i = 1360; i < 1400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput36() public {
//       for (uint256 i = 1400; i < 1440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput37() public {
//       for (uint256 i = 1440; i < 1480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput38() public {
//       for (uint256 i = 1480; i < 1520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput39() public {
//       for (uint256 i = 1520; i < 1560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput40() public {
//       for (uint256 i = 1560; i < 1600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput41() public {
//       for (uint256 i = 1600; i < 1640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput42() public {
//       for (uint256 i = 1640; i < 1680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput43() public {
//       for (uint256 i = 1680; i < 1720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput44() public {
//       for (uint256 i = 1720; i < 1760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput45() public {
//       for (uint256 i = 1760; i < 1800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput46() public {
//       for (uint256 i = 1800; i < 1840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput47() public {
//       for (uint256 i = 1840; i < 1880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput48() public {
//       for (uint256 i = 1880; i < 1920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput49() public {
//       for (uint256 i = 1920; i < 1960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput50() public {
//       for (uint256 i = 1960; i < 2000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput51() public {
//       for (uint256 i = 2000; i < 2040; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput52() public {
//       for (uint256 i = 2040; i < 2080; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput53() public {
//       for (uint256 i = 2080; i < 2120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput54() public {
//       for (uint256 i = 2120; i < 2160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput55() public {
//       for (uint256 i = 2160; i < 2200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput56() public {
//       for (uint256 i = 2200; i < 2240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput57() public {
//       for (uint256 i = 2240; i < 2280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput58() public {
//       for (uint256 i = 2280; i < 2320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput59() public {
//       for (uint256 i = 2320; i < 2360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput60() public {
//       for (uint256 i = 2360; i < 2400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput61() public {
//       for (uint256 i = 2400; i < 2440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput62() public {
//       for (uint256 i = 2440; i < 2480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput63() public {
//       for (uint256 i = 2480; i < 2520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput64() public {
//       for (uint256 i = 2520; i < 2560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput65() public {
//       for (uint256 i = 2560; i < 2600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput66() public {
//       for (uint256 i = 2600; i < 2640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput67() public {
//       for (uint256 i = 2640; i < 2680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput68() public {
//       for (uint256 i = 2680; i < 2720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput69() public {
//       for (uint256 i = 2720; i < 2760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput70() public {
//       for (uint256 i = 2760; i < 2800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput71() public {
//       for (uint256 i = 2800; i < 2840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput72() public {
//       for (uint256 i = 2840; i < 2880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput73() public {
//       for (uint256 i = 2880; i < 2920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput74() public {
//       for (uint256 i = 2920; i < 2960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput75() public {
//       for (uint256 i = 2960; i < 3000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput76() public {
//       for (uint256 i = 3000; i < 3040; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput77() public {
//       for (uint256 i = 3040; i < 3080; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput78() public {
//       for (uint256 i = 3080; i < 3120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput79() public {
//       for (uint256 i = 3120; i < 3160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput80() public {
//       for (uint256 i = 3160; i < 3200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput81() public {
//       for (uint256 i = 3200; i < 3240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput82() public {
//       for (uint256 i = 3240; i < 3280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput83() public {
//       for (uint256 i = 3280; i < 3320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput84() public {
//       for (uint256 i = 3320; i < 3360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput85() public {
//       for (uint256 i = 3360; i < 3400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput86() public {
//       for (uint256 i = 3400; i < 3440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput87() public {
//       for (uint256 i = 3440; i < 3480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput88() public {
//       for (uint256 i = 3480; i < 3520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput89() public {
//       for (uint256 i = 3520; i < 3560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput90() public {
//       for (uint256 i = 3560; i < 3600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput91() public {
//       for (uint256 i = 3600; i < 3640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput92() public {
//       for (uint256 i = 3640; i < 3680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput93() public {
//       for (uint256 i = 3680; i < 3720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput94() public {
//       for (uint256 i = 3720; i < 3760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput95() public {
//       for (uint256 i = 3760; i < 3800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput96() public {
//       for (uint256 i = 3800; i < 3840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput97() public {
//       for (uint256 i = 3840; i < 3880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput98() public {
//       for (uint256 i = 3880; i < 3920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput99() public {
//       for (uint256 i = 3920; i < 3960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput100() public {
//       for (uint256 i = 3960; i < 4000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput101() public {
//       for (uint256 i = 4000; i < 4040; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput102() public {
//       for (uint256 i = 4040; i < 4080; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput103() public {
//       for (uint256 i = 4080; i < 4120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput104() public {
//       for (uint256 i = 4120; i < 4160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput105() public {
//       for (uint256 i = 4160; i < 4200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput106() public {
//       for (uint256 i = 4200; i < 4240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput107() public {
//       for (uint256 i = 4240; i < 4280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput108() public {
//       for (uint256 i = 4280; i < 4320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput109() public {
//       for (uint256 i = 4320; i < 4360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput110() public {
//       for (uint256 i = 4360; i < 4400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput111() public {
//       for (uint256 i = 4400; i < 4440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput112() public {
//       for (uint256 i = 4440; i < 4480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput113() public {
//       for (uint256 i = 4480; i < 4520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput114() public {
//       for (uint256 i = 4520; i < 4560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput115() public {
//       for (uint256 i = 4560; i < 4600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput116() public {
//       for (uint256 i = 4600; i < 4640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput117() public {
//       for (uint256 i = 4640; i < 4680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput118() public {
//       for (uint256 i = 4680; i < 4720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput119() public {
//       for (uint256 i = 4720; i < 4760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput120() public {
//       for (uint256 i = 4760; i < 4800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput121() public {
//       for (uint256 i = 4800; i < 4840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput122() public {
//       for (uint256 i = 4840; i < 4880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput123() public {
//       for (uint256 i = 4880; i < 4920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput124() public {
//       for (uint256 i = 4920; i < 4960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput125() public {
//       for (uint256 i = 4960; i < 5000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput126() public {
//       for (uint256 i = 5000; i < 5040; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput127() public {
//       for (uint256 i = 5040; i < 5080; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput128() public {
//       for (uint256 i = 5080; i < 5120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput129() public {
//       for (uint256 i = 5120; i < 5160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput130() public {
//       for (uint256 i = 5160; i < 5200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput131() public {
//       for (uint256 i = 5200; i < 5240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput132() public {
//       for (uint256 i = 5240; i < 5280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput133() public {
//       for (uint256 i = 5280; i < 5320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput134() public {
//       for (uint256 i = 5320; i < 5360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput135() public {
//       for (uint256 i = 5360; i < 5400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput136() public {
//       for (uint256 i = 5400; i < 5440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput137() public {
//       for (uint256 i = 5440; i < 5480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput138() public {
//       for (uint256 i = 5480; i < 5520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput139() public {
//       for (uint256 i = 5520; i < 5560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput140() public {
//       for (uint256 i = 5560; i < 5600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput141() public {
//       for (uint256 i = 5600; i < 5640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput142() public {
//       for (uint256 i = 5640; i < 5680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput143() public {
//       for (uint256 i = 5680; i < 5720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput144() public {
//       for (uint256 i = 5720; i < 5760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput145() public {
//       for (uint256 i = 5760; i < 5800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput146() public {
//       for (uint256 i = 5800; i < 5840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput147() public {
//       for (uint256 i = 5840; i < 5880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput148() public {
//       for (uint256 i = 5880; i < 5920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput149() public {
//       for (uint256 i = 5920; i < 5960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput150() public {
//       for (uint256 i = 5960; i < 6000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput151() public {
//       for (uint256 i = 6000; i < 6040; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput152() public {
//       for (uint256 i = 6040; i < 6080; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput153() public {
//       for (uint256 i = 6080; i < 6120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput154() public {
//       for (uint256 i = 6120; i < 6160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput155() public {
//       for (uint256 i = 6160; i < 6200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput156() public {
//       for (uint256 i = 6200; i < 6240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput157() public {
//       for (uint256 i = 6240; i < 6280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput158() public {
//       for (uint256 i = 6280; i < 6320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput159() public {
//       for (uint256 i = 6320; i < 6360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput160() public {
//       for (uint256 i = 6360; i < 6400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput161() public {
//       for (uint256 i = 6400; i < 6440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput162() public {
//       for (uint256 i = 6440; i < 6480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput163() public {
//       for (uint256 i = 6480; i < 6520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput164() public {
//       for (uint256 i = 6520; i < 6560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput165() public {
//       for (uint256 i = 6560; i < 6600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput166() public {
//       for (uint256 i = 6600; i < 6640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput167() public {
//       for (uint256 i = 6640; i < 6680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput168() public {
//       for (uint256 i = 6680; i < 6720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput169() public {
//       for (uint256 i = 6720; i < 6760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput170() public {
//       for (uint256 i = 6760; i < 6800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput171() public {
//       for (uint256 i = 6800; i < 6840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput172() public {
//       for (uint256 i = 6840; i < 6880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput173() public {
//       for (uint256 i = 6880; i < 6920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput174() public {
//       for (uint256 i = 6920; i < 6960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput175() public {
//       for (uint256 i = 6960; i < 7000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput176() public {
//       for (uint256 i = 7000; i < 7040; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput177() public {
//       for (uint256 i = 7040; i < 7080; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput178() public {
//       for (uint256 i = 7080; i < 7120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput179() public {
//       for (uint256 i = 7120; i < 7160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput180() public {
//       for (uint256 i = 7160; i < 7200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput181() public {
//       for (uint256 i = 7200; i < 7240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput182() public {
//       for (uint256 i = 7240; i < 7280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput183() public {
//       for (uint256 i = 7280; i < 7320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput184() public {
//       for (uint256 i = 7320; i < 7360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput185() public {
//       for (uint256 i = 7360; i < 7400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput186() public {
//       for (uint256 i = 7400; i < 7440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput187() public {
//       for (uint256 i = 7440; i < 7480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput188() public {
//       for (uint256 i = 7480; i < 7520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput189() public {
//       for (uint256 i = 7520; i < 7560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput190() public {
//       for (uint256 i = 7560; i < 7600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput191() public {
//       for (uint256 i = 7600; i < 7640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput192() public {
//       for (uint256 i = 7640; i < 7680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput193() public {
//       for (uint256 i = 7680; i < 7720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput194() public {
//       for (uint256 i = 7720; i < 7760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput195() public {
//       for (uint256 i = 7760; i < 7800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput196() public {
//       for (uint256 i = 7800; i < 7840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput197() public {
//       for (uint256 i = 7840; i < 7880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput198() public {
//       for (uint256 i = 7880; i < 7920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput199() public {
//       for (uint256 i = 7920; i < 7960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput200() public {
//       for (uint256 i = 7960; i < 8000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput201() public {
//       for (uint256 i = 8000; i < 8040; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput202() public {
//       for (uint256 i = 8040; i < 8080; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput203() public {
//       for (uint256 i = 8080; i < 8120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput204() public {
//       for (uint256 i = 8120; i < 8160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput205() public {
//       for (uint256 i = 8160; i < 8200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput206() public {
//       for (uint256 i = 8200; i < 8240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput207() public {
//       for (uint256 i = 8240; i < 8280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput208() public {
//       for (uint256 i = 8280; i < 8320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput209() public {
//       for (uint256 i = 8320; i < 8360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput210() public {
//       for (uint256 i = 8360; i < 8400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput211() public {
//       for (uint256 i = 8400; i < 8440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput212() public {
//       for (uint256 i = 8440; i < 8480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput213() public {
//       for (uint256 i = 8480; i < 8520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput214() public {
//       for (uint256 i = 8520; i < 8560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput215() public {
//       for (uint256 i = 8560; i < 8600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput216() public {
//       for (uint256 i = 8600; i < 8640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput217() public {
//       for (uint256 i = 8640; i < 8680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput218() public {
//       for (uint256 i = 8680; i < 8720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput219() public {
//       for (uint256 i = 8720; i < 8760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput220() public {
//       for (uint256 i = 8760; i < 8800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput221() public {
//       for (uint256 i = 8800; i < 8840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput222() public {
//       for (uint256 i = 8840; i < 8880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput223() public {
//       for (uint256 i = 8880; i < 8920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput224() public {
//       for (uint256 i = 8920; i < 8960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput225() public {
//       for (uint256 i = 8960; i < 9000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput226() public {
//       for (uint256 i = 9000; i < 9040; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput227() public {
//       for (uint256 i = 9040; i < 9080; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput228() public {
//       for (uint256 i = 9080; i < 9120; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput229() public {
//       for (uint256 i = 9120; i < 9160; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput230() public {
//       for (uint256 i = 9160; i < 9200; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput231() public {
//       for (uint256 i = 9200; i < 9240; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput232() public {
//       for (uint256 i = 9240; i < 9280; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput233() public {
//       for (uint256 i = 9280; i < 9320; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput234() public {
//       for (uint256 i = 9320; i < 9360; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput235() public {
//       for (uint256 i = 9360; i < 9400; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput236() public {
//       for (uint256 i = 9400; i < 9440; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput237() public {
//       for (uint256 i = 9440; i < 9480; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput238() public {
//       for (uint256 i = 9480; i < 9520; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput239() public {
//       for (uint256 i = 9520; i < 9560; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput240() public {
//       for (uint256 i = 9560; i < 9600; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput241() public {
//       for (uint256 i = 9600; i < 9640; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput242() public {
//       for (uint256 i = 9640; i < 9680; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput243() public {
//       for (uint256 i = 9680; i < 9720; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput244() public {
//       for (uint256 i = 9720; i < 9760; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput245() public {
//       for (uint256 i = 9760; i < 9800; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput246() public {
//       for (uint256 i = 9800; i < 9840; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput247() public {
//       for (uint256 i = 9840; i < 9880; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput248() public {
//       for (uint256 i = 9880; i < 9920; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput249() public {
//       for (uint256 i = 9920; i < 9960; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }

//     function testFileOutput250() public {
//       for (uint256 i = 9960; i < 10000; i++) {
//         string memory path = string.concat("images/", Strings.toString(i), ".svg");
//         vm.writeFile(path, compose.composeOnlyImage(i));
//       }
//     }
// }
