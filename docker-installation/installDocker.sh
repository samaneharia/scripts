#!/bin/bash

set -ex

if [ $(id -u) != 0 ]; then
  echo -e "It must be root user."
  exit 1
fi 

check=$(systemctl --type=service | grep docker.service)
status=$? 

if [ $status -eq 1 ];then
  
  #This service doesnt exist.installing the last version.
  apt-get update
  apt-get install docker-ce docker-ce-cli containerd.io
  apt-cache madison docker-ce
  apt-get install docker-ce=<VERSION_STRING> \ 
	  docker-ce-cli=<VERSION_STRING> containerd.io

  #installing docker-compose
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/ \ 
	  docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose

  #creating a symbolic link if docker-compose command fails.
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  
  #checking versions
  docker --version
  docker-compose --version

else

  #This servis exist.Removing the existed version.
  apt-get remove docker docker-engine docker.io containerd runc
  rm -rf /var/lib/docker
  rm -rf /var/lib/containerd

  #installing last version.
  apt-get update                                                               
  apt-get install docker-ce docker-ce-cli containerd.io                        
  apt-cache madison docker-ce                                                  
  apt-get install docker-ce=<VERSION_STRING> \                                 
        docker-ce-cli=<VERSION_STRING> containerd.io                             
  
  #installing docker-compose
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/ \
	  docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
 
  #creating a symbolic link if docker-compose command fails.
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
 
  #checking versions
  docker --version
  docker-compose --version

fi
