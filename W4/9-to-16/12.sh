#!/bin/bash

function file_count() {
    local dir=$1
    local count=$(find "$dir" | wc -l)
    echo "$count"
}

file_count .
