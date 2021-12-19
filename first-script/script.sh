#!/bin/bash

grep -i 'error\|warning' /var/log/dmesg > /home/$(echo $USER)/dmesg.txt
