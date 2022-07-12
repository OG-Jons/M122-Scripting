#!/bin/bash
echo "Enter the directory: "
read -r path
# Check if path exists
if [ ! -d "$path" ]; then
  echo "$path does not exist"
  exit 1
fi

echo "From which date should the files be deleted (JJJJ-MM-TT): "
read -r date
# Check if date is valid
if ! [[ $date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  echo "Date $date is invalid"
  exit 1
fi

# Read out all the files in the given directory
files=$(find "$path" -type f)
deletable_files=()
#find "$path" -type f
# Loop through all the files
for file in $files; do
  # Check if the file is older than the given date
  if [[ $(stat -c %Y "$file") -lt $(date -d "$date" +%s) ]]; then
    deletable_files+=("$file")
    echo "$file"
  fi
done

echo "Should the files be deleted? (y/n)"
read -r answer
if [ "$answer" == "y" ]; then
  # Delete all the files
  for file in "${deletable_files[@]}"; do
    rm "$file"
  done

  echo "${#deletable_files[@]} files were deleted"
fi
