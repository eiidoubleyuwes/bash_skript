#This simple script deletes the file passed as an argument
#if the file exists
#if the file does not exist, it prints an error message

#!/bin/bash
if [ -f $1 ]; then
rm $1
else
echo "File $1 does not exist"
fi
