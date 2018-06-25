#!/bin/sh
docker network create dtls
docker run --net dtls --name dtls-server --rm -it safecrypto-dtls dtls-rlwe-server
