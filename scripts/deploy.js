const { ethers } = require("hardhat");
const hre = require("hardhat");

 async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(`Address deploying the contract ====> ${deployer.address}`);

  //  const Token = await hre.ethers.getContractFactory("Llama");
  //  console.log('Deploying ERC721 token...');
  //  const token = await Token.deploy();    
  //  await token.deployed();  
  //  console.log("deployed to:", token.address);

   const Token2 = await hre.ethers.getContractFactory("Drawing");
   console.log('Deploying ERC721 token2...');
   const token2 = await Token2.deploy();
   await token2.deployed();
   console.log("deployed to:", token2.address);
 }
 
 main()
   .then(() => process.exit(0))
   .catch((error) => {
     console.error(error);
     process.exit(1);
   });