FROM ubuntu:bionic

ARG NODE_VER=8.16.2

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt upgrade -y && \
    apt install -y build-essential python wget && \
    mkdir tmp/node && \
    wget https://nodejs.org/dist/v$NODE_VER/node-v$NODE_VER.tar.gz -P tmp/node && \
    (cd tmp/node && tar --strip-components=1 -zxf node-v$NODE_VER.tar.gz) && \
    (cd tmp/node && ./configure --with-intl=full-icu --with-icu-source=https://github.com/unicode-org/icu/releases/download/release-60-3/icu4c-60_3-src.tgz --download=all) && \
    (cd tmp/node && make -j8 OFLAGS=-O1) && \
    (cd tmp/node && make install) && \
    apt-get purge -y build-essential python wget $(apt-mark showauto) && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf tmp/node && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["node"]
