#!/bin/bash

if [ -z "$1" ]
then
    docker build -t testimage .
    docker run -p 5000:80 -v /sys/fs/cgroup -d testimage 
    docker exec -it $(docker ps -aq) sh
fi

if [ $1 = "remove" ]
then
    docker rm -f $(docker ps -aq)
    docker rmi -f $(docker images -q)
fi