#!/bin/bash



bash clean.sh fclean
docker buildx prune -f


rm -rf /home/asidqi/data

mkdir -p /home/asidqi/data/wp-data
mkdir -p /home/asidqi/data/mysql
