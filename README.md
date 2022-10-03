forge build --via-ir
forge test --via-ir -vvvv
forge script script/Clifford.s.sol:CliffordScript --fork-url http://localhost:8545 --via-ir --broadcast -vvvv
forge script script/Clifford.s.sol:CliffordScript --fork-url https://goerli.infura.io/v3/63f1a12625cf485cb768cd39a01044da --via-ir --broadcast --verify -vvvv

docker compose up build
docker compose up test