#!/bin/bash

# Script de instalação e configuração para conclusão do projeto3-iac.
# Esse script instala o docker e carrega os containers mysql, apache e um proxy que é usado para balanceamento de carga.

#instalar docker
apt-get update
apt-get install docker.io nfs-server
echo "instalação OK"

#Download do container mysql
mkdir /my/own/datadir
docker run --name mysql -v /my/own/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=senha123,MYSQL_DATABASE=meubanco -dti mysql:latest

echo "MySQL OK"

#copiando index para o diretório no docker
cp index.php /var/lib/docker/volumes/app/_data/

#Criando um Swarm
docker swarm init | tee /tmp/log_swarm.txt

#Ingressar as máquinas no grupo com o token e executar a segunda parte do projeto3.

