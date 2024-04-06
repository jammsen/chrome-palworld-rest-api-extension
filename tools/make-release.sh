#!/usr/bin/env bash

########################################################################################
# Script to update version numbers in package.json and /public/manifest.json
# Adjust the Path of both files if you have to in the FILES Variable
# This script uses the jq bash tool under the hood, make shure to have this installed
#
# Usage: ./make-release [-major|-minor|-patch]
#
########################################################################################

# Function to update version number based on semantic versioning
update_version() {
    local version=$1 type=$2
    IFS='.' read -ra ADDR <<< "$version"
    case $type in
        -major)
            ((ADDR[0]++))
            ADDR[1]=0
            ADDR[2]=0
            ;;
        -minor)
            ((ADDR[1]++))
            ADDR[2]=0
            ;;
        -patch)
            ((ADDR[2]++))
            ;;
        *)
            echo "Invalid argument. Use -major, -minor, or -patch."
            exit 1
            ;;
    esac
    echo "${ADDR[0]}.${ADDR[1]}.${ADDR[2]}"
}

# Check for correct usage
if [ $# -ne 1 ]; then
    echo "Usage: $0 {-major|-minor|-patch}"
    exit 1
fi

# Files to update
FILES=("package.json" "./public/manifest.json")

for file in "${FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "Error: $file does not exist."
        exit 1
    fi

    # Get current version
    current_version=$(jq -r '.version' "$file")
    if [ -z "$current_version" ]; then
        echo "Error: Unable to read current version from $file."
        exit 1
    fi

    # Update version based on argument
    new_version=$(update_version "$current_version" "$1")
    
    # Update the file with the new version
    jq ".version = \"$new_version\"" "$file" > temp.$$.json && mv temp.$$.json "$file"
    
    echo "Updated $file to version $new_version."
done
