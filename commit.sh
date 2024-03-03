#This script is just supposed to let me enter a commit message after which it should push to the remote repository
#!/bin/bash
echo "Enter the commit message(Header)"
echo "Enter brief decription of the changes"
read commit_message
read description
git add .
git commit -a -m "$commit_message, $description"
git push
echo "Done pushing,focus on more features"
