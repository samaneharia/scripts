#!/bin/bash

dmesg | grep -iE 'error|warning' > $HOME/dmesg.txt
