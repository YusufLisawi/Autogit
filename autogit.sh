#!/bin/bash

usage() {
    echo "Usage: $0 [-c | --commitonly] [-p | --pushonly] [-m | --message COMMIT_MESSAGE] [-h | --help] [--]"
    echo ""
    echo "  -c, --commitonly  Only add and commit changes, but do not push"
    echo "  -p, --pushonly    Only push changes, but do not add or commit"
    echo "  -m, --message     Custom commit message"
    echo "  -h, --help        Display this help and exit"
    echo "  --                This option can be used to delimit the end of the options"
    exit 1
}

# default commit message
commit_message="Automated commit"

# parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--commitonly)
            commit_only=true
            shift
            ;;
        -p|--pushonly)
            push_only=true
            shift
            ;;
        -m|--message)
            if [[ -z $2 || $2 == -* ]]; then
                echo "Error: Missing commit message argument" >&2
                exit 1
            fi
            commit_message="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Error: Invalid option: $1" >&2
            usage
            ;;
    esac
done

# check if the current directory is a git repository
if [ ! -d .git ]; then
    echo "This is not a git repository"
    read -p "Do you want to initialize a new repository? (y/n): " answer
    if [[ $answer == "y" || $answer == "Y" ]]; then
        git init
        read -p "Enter remote repository URL: " remote_url
        git remote add origin $remote_url
    else
        exit 1
    fi
fi

if [ "$commit_only" = true ]; then
    git add .
    git commit -m "$commit_message"
    echo "Changes have been committed but not pushed"
elif [ "$push_only" = true ]; then
    git push
    echo "Changes have been pushed but not committed"
else
    git add .
    git commit -m "$commit_message"
    git push
    echo "Changes have been committed and pushed"
fi
