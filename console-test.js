const ethers = require("ethers");
const hre = require("hardhat");


const abi = require('./artifacts/contracts/Drawing.sol/Drawing.json').abi;
const provider = new ethers.ethers.providers.JsonRpcProvider();
const address = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
const signer = provider.getSigner('0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266');
const t = new ethers.ethers.Contract(address,abi, signer);

async function main() {
const accounts = await hre.ethers.getSigners();
toAddress = accounts[0].address;
const symbol = await t.compose();
console.log(symbol);
// await t.safeMint('0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266');'
// const c = await t.getInputs(0);
// console.log(c);
// await t.layer01();
// const f = await t.getLayer01();
// console.log(f);


}
main();