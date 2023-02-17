#!/bin/bash

# Define the download URL and the installation directory
DOWNLOAD_URL="https://raw.githubusercontent.com/YusufLisawi/autogit/master/autogit.sh"
INSTALL_DIR="/usr/local/bin"

# Download the script using curl
curl -o "${INSTALL_DIR}/autogit" "${DOWNLOAD_URL}"
chmod +x "${INSTALL_DIR}/autogit"

# Add the installation directory to the system's PATH
if [ -z "$(grep "${INSTALL_DIR}" ~/.bashrc)" ]; then
  echo 'export PATH=$PATH:'"${INSTALL_DIR}" >> ~/.bashrc
fi

if [ -z "$(grep "${INSTALL_DIR}" ~/.zshrc)" ]; then
  echo 'export PATH=$PATH:'"${INSTALL_DIR}" >> ~/.zshrc
fi

# Print a message indicating success
echo "The autogit command has been installed and added to the system's path."
