#!/bin/bash

# Function to rename directories to lowercase
rename_to_lowercase() {
  find "$1" -depth -type d -exec sh -c 'mv "$1" "${1%/*}/$(echo "${1##*/}" | tr "[:upper:]" "[:lower:]")"' _ {} \;
}

# Specify the root directory you want to start from
root_directory="./blockchains"

# Check if the specified directory exists and is a directory
if [ -d "$root_directory" ]; then
  rename_to_lowercase "$root_directory"
  echo "All directories and sub-directories renamed to lowercase."
else
  echo "The specified directory '$root_directory' does not exist or is not a directory."
  exit 1  # Exit with an error code
fi
