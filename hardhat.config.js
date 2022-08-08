const { task } = require("hardhat/config");
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");

// Deploy to testnet and mainnet.  
// Provides --verify parameter to optionally enable contract verification with Etherscan
task("deploy", "Deploy contract to testnet and mainnet") 
  .addParam("verify", "Specify true or false to determine if the contract is verified after deployment.")
  .setAction(async (taskArgs, hre) => {
    const [deployer] = await hre.ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.getBalance()).toString())
  
    // Deploy contracts
    const Onion = await hre.ethers.getContractFactory("Onion");
    const onion = await Onion.deploy();
    await onion.deployed();
  
    console.log("Contract deployed to address:", onion.address);
  
    if (taskArgs.verify === 'true') {
      console.log("Waiting 5 block confirmations...");
      await onion.deployTransaction.wait(5); // needed as verify-etherscan subtask is called immediately after deployment
  
      // Verify the contract using the verify-etherscan subtask
      await hre.run("verify-etherscan", {
        address: onion.address
      });
    };
});

// Override the default verify task added with hardhat-etherscan plug-in
// See https://github.com/NomicFoundation/hardhat/issues/2287
task("verify", "Verify a deployed contract")
  .setAction(async (taskArgs, hre) => {
    // Verify the contract using the verify-etherscan subtask
    await hre.run("verify-etherscan", {
      address: taskArgs.address
    });
});

// By default Etherscan validation will fail if contract is already validated so we override this behaviour
subtask("verify-etherscan", "Verifies the deployed contract. ")  
  .addParam("address", "The address of the contract")
  .setAction(async (taskArgs, hre) => {
    if (hre.network.config.chainId === 31337 || !hre.config.etherscan.apiKey) {
      return; // contract is deployed on local network or no apiKey is configured
    };
  
    try {
      console.log("Verifying contract at address:", taskArgs.address)

      // As per https://hardhat.org/plugins/nomiclabs-hardhat-etherscan
      await hre.run("verify:verify", {
        address: taskArgs.address,
        constructorArguments: [],
      });
    } catch (err) {
      if (err.message.includes("Reason: Already Verified")) {
        console.log("Contract is already verified!");
      } else {
        throw err.message;
      }
    }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  networks: {
    mainnet: {
      url: process.env.MAINNET_URL,
      accounts: [process.env.MAINNET_ACCOUNT]
    },
    rinkeby: {
      url: process.env.RINKEBY_URL,
      accounts: [process.env.RINKEBY_ACCOUNT]
    },
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  },
};
