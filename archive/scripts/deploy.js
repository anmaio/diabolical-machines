const { ethers } = require("hardhat");
const hre = require("hardhat");

 async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`Address deploying the contract ====> ${deployer.address}`);

   const Token = await hre.ethers.getContractFactory("Onion");
   console.log('Deploying ERC721 token...');
   const token = await Token.deploy();    
   await token.deployed();  
   console.log("deployed to:", token.address);

 }
 main()
   .then(() => process.exit(0))
   .catch((error) => {
     console.error(error);
     process.exit(1);
   });