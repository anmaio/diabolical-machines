# **Yarn shortcut commands**

Using yarn we are able to provide shortcut commands to running hardhat tasks.  These shortcuts run scripts that are listed in the `packages.json` file.

The table below lists all the available shortcut commands.

| command | Description  |
|:-----------|:-----------|
| `yarn hook:add` | Install and configure Husky pre-commit hooks for git |
| `yarn hook:remove` | Remove pre-commit hook and uninstall Husky |
| `yarn node:local `| Start hardhat node on local client |
| `yarn node:docker` | Start hardhat node in docker container |
| `yarn accounts:local` | Prints out accounts and balances that exist on local node |
| `yarn check:local` | Run format and linting |
| `yarn lint:sol` | Check linting |
| `yarn format:sol` | Format solidity files |
| `yarn test:local` | Format, lint and run unit tests |
| `yarn clean:local` | Clean up any compiled conTracts |
| `yarn compile:local` | Compile the solidity contracts |
| `yarn deploy:local` | Deploy contracts to local node (Local or docker, whichever is running) |
| `yarn deploy:rinkeby` | Deploy contracts to testnet (By default this will also verify the contracts) |
| `yarn deploy:mainnet` | Deploy contracts to mainnet (By default this will also verify the contracts) |
| `yarn verify:rinkeby <contract_address> <constructor_args>` | Verify a deployed contract deployed to testnet (by default this is enabled as part of deploy) |
| `yarn verify:mainnet <contract_address> <constructor_args>` | Verify a deployed contract deployed to mainnet (by default this is enabled as part of deploy) |
| `yarn client:local` | Spin up test client to work against local node or testnet. |
| `yarn client:docker` | Spins up a container runninf the test client app. |


Please feel free to add to if required.  As a point to note, hardhat tasks can be used for anything, including setting up a task to mint your tokens after deployment.