#!/bin/bash

# Segunda parte do script para conclusão do projeto3-iac.

echo "/var/lib/docker/volumes/app/_data/ *(rw,sync,subtree_check)" >> /etc/exports
exportfs -ar

docker service create --name web-server --replicas 6 -dt -p 80:80 --mount type=volume,src=app,dst=/app/ webdevops/php-apache:alpine-php7


#CONFIGURAÇÃO DO PROXY
mkdir /proxy
cp nginx.conf /proxy/
cp dockerfile /proxy/

docker build -t proxy-app .

docker container run --name my-proxy-app -dti -p 4500:4500 proxy-app

