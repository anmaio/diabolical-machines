const { ethers } = require("hardhat");
const hre = require("hardhat");

 async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`Address deploying the contract ====> ${deployer.address}`);

   const Compose = await hre.ethers.getContractFactory("Compose");
   const compose = await Compose.deploy();    
   await compose.deployed();  
   console.log("Contract 'Compose' deployed to:", compose.address);

   const Metadata = await hre.ethers.getContractFactory("Metadata");
   const metadata = await Metadata.deploy(compose.address);    
   await metadata.deployed();  
   console.log("Contract 'Metadata' deployed to:", metadata.address);

   const Onion = await hre.ethers.getContractFactory("Metadata");
   const onion = await Onion.deploy(metadata.address);    
   await onion.deployed();  
   console.log("Contract 'Onion' deployed to:", onion.address);

   await onion.safeMint(deployer.address);
   console.log("URI (no SB):", await onion.tokenURI(0));
   console.log("URI (with SB):", await onion.tokenURIWithSB(0));

 }
 main()
   .then(() => process.exit(0))
   .catch((error) => {
     console.error(error);
     process.exit(1);
   });