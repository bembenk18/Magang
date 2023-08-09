#!/bin/bash
apt update
apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
mkdir docker
cd docker
curl https://raw.githubusercontent.com/bembenk18/Magang/main/Nginx/Dockerfile > Dockerfile
curl https://github.com/bembenk18/Magang/blob/main/Nginx/nginx.conf > nginx.conf
docker build -t nginx-multiserver .
docker run -d -p 8081:8081 -p 8082:8082 -p 8083:8083 nginx-multiserver

