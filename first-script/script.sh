#!/bin/bash
egrep -i 'error|warning' /var/log/dmesg > /home/$(echo $USER)/dmesg.txt

