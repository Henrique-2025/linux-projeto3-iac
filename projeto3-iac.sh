#!/bin/bash

# Script de instalação e configuração para conclusão do projeto3-iac.
# Esse script instala o docker e carrega os containers mysql, apache e um proxy que é usado para balanceamento de carga.

#instalar docker
#apt-get update
#apt-get install docker.io nfs-server -y
#echo "instalação OK"

#sudo systemctl start docker.service
#sudo systemctl enable docker.service

#Download do container mysql
sudo mkdir -p /my/own/datadir
#PermitRootLogin prohibit-password
docker run -dti --name mysql -v /my/own/datadir:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=senha123 -e MYSQL_DATABASE=meubanco  mysql:latest
#docker run -dti --name mysql -v /my/own/datadir:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=senha123,MYSQL_DATABASE=meubanco  mysql:latest

echo "MySQL OK"

#copiando index para o diretório no docker
sudo cp index.php /var/lib/docker/volumes/app/_data/

#Criando um Swarm
docker swarm init | tee /tmp/log_swarm.txt

#Ingressar as máquinas no grupo com o token e executar a segunda parte do projeto3.

