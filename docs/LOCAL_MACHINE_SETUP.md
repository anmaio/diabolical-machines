# **Local Machine Setup**

The following provides guidance on how to setup your local machine for Solidity smart contract development using this template.

## **Installing software**

The following software must be installed onto the host machine.

- [Docker for Desktop](https://docs.docker.com/get-docker/)
- [Git](https://git-scm.com/downloads)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Terminal Preview](https://docs.microsoft.com/en-us/windows/terminal/install)

## **Install and configure WSL 2**

To improve performance of developing in containers it is recommended to enable WSL 2 and store the source code on the Unix filesystem.  Follow the steps below to install and setup WSL.

- On the host machine run `wsl --install -d <Distribution Name>` to install WSL2 (use `Ubuntu` as distribution)
- Create a user and password for the linux distribution
- Ensure Docker desktop settings are configured to use WSL2
- Connect to the linux terminal by running `wsl --distribution <distribution_name>` from a PowerShell terminal on the host machine.
- Browse to linux user home directory using the linux terminal (`cd /home/<username>`).
- In the linux create a directory that will be where you clone repositories to by running 'mkdir source' in the linux terminal.
- Create a shortcut to `/home/username/source` dir on Ubuntu in Windows Explorer
- Install git on the WSL distribution by running 

From windows explorer.exe browse to `\\wsl$\<distributon_name>` to access the file system of a specific linux distribution

The Windows file system can also be accessed from the linux side by browsing to `/mnt/c/` using the linux terminal

References:

- [WSL - Getting Started](https://code.visualstudio.com/docs/remote/wsl#_getting-started)
- [Installing WSL](https://docs.microsoft.com/en-gb/windows/wsl/install)

## **Git Configuration**

On the host machine the git user and email must be correctly configured by running the following commands:

```
git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"
```

This configuration is stored in `%USERPROFILE%\.gitconfig` on the host machine.

On the WSL distribution the git user and email must also be configured, as well as mounting git credentials from the local machine to the WSL distribution.  From within a linux terminal on the WSL distribution run the following commands:

```
git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"
git config --global credential.https://dev.azure.com.useHttpPath true
```

The `.gitattributes` configuration ensures that line endings are set to LF, except for Windows batch files are these require CRLF.

References:
- [Resoliving Git line ending issues](https://code.visualstudio.com/docs/remote/troubleshooting#_resolving-git-line-ending-issues-in-containers-resulting-in-many-modified-files)
- [Get started using Git on WSL](https://docs.microsoft.com/en-us/windows/wsl/tutorials/wsl-git)

## **VS Code Extensions**

The following Visual Studio Code extensions should be installed on the host machine.

- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [Solidity](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)
- [Azure Pipelines](https://marketplace.visualstudio.com/items?itemName=ms-azure-devops.azure-pipelines)
- [dotENV](https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv)
- [Azure Account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account)
- [Mocha Test Explorer](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-mocha-test-adapter)
- [Test Adapter Converter](https://marketplace.visualstudio.com/items?itemName=ms-vscode.test-adapter-converter)
- [Test Explorer UI](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer)
- [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)

The VSCode extensions for the development container instance are managed in `./devcontainer/devcontainer.json` and are the same as above, with the exception of the Remote - Containers and Remote-WSL extensions, as these are only installed on the host machine. When the container starts up the extensions are installed onto the dev container by VS Code.

## **Installing Node and yarn**

Node and yarn do not need to be installed onto the local host or the WSL distribution as they are provided as part of the docker image in which the development takes place.  

Both can be installed onto the host machine or the WSL distribution and this will have no impact on the development container.

For details on configuring the version of node and yarn installed onto the contianer see the [Using this Template](./USING_THIS_TEMPLATE.md) documentation.