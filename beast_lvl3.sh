#Hardest beast form
#!/bin/bash  #shebang
echo "This is the beast's final form"
beast =$(( $RANDOM % 100000)) #Random math
echo "Pick a number between 1 and 100000"
read input
if [[ $input -eq $beast ]]
then
    echo "You have defeated the beast"
    echo "Your value was $input and the beast's value was $beast"
else
    echo "You have been defeated by the beast"
    echo "Your value was $input and the beast's value was $beast"

fi