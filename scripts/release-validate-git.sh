#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display usage information
show_usage() {
    echo
    echo "This script validates the git repository for release."

    echo
    echo "Usage: $0 [-b|--branch <BRANCH>]"
    echo "  -b, --branch          Optional. The branch to validate (auto-detects default branch if not specified)"

    echo
    echo "This script will:"
    echo "  * Validate that the script is run within a git repository"
    echo "  * Validate that the current git branch matches the specified one"
    echo "  * Validate that the git repository doesn't have any uncommitted changes"

    echo
    echo "Examples:"
    echo "  $0"
    echo "  $0 -b main"
    echo "  $0 --branch develop"
    echo
}

# Function to display error message, show usage, and exit
show_usage_error_and_exit() {
    echo
    local error_message="$1"
    echo "Error: $error_message"
    show_usage
    exit 1
}

# Function to display error message, and exit
show_error_and_exit() {
    echo
    local error_message="$1"
    echo "Error: $error_message"
    echo
    exit 1
}

# Define argument variables
BRANCH=""  # Will be set to default after parsing

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -b|--branch)
            shift
            if [[ $# -eq 0 || "$1" =~ ^- ]]; then
                show_usage_error_and_exit "--branch requires a branch name"
            fi
            BRANCH="$1"
            shift
            ;;
        -h|--help)
            show_usage; exit 0 ;;
        *)
            show_usage_error_and_exit "Unknown option or argument: $1" ;;
    esac
done

# If no BRANCH was provided, try to get the default branch name
if [ -z "$BRANCH" ]; then
    FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    SCRIPT_DEFAULT_BRANCH="$FOLDER/git-default-branch.sh"

    if [ ! -f "$SCRIPT_DEFAULT_BRANCH" ]; then
        show_error_and_exit "Script not found: $SCRIPT_DEFAULT_BRANCH"
    fi

    if ! BRANCH=$("$SCRIPT_DEFAULT_BRANCH"); then
        show_error_and_exit "Failed to get default branch"
    fi
fi

# Start script
echo
echo "Validating git repository for branch '$BRANCH'..."

# Check if the current directory is a Git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    show_error_and_exit "Not a Git repository"
fi

# Verify that we're on the correct branch
if ! current_branch=$(git rev-parse --abbrev-ref HEAD); then
    show_error_and_exit "Failed to get current branch name"
fi

if [ "$current_branch" != "$BRANCH" ]; then
    show_error_and_exit "Not on the specified branch. Current branch is '$current_branch', expected '$BRANCH'"
fi

# Check for uncommitted changes
if [ -n "$(git status --porcelain)" ]; then
    show_error_and_exit "Git repository is dirty. There are uncommitted changes"
fi

# Complete successfully
echo
echo "Git repository validated successfully!"
echo
