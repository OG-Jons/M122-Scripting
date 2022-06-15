#!/bin/bash

for file in *.jpg;
  do
    mv "$file" "$(date +%Y-%m-%d)"-"$file"
  done
