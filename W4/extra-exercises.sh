#!/bin/bash

# Exercise 1
echo "Shell scripting is fun!"

# Exercise 2
msg="Shell scripting is fun!"
echo "$msg"

# Exercise 3
hostname="$(hostname)"
echo "Dieses Skript läuft auf $hostname."

# Exercise 4
if [ -f "file_path" ]; then
    echo "file_path passwords are enabled"
    if [ -w "file_path" ]; then
        echo "Sie haben die Berechtigung, \"file_path\" zu bearbeiten."
    else
        echo "Sie haben NICHT die Berechtigung, \"file_path\" zu bearbeiten."
    fi
fi

# Exercise 5
declare -a Creatures=("Mensch" "Bär" "Schwein" "Hund" "Katze" "Schaf")

printf "%s\n" "${Creatures[@]}"

# Exercise 6 / 7 / 8
# For this one to work, you need to parse a file, directory or special file.
for par in "$@"
do
  if [ -n "$par" ]; then
      echo "Checking if the given parameter is a directory or file."
      if [ -d "$par" ]; then
          echo "The given parameter is a directory."
          echo "The files in the directory are:"
          ls -l "$par"
      elif [ -f "$par" ]; then
          echo "The given parameter is a file."
          echo "The file content is:"
          ls "$par"
      elif [ -c "$par" ]; then
          echo "It's a special file or a device."
      else
          echo "The given parameter is not a directory, file or special file."
      fi
      file "$par"
  else
      echo "You did not pass anything"
  fi
done
