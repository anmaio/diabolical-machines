const assert = require("assert");
const { ethers } = require("hardhat");

const TEST_COUNT = 10

let provider;
let accounts = [];
let stringBuilder;
let signer;

beforeEach(async () => {
    const StringBuilder = await ethers.getContractFactory("MockStringBuilder");
    stringBuilder = await StringBuilder.deploy();

    provider = ethers.provider;

    const signers = await ethers.getSigners();
    signer = await signers[0].getAddress();

    for (const s of signers) {
        const addr = s.address;
        accounts.push(addr);
    }
});

describe("MockStringBuilder Contract", () => {
    it("successfully deploys", () => {
        assert.ok(stringBuilder.address);
    });

    it("Builds string without string builder", async () => {
        for (let i = 0; i < 10; i++) {
            await stringBuilder.withoutSB(0);            
        }
        
        assert(true);
    });

    it("Builds string with string builder", async () => {
        for (let i = 0; i < 10; i++) {
            await stringBuilder.withSB(0);          
        }

        assert(true);
    });

    it("Builds a string with concat bytes", async () => {
        for (let i = 0; i < 10; i++) {
            await stringBuilder.withConcatBytes(0);          
        }

        assert(true);
    });

    it("Builds same string with and without string builder", async () => {
        assert.strictEqual(await stringBuilder.getWithSB(), await stringBuilder.getWithoutSB());
        assert.strictEqual(await stringBuilder.getWithSB(), await stringBuilder.getWithConcatBytes());
        assert.strictEqual(await stringBuilder.getWithoutSB(), await stringBuilder.getWithConcatBytes());
    });
});