#!/bin/bash

# Function to display usage information
show_usage() {
    echo
    echo "This script outputs the default git branch name."

    echo
    echo "Usage: $0 [OPTIONS]"
    echo "  -f, --fallback       Optional fallback branch name if detection fails (default: main)"
    echo "  -h, --help           Show this help message"

    echo
    echo "Examples:"
    echo "  $0"
    echo "  $0 -f main"
    echo "  $0 --fallback develop"
    echo
}

# Function to display error message, show usage, and exit
show_error_and_exit() {
    echo
    local error_message="$1"
    echo "Error: $error_message"
    show_usage
    exit 1
}

# Define argument variables
FALLBACK="main"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--fallback)
            shift
            if [[ $# -eq 0 || "$1" =~ ^- ]]; then
                show_error_and_exit "--fallback requires a branch name"
            fi
            FALLBACK="$1"
            shift
            ;;
        -h|--help)
            show_usage; exit 0 ;;
        -*)
            show_error_and_exit "Unknown option $1" ;;
        *)
            show_error_and_exit "Unexpected argument '$1'" ;;
    esac
done

# Try to get the default git branch name from symbolic ref
BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@' || echo "")
if [ -n "$BRANCH" ]; then
    echo $BRANCH
    exit 0
fi

# If that fails, query the remote for the default branch
BRANCH=$(git remote show origin 2>/dev/null | grep 'HEAD branch' | cut -d' ' -f5 || echo "")
if [ -n "$BRANCH" ]; then
    echo $BRANCH
    exit 0
fi

# If all methods fail, use fallback
echo $FALLBACK
