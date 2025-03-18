#!/usr/bin/env bash

sudo dd if=/dev/zero of=/swapfile count=2048 bs=1MiB
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

sudo apt update && sudo apt install -y nmap zip unzip

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install -y docker-ce

git clone https://github.com/RomAbreu/practica6-aux.git

sudo apt update
sudo apt -y install software-properties-common
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get -y update
sudo apt-get -y install certbot

sudo certbot certonly --standalone -d practica6.turnos.do -d www.practica6.turnos.do

sudo cat /etc/letsencrypt/live/practica6.turnos.do/fullchain.pem /etc/letsencrypt/live/practica6.turnos.do/privkey.pem > ~/haproxy.pem
mv ~/haproxy.pem ~/practica6-aux/haproxy.pem
