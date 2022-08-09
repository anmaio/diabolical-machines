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
  const Compose = await hre.ethers.getContractFactory("Compose");
  const compose = await Compose.deploy();
  await compose.deployed();
  console.log("Contract Compose deployed to address:", compose.address)  
  
  const Metadata = await hre.ethers.getContractFactory("Metadata");
  const metadata = await Metadata.deploy(compose.address);    
  await metadata.deployed();
  console.log("Contract 'Metadata' deployed to:", metadata.address);

  const Onion = await hre.ethers.getContractFactory("Onion");
  const onion = await Onion.deploy(metadata.address);

  // Push to Ethernal if enabled
  await hre.ethernal.push({
    name: 'Onion',
    address: onion.address
  });
  
  await onion.deployed();

  console.log("Contract deployed to address:", onion.address)


  console.log("Minting token and getting tokenURI...")
  await onion.safeMint(onion.signer.getAddress());
  console.log("TokenURI:", await onion.tokenURI(0));
  console.log("TokenURIWithSB:", await onion.tokenURIWithSB(0));
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
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
    disableSync: false,
    disableTrace: false,
    workspace: (process.env.ETHERNAL_WORKSPACE) ? process.env.ETHERNAL_WORKSPACE : undefined,
    uploadAst: true,
    disabled: (process.env.ETHERNAL_ENABLED == "true") ? false : true,
    resetOnStart: (process.env.ETHERNAL_RESET_ON_START == "true") ? true : false
  }
};
