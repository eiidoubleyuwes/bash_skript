#Allow user input to choose character

#!/bin/bash  #shebang 

echo "Hello traveller chose an avatar : 1. Mage 2. Musclebrain 3. Guhdamn"

read avatar

if [[ $avatar -eq 1 ]]
then
    echo "You chose Mage"
    echo "Skill set is : 1. Thought 2. Punch 3. Kick"

elif [[ $avatar -eq 2 ]]
then
    echo "You chose Musclebrain"
    echo "Skill set is : 1. Muscle 2. Punch 3. Kick"

elif [[ $avatar -eq 3 ]]
then
    echo "You chose Guhdamn"
    echo "Skill set is : 1. Fireball 2. Punch 3. Kick"
else
    echo "You chose poorly,please stick to the options provided"
fi

