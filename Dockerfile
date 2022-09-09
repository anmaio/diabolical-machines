# Docker container for solidity smart contract development with hardhat
# 
# Designed to mount source code into /usr/src/app:
# 
#   - docker build -t localdev --build-arg NODE_VERSION=16.x .
#   - docker run -it -v ${PWD}:/usr/src/app --name mydev localdev


FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

# Install Curl
RUN apt update \
    && apt-get -qq install curl

# Create source dir
RUN mkdir /usr/src/app && mkdir /usr/src/docker

# Install Git and set source dir as safe
RUN apt-get -qq install git
RUN git config --global --add safe.directory /usr/src/app

# Install Docker-CLI and Docker Compose
RUN apt install apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" \
    && apt-get install docker-ce-cli docker-compose-plugin

# Install nodejs and enable yarn (https://github.com/nodesource/distributions/blob/master/README.md#debian-and-ubuntu-based-distributions)
ARG NODE_VERSION
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION} | bash - \
    && apt-get -qq install nodejs && corepack enable

# Copy entrypoint script and set execute permissions
COPY ./docker/entrypoint.sh /usr/src/docker
RUN chmod +x "/usr/src/docker/entrypoint.sh"

WORKDIR /usr/src/app

ARG ROLE
ENV ROLE=${ROLE}

ENTRYPOINT sh /usr/src/docker/entrypoint.sh -r $ROLE