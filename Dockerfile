FROM ghcr.io/foundry-rs/foundry:latest
ARG SOLC_VERSION
RUN apk update && apk add --no-cache docker-cli
RUN apk add --no-cache git
RUN git config --global --add safe.directory /app
# Install GCC as required by pyton
RUN apk add --no-cache --update build-base musl-dev
# Install python as required by slither
RUN apk add --no-cache --update python3-dev
RUN apk add --no-cache --update py3-pip
RUN apk add --no-cache --update py3-wheel
# # Install slither analyzer
# RUN pip3 install slither-analyzer \
#     && pip3 install solc-select
# Install slither analyzer
# RUN pip3 install halmos
RUN pip3 install solc-select
RUN git clone --branch dev https://github.com/crytic/slither.git
RUN cd /slither && python3 setup.py install
# Configure slither analyzer
RUN solc-select install $SOLC_VERSION \
    && solc-select use $SOLC_VERSION
COPY ./docker/entrypoint.sh /docker/entrypoint.sh
RUN chmod +x "/docker/entrypoint.sh"
WORKDIR /app
RUN mkdir images
RUN mkdir outputJson
ENTRYPOINT [ "/bin/sh" ]