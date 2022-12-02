forge build --via-ir
<!-- Test without gas report -->
<!-- Note: Use vv when mass minting -->
forge test --via-ir -vvvv
forge test -vvvv
<!-- Test without optimizer -->
forge test --via-ir --gas-report  -vvvv
<!-- Test with optimizer -->
forge test --via-ir --gas-report  -vvvv --optimize --optimizer-runs 1000
<!-- Deploy to localhost -->
forge script script/Clifford.s.sol:CliffordScript --rpc-url http://localhost:8545 --via-ir --broadcast -vvvv
<!-- Deploy to Goerli -->
forge script script/Clifford.s.sol:CliffordScript --rpc-url https://goerli.infura.io/v3/63f1a12625cf485cb768cd39a01044da --via-ir --broadcast --verify -vvvv
<!-- Slither overview -->
slither ./src/Clifford.sol --print human-summary

docker compose up build
docker compose up test