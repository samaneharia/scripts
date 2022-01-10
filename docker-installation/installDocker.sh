#!/bin/bash

set -e

if [ $(id -u) != 0 ]; then
  echo -e "It must be root user."
  exit 1
fi
