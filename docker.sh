#! /bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
    echo " You are in su mode and can run the script now"
else 
    echo " please run the script in su mode"
fi 

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
 
sudo systemctl enable docker
sudo systemctl start docker

 sudo useradd -g docker docker
 sudo usermod -aG docker docker

 sudo chmod 777 /var/run/docker.sock