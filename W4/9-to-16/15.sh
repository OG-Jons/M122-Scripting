#!/bin/bash


echo "Bitte geben Sie ein Präfix ein (Standardmäßig das heutige Datum):"

read -r prefix

if [[ -z $prefix ]]; then
  prefix=$(date +%Y-%m-%d)
fi

echo "Geben sie die Dateierweiterung ein (Standardmäßig \"jpg\"):"

read -r suffix

if [[ -z $suffix ]]; then
  suffix="jpg"
fi

for file in *."$suffix"; do
  echo "Alter name: $file"
  echo "Neuer Name: $prefix-$file"
  mv "$file" "$prefix-$file"
done
