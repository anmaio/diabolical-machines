require("@nomiclabs/hardhat-solhint");
require("hardhat-prettier");
require("hardhat-gas-reporter");
require('hardhat-ethernal');
require("@nomiclabs/hardhat-waffle");

const { task } = require("hardhat/config");

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    const balance = await hre.ethers.provider.getBalance(account.address);
    console.log(account.address, ":", hre.ethers.utils.formatEther(balance));
  }
});


task("deploy-local", "Deploys contract", async (taskArgs, hre) => {
  
  // Deploy contracts
  const Compose = await hre.ethers.getContractFactory("Compose");
  const compose = await Compose.deploy();
  await compose.deployed();

  const Metadata = await hre.ethers.getContractFactory("Metadata");
  const metadata = await Metadata.deploy(compose.address);
  await metadata.deployed();

  const Clifford = await hre.ethers.getContractFactory("Clifford");
  const clifford = await Clifford.deploy(metadata.address);
  await clifford.deployed();

  // Push to Ethernal if enabled
  await hre.ethernal.push({
    name: 'Clifford',
    address: clifford.address
  });
  
  await clifford.deployed();

  console.log("Contract deployed to address:", clifford.address)
  console.log("Minting token and getting tokenURI...")

  await clifford.safeMint(clifford.signer.getAddress());
  const tokenURI = await clifford.tokenURI(0);
  console.log("TokenURI:", tokenURI);
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.12",
  networks: {
    localhost: {}
  },
  gasReporter: {
    enabled: (process.env.REPORT_GAS == "true") ? true : false,
    coinmarketcap: process.env.COINMARKETCAP_API_KEY,
    currency: "GBP",
    token: "ETH",
    gasPriceApi: "https://api.etherscan.io/api?module=proxy&action=eth_gasPrice",
    showTimeSpent: true,
    excludeContracts: [],
    src: "contracts" 
  },
  ethernal: {
    email: process.env.ETHERNAL_EMAIL,
    password: process.env.ETHERNAL_PASSWORD,
    disableSync: (process.env.ETHERNAL_DISABLE_SYNC == "true") ? true : false,
    disableTrace: (process.env.ETHERNAL_DISABLE_TRACE == "true") ? true : false,
    workspace: (process.env.ETHERNAL_WORKSPACE) ? process.env.ETHERNAL_WORKSPACE : undefined,
    uploadAst: (process.env.ETHERNAL_UPLOAD_AST == "true") ? true : false,
    disabled: (process.env.ETHERNAL_ENABLED == "true") ? false : true,
    resetOnStart: (process.env.ETHERNAL_RESET_ON_START == "true") ? true : false
  }
};
