FROM	debian:9.4-slim AS base

RUN	apt-get update && apt-get install -y libmpfr4 libgmp10

FROM	base AS build

RUN	apt-get update && apt-get install -y autoconf build-essential bc netcat autotools-dev \
		autoconf-archive automake libtool check libevent-dev curl zip unzip \
		pkg-config libsubunit-dev libgmp-dev libmpfr-dev splint

RUN	SCDIR=/tmp/libsafecrypto && \
	TDDIR=/tmp/tinydtls && \
        mkdir -p ${SCDIR} && \
	mkdir -p ${TDDIR} && \
        cd ${SCDIR} && \
        curl -sL https://github.com/safecrypto/libsafecrypto/releases/download/0.2.0-42/safecrypto-0.2.0-42.tar.gz | \
        tar -zx --strip-components=1 && \
        autoreconf -fvi && \
        ./configure && \
        make && \
        make install && \
	ldconfig && \
	cd ${TDDIR} && \
	curl -sL https://github.com/noelcatt/tinydtls/archive/sc-v0.1.tar.gz | \
	tar -zx --strip-components=1 && \
	autoreconf && \
	./configure && \
	make && \
	cp ${TDDIR}/tests/dtls-rlwe-client /usr/local/bin/ && \
	cp ${TDDIR}/tests/dtls-rlwe-server /usr/local/bin/

FROM	base AS release

COPY	--from=build /usr/local /usr/local

RUN	ldconfig
