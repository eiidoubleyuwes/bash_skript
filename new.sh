#This script should create a new user and assign permissions to him
#!/bin/bash
echo "Creating a new user"
sudo adduser newuser
sudo usermod -aG sudo newuser
echo "Done, new user created"
# Path: update.sh
# This simple script is supposed to update the system and clean unused packages