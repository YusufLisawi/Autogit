#!/bin/bash

# Delete and reinstall Autogit from Github repo
if [ -f ~/.autogit.sh ]; then
    /bin/rm -rf ~/.autogit.sh > /dev/null 2>&1
fi
rm -rf $HOME/.brew
git clone --depth=1 https://github.com/YusufLisawi/Autogit $HOME/.autogit

# Remove the autogit source line from the appropriate shell startup file
sed -i '/source \$HOME\/\.autogit\.sh/d' ~/.bashrc
sed -i '/source \$HOME\/\.autogit\.sh/d' ~/.zshrc

# Add brew to path
export PATH=\$HOME/.autogit/bin:\$PATH
# Set Autogit temporary folders
export AUTOGIT_CACHE=/tmp/\$USER/autogit/Caches
export AUTOGIT_TEMP=/tmp/\$USER/autogit/Temp

# Set the executable bit on the script file
chmod +x ~/.autogit/.autogit.sh

# Add the autogit source line to the appropriate shell startup file
if [[ "$SHELL" == "/bin/bash" ]]; then
    echo "source $HOME/.autogit.sh" >> ~/.bashrc
else
    echo "source $HOME/.autogit.sh" >> ~/.zshrc
fi

# Print a success message
echo "The autogit command has been installed and added to the system's path."
echo "Run \e[1;32mautogit -help or -h \033[0m for more info."
