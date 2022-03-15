#!/bin/bash

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

sudo apt-get update  
sudo apt-get install docker-ce docker-ce-cli containerd.io                        
                                                  
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo systemctl start docker
sudo systemctl enable docker

sudo docker-compose version
sudo docker version

sudo usermod -aG docker $USER
