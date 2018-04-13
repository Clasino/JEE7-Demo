#!/bin/bash

CONTAINER_NAME='cheeky_binko'

docker network inspect jee7-network 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
	docker network create --subnet 172.18.0.0/16   jee7-network
fi


if [[ "$(docker images -q jee7-demo-mysql 2> /dev/null)" == "" ]]; then
 	docker build -t jee7-demo-mysql .
fi
if [[docker inspect -f {{.State.Running}} $CONTAINER_NAME]]; then
    docker rm -fv $CONTAINER_NAME
fi
docker run --ip="172.18.0.3" --net="jee7-network" -p 13306:3306 --name=$CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=admin -d jee7-demo-mysql
