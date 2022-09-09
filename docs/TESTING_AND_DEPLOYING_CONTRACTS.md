# **Build and Test**

Yarn is used to provide shortcuts to running the standard build, compile, deploy and test actions associated with contract development.  

## **Local chain and EVM**

The project is based on hardhat and so utilises the hardhat local blockchain and evm functionality.  An instance of the local chain and evm can be spun up locally or within a docker container.

- Local: 
  - Run `yarn node:local`
- Docker:
  - Run `yarn node:docker`

The local chain can be optionally integrated with Ethernal to capture and trace transactions for debugging and testing. Ethernal configuration is managed via environment variables. (see [Using this template](./USING_THIS_TEMPLATE.md) and [Node Modules and Hardhat Plug-ins](./NODE_MODULES.md) for more details on setting up enviromnent variables and .env files).

NOTE: By default an instance of the hardhat node container is started alongside the dev container when VSCode spings up the containers.  Only a single instance of the hardhat node can be running at any one time due to port clashes.  This beheaviour can be changed by upding the `devcontainer.json` configuration.  See [Using this template](./USING_THIS_TEMPLATE.md) for more details.

## **Compiling**

To compile the code run the following command:

- `yarn compile:local`

To clean up any existing compiled contracts run:

- `yarn clean:local`

## **Deploying to locahost**

To deploy a contract to the local hardhat blockahin run the command:

- `yarn deploy:local`

This will deploy the compiled contract to the active hardhat node.  This same command is used whether the hardhat node container is running alongside or inside the development container.

This executes hardhat tasks defined in `./hardhat.config.local.js` to deploy the contract.  The existing tasks are coded for the sample Greeter contract.  They will need to be amended to suite your requirements.

## **Unit tests**

Unit tests must be stored in the `./tests` folder.  To execute the tests using run the following command:

- `yarn test:local`

The unit tests will also verify Soldity formatting and linting as well as provide feedeback on estimated gas consumption and costs.

Unit tests can also be run directly in the VSCode Test Explorer.

## **Solidity formatting and linting**

Linting and formatting of .sol files can also be performed as individual steps by running:

- `yarn lint:sol`
- `yarn format:sol`

You can use `yarn check:local` to run both of the above in a single command.

See [Node Modules and Hardhat Plug-ins](./NODE_MODULES.md) for more details on how to configure linting, formatting and gas reporting.

## **Integration tests**

Integration testing using a client located in the `./client` folder can be run to provide additional local or pipeline testing.  The client app is run inside a separate docker container.  To launch the client run:

- `yarn client:docker`

The client:docker command sets the Dockerfile argument `ROLE` to `client` (this is set in `docker-compose.yml`).  This runs the `client` specific switch statement in `./docker/entrypoint.sh` which autoamtically runs the client app by running `yarn client:local` when it is spun up.  Update `entrypoint.sh` switch statement for `client` to change the default behaviour if required.

As with local development and testing, integration tests can be integrated with Ethernal if required.  For local testing this is controlled using local environment variables.  See [Using this template](./USING_THIS_TEMPLATE.md) for further details on configuring environment variables for the client.

You can run the client app directly on the dev container by running `yarn client:local`, however for this to work the environment variables must be declared in a `.env` file in the root of the directory.

## **Deploy to Rinkeby and testnet**

To deploy to the [Rinkeby](https://www.rinkeby.io/#stats) testnet you will first need to setup an account with a service like [Infura](https://infura.io/) to obtain a secure url.  You will also be required to provide the private key of a wallet that contains ETH on the Rinkeby testnet network.

The secret url and wallet private key must be provided for the value of the `RINKEBY_URL` and `RINKEBY_ACCOUNT` environment variables.  These can be povided in the `./config/.dev.env` file or as local environment variables.

To deploy contract(s) to a testnet run the command:

- `yarn deploy:rinkeby`

This executes hardhat tasks defined in `./hardhat.config.js` to deploy the contract and run the verification.  The existing tasks are coded for the sample Greeter contract.  They will need to be amended to suite your requirements.

Transactions on the Rinkeby testnet can be explored using the [Etherscan Testnet Explorer](https://rinkeby.etherscan.io/).

NOTE: This template uses the rinkeby test network and Infura.  Other test networks and providers are available and can be used instead of rinkeby and infura.

## **Deploy to Mainnet**

To deploy to the mainnet you will first need to setup an account with a service like [Infura](https://infura.io/) to obtain a secure url.  You will also be required to provide the private key of a wallet that contains ETH on the mainnet network.

The secret url and wallet private key must be provided for the value of the `MAINNET_URL` and `MAINNET_ACCOUNT` environment variables.  These can be povided in the `./config/.dev.env` file or as local environment variables.

To deploy contract(s) to mainnet run the command:

- `yarn deploy:mainnet`

This executes hardhat tasks defined in `./hardhat.config.js` to deploy the contract and run the verification.  The existing tasks are coded for the sample Greeter contract.  They will need to be amended to suite your requirements.

NOTE: This template uses Infura, other  providers are available and can be used instead of Infura.