forge build --via-ir
<!-- Test without gas report -->
<!-- Note: Use vv when mass minting -->
forge test --via-ir -vvvv
forge test -vvv
forge test --match-contract Clifford --match-test testAuctionSimulator -vvvv
forge test --match-contract Clifford --match-test testWriteChain1 --fork-url $MAINNET_RPC_URL

<!-- Test without optimizer -->
forge test --via-ir --gas-report  -vvvv
<!-- Test with optimizer -->
forge test --via-ir --gas-report  -vvvv --optimize --optimizer-runs 1000
<!-- Deploy to localhost -->
forge script script/Clifford.s.sol:CliffordScript --rpc-url http://localhost:8545 --broadcast -vvv
forge script script/Clifford.s.sol:CliffordScript --private-key $PRIVATE_KEY --rpc-url http://localhost:8545 --broadcast  -vvvv
forge script script/FakeClifford.s.sol:FakeCliffordScript --rpc-url http://localhost:8545 --broadcast -vvv
<!-- Deploy to Goerli -->
forge script script/Clifford.s.sol:CliffordScript --rpc-url $GOERLI_RPC_URL --broadcast --verify -vvvv
forge script script/FakeClifford.s.sol:FakeCliffordScript --rpc-url $GOERLI_RPC_URL --broadcast --verify -vvv
<!-- Deploy to Sepolia -->
forge script script/Clifford.s.sol:CliffordScript --private-key $PRIVATE_KEY --rpc-url $MAINNET_RPC_URL --broadcast --verify -vvvv
<!-- Slither overview -->
slither ./src/Clifford.sol --print human-summary
<!-- Forge std update -->
forge remove foundry-rs/forge-std && forge install foundry-rs/forge-std --no-commit

docker compose up build
docker compose up test