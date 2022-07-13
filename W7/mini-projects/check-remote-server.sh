#!/bin/bash -e
## Check remote server
## Author: Jonas Marschall
## Date: 07.07.2022
##
## This script will take in a hostname and check if the server is online.
##


echo -n "Enter the host of the server you want to check: "
read -r host
ping -q -c 1 "$host" > /dev/null 2>&1 && echo "$host is online!" || echo "$host is offline!"
