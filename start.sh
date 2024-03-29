#!/bin/sh

if [ ! $(docker ps -q -f name=homesec) ]; then
    docker-compose up -d
    docker exec -it homesec /bin/bash scripts/apt_ops.sh
else
    echo "container \"homesec\" already exists"
fi
