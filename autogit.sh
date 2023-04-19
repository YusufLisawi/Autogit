#!/bin/bash

usage() {
    echo "Usage: autogit.sh [-c | --commitonly] [-p | --pushonly] [-cp | --commitpush] [-b | --branch BRANCH_NAME] [-m | --message COMMIT_MESSAGE] [-h | --help] [--]"
    echo ""
    echo "  -c, --commitonly  Only add and commit changes, but do not push"
    echo "  -p, --pushonly    Only push changes, but do not add or commit"
    echo "  -cp, --commitpush Add, commit, and push changes"
    echo "  -b, --branch      Specify the branch to push changes to (default: current branch)"
    echo "  -m, --message     Custom commit message (default: Updates)"
    echo "  -h, --help        Display this help and exit"
    echo "  --                This option can be used to delimit the end of the options"
    exit 1
}

# Parse command line arguments
commit=false
push=false
branch_name=$(git rev-parse --abbrev-ref HEAD)
while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -c|--commitonly)
        commit=true
        shift # past argument
        ;;
        -p|--pushonly)
        push=true
        shift # past argument
        ;;
        -cp|--commitpush)
        commit=true
        push=true
        shift # past argument
        ;;
        -b|--branch)
        branch_name="$2"
        shift # past argument
        shift # past value
        ;;
        -m|--message)
        commit_message="$2"
        shift # past argument
        shift # past value
        ;;
        -h|--help)
        usage
        ;;
        --)
        shift # past argument
        break
        ;;
        *)
        echo "Unknown option: $1"
        usage
        ;;
    esac
done

# Add and commit changes
if [ "$commit" = true ]; then
    git add .
    git commit -m "$commit_message"
fi

# Push changes
if [ "$push" = true ]; then
    git push origin "$branch_name"
fi

