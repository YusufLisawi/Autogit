# Autogit

This script provides a simple and convenient way to add, commit, and push changes to a Git repository. The script includes the following options:

    -c or --commitonly: Only add and commit changes, but do not push.
    -p or --pushonly: Only push changes, but do not add or commit.
    -cp or --commitpush: Add, commit, and push changes.
    -m or --message: Use a custom commit message. By default, the commit message is "Automated commit".
    -h or --help: Display help information.

## Usage

To use this script, simply run the script file in the terminal, followed by the desired options.

	autogit.sh [-c | --commitonly] [-p | --pushonly] [-cp | --commitpush] [-m | --message COMMIT_MESSAGE] [-h | --help] [--]

## Options

**-c or --commitonly**: Only add and commit changes, but do not push.

    ./autogit.sh -c

**-p or --pushonly**: Only push changes, but do not add or commit.

    ./autogit.sh -p

**-cp or --commitpush**: Add, commit, and push changes.

    ./autogit.sh -cp

**-m or --message**: Use a custom commit message. By default, the commit message is "Automated commit".


    ./autogit.sh -m "Commit message"

**-h or --help**: Display help information.


    ./autogit.sh -h

### Notes

- If the current directory is not a Git repository, the script will prompt you to initialize a new repository.
- If you choose to commit and push automatically, the script will add, commit, and push changes to the remote repository.
***By default, the script pushes changes to the master branch of the remote repository.***
- If you want to push changes to a different branch, you will need to modify the script accordingly.

## How to use

1. Copy the autogit.sh file to the directory where you want to use it.
2. Open a terminal and navigate to the directory where you copied the autogit.sh file.
3. Run the script by typing ./autogit.sh followed by the desired options.

To use the script from anywhere on your computer, you can add the directory where you saved the script to your system's PATH. Here's how to do it:

Open your terminal and enter the following command to open your shell's configuration file:

    nano ~/.bashrc
or

    nano ~/.zshrc

Add the following line at the end of the file:

    export PATH=$PATH:/path/to/the/directory/containing/autogit.sh

**Replace /path/to/the/directory/containing/autogit.sh with the actual path to the directory where you saved the autogit.sh file.**

Save the changes and exit the editor by pressing **Ctrl + X**, then **Y**, then Enter.

To apply the changes, run the following command in your terminal:

    source ~/.bashrc
or

    source ~/.zshrc

*Now you can run the autogit.sh script from anywhere on your computer by typing autogit.sh followed by the desired options.*