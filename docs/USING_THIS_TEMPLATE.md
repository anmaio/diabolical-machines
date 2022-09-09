# **Using this template**

This project is intended to be used as a template for new Soldiity development projects.  The following steps outline how to use this template in your project.

NOTE: Before going through these steps please ensure you have setup your local machine as per the [Local Machine Setup](./LOCAL_MACHINE_SETUP.md) guide.

## **1)  Copy the template**

Once you have created your project repository and cloned it down to your local machine, copy the contents of this template into your project.

## **2)  Setup environment variables**

Environment variables are managed using dotenv (.env) files.  The .env files are passed into the containers at run time by Docker Compose.

The .env files used by docker are located in `./config`

- `.dev.env` - Environment variables used in the development container.  Use this to configure:
    - Git
    - Gas reporting
    - Etherscan
    - Testnet account
    - Mainnet account
- `.node.env` - Environment variables passed into the container that runs the hardhat node and local chain.  Use this to configure:
    - Ethernal
- `.client.env` - Environment variables passed into the container that runs the test client.

Environment variables are used to control plug-ins.  For details on suppoorted environment variables and their usage see the [Node Modules](./NODE_MODULES.md) documentation for more details.

The copy or version of the .env files must also be uploaded to Azure DevOps and are then pulled in by the pipeline when a job is run.

## **3)  Setup docker mounts**

Docker mounts the local source folder (stored on the WSL2 file system) to the container `/usr/src/app` folder.

The local source folder path must be updated on both the hardhat_node and hardhat_client containers to the location where you have stored your source code.  The configuration is in the `docker-compose.yml` file.

```json
volumes:
  - /home/<unix_user_name>/source/<project_name>:/usr/src/app
```

As is recommended and suggested in the [Local Machine Setup](./LOCAL_MACHINE_SETUP.md) document, this should be a folder in your users home directory on the WSL ditribution. Saplce <unix_user_name> with the username you setup on the WSL distribution.

NOTE: This is to workaround an issue ecountered with trying to run the hardhat node on a container inside the dev container.  This is currently being investigated and may be resolved in the future.

## **4)  Install node packages**

Run `yarn install` to install required node packages.

## **5)  Update deployment scripts**

The template provides a couple of methods for deploying the contracts.  The preferred method is using [hardhat tasks](https://hardhat.org/guides/create-task).

- For deployments into the local blockchain running on the hardhat node the deploy tasks can be found in `./hardhat.config.local.js`.
- For deployments into testnet or mainnet the deploy tasks can be found in `./hardhat.config.js`.

The existing tasks are coded to deploy the example Greeter.sol contract and will need to be amended for your own contracts.  

## **6)  Update test client**

A sample test client is included in `./client/sample-client.js`.  Replace this with your own client.

The client .js file is referened by the `client:local` and `client:docker` scripts in `packages.json`.  You will need to update the name of the file in these scripts.

## **7)  Additional VSCode extensions**

The template includes extenions most commonly used for Solidity development and testing.  Details of the extensions included can be found in the [Local Machine Setup](./LOCAL_MACHINE_SETUP.md) guide.

If additional extensions are required, first install them on the local host before adding them to the configuration in `.devonctainers/devcontainers.json`.

## **8)  Setup devcontainer environment**

By default, VSCode will launch 2 containers.

- hardhat_dev - The container in which development will be done and in which the deployment will run in the pipeline.  This is the container to which VSCode will attach.
- hardhat_node - The container in which runs the local hardhat blockchain and node.  This container will run in the background but can be connected to using the Docker or Remote - Container extensions.

If you want to configure devcontainers to only run the dev container then update the value for `runServices` in `./devcontainers/devcontainers.json`.  The hardhat node ccan then be started manually from within the dev container by running `yarn node:docker`.


