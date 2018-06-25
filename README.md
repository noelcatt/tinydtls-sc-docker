# tinydtls-sc-docker

Dockerfile to build and run libsafecrypto-tinydtls example.

Once built using 'build.sh' run the server script first, which will create the network and run the server, then run the client script.

## build.sh
Builds the docker container.

## run-server.sh
Creates the private docker network and runs the server component.

## run-client.sh
Runs the client component within the private docker network.

## stop-all.sh
Stops running containers and removes the private network.