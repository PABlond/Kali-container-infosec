#!/bin/sh

if [ $(docker ps -q -f name=homesec) ]; then
    docker exec -it homesec /bin/bash
else
    echo "container \"homesec\" does not exists"
fi
