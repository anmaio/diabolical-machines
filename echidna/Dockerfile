FROM ghcr.io/crytic/echidna/echidna:testing-master

COPY ./docker/entrypoint.sh /docker/entrypoint.sh
RUN chmod +x "/docker/entrypoint.sh"

WORKDIR /app

ENTRYPOINT [ "/bin/sh" ]