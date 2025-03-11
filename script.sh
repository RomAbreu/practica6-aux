#!/usr/bin/env bash

sudo dd if=/dev/zero of=/swapfile count=2048 bs=1MiB
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

sudo apt update && sudo apt install -y nmap zip unzip haproxy certbot docker

git clone https://github.com/RomAbreu/practica6-aux.git

chmod +x ~/practica6-aux/session.sh