#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display usage information
show_usage() {
    echo
    echo "This script generates Swift code from a string catalog file."

    echo
    echo "Usage:"
    echo "  $0 --from <CATALOG_PATH> --to <OUTPUT_PATH> [--root <ROOT_NAMESPACE>]"
    echo "  $0 --package <PACKAGE_PATH> --catalog <CATALOG_PATH> --target <TARGET_PATH> [--root <ROOT_NAMESPACE>]"

    echo
    echo "Options:"
    echo "  --from          Command-relative path to a source string catalog"
    echo "  --to            Command-relative path to a target output file"
    echo "  --package       Command-relative path to a Swift Package"
    echo "  --catalog       Package-relative path to the string catalog"
    echo "  --target        Package-relative path to the target output file"
    echo "  --root          The root namespace of the key hierarchy, by default l10n."
    echo "  -h, --help      Show this help message"

    echo
    echo "Examples:"
    echo "  $0 --from Resources/Localizable.xcstrings --to Sources/Generated/L10n.swift"
    echo "  $0 --package Sources/MyPackage/ --catalog Resources/Localizable.xcstrings --target Generated/L10n.swift --root myPackageName"

    echo
    echo "Important:"
    echo "  This script calls out to the Swift-based CLI tools/StringCatalogKeyBuilder."
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

# Function to get absolute path
get_absolute_path() {
    local path="$1"
    if [[ "$path" = /* ]]; then
        # Already absolute
        echo "$path"
    else
        # Make it absolute relative to current directory
        echo "$(pwd)/$path"
    fi
}

# Define argument variables
FROM=""
TO=""
PACKAGE=""
CATALOG=""
TARGET=""
ROOT=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_usage; exit 0 ;;
        --from)
            FROM="$2"; shift 2 ;;
        --to)
            TO="$2"; shift 2 ;;
        --package)
            PACKAGE="$2"; shift 2 ;;
        --catalog)
            CATALOG="$2"; shift 2 ;;
        --target)
            TARGET="$2"; shift 2 ;;
        --root)
            ROOT="$2"; shift 2 ;;
        -*)
            show_error_and_exit "Unknown option $1" ;;
        *)
            show_error_and_exit "Unexpected argument '$1'" ;;
    esac
done

# Validate arguments
if [ -n "$FROM" ] || [ -n "$TO" ]; then

    # Using --from/--to mode
    if [ -z "$FROM" ]; then
        show_error_and_exit "--from is required when using --from/--to mode"
    fi
    if [ -z "$TO" ]; then
        show_error_and_exit "--to is required when using --from/--to mode"
    fi
    if [ -n "$PACKAGE" ] || [ -n "$CATALOG" ] || [ -n "$TARGET" ]; then
        show_error_and_exit "Cannot mix --from/--to with --package/--catalog/--target"
    fi

    # Verify source file exists
    if [ ! -f "$FROM" ]; then
        show_error_and_exit "Source catalog '$FROM' does not exist"
    fi

    # Remove target file
    if [ -f "$TO" ]; then
        rm "$TO"
    fi

    # Convert to absolute paths
    FROM_ABS=$(get_absolute_path "$FROM")
    TO_ABS=$(get_absolute_path "$TO")

    # Build arguments
    ARGS="--from \"$FROM_ABS\" --to \"$TO_ABS\""

    # Add root namespace if specified
    if [ -n "$ROOT" ]; then
        ARGS="$ARGS --root \"$ROOT\""
    fi

elif [ -n "$PACKAGE" ] || [ -n "$CATALOG" ] || [ -n "$TARGET" ]; then
    # Using --package/--catalog/--target mode
    if [ -z "$PACKAGE" ]; then
        show_error_and_exit "--package is required when using --package/--catalog/--target mode"
    fi
    if [ -z "$CATALOG" ]; then
        show_error_and_exit "--catalog is required when using --package/--catalog/--target mode"
    fi
    if [ -z "$TARGET" ]; then
        show_error_and_exit "--target is required when using --package/--catalog/--target mode"
    fi

    # Verify package directory exists
    if [ ! -d "$PACKAGE" ]; then
        show_error_and_exit "Package directory '$PACKAGE' does not exist"
    fi

    # Remove target file
    if [ -f "$PACKAGE/$TARGET" ]; then
        rm "$PACKAGE/$TARGET"
    fi

    # Convert package to absolute path (catalog and target remain relative to package)
    PACKAGE_ABS=$(get_absolute_path "$PACKAGE")

    # Build arguments
    ARGS="--package \"$PACKAGE_ABS/\" --catalog \"$CATALOG\" --target \"$TARGET\""

    # Add root namespace if specified
    if [ -n "$ROOT" ]; then
        ARGS="$ARGS --root \"$ROOT\""
    fi

else
    show_error_and_exit "Either --from/--to or --package/--catalog/--target must be provided"
fi

# Define the tool directory
TOOL_DIR="scripts/tools/StringCatalogKeyBuilder"

# Verify tool directory exists
if [ ! -d "$TOOL_DIR" ]; then
    show_error_and_exit "Tool directory '$TOOL_DIR' does not exist"
fi

# Start script
echo
echo "Generating localization code..."

# Clean build cache and execute command
echo "Cleaning build cache..."
(cd "$TOOL_DIR" && swift package clean)

echo "Running: swift run l10n-gen $ARGS"
(cd "$TOOL_DIR" && eval "swift run l10n-gen $ARGS")

# Complete successfully
echo "Code generation completed successfully!"
echo