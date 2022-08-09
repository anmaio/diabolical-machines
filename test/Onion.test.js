const assert = require("assert");
const { ethers } = require("hardhat");

let provider;
let accounts = [];
let compose;
let metadata;
let onion;
let signer;

beforeEach(async () => {
    const Compose = await ethers.getContractFactory("Compose");
    compose = await Compose.deploy();
    await compose.deployTransaction.wait();

    const Metadata = await ethers.getContractFactory("Metadata");
    metadata = await Metadata.deploy(compose.address);
    await metadata.deployTransaction.wait();

    const Onion = await ethers.getContractFactory("Onion");
    onion = await Onion.deploy(metadata.address);
    await onion.deployTransaction.wait();

    provider = ethers.provider;

    const signers = await ethers.getSigners();
    signer = await signers[0].getAddress();

    for (const s of signers) {
        const addr = s.address;
        accounts.push(addr);
    }
});

describe("Onion Contract", () => {
    it("successfully deploys", () => {
        assert.ok(compose.address);
        assert.ok(metadata.address);
        assert.ok(onion.address);
    });

    it("mints a token", async () => {
        await onion.safeMint(accounts[0]);
    });

    it("returns token uri without string builder", async () => {
        await onion.safeMint(accounts[0]);
        await onion.tokenURI(0);
    });

    it("returns token uri with string builder", async () => {
        await onion.safeMint(accounts[0]);
        await onion.tokenURIWithSB(0);
    });

    it("returns the same uri with and without string builder", async () => {
        await onion.safeMint(accounts[0]);
        assert.strictEqual(await onion.tokenURI(0), await onion.tokenURIWithSB(0))
    });
});