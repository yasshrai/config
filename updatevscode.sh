#!/bin/bash

# Check if the user provided an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path-to-vscode.tar.gz>"
    exit 1
fi

TAR_FILE="$1"

# Check if the file exists
if [ ! -f "$TAR_FILE" ]; then
    echo "Error: File '$TAR_FILE' does not exist."
    exit 1
fi

# Extract the tar.gz file
echo "Extracting $TAR_FILE..."
TEMP_DIR=$(mktemp -d)
tar -xzf "$TAR_FILE" -C "$TEMP_DIR"

# Get the name of the extracted folder
EXTRACTED_FOLDER=$(find "$TEMP_DIR" -mindepth 1 -maxdepth 1 -type d | head -n 1)

if [ -z "$EXTRACTED_FOLDER" ]; then
    echo "Error: Could not find extracted folder."
    exit 1
fi

# Rename the folder to vscode
RENAMED_FOLDER="$TEMP_DIR/vscode"
mv "$EXTRACTED_FOLDER" "$RENAMED_FOLDER"

# Remove existing vscode in /opt if exists
if [ -d "/opt/vscode" ]; then
    echo "Removing existing /opt/vscode..."
    sudo rm -rf /opt/vscode
fi

# Move the new vscode folder to /opt
echo "Moving vscode to /opt..."
sudo mv "$RENAMED_FOLDER" /opt/

echo "VSCode has been updated in /opt/vscode."

#chmod +x updatevscode.sh ; ./updatevscode.sh <path-to-vscode.tar.gz>