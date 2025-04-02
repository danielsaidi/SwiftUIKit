#!/bin/bash

# Documentation:
# This script creates a new project version for the current project.
# You can customize this to fit your project when you copy these scripts.
# You can pass in a custom branch if you don't want to use the default one.

SCRIPT="scripts/package_version.sh"
chmod +x $SCRIPT
bash $SCRIPT
