#!/bin/bash

# Script to upload files using scp to /opt/stacks/ with same path structure
# Usage: ./upload_file.sh <filename_with_path>
# Example: ./upload_file.sh ./glance/config/glance.yml

# Check if a file path was provided
if [ $# -eq 0 ]; then
    echo "Error: No file path provided"
    echo "Usage: $0 <filename_with_path>"
    echo "Example: $0 ./glance/config/glance.yml"
    exit 1
fi

# Get the source file path
SOURCE_FILE="$1"

# Check if the source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file '$SOURCE_FILE' does not exist"
    exit 1
fi

# Construct the destination path: /opt/stacks/ + the original path
DEST_PATH="/opt/stacks/$SOURCE_FILE"

# Get the remote host (you can modify this as needed)
REMOTE_HOST="lab.son"
# REMOTE_USER=""

# Construct the full remote path
REMOTE_PATH="$REMOTE_HOST:$DEST_PATH"

echo "Uploading '$SOURCE_FILE' to '$REMOTE_PATH'..."

# Upload the file using scp
scp "$SOURCE_FILE" "$REMOTE_PATH"

# Check if the upload was successful
if [ $? -eq 0 ]; then
    echo "Successfully uploaded '$SOURCE_FILE' to '$REMOTE_PATH'"
else
    echo "Error: Failed to upload '$SOURCE_FILE'"
    exit 1
fi


