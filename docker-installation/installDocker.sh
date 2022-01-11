#!/bin/bash

if [ $(id -u) != 0 ]; then
  echo -e "It must be root user."
  exit 1
fi 

check=$(systemctl --type=service | grep docker.service)
status=$? 

if [ $status -eq 1 ];then
  echo "This service doesnt exist"
else
  echo "This servis exist"
fi
