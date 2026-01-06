#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Default values
MAP_VISIONOS=false

# Function to display usage information
show_usage() {
    echo
    echo "This script finds all supported platforms in Package.swift."

    echo
    echo "Usage: $0 [OPTIONS]"
    echo "  -h, --help                    Show this help message"
    echo "  -xros, --map-visionos-to-xros Map visionOS to xrOS in output"

    echo
    echo "Examples:"
    echo "  $0"
    echo "  $0 --map-visionos-to-xros"
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

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_usage; exit 0 ;;
        -xros|--map-visionos-to-xros)
            MAP_VISIONOS=true ;;
        -*)
            show_error_and_exit "Unknown option $1" ;;
        *)
            show_error_and_exit "Unexpected argument '$1'" ;;
    esac
    shift
done

# Check that a Package.swift file exists
if [ ! -f "Package.swift" ]; then
    show_error_and_exit "Package.swift not found in current directory"
fi

# Extract platforms array and parse platform names
# Matches patterns like: .iOS(.v15), .macOS(.v12), .tvOS(.v15), etc.
if [ "$MAP_VISIONOS" = true ]; then
    if ! platforms=$(grep -A 20 "platforms:" "Package.swift" | \
        grep -oE '\.(iOS|macOS|tvOS|watchOS|visionOS|macCatalyst)' | \
        sed 's/^\.//' | \
        sed 's/visionOS/xrOS/' | \
        sort -u); then
        show_error_and_exit "Could not extract platforms from Package.swift"
    fi
else
    if ! platforms=$(grep -A 20 "platforms:" "Package.swift" | \
        grep -oE '\.(iOS|macOS|tvOS|watchOS|visionOS|macCatalyst)' | \
        sed 's/^\.//' | \
        sort -u); then
        show_error_and_exit "Could not extract platforms from Package.swift"
    fi
fi

if [ -z "$platforms" ]; then
    show_error_and_exit "No platforms found in Package.swift"
fi

# Output the platforms, one per line
echo "$platforms"
