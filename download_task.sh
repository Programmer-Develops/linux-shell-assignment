#!/bin/bash
# ==============================================
# Script Name: download_task.sh
# Author: Shantanu Pandya
# Description: Downloads a file from the internet to a specific directory.
# ==============================================

# Variables
# Using a sample test file from the internet for demonstration
FILE_URL="https://www.w3.org/TR/PNG/iso_8859-1.txt"
DEST_DIR="$HOME/Downloads/Automated"
OUTPUT_FILE="downloaded_standard.txt"

# Create destination if it doesn't exist
mkdir -p "$DEST_DIR"

echo "Starting download from $FILE_URL..."

# EXPLANATION:
# wget is used here. -O allows us to specify the output path and filename.
# -q makes it quiet (less output), --show-progress ensures we still see status.
wget -q --show-progress -O "$DEST_DIR/$OUTPUT_FILE" "$FILE_URL"

# Check if the file was downloaded successfully
if [ -f "$DEST_DIR/$OUTPUT_FILE" ]; then
    echo "Success: File saved to $DEST_DIR/$OUTPUT_FILE"
else
    echo "Error: Download failed."
fi
