#!/bin/sh
docker run --net dtls --name dtls-client -it --rm safecrypto-dtls dtls-rlwe-client dtls-server
