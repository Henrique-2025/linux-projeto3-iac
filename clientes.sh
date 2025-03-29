#!/bin/bash
#adicionar IP e nome no arquivo hosts
sudo apt-get install docker.io nfs-common -y
sudo systemctl start docker
sudo systemctl enable docker

sudo docker swarm join --token SWMTKN-1-02hct4roxywyc47db2t1ue12j89juxvzlbn59o53j2aoasqxpn-akfgct2e5alqin1ri4sd0q59g 192.168.1.168:2377

sudo mkdir -p /var/lib/docker/volumes/app/_data/
mount -o v3 192.168.1.173:/var/lib/docker/volumes/app/_data/ /var/lib/docker/volumes/app/_data
