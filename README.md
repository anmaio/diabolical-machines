# Running build, test and deploy
```
forge build --via-ir
forge test --via-ir -vvvv
forge test --via-ir --gas-report  -vvvv
forge script script/Clifford.s.sol:CliffordScript --fork-url http://localhost:8545 --via-ir --broadcast -vvvv
forge script script/Clifford.s.sol:CliffordScript --fork-url https://goerli.infura.io/v3/63f1a12625cf485cb768cd39a01044da --via-ir --broadcast --verify -vvvv
```

# Running with Docker
```
docker compose up build
docker compose up test
```

# Slither

[Slither user guide](https://github.com/crytic/slither)
slither ./src/Clifford.sol

[Print Summaries](https://github.com/crytic/slither/wiki/Printer-documentation)
`slither ./src/Clifford.sol --print human-summary`