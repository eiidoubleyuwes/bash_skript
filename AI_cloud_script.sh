#This script is to install AI models based on a git hub repository below.
#The repository link is as follows https://github.com/jmorganca/ollama


#!/bin/bash
#change to sudo
sudo -i
#Update the system
apt-get update 
#or for yum use 
yum update

#Install the script
curl https://ollama.ai/install.sh | sh

#Run the models
ollama run --model=gpt-3.5-turbo --prompt="What is the capital of France?" #Example 1

# ollama run llama2 - Example 2 
ollama run llama2 --prompt="What is the capital of Nairobi?" #Example 2

#To choose the output
ollama run llama2 --prompt="What is the recipie for chicken?" --output=text #Example 3

