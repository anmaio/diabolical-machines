const assert = require("assert");
const { ethers } = require("hardhat");

let provider;
let accounts = [];
let compose;
let signer;

beforeEach(async () => {
    const Compose = await ethers.getContractFactory("MockCompose");
    compose = await Compose.deploy();

    provider = ethers.provider;

    const signers = await ethers.getSigners();
    signer = await signers[0].getAddress();

    for (const s of signers) {
        const addr = s.address;
        accounts.push(addr);
    }
});

describe("MockCompose Contract", () => {
    it("successfully deploys", () => {
        assert.ok(compose.address);
    });

    it("composes html with string builder", async () => {
        await compose.initialTraitValues(0);
        await compose.testComposeHTMLWithSB(0);

        assert(true);
    });

    it("composes html without string builder", async () => {
        await compose.initialTraitValues(0);
        await compose.testComposeHTML(0);

        assert(true);
    });

    it("composes same html with and without string builder", async () => {
        await compose.initialTraitValues(0);
        assert.strictEqual(await compose.testComposeHTMLWithSB(0), await compose.testComposeHTML(0));
    });
});