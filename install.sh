#!/bin/bash

# Define the download URL and the installation directory
DOWNLOAD_URL="https://raw.githubusercontent.com/YusufLisawi/autogit/master/autogit.sh"
INSTALL_DIR="$HOME/autogit"

# Create the installation directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download the script using curl
curl -fsSL "${DOWNLOAD_URL}" > "$INSTALL_DIR/autogit.sh"

# Make the script executable
/bin/chmod +x "$INSTALL_DIR/autogit.sh"

# Add the installation directory to the system's PATH
echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$HOME/.bashrc"
echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$HOME/.zshrc"

# Print a message indicating success
echo "The autogit command has been installed and added to the system's path."
echo "Please restart your shell or run 'source ~/.bashrc' or 'source ~/.zshrc' to use the 'autogit' command."
