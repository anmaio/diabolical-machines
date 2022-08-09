/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();

const privateKey = process.env.PRIVATE_KEY;
const endpoint = process.env.URL;
const etherscanKey = process.env.ETHERSCAN_KEY

module.exports = {
    solidity: {
        version: "0.8.4"
    },
    settings: {
        optimizer: {
            enabled: true,
            runs: 2000,
            details: {
                yul: true,
                yulDetails: {
                    stackAllocation: true,
                    optimizerSteps: "dhfoDgvulfnTUtnIf"
                }
            }
        }
    },
    networks: {
        rinkeby: {
            url: endpoint,
            accounts: [`0x${privateKey}`]
        }
    },
    etherscan: {
        apiKey: etherscanKey
    }
};