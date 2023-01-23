#!/bin/bash
containers=`docker container ls -aq`
images=`docker image ls -q`
volumes=`docker volume ls -q`
if [ ${#containers} != 0 ];then
    docker container rm -f $containers
fi
echo 'All containers deleted.'
if [ ${#images} != 0 ];then
    docker image rm -f $images
fi
echo 'All images deleted.'
if [ ${#volumes} != 0 ];then
    docker volume rm -f $volumes
fi
echo 'All volumes deleted.'