# **Solidity Docker Forge Templete**

## **Overview**

This project provides a template for smart contract development with Solidity and [Foundry](https://book.getfoundry.sh/).

It aims to achieve the following goals:

- Provide consistent development, build and deployment environments (Docker)
- Provide approval-based workflow for release of contracts (Azure Pipelines)
- Integrate VS Code with containerised development environment (VSCode and Remote - Containers)
- Provide an asset that can be a template for creation of new projects/contracts
- Include features into the development and pipeline workflows such as:
    - Gas reporting
    - Automated contract deployment and verification with Etherscan

It uses Docker containers (with Docker Compose) to provide the the consistent development, build and release environments.  VSCode Remote - Containers provides a seamlless integration with containerised development environment.  The Foundry package along with a number of plug-ins provide the testing and deployment tools.

## **Using this template**

Read the following for full details on how to use this template in your project:

1. [Local Machine Setup](./docs/LOCAL_MACHINE_SETUP.md)
1. [Using this Template](./docs/USING_THIS_TEMPLATE.md)
1. [Developing in Containers](./docs/DEVELOPING_IN_CONTAINERS.md)
1. [Node Modules and Hardhat Plug-Ins](./docs/NODE_MODULES.md)
1. [Testing and Deploying Contracts](./docs/TESTING_AND_DEPLOYING_CONTRACTS.md)
1. [Azure DevOps Pipeline](./docs/AZURE_DEVOPS_PIPELINE.md)