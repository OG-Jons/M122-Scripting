#!/bin/bash
# The line above is used to tell the executing terminal, that this is a bash script and should execute it with such.


# This is a simple function to go on a new line
function breakLine() {
    printf "\n"
}

# Print Hello World!
echo Hello World!
breakLine

echo Printing Hello World 99 times:

# Create variable called counter and set it to 1
counter=1

# Using until to loop printing Hello World! until counter is 99
# It could also be possible to use a for loop here, but this is just used as an example
until [[ $counter -gt 99 ]]
do
  echo "Hello World #$counter"
  ((counter++))
done
breakLine


echo Printing hello world the amount of times of minutes there are currently:

# Create variable called currentMinutes and set it to the amount of minutes there are in the current hour
currentMinutes=$(date +%M)

# Loop printing hello world the amount of times of minutes there are currently
for (( i = 1; i <= currentMinutes; i++ )); do
  echo "Hello World #$i"
done
breakLine


# Use the exit command to exit the script programmatically, where you can pass an exit code
# It's possible to use different exit codes with different meanings, check: https://tldp.org/LDP/abs/html/exitcodes.html
exit 0

# It's also possible to stop a script manually, by pressing CTRL+C

