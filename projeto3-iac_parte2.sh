#!/bin/bash

# Segunda parte do script para conclusão do projeto3-iac.
# Executar após adicionar as máquinas clientes ao node swarm.

sudo docker service create --name web-server --replicas 4 -dt -p 80:80 --mount type=volume,src=app,dst=/app/ webdevops/php-apache:alpine-php7


#CONFIGURAÇÃO DO PROXY
sudo mkdir /proxy
sudo cp nginx.conf /proxy/
sudo cp dockerfile /proxy/
sudo cd /proxy/
sudo docker build -t proxy-app .
docker container run --name my-proxy-app -dti -p 4500:4500 proxy-app

