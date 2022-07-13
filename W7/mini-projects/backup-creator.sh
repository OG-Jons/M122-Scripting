#!/bin/bash -e
## SCP Backup creator
## Author: Jonas Marschall
## Date: 07.07.2022
##
## This script will zip a given directory and copy it to a remote server, using credentials from the user.
## It will then ask if the local copy should be deleted.
##


echo -n "Path to the directory you want to create a backup of: "
read -r backupPath

echo -n "Enter the host of the SCP server: "
read -r host

echo -n "Enter the user of the SCP server: "
read -r user

echo -n "Enter the password of the SCP server (optional): "
read -sr password

echo "Zipping: "
zip -r backup.zip "$backupPath"
echo "Zipping done. Zipped to backup.zip"

echo "Uploading: "
if [[ -n $password ]]; then
  scp backup.zip $user@$host:backup.zip
else
  scp backup.zip $user@$host:backup.zip -p $password
fi
echo "Uploading done. Backup.zip uploaded to $host"

echo "Do you want to delete the archive locally? (y/n)"
read -r delete
if [ "$delete" = "y" ]; then
  rm backup.zip
  echo "Deleted backup.zip"
fi
# Alternative is using rm -i to delete the file and requesting confirmation. But it's nicer for the user this way.
