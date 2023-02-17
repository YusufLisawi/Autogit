#!/bin/bash

# Delete and reinstall Autogit from Github repo
rm -rf ~/.autogit

curl -fsSL https://raw.githubusercontent.com/YusufLisawi/Autogit/master/autogit.sh > ~/.autogit.sh
# Add Autogit to path
echo "export PATH=\$HOME/.autogit/bin:\$PATH" >> ~/.zshrc

# Set the executable bit on the script file
/bin/chmod +x ~/.autogit.sh

# Add the autogit source line to the appropriate shell startup file
if [[ "$SHELL" == "/bin/bash" ]]; then
    echo "source \$HOME/.autogit.sh" >> ~/.bashrc
else
    echo "source \$HOME/.autogit.sh" >> ~/.zshrc
fi

# Print a success message
echo "The autogit command has been installed and added to the system's path."
echo "Run \e[1;32mautogit -help or -h \033[0m for more info."
