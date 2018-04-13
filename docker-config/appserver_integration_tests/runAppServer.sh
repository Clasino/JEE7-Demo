#!/bin/bash

CONTAINER_NAME='bodacious_goren'

if [[ "$(docker images -q jee7-test-wildfly 2> /dev/null)" == "" ]]; then
 	docker build -t jee7-test-wildfly .
fi
if docker inspect -f {{.State.Running}} $CONTAINER_NAME; then
    docker rm -fv $CONTAINER_NAME
fi
docker run -d  -p 18080:8080 -p 9990:9990 -p 8787:8787 --name=$CONTAINER_NAME  jee7-test-wildfly
