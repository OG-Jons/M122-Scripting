#!/bin/bash

max_guesses=3
random_number=$((RANDOM%20+1))

for (( i=1 ; i <= max_guesses ; i++ )) ; do

    echo "This is attempt #$i"

    read -r -p "Pick a number between 1 and 20  " guess

    echo "You guessed $guess"

    if [ "$random_number" -eq "$guess" ]; then
        echo "You guessed correctly!"
        exit 0
        break
    fi

    if [ "$i" -ge $max_guesses ] ; then
        echo "You have exceeded $max_guesses tries and lost!"
        echo "The correct number was $random_number"
        exit 1
        break

    elif [ "$random_number" -gt "$guess" ]; then
        echo "The hidden number is higher!"

    elif [ "$random_number" -lt "$guess" ]; then
        echo "The hidden number is lower!"
    fi

done
