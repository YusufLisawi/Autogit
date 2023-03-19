#!/bin/bash 

usage() {
    echo "Usage: autogit.sh [-c | --commitonly] [-p | --pushonly] [-cp | --commitpush] [-b | --branch BRANCH_NAME] [-m | --message COMMIT_MESSAGE] [-h | --help] [--]"
    echo ""
    echo "  -c, --commitonly  Only add and commit changes, but do not push"
    echo "  -p, --pushonly    Only push changes, but do not add or commit"
    echo "  -cp, --commitpush Add, commit, and push changes"
    echo "  -b, --branch      Specify the branch to push changes to"
    echo "  -m, --message     Custom commit message"
    echo "  -h, --help        Display this help and exit"
    echo "  --                This option can be used to delimit the end of the options"
    exit 1
}

# default commit message
commit_message="Updates"

# default branch to push changes to
branch_name="main"

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
        -cp|--commitpush)
            commit_push=true
            shift
            ;;
        -b|--branch)
            if [[ -z $2 || $2 == -* ]]; then
                echo "Error: Missing branch name argument" >&2
                exit 1
            fi
            branch_name="$2"
            shift 2
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
elif [ "$commit_push" = true ]; then
    git add .
    git commit -m "$commit_message"
    git push --set-upstream origin "$branch_name"
    echo "Changes have been committed and pushed to $branch_name"
else
    read -p "Do you want to commit and push automatically? (y/n): " answer
    if [[ $answer == "y" || $answer == "Y" ]]; then
        git add .
        git commit -m "$commit_message"
        git push origin "$branch_name"
    fi
fi
