#!/usr/bin/env bash
#!/bin/bash
characters=({a..z} {0..9})

for a in "${characters[@]}";
do
  for b in "${characters[@]}";
  do
      for c in "${characters[@]}";
      do
        for d in "${characters[@]}";
        do
            echo "$a$b$c$d"
            if unzip -o -P "$a$b$c$d" "vollsicher.zip" > /dev/null 2>&1; then
                echo "Password found: $a$b$c$d"
                exit 0
            fi
        done
      done
  done
done
