# Developing in Containers

The following steps provide the best experience and performance for developing in a container.  It is advised that the data is either stored on a WSL2 path (i.e.) on the Linux distro available in windows as the `\\wsl$` share.

The dockerfile to use for the container can be specified in `devcontainer.json`.  By default it uses the `Dockerfile` at the root of the project.

- Run `wsl --distribution <dictribution_name>` to launch a terminal session on the Ubuntu distro (e.g. `wsl --distribution Ubuntu`)
- In the Ubuntu terminal, browse to the source folder (e.g. cd `/home/username/source/projectName`)
- Type `code .` to lauch code in the current folder using WSL2
- Update dev and node container environment variables in `./config/.dev.env` and `./config/.node.env`.
- Update volume for node container to point to the full path of the source folder on the WSL distro (e.g. `/home/username/source/projectName`)
- In code use Remote Containers extension to open the current folder in WSL
- In code use Remote Containers to re-open the current folder in a Container

By defualt both a dev and node container will be started, with VSCode connecting to the dev container instance and the node container running in the background.  This behaviour can be changed by updating the value of `runServices` in `devcontainer.json`.

**Note:** If you are working in a container on a nodejs project that was setup and run on Windows first, you may get a `permission denied` error when running modules stored in `node_modules`.  If the `node_modules` were created using `npm install` or `yarn install` on Windows then it try removing the `node_modules` folder then re-running the install command.  To remove the node_modules folder run `rm -rf node_modules`.