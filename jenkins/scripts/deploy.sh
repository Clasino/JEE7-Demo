#!/bin/bash

DOCKER_DEPLOY='/tmp/server/tmp/docker-deploy'

if [[ -e $DOCKER_DEPLOY/jee7-demo-class-service-1.0.0-SNAPSHOT.war ]]; then
    rm -f $DOCKER_DEPLOY/jee7-demo-class-service-1.0.0-SNAPSHOT.war
    if [[ -e $DOCKER_DEPLOY/jee7-demo-class-service-1.0.0-SNAPSHOT.war.deployed ]]; then
        rm -f $DOCKER_DEPLOY/jee7-demo-class-service-1.0.0-SNAPSHOT.war.deployed
    fi
fi
if [[ -e jee7-class-service/target/jee7-demo-class-service-1.0.0-SNAPSHOT.war ]]; then
    cp jee7-class-service/target/jee7-demo-class-service-1.0.0-SNAPSHOT.war $DOCKER_DEPLOY
fi

if [[ -e $DOCKER_DEPLOY/jee7-demo-grade-service-1.0.0-SNAPSHOT.war ]]; then
    rm -f $DOCKER_DEPLOY/jee7-demo-grade-service-1.0.0-SNAPSHOT.war
    if [[ -e $DOCKER_DEPLOY/jee7-demo-grade-service-1.0.0-SNAPSHOT.war.deployed ]]; then
        rm -f $DOCKER_DEPLOY/jee7-demo-grade-service-1.0.0-SNAPSHOT.war.deployed
    fi
fi
if [[ -e jee7-grade-service/target/jee7-demo-grade-service-1.0.0-SNAPSHOT.war ]]; then
    cp jee7-grade-service/target/jee7-demo-grade-service-1.0.0-SNAPSHOT.war $DOCKER_DEPLOY
fi

if [[ -e $DOCKER_DEPLOY/jee7-demo-search-service-1.0.0-SNAPSHOT.war ]]; then
    rm -f $DOCKER_DEPLOY/jee7-demo-search-service-1.0.0-SNAPSHOT.war
    if [[ -e $DOCKER_DEPLOY/jee7-demo-search-service-1.0.0-SNAPSHOT.war.deployed ]]; then
        rm -f $DOCKER_DEPLOY/jee7-demo-search-service-1.0.0-SNAPSHOT.war.deployed
    fi
fi
if [[ -e jee7-search-service/target/jee7-demo-search-service-1.0.0-SNAPSHOT.war ]]; then
    cp jee7-search-service/target/jee7-demo-search-service-1.0.0-SNAPSHOT.war $DOCKER_DEPLOY
fi

if [[ -e $DOCKER_DEPLOY/jee7-demo-student-service-1.0.0-SNAPSHOT.war ]]; then
    rm -f $DOCKER_DEPLOY/jee7-demo-student-service-1.0.0-SNAPSHOT.war
    if [[ -e $DOCKER_DEPLOY/jee7-demo-student-service-1.0.0-SNAPSHOT.war.deployed ]]; then
        rm -f $DOCKER_DEPLOY/jee7-demo-student-service-1.0.0-SNAPSHOT.war.deployed
    fi
fi
if [[ -e jee7-students-service/target/jee7-demo-student-service-1.0.0-SNAPSHOT.war ]]; then
    cp jee7-students-service/target/jee7-demo-student-service-1.0.0-SNAPSHOT.war $DOCKER_DEPLOY
fi
