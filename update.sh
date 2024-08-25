#This simple script is supposed to update the system and clean unused packages
#!/bin/bash
echo "Updating the system"
sleep 5
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt clean -y
sudo apt autoclean -y
sleep 6
echo "Done,Enjoy your updated system!"
