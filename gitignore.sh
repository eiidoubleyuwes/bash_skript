#This script will create a .gitignore file in the current directory
#It will add the following lines: .gitignore
#It will also add the gitignore to sub folders within the current directory
#It will check if the gitignore already exixts and if it does it will not create a new one within the current directory and its sub folders

#!/bin/bash
if [ -f .gitignore ]; then
    echo ".gitignore already exists"
else
    echo ".gitignore does not exist"
    touch .gitignore
    echo ".gitignore created"
    echo ".gitignore" >> .gitignore
    echo ".gitignore added to .gitignore"
fi
for file in *; do
    if [ -d "$file" ]; then
        echo "$file is a directory"
        cd "$file"
        if [ -f .gitignore ]; then
            echo ".gitignore already exists"
        else
            echo ".gitignore does not exist"
            touch .gitignore
            echo ".gitignore created"
            echo ".gitignore" >> .gitignore
            echo ".gitignore added to .gitignore"
        fi
        cd ..
    fi
done
echo "Done"

#Add extra lines to customise your gitignore to how you seem fit