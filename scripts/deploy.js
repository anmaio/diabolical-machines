const { ethers } = require("hardhat");
const hre = require("hardhat");

 async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`Address deploying the contract ====> ${deployer.address}`);

   const TokenB = await hre.ethers.getContractFactory("Compose");
   console.log('Deploying B token...');
   const tokenB = await TokenB.deploy();    
   await tokenB.deployed();  
   console.log("B deployed to:", tokenB.address);


   const TokenA = await hre.ethers.getContractFactory("Onion");
   console.log('Deploying A token...');
   const tokenA = await TokenA.deploy(tokenB.address);    
   await tokenA.deployed();  
   console.log("A deployed to:", tokenA.address);


 }
 main()
   .then(() => process.exit(0))
   .catch((error) => {
     console.error(error);
     process.exit(1);
   });