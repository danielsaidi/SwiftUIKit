#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Fail if any command in a pipeline fails
set -o pipefail

# Function to display usage information
show_usage() {
    echo
    echo "This script builds DocC for a <TARGET> and certain <PLATFORMS>."
    echo "Unlike the 'docc' script, this scripts combines DocC for all platform into a single output."

    echo
    echo "Usage: $0 [TARGET] [-p|--platforms <PLATFORM1> <PLATFORM2> ...] [--hosting-base-path <PATH>]"
    echo "  [TARGET]              Optional. The target to build documentation for (defaults to package name)"
    echo "  -p, --platforms       Optional. List of platforms (default: iOS macOS tvOS watchOS xrOS)"
    echo "  --hosting-base-path   Optional. Base path for static hosting (default: TARGET name, use empty string \"\" for root)"

    echo
    echo "The web transformed documentation ends up in .build/docc."

    echo
    echo "Examples:"
    echo "  $0"
    echo "  $0 MyTarget"
    echo "  $0 -p iOS macOS"
    echo "  $0 MyTarget -p iOS macOS"
    echo "  $0 MyTarget --platforms iOS macOS tvOS watchOS xrOS"
    echo "  $0 MyTarget --hosting-base-path \"\""
    echo "  $0 MyTarget --hosting-base-path \"custom/path\""
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
PLATFORMS="iOS macOS tvOS watchOS xrOS"  # Default platforms
HOSTING_BASE_PATH=""  # Will be set to TARGET if not specified

# Define paths
SYMBOL_GRAPHS_DIR=".build/symbol-graphs"
DOCC_OUTPUT_DIR=".build/docc"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
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
                show_error_and_exit "--platforms requires at least one platform"
            fi
            ;;
        --hosting-base-path)
            shift  # Remove --hosting-base-path from arguments
            if [[ $# -eq 0 ]]; then
                show_error_and_exit "--hosting-base-path requires a value (use \"\" for empty path)"
            fi
            HOSTING_BASE_PATH="$1"
            shift
            ;;
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

# Set default hosting base path if not specified
if [ -z "$HOSTING_BASE_PATH" ]; then
    HOSTING_BASE_PATH="$TARGET"
fi

# Define target lowercase for redirect script
TARGET_LOWERCASED=$(echo "$TARGET" | tr '[:upper:]' '[:lower:]')

# Prepare the package for DocC
swift package resolve;

# A function that builds $TARGET documentation for a specific platform
build_platform() {

    # Define a local $PLATFORM variable
    local PLATFORM=$1

    # Define the build folder name, based on the $PLATFORM
    case $PLATFORM in
        "iOS")
            DEBUG_PATH="Debug-iphoneos"
            ;;
        "macOS")
            DEBUG_PATH="Debug"
            ;;
        "tvOS")
            DEBUG_PATH="Debug-appletvos"
            ;;
        "watchOS")
            DEBUG_PATH="Debug-watchos"
            ;;
        "xrOS")
            DEBUG_PATH="Debug-xros"
            ;;
        *)
            echo "Error: Unsupported platform '$PLATFORM'"
            return 1
            ;;
    esac

    # Build $TARGET docs for the $PLATFORM
    echo "Building $TARGET docs for $PLATFORM..."
    if ! xcodebuild  \
        -scheme $TARGET \
        -derivedDataPath .build/.deriveddata \
        -destination "generic/platform=$PLATFORM" \
        OTHER_SWIFT_FLAGS="-emit-symbol-graph -emit-symbol-graph-dir $SYMBOL_GRAPHS_DIR/$PLATFORM"; then
        echo "Failed to build documentation for $PLATFORM"
        return 1
    fi
}

# Start script
echo
echo "Building $TARGET docs for [$PLATFORMS]..."
if [ -n "$HOSTING_BASE_PATH" ]; then
    echo "Hosting base path: '$HOSTING_BASE_PATH'"
else
    echo "Hosting base path: (empty - root level)"
fi

# Loop through all platforms and call the build function
for PLATFORM in $PLATFORMS; do
    if ! build_platform "$PLATFORM"; then
        exit 1
    fi
done

# Create a .doccarchive from the symbols.
$(xcrun --find docc) convert "Sources/$TARGET/$TARGET.docc" \
    --emit-lmdb-index \
    --fallback-display-name "$TARGET" \
    --fallback-bundle-identifier "$TARGET" \
    --fallback-bundle-version 0 \
    --output-dir "$DOCC_OUTPUT_DIR" \
    --additional-symbol-graph-dir "$SYMBOL_GRAPHS_DIR" \
    --hosting-base-path "$HOSTING_BASE_PATH"

# Inject a root redirect script on the root page
echo "<script>window.location.href += \"/documentation/$TARGET_LOWERCASED\"</script>" > $DOCC_OUTPUT_DIR/index.html;

# Complete successfully
echo
echo "Building $TARGET docs completed successfully!"
echo
