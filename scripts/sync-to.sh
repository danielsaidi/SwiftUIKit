#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display usage information
show_usage() {
    echo
    echo "This script syncs Swift Package Scripts to a <TARGET_FOLDER>."

    echo
    echo "Usage: $0 <TARGET_FOLDER> [-ghw|--github-workflows <BRANCH>]"
    echo "  <TARGET_FOLDER>             Required. The full path to a Swift Package root"
    echo "  -ghw, --github-workflows    Optional. Sync .github/workflows (1) or skip it (0) (default: 0)"

    echo
    echo "The script will replace any existing 'scripts' and '.github/workflows/' folders."

    echo
    echo "Examples:"
    echo "  $0 ../MyPackage"
    echo "  $0 ../MyPackage --github-workflows 1"
    echo "  $0 /path/to/MyPackage -ghw 1"
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
GITHUB_WORKFLOWS=0

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_usage; exit 0 ;;
        -ghw|--github-workflows)
            if [[ -n "$2" && "$2" =~ ^[01]$ ]]; then
                GITHUB_WORKFLOWS="$2"
                shift 2
            else
                show_error_and_exit "Option $1 requires argument: 0 or 1"
            fi
            ;;
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

# Sync GitHub workflows if requested
if [ "$GITHUB_WORKFLOWS" -eq 1 ]; then
    GITHUB_SOURCE=".github/workflows"
    GITHUB_TARGET_BASE="$TARGET/.github"
    GITHUB_TARGET="$GITHUB_TARGET_BASE/workflows"
    
    if [ ! -d "$GITHUB_SOURCE" ]; then
        show_error_and_exit "Source folder '$GITHUB_SOURCE' does not exist"
    fi
    
    echo "Syncing GitHub workflows to $GITHUB_TARGET..."
    
    # Create .github directory if it doesn't exist
    if [ ! -d "$GITHUB_TARGET_BASE" ]; then
        echo "Creating .github directory..."
        mkdir -p "$GITHUB_TARGET_BASE"
    fi
    
    # Remove existing workflows folder if it exists
    if [ -d "$GITHUB_TARGET" ]; then
        echo "Removing existing workflows folder in target..."
        rm -rf "$GITHUB_TARGET"
    fi
    
    # Copy workflows folder
    echo "Copying workflows to target..."
    if ! cp -r "$GITHUB_SOURCE" "$GITHUB_TARGET"; then
        show_error_and_exit "Failed to copy workflows to $GITHUB_TARGET"
    fi
fi

# Complete successfully
echo
echo "Script syncing to $TARGET_FOLDER completed successfully!"
echo