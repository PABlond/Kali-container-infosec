#!/bin/sh

docker-compose up -d
docker exec -it homesec /bin/bash scripts/apt_ops.sh
docker exec -it homesec /bin/bash
