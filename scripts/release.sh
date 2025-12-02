#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display usage information
show_usage() {
    echo
    echo "This script creates a new release for the provided <TARGET>."

    echo
    echo "Usage: $0 [TARGET] [-b|--branch <BRANCH>] [-p|--platforms <PLATFORM1> <PLATFORM2> ...]"
    echo "  [TARGET]              Optional. The target to release (defaults to package name)"
    echo "  -b, --branch          Optional. The branch to validate (auto-detects default branch if not specified)"
    echo "  -p, --platforms       Optional. List of platforms (default: iOS macOS tvOS watchOS xrOS)"

    echo
    echo "This script will:"
    echo "  * Call release-validate-git.sh to validate the git repository for release."
    echo "  * Call release-validate-package.sh to run unit tests, swiftlint, etc."
    echo "  * Call version-bump.sh if all validation steps above passed"

    echo
    echo "Examples:"
    echo "  $0"
    echo "  $0 MyTarget"
    echo "  $0 -b main"
    echo "  $0 MyTarget -b develop"
    echo "  $0 MyTarget -b main -p iOS macOS"
    echo "  $0 MyTarget --branch main --platforms iOS macOS tvOS watchOS xrOS"
    echo
}

echo

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
TARGET=""
BRANCH=""
PLATFORMS="iOS macOS tvOS watchOS xrOS"  # Default platforms

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
        -p|--platforms)
            shift  # Remove --platforms from arguments
            PLATFORMS=""  # Clear default platforms

            # Collect all platform arguments until we hit another flag or run out of args
            while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do
                PLATFORMS="$PLATFORMS $1"
                shift
            done

            # Remove leading space and check if we got any platforms
            PLATFORMS=$(echo "$PLATFORMS" | sed 's/^ *//')
            if [ -z "$PLATFORMS" ]; then
                show_usage_error_and_exit "--platforms requires at least one platform"
            fi
            ;;
        -h|--help)
            show_usage; exit 0 ;;
        -*)
            show_usage_error_and_exit "Unknown option $1" ;;
        *)
            if [ -z "$TARGET" ]; then
                TARGET="$1"
            else
                show_usage_error_and_exit "Unexpected argument '$1'"
            fi
            shift
            ;;
    esac
done

# If no TARGET was provided, try to get package name
if [ -z "$TARGET" ]; then
    FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    SCRIPT_PACKAGE_NAME="$FOLDER/package-name.sh"

    if [ ! -f "$SCRIPT_PACKAGE_NAME" ]; then
        show_error_and_exit "Script not found: $SCRIPT_PACKAGE_NAME"
    fi

    if ! TARGET=$("$SCRIPT_PACKAGE_NAME"); then
        show_error_and_exit "Failed to get package name"
    fi
fi

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

# Use the script folder to refer to other scripts
FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPT_VALIDATE_GIT="$FOLDER/release-validate-git.sh"
SCRIPT_VALIDATE_PACKAGE="$FOLDER/release-validate-package.sh"
SCRIPT_VERSION_BUMP="$FOLDER/version-bump.sh"

# A function that runs a certain script and checks for errors
run_script() {
    local script="$1"
    shift  # Remove the first argument (script path) from the argument list

    if [ ! -f "$script" ]; then
        show_error_and_exit "Script not found: $script"
    fi

    chmod +x "$script"
    if ! "$script" "$@"; then
        exit 1
    fi
}

# Start script
echo
echo "Creating a new release for $TARGET on the $BRANCH branch with platforms [$PLATFORMS]..."

# Validate git
run_script "$SCRIPT_VALIDATE_GIT" -b "$BRANCH"

# Validate project
echo "Validating package..."
run_script "$SCRIPT_VALIDATE_PACKAGE" "$TARGET" -p $PLATFORMS

# Bump version
echo "Bumping version..."
run_script "$SCRIPT_VERSION_BUMP"

# Complete successfully
echo
echo "Release created successfully!"
echo
