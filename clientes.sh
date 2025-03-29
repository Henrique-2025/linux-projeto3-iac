#!/bin/bash
#adicionar IP e nome no arquivo hosts
sudo apt-get install docker.io nfs-common -y
sudo systemctl start docker
sudo systemctl enable docker

# Adicionando a maquina ao swarm do docker server
# A cada vez que executar o "docker swarm init" DEVE-SE ATUALIZAR o token a baixo.
sudo docker swarm join --token SWMTKN-1-02hct4roxywyc47db2t1ue12j89juxvzlbn59o53j2aoasqxpn-akfgct2e5alqin1ri4sd0q59g 192.168.1.168:2377

#Criando diretorio e copiando arquivo do server
sudo mkdir -p /var/lib/docker/volumes/app/_data/
mount -o v3 192.168.1.168:/var/lib/docker/volumes/app/_data/ /var/lib/docker/volumes/app/_data
