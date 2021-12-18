#!/bin/bash
username=$(echo $USER)
egrep -i 'error|warning' /var/log/dmesg > /home/$username/dmesg.txt

