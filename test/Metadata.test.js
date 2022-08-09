const assert = require("assert");
const { ethers } = require("hardhat");

let provider;
let accounts = [];
let metadata;
let compose;
let signer;

beforeEach(async () => {
    const Compose = await ethers.getContractFactory("Compose");
    compose = await Compose.deploy();
    const Metadata = await ethers.getContractFactory("Metadata");
    metadata = await Metadata.deploy(compose.address);
    await metadata.deployTransaction.wait();

    provider = ethers.provider;

    const signers = await ethers.getSigners();
    signer = await signers[0].getAddress();

    for (const s of signers) {
        const addr = s.address;
        accounts.push(addr);
    }
});

describe("Metadata Contract", () => {
    it("successfully deploys", () => {
        assert.ok(compose.address);
        assert.ok(metadata.address);
    });

    it("builds metadata with string builder", async () => {
        await metadata.initialTraitValues(0);
        await metadata.buildMetadataWithSB(0);

        assert(true);
    });

    it("builds metadata without string builder", async () => {
        await metadata.initialTraitValues(0);
        await metadata.buildMetadata(0);

        assert(true);
    });

    it("builds same metadata with and without string builder", async () => {
        await metadata.initialTraitValues(0);

        assert.strictEqual(await metadata.buildMetadataWithSB(0), await metadata.buildMetadata(0));
    });
});