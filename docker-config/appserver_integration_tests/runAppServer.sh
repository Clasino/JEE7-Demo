#!/bin/bash

if [[ "$(docker images -q jee7-test-wildfly 2> /dev/null)" == "" ]]; then
 	docker build -t jee7-test-wildfly .
fi
docker run -d  -p 8080:8080 -p 9090:9090 -p 8787:8787  jee7-test-wildfly
