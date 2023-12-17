#Changes permissions for all files in the folder to executable

#! /bin/bash
for file in *
do
    if [[ -x $file ]]
    then
        echo "$file is executable"
    else
        echo "$file is not executable"
        chmod +x $file
        echo "Permissions changed"
    fi
done