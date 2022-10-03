FROM ghcr.io/foundry-rs/foundry:latest

RUN apk update && apk add --no-cache docker-cli
RUN apk add git
RUN git config --global --add safe.directory /app

COPY ./docker/entrypoint.sh /docker/entrypoint.sh
RUN chmod +x "/docker/entrypoint.sh"

WORKDIR /app

ENTRYPOINT [ "/bin/sh" ]