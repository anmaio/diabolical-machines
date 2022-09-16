const { task } = require("hardhat/config");
const { BigNumber } = require('ethers');
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");

// Deploy to testnet and mainnet.  
// Provides --verify parameter to optionally enable contract verification with Etherscan
task("deploy", "Deploy contract to testnet and mainnet")
    .addParam("verify", "Specify true or false to determine if the contract is verified after deployment.")
    .setAction(async(taskArgs, hre) => {
        const [deployer] = await hre.ethers.getSigners();

        console.log("Deploying contracts with the account:", deployer.address);
        console.log("Account balance:", (await deployer.getBalance()).toString())

        // Deploy contracts
        const Compose = await hre.ethers.getContractFactory("Compose");
        const compose = await Compose.deploy();
        await compose.deployed();

        const Metadata = await hre.ethers.getContractFactory("Metadata");
        const metadata = await Metadata.deploy(compose.address);
        await metadata.deployed();

        const TokenSwap = await hre.ethers.getContractFactory("TokenSwap");
        const tokenSwap = await TokenSwap.deploy();
        await tokenSwap.deployed();

        const Clifford = await hre.ethers.getContractFactory("Clifford");
        const clifford = await Clifford.deploy(metadata.address, tokenSwap.address);
        await clifford.deployed();

        const VRFv2SubscriptionManager = await hre.ethers.getContractFactory("VRFv2SubscriptionManager");
        const vRFv2SubscriptionManager = await VRFv2SubscriptionManager.deploy(clifford.address, metadata.address);
        await vRFv2SubscriptionManager.deployed();

        // Set the vrf consumer address in the main contract
        await clifford.setSubscriptionManager(vRFv2SubscriptionManager.address);

        // Get Link contract
        // const link = await hre.ethers.getContractAt("LinkTokenInterface", "0x326C977E6efc84E512bB9C30f76E30c160eD06FB");
        
        // console.log("Sending Link to vRFv2SubscriptionManager contract");
        // const amount = 1; // smallest possible amount of link, needed to be able to top up
        // await link.transfer(vRFv2SubscriptionManager.address, amount);
        // console.log("Link sent to vRFv2SubscriptionManager contract");

        // await new Promise(r => setTimeout(r, 20000)); // wait 20 seconds before topping up
        // const testTopUp = BigNumber.from("8000000000000000000"); // 8 Link
        // await vRFv2SubscriptionManager.topUpSubscription(amount);

        console.log("Compose contract deployed to address:", compose.address);
        console.log("Metadata contract deployed to address:", metadata.address);
        console.log("TokenSwap contract deployed to address:", tokenSwap.address);
        console.log("Clifford contract deployed to address:", clifford.address);
        console.log("VRFv2SubscriptionManager contract deployed to address:", vRFv2SubscriptionManager.address);
        
        if (taskArgs.verify === 'true') {
            console.log("Waiting 5 block confirmations...");
            await clifford.deployTransaction.wait(5); // needed as verify-etherscan subtask is called immediately after deployment

            // Verify the contract using the verify-etherscan subtask
            await hre.run("verify-etherscan", {
                address: vRFv2SubscriptionManager.address,
                clifford: clifford.address,
                metadata: metadata.address
            });

            // Verify the contract using the verify-etherscan subtask
            await hre.run("verify-etherscan", {
                address: clifford.address,
                clifford: metadata.address,
                metadata: tokenSwap.address
            });
        };
    });

// Override the default verify task added with hardhat-etherscan plug-in
// See https://github.com/NomicFoundation/hardhat/issues/2287
task("verify", "Verify a deployed contract")
    .setAction(async(taskArgs, hre) => {
        // Verify the contract using the verify-etherscan subtask
        await hre.run("verify-etherscan", {
            address: taskArgs.address,
            constructorArguments: taskArgs.constructorArgsParams[0]
        });
    });

// By default Etherscan validation will fail if contract is already validated so we override this behaviour
subtask("verify-etherscan", "Verifies the deployed contract. ")
    .addParam("address", "The address of the contract")
    .addOptionalParam("clifford", "The construction arguments of the contract")
    .addParam("metadata", "The construction arguments of the contract")
    .setAction(async(taskArgs, hre) => {
        if (hre.network.config.chainId === 31337 || !hre.config.etherscan.apiKey) {
            return; // contract is deployed on local network or no apiKey is configured
        };

        try {
            console.log("Verifying contract at address:", taskArgs.address);

            // As per https://hardhat.org/plugins/nomiclabs-hardhat-etherscan
            if (taskArgs.clifford) {
                await hre.run("verify:verify", {
                    address: taskArgs.address,
                    constructorArguments: [taskArgs.clifford, taskArgs.metadata]
                });
            } else {
                await hre.run("verify:verify", {
                    address: taskArgs.address,
                    constructorArguments: [taskArgs.metadata]
                });
            }
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
    solidity: "0.8.12",
    networks: {
        mainnet: {
            url: process.env.MAINNET_URL,
            accounts: [process.env.MAINNET_ACCOUNT]
        },
        rinkeby: {
            url: process.env.RINKEBY_URL,
            accounts: [process.env.RINKEBY_ACCOUNT]
        },
        goerli: {
            url: process.env.GOERLI_URL,
            accounts: [process.env.GOERLI_ACCOUNT]
        },
        polygon: {
            url: process.env.POLYGON_URL,
            accounts: [process.env.POLYGON_ACCOUNT]
        }
    },
    etherscan: {
        apiKey: process.env.ETHERSCAN_API_KEY
    },
};