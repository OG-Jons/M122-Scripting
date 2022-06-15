#!/bin/bash

function file_count() {
    local dir=$1
    local count=$(find "$dir" | wc -l)
    echo "$dir: $count"
}

file_count /etc

file_count /var

file_count /usr/bin
