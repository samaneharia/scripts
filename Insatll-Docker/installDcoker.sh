#!/bin/bash

if [ $(id -u) != 0 ]; then
	echo -e "Sorry!\nThis script only runs by root.\nYou are not root user."
	exit 1
fi


