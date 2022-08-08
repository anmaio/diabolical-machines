# Node Modules

The template depends on several node modules.  These include  the following:

- hardhat - Solidity development, testing and deployment framework
- hardhat-solhint - Plug-in for hardhat for linting and security checking of solidity contracts
- hardhat-etherscan - Plug-in for hardhat that verifies contracts deployed to the testnet and mainnet.
- hardhat-prettier - Plug-in for hardhat that is used for checking and fixing format of solidity code
- hardhat-ethernal - Plug-in for hardhat that allowes integration of the local chain with the Ethernal blockchain explorer
- hardhat-gas-reporter - Plug-in for hardhat that estimates gas consumption and pricing for contract methods and deployment
- husky - Provides integration with git and prettier via hooks and formats solidity code when a git commit is performed

For a full list of the node module dependencies see `packages.json`.

The following section detail how to configure some of these modules to suit your requirements.

## hardhat-solhint
The defailt configuration included in this template is an extension of the recommended configuration as listed [here](https://github.com/protofire/solhint/blob/master/docs/rules.md#:~:text=Style%20Guide%20Rules,-Rule%20Id&text=Constant%20name%20must%20be%20in%20capitalized%20SNAKE_CASE.&text=Contract%20name%20must%20be%20in%20CamelCase.&text=Event%20name%20must%20be%20in%20CamelCase.&text=Function%20name%20must%20be%20in%20camelCase.)

- Rules are managed in `./.solhint.json`
- Files/folders to exlude from checking are managed in `./.solhintignore`

Using yarn you can execute solhint to check linting:
- Run `yarn lint:sol` to check the linting of *.sol files
- Run `yarn test:local` to check the linting as part of unit testing.

## hardhat-prettier
Prettier is integrated with solhint and husky.  The solhint integration ensures code format is cheked along with other linting and security rules.  Husky integration allows a git hook to be created that formats the code when a git commit is detected.

- Rules are managed in `./.prettierrc`
- Files/folders to ginre are managed in `./.prettierignore`

Using yarn you can execute prettier to check formatting:
- Run `yarn format:sol` to check the format of *.sol files
- Run `yarn test:local` to check the formatting as part of unit testing.

For further details on how these components work togher see [this article](https://medium.com/coinmonks/introduction-to-solidity-linting-and-formatting-e838c074791a) on medium.com.

Full details on confgiuring solhint and the available options see the [prettier Github page](https://github.com/prettier/prettier).

## Husky
Husky integrates with git to trigger formatting of the code using prettier when a git commit is detected.  This trigger will fire on a pre-commit event so any formatting occurs before the code is commited to the repository. 

Husky is setup and enabled by default, with the configuration stored in the `.husky` folder.  This can be removed or added using yarn commands.

To configure husky and enable the git commit integration:
- Run `yarn hook:add`

If you wish to remove the git hook:
- Run `yarn hook:remove`

Further details can be found on the [husky Github site](https://typicode.github.io/husky/#/).

[This article](https://medium.com/coinmonks/introduction-to-solidity-linting-and-formatting-e838c074791a) on medium.com provides futher info.

## hardhat-ethernal
Integration of the local hardhat blockchain with ethernal blockchain explorer is disabled by default.  It can be enabled by setting environment variable `ETHERNAL_ENABLED=true` and as a minimum authentication credentials must be provided using the environment variables `ETHERNAL_EMAIL` and `ETHERNAL_PASSWORD`.

Using the ethernal integration first requires you [sign up for an account](https://app.tryethernal.com) and create a workspace.  This will be your default workspace which will be used.  To create a workspace a connection is required from the browser to an instance of the local blockhain available at `https://127.0.0.1:8545` or `ws://127.0.0.1:8545`.  Enure you have an instance of the hardhat_node container running.  Depending on how you havr configured `runServices` in `devonctainer.json` you may already have ab instance running.  If not you can start one by running `yarn node:docker`.

The following environment variables control the cofngiruation of Ethernal:

| Name | Default  | Description  |
|:-----------|:----------:|:-----------|  
| ETHERNAL_ENABLED | false | Specifies whether Ethernal integration is enabled.  If set to `true` then values must be provided for `ETHERNAL_EMAIL` and `ETHERNAL_PASSWORD`. |
| ETHERNAL_EMAIL | | Email address of Ethernal account to use for authentication. |
| ETHERNAL_PASSWORD | | Password for the Ethernal account. |
| ETHERNAL_DISABLE_SYNC | false | If set to `true`, plugin will not sync blocks & transactions to Ethernal. |
| ETHERNAL_DISABLE_TRACE | false | If set to `true`, Ethernal won't trace transactions. |
| ETHERNAL_WORKSPACE | undefined | Set the workspace to use, will default to the default workspace (latest one used in the dashboard). It is also possible to set it through the `ETHERNAL_WORKSPACE` env variable.
| ETHERNAL_UPLOAD_AST | false | If set to `true`, plugin will upload AST, and you'll be able to use the storage feature (longer sync time though). |
| ETHERNAL_RESET_ON_START | false | Pass a workspace name to reset it automatically when restarting the node, note that if the workspace doesn't exist it won't error. |

Further information can be found on the [Github site](https://github.com/tryethernal/hardhat-ethernal) for hardhat-ethernal, or [here](https://github.com/tryethernal/ethernal) on the main Ethernal Github site.

## hardhat-gas-reporter
The hardhat-gas-reporter plug-in is used to estimate gas usage and costs.  The plug-in is disabled by default and can be enabled by providing the environment variable `REPORT_GAS=true`. It extends the hardhat test functionality to run each time unit tests are run.

To enable estimated price for calling contract functions and deploying the contracts you must have registered for an account with coinmarketcap.com.  Once you have an account (free tier available), generate and API key and provide this for the value of `COINMARKETCAP_API_KEY`.

The following environment variables control the cofngiruation of the hardhat-gas-reporter plug-in:

| Name | Default  | Description  |
|:-----------|:----------:|:-----------|  
| REPORT_GAS | false | Specificy whether to report on gas usage.  If set to true then a value for `COINMARKETCAP_API_KEY` must be provided to repport on estimated costs. |
| COINMARKETCAP_API_KEY | | An API Key for Coinmarketcap.  If  no value is provided then no pricing data will be available.  Estimated gas consumption will still be reported. |

When developing and testing locally (using `yarn xyz:local`), the environment variables must exist on the local system.  When running in docker or in the pipeline, the variables should be provided via the .env files located in the `./config` folder.  

Further information can be found on the [Github site](https://github.com/cgewecke/hardhat-gas-reporter/

## **hardhat-etherscan**

The etherscan plug-in for hardhat facilitates the ability to verify contracts after deployment.

Contract verification is enabled by default and requires an `ETHERSCAN_API_KEY` to be added to the `.dev.env` dotEnv file.  It is run as part of the `yarn deploy:rinkeby` and `yarn deploy:mainnet` tasks defined in `packages.json`.

Contract verification at the time of deployment can be disabled by setting the `--verify` option to `false` on the `deploy:rinkeby` and `deploy:mainnet` tasks.

Verification can also be run independently by running the following commands:

- testnet: `yarn verify:rinkeby <contract_address> <constructor_args>`
- mainnet: `yarn verify:mainnet <contract_address> <constructor_args>`

Custom hardhat tasks `verify` and `verify-etherscan` are defined in `hardhat.config.js`.