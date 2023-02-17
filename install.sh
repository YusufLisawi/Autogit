#!/bin/bash

# Delete and reinstall Autogit from Github repo
rm -rf ~/.autogit
git clone --depth=1 https://github.com/YusufLisawi/Autogit $HOME/.autogit

# Add Autogit to path
echo "export PATH=\$HOME/.autogit/bin:\$PATH" >> ~/.zshrc
# Set Autogit temporary folders
export AUTOGIT_CACHE=/tmp/\$USER/autogit/Caches
export AUTOGIT_TEMP=/tmp/\$USER/autogit/Temp

# Set the executable bit on the script file
/bin/chmod +x ~/.autogit/.autogit.sh

# Add the autogit source line to the appropriate shell startup file
if [[ "$SHELL" == "/bin/bash" ]]; then
    echo "source \$HOME/.autogit/.autogit.sh" >> ~/.bashrc
else
    echo "source \$HOME/.autogit/.autogit.sh" >> ~/.zshrc
fi

# Print a success message
echo "The autogit command has been installed and added to the system's path."
echo "Run \e[1;32mautogit -help or -h \033[0m for more info."
