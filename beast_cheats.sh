#Allows the beast to select a random number between 1 and 2 for level 1
#!/bin/bash  #shebang
beast =$(( $RANDOM % 2)) #Random math
echo "Pick a number between 1 and 2"

read choice

if [[ $choice -eq $beast || $choice == "Kill" ]]

then
    echo "You have defeated the beast"
    echo "Your value was $choice and the beast's value was $beast"

else
    echo "You have been defeated by the beast"
    echo "Your value was $choice and the beast's value was $beast"
fi