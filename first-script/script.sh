#!/bin/bash

username=$(echo $USER)

touch /home/$username/dmsg.txt 

egrep -i 'error|warning' /var/log/dmesg > /home/$username/dmesg.txt

