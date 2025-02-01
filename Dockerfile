FROM node:23.7.0-alpine3.21

# See https://github.com/dodona-edu/dolos/blob/main/docker/Dockerfile

ENV DOLOS_VERSION=2.9.0

RUN apk update
RUN apk add --no-cache bash python3 build-base unzip
RUN npm -g install @dodona/dolos@${DOLOS_VERSION}

RUN mkdir /dolos /dolos-bin
RUN chmod 777 /dolos /dolos-bin

COPY scripts/entrypoint.sh /dolos-bin/entrypoint.sh
RUN chmod 777 /dolos-bin/entrypoint.sh

WORKDIR /dolos

ENTRYPOINT ["/bin/bash", "/dolos-bin/entrypoint.sh"]
