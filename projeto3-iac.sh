#!/bin/bash

# Script de instalação e configuração para conclusão do projeto3-iac.
# Esse script instala o docker e carrega os containers mysql, apache e um proxy que é usado para balanceamento de carga.

#instalar docker
sudo apt-get update
sudo apt-get install docker.io nfs-server -y
echo "instalação OK"

sudo systemctl start docker.service
sudo systemctl enable docker.service
# adicionar usuario ao grupo do docker para não precisar ficar especificando o sudo no futuro
sudo usermod -aG docker $USER

#Download do container mysql
sudo mkdir -p /my/own/datadir

sudo docker run -dti --name mysql -v /my/own/datadir:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=senha123 -e MYSQL_DATABASE=meubanco  mysql:latest
echo "MySQL OK"

#criando container de serviço web
sudo docker run --name web-server -dt -p 80:80 --mount type=volume,src=app,dst=/app/ webdevops/php-apache:alpine-php7
echo "Apache OK"

#copiando index para o diretório no docker
sudo cp index.php /var/lib/docker/volumes/app/_data/

#Criando um Swarm
sudo docker swarm init | tee /tmp/log_swarm.txt

echo "/var/lib/docker/volumes/app/_data/ *(rw,sync,subtree_check)" >> /etc/exports
exportfs -ar

#Ingressar as máquinas no grupo com o token e executar a segunda parte do projeto3.
