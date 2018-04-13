#!/bin/bash

CONTAINER_NAME='shady_selimi'

docker network inspect jee7-network 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
     docker network create --subnet 172.18.0.0/16   jee7-network
fi

if [[ "$(docker images -q jee7-demo-wildfly 2> /dev/null)" == "" ]]; then
 	docker build -t jee7-demo-wildfly .
fi
if docker inspect -f {{.State.Running}} $CONTAINER_NAME; then
    docker rm -fv $CONTAINER_NAME
fi
docker run --ip="172.18.0.2" --net="jee7-network" -d  -p 18080:8080 -p 19990:9990 -p 18787:8787 --name=$CONTAINER_NAME -v "/tmp/docker-deploy:/opt/jboss/wildfly/standalone/deployments/:rw" jee7-demo-wildfly
