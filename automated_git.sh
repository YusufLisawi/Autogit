#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <commit-message>"
    exit 1
fi

message="$1"

# check if the current directory is a Git repository
if [ ! -d ".git" ]; then
    # if not, initialize a new repository
    git init
    read -p "Enter the URL of the remote repository: " remote_url
    git remote add origin "$remote_url"
fi

# add all changes to the index
git add .

# commit changes with the given message
git commit -m "$message"

# push changes to the remote repository
git push origin master
