#Harder beast
#!/bin/bash  #shebang
beast =$(( $RANDOM % 10)) #Random math
echo "Pick a number between 1 and 10"

read choice

if [[ $choice -eq $beast ]]
then
    echo "You have defeated the beast,but that wasn't the final form"
    echo "Your value was $choice and the beast's value was $beast"

else
    echo "You have been defeated by the beast"
    echo "Your value was $choice and the beast's value was $beast"

fi