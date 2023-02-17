#!/bin/bash

/bin/rm -rf ~/.autogit.sh > /dev/null 2>&1

# Define the download URL and the installation directory
DOWNLOAD_URL="https://raw.githubusercontent.com/YusufLisawi/autogit/master/autogit.sh"

# Download the script using curl
curl -fsSL "${DOWNLOAD_URL}" > ~/.autogit.sh
chmod +x ~/.autogit.sh

# Add the installation directory to the system's PATH
if [ -z "$(grep ~/.bashrc)" ]; then
	echo "source ~/.autogit.sh" >> ~/.bashrc
fi

if [ -z "$(grep ~/.zshrc)" ]; then
  	echo "source ~/.autogit.sh" >> ~/.zshrc
fi

# Print a message indicating success
echo "The autogit command has been installed and added to the system's path."
echo "run \e[1;32m autogit -help or -h \033[0m for more info"