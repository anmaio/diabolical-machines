FROM ghcr.io/foundry-rs/foundry:latest

ARG SOLC_VERSION

# Install Docker and git
RUN apk update && apk add --no-cache docker-cli
RUN apk add --no-cache git
RUN git config --global --add safe.directory /app

# Install curl required for mythril download
RUN apk --no-cache add curl

# Install GCC as required by pyton
RUN apk add --no-cache --update build-base musl-dev

# Install python as required by slither
RUN apk add --no-cache --update python3-dev
RUN apk add --no-cache --update py3-pip
RUN apk add --no-cache --update py3-wheel

# Install slither analyzer
RUN pip3 install slither-analyzer \
    && pip3 install solc-select

# Configure slither analyzer
RUN solc-select install $SOLC_VERSION \
    && solc-select use $SOLC_VERSION

# # Install mythril, required rust and curl
# RUN apk --no-cache add curl
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
# # RUN source $HOME/.cargo/env
# ENV PATH="/root/.cargo/env:$PATH"
# # RUN pip3 install mythril

# Copy up entrypoint script
COPY ./docker/entrypoint.sh /docker/entrypoint.sh
RUN chmod +x "/docker/entrypoint.sh"

# Setup working dir
WORKDIR /app
RUN mkdir images
RUN mkdir outputJson

# Run entrypoint script
ENTRYPOINT [ "/bin/sh" ]
