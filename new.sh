#This script should create a new user and assign permissions to him
#!/bin/bash
echo "Creating a new user"
sleep 2
echo "Enter the username"
sleep 3
read newuser
sudo adduser $newuser
sudo usermod -aG sudo newuser
echo "Done, new user created"
#Change the passowrd for the new user
echo "Changing the password for the new user"
sudo passwd $newuser
echo "Done, password changed"
# Path: update.sh
# This simple script is supposed to update the system and clean unused packages