#!/bin/bash

if [ -c "$1" ]
then
  echo "This is a special directory"
  exit 2
elif [ -d "$1" ]; then
  echo "This is a directory"
  exit 1
elif [ -f "$1" ]; then
  echo "This is a file"
  exit 0
else
  echo "Not a directory"
fi
