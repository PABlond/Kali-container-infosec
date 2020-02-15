#!/bin/sh

if [ $(docker ps -q -f name=homesec) ]; then
    docker exec -it homesec $@
else
    echo "container \"homesec\" does not exists"
fi