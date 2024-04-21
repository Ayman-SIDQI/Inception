#!/bin/bash



if [ $1 = 'clean' ]
then 
    docker rm -f $(docker ps -aq)
fi
if [ $1 = 'fclean' ] 
then
    docker rm -f $(docker ps -aq)
    docker rmi -f $(docker images -aq)
fi
