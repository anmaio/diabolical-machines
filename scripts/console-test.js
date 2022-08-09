const ethers = require("ethers");
const hre = require("hardhat");


const abi = require('./artifacts/contracts/Onion.sol/Onion.json').abi;
const provider = new ethers.ethers.providers.JsonRpcProvider();
const address = '0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512';
const signer = provider.getSigner('0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266');
const t = new ethers.ethers.Contract(address,abi, signer);

async function main() {
const accounts = await hre.ethers.getSigners();
toAddress = accounts[0].address;
const symbol = await t.symbol();
console.log(symbol);
await t.safeMint('0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266');
console.log(await t.tokenURI(0));
// await t.updateTraitValue(0, 1, "blue");
// console.log(await t.tokenURI(0));
// const c = await t.getInputs(0);
// console.log(c);
// await t.layer01();
// const f = await t.getLayer01();
// console.log(f);


}
main();



// const t = await ethers.getContractAt("Onion", address);
// const accounts = await hre.ethers.getSigners();
// toAddress = accounts[0].address;
// await t.symbol();

// const address = '0x0387861b85dB31FdC724Dbf35F74182aAf39536E';
// toAddress = '0x161eb2283E222F156215a11D7B3E69a1E50064e6'
// const t = await ethers.getContractAt("Onion", address);