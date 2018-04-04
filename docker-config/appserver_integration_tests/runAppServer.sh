#!/bin/bash

if [[ "$(docker images -q jee7-test-wildfly 2> /dev/null)" == "" ]]; then
 	docker build -t jee7-test-wildfly ./docker-config/appserver_integration_tests/
fi
docker run -d  -p 18080:18080 -p 19990:19990 -p 18777:18787  jee7-test-wildfly
