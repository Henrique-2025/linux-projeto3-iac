#!/bin/bash
#adicionar IP e nome no arquivo hosts
echo "192.168.3.100 server" >> /etc/hosts

apt-get install nfs-common

mount -o v3 server:/var/lib/docker/volumes/app/_data/ /var/lib/docker/volumes/app/_data

docker swarm join --token ... 


