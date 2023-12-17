#Changes permissions for all files in the folder to executable

#! /bin/bash
for file in *
do
    if [[ -x $file ]]
    then
        echo "$file is executable"
    else
        echo "$file is not executable"
        if [[ $file == *.sh ]]
        then
            echo "Adding permissions to $file"
            chmod +x $file
            echo "Permissions changed"
        else
            echo "Skipping $file"
            continue
        fi
        echo "Done executing"
    fi
done