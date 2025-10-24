#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display usage information
show_usage() {
    echo
    echo "This script bumps the project version number."

    echo
    echo "Usage: $0 [OPTIONS]"
    echo "  --no-semver          Disable semantic version validation"
    echo "  -h, --help           Show this help message"
    
    echo
    echo "Examples:"
    echo "  $0"
    echo "  $0 --no-semver"
    echo "  bash scripts/version_bump.sh"
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
VALIDATE_SEMVER=true

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --no-semver)
            VALIDATE_SEMVER=false
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

# Use the script folder to refer to other scripts
FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPT_VERSION_NUMBER="$FOLDER/version_number.sh"

# Check if version_number.sh exists
if [ ! -f "$SCRIPT_VERSION_NUMBER" ]; then
    show_error_and_exit "version_number.sh script not found at $SCRIPT_VERSION_NUMBER"
fi

# Function to validate semver format, including optional -rc.<INT> suffix
validate_semver() {
    if [ "$VALIDATE_SEMVER" = false ]; then
        return 0
    fi
    
    if [[ $1 =~ ^v?[0-9]+\.[0-9]+\.[0-9]+(-rc\.[0-9]+)?$ ]]; then
        return 0
    else
        return 1
    fi
}

# Start script
echo
echo "Bumping version number..."

# Get the latest version
echo "Getting current version..."
if ! VERSION=$($SCRIPT_VERSION_NUMBER); then
    echo "Failed to get the latest version"
    exit 1
fi

# Print the current version
echo "The current version is: $VERSION"

# Prompt user for new version
while true; do
    echo ""
    read -p "Enter the new version number: " NEW_VERSION

    # Validate the version number to ensure that it's a semver version
    if validate_semver "$NEW_VERSION"; then
        break
    else
        if [ "$VALIDATE_SEMVER" = true ]; then
            echo "Invalid version format. Please use semver format (e.g., 1.2.3, v1.2.3, 1.2.3-rc.1, etc.)."
            echo "Use --no-semver to disable validation."
        else
            break
        fi
    fi
done

# Push the current branch and create tag
echo "Pushing current branch..."
if ! git push -u origin HEAD; then
    echo "Failed to push current branch"
    exit 1
fi

echo "Creating and pushing tag $NEW_VERSION..."
if ! git tag $NEW_VERSION; then
    echo "Failed to create tag $NEW_VERSION"
    exit 1
fi

if ! git push --tags; then
    echo "Failed to push tags"
    exit 1
fi

# Complete successfully
echo
echo "Version tag $NEW_VERSION pushed successfully!"
echo