#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display usage information
show_usage() {
    echo
    echo "This script syncs Swift Package Scripts from a <SOURCE_FOLDER>."

    echo
    echo "Usage: $0 <SOURCE_FOLDER> [-ghw|--github-workflows <BRANCH>]"
    echo "  <SOURCE_FOLDER>             Required. The full path to a Swift Package Scripts root"
    echo "  -ghw, --github-workflows    Optional. Sync .github/workflows (1) or skip it (0) (default: 0)"
    
    echo
    echo "The script will replace any existing 'scripts' and '.github/workflows/' folders."
    
    echo
    echo "Examples:"
    echo "  $0 ../SwiftPackageScripts"
    echo "  $0 ../SwiftPackageScripts --github-workflows 1"
    echo "  $0 /path/to/SwiftPackageScripts -ghw 1"
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
SOURCE=""
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
            if [ -z "$SOURCE" ]; then
                SOURCE="$1"
            else
                show_error_and_exit "Unexpected argument '$1'"
            fi
            shift
            ;;
    esac
done

# Verify SOURCE was provided
if [ -z "$SOURCE" ]; then
    echo ""
    read -p "Please enter the source folder path: " SOURCE
    if [ -z "$SOURCE" ]; then
        show_error_and_exit "SOURCE_FOLDER is required"
    fi
fi

# Verify source directory exists
if [ ! -d "$SOURCE" ]; then
    show_error_and_exit "Source directory '$SOURCE' does not exist"
fi

# Verify source has scripts folder
if [ ! -d "$SOURCE/scripts" ]; then
    show_error_and_exit "Source folder '$SOURCE/scripts' does not exist"
fi

# Store current directory
CURRENT_DIR=$(pwd)

# Get absolute path of source
SOURCE_ABS=$(cd "$SOURCE" && pwd)

# Find sync-to.sh script (should be in current directory's scripts folder)
SYNC_TO_SCRIPT="$CURRENT_DIR/scripts/sync-to.sh"

if [ ! -f "$SYNC_TO_SCRIPT" ]; then
    show_error_and_exit "sync-to.sh script not found at '$SYNC_TO_SCRIPT'"
fi

# Build arguments for sync-to.sh
SYNC_TO_ARGS="$CURRENT_DIR"
if [ "$GITHUB_WORKFLOWS" -eq 1 ]; then
    SYNC_TO_ARGS="$SYNC_TO_ARGS --ghw 1"
fi

# Navigate to source directory and run sync-to.sh
echo
echo "Syncing scripts from $SOURCE_ABS..."
cd "$SOURCE_ABS"

# Run sync-to.sh
if ! bash "$SYNC_TO_SCRIPT" $SYNC_TO_ARGS; then
    cd "$CURRENT_DIR"
    show_error_and_exit "Failed to sync scripts"
fi

# Return to original directory
cd "$CURRENT_DIR"

# Complete successfully
echo
echo "Script syncing from $SOURCE_ABS completed successfully!"
echo