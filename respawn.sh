#This script is used to respawn the character after death
#! /bin/bash

echo "You have died,I will give you a chance,answer this question correctly and you will be revived"

sleep 2

echo "What is the shoe size of the beast?"

read answer

if [[ $answer -eq 10 || $answer -eq 1 || $answer == "Big foot"]]
then
    sleep 4
    echo "You have been revived"
else
    echo "You have been defeated again"
    #Loop until the user enters the correct answer
    while [[ $answer -ne 10 || $answer -ne 1 || $answer != "Big foot" ]]
    do
        echo "What is the shoe size of the beast?"
        read answer
        if [[ $answer -eq 10 || $answer -eq 1 || $answer == "Big foot" ]]
        then
            echo "You have been revived"
            break
        else
            echo "You have been defeated again"
        fi
    done
fi