const assert = require("assert");
const { ethers } = require("hardhat");

const SHARED_ASSETS_PRE = "SharedAssets";

const CONTRACT_NAME_PRE = "Compose"
const CONTRACT_NAME = "Clifford"

const TOKEN_NAME = "Clifford";
const TOKEN_SYMBOL = "o";

let provider;
let accounts = [];
let contract;
let signer;

beforeEach(async () => {
    const SharedAssets = await ethers.getContractFactory(SHARED_ASSETS_PRE);
    const sharedAssets = await SharedAssets.deploy();
    const Compose = await ethers.getContractFactory(CONTRACT_NAME_PRE);
    const compose = await Compose.deploy(sharedAssets.address);
    const factory = await ethers.getContractFactory(CONTRACT_NAME);
    contract = await factory.deploy(compose.address);
    await contract.deployTransaction.wait();

    provider = ethers.provider;

    const signers = await ethers.getSigners();
    signer = await signers[0].getAddress();

    for (const s of signers) {
        const addr = s.address;
        accounts.push(addr);
    }
});

describe("MetaToken Contract", () => {
    it("successfully deploys", () => {
        assert.ok(contract.address);
    });

    it("sets the token name and symbol", async () => {
        const actualName = await contract.name();
        const actualSymbol = await contract.symbol();

        assert.strictEqual(actualName, TOKEN_NAME);
        assert.strictEqual(actualSymbol, TOKEN_SYMBOL);
    });
});