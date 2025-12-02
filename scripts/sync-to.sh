#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display usage information
show_usage() {
    echo
    echo "This script syncs Swift Package Scripts to a <TARGET_FOLDER>."

    echo
    echo "Usage: $0 <TARGET_FOLDER>"
    echo "  <TARGET_FOLDER>       Required. The full path to a Swift Package root"

    echo
    echo "The script will replace any existing 'scripts' folder."

    echo
    echo "Examples:"
    echo "  $0 ../MyPackage"
    echo "  $0 /path/to/MyPackage"
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
TARGET=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_usage; exit 0 ;;
        -*)
            show_error_and_exit "Unknown option $1" ;;
        *)
            if [ -z "$TARGET" ]; then
                TARGET="$1"
            else
                show_error_and_exit "Unexpected argument '$1'"
            fi
            shift
            ;;
    esac
done

# Verify TARGET was provided
if [ -z "$TARGET" ]; then
    echo ""
    read -p "Please enter the target folder path: " TARGET
    if [ -z "$TARGET" ]; then
        show_error_and_exit "TARGET_FOLDER is required"
    fi
fi

# Define variables
FOLDER="scripts/"
TARGET_FOLDER="$TARGET/$FOLDER"

# Verify source folder exists
if [ ! -d "$FOLDER" ]; then
    show_error_and_exit "Source folder '$FOLDER' does not exist"
fi

# Verify target directory exists
if [ ! -d "$TARGET" ]; then
    show_error_and_exit "Target directory '$TARGET' does not exist"
fi

# Start script
echo
echo "Syncing scripts to $TARGET_FOLDER..."

# Remove existing folder if it exists
if [ -d "$TARGET_FOLDER" ]; then
    echo "Removing existing scripts folder in target..."
    rm -rf "$TARGET_FOLDER"
fi

# Copy folder
echo "Copying scripts to target..."
if ! cp -r "$FOLDER" "$TARGET_FOLDER"; then
    show_error_and_exit "Failed to copy scripts to $TARGET_FOLDER"
fi

# Complete successfully
echo
echo "Script syncing to $TARGET_FOLDER completed successfully!"
echo
