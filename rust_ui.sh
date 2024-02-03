#!/bin/bash

echo "Enter the name for a new project"
read input

cargo generate --git https://github.com/slint-ui/slint-rust-template --name $input


#To make this script available anywhere add the following line to your .bashrc file
#export PATH=$PATH:/path/to/your/script
#Replace /path/to/your/script with the path to your script
#Then you can run the script from anywhere by typing the script name in the terminal