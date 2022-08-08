# **Azure DevOps Pipeline**

A framework for an Azure DevOps pipeline is included in this template.  The main pipeline file is `./azure-pipelines.yml` which reference template files located in the `./pipeline/templates` folder.

The pipeline has been designed around the Gitflow workflow.

## **Stages and Jobs**
At a high-level the pipeline runs through the following stages and jobs:


| Environment/Stage | Trigger | Depends On | Jobs |
|:-----------|:-----------|:-----------|:-----------|
| Test | PR from feature to develop branch | N/A | Checks formatting, linting and run unit tests.  Provides feedback on estimated gas consumption and costs. |
| Staging | Creation of Release branch | N/A | Compiles and deploys the contract to testnet before verifying the contract.  Includes a placeholder job where a test client could also be added for user acceptance testing. |
| Productuon | Creation of Release branch | Staging | Compiles and deploys the contract to mainnet before verifying the contract. |

Before running the pipeline you will need to ensure that the Pipeline environment (with required branch control and approvers) are created in the project.

Secure file artifacts must also be created in the DevOps project to ensure enviroment variables are injected into the pipeline.  See the [Using this template](./USING_THIS_TEMPLATE.md) guide for details on the .env files.

