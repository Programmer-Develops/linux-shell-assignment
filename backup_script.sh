#!/bin/bash
# ==============================================
# Script Name: backup_script.sh
# Author: Shantanu Pandya
# Date: 9/11/2025
# Description: Backs up a specified directory to a backup location with a timestamp.
# ==============================================

# Variables
SOURCE_DIR="$HOME/Documents/AssignmentData"  # Directory to backup
BACKUP_DIR="$HOME/Backups"                   # Destination for backups
DATE_STAMP=$(date +%Y-%m-%d_%H-%M-%S)        # Current date and time
BACKUP_FILENAME="backup_$DATE_STAMP.tar.gz"  # Final filename

# Ensure backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory does not exist. Creating it now..."
    mkdir -p "$BACKUP_DIR"
fi

# EXPLANATION:
# We use 'tar' to compress the directory.
# -c = create new archive, -z = compress with gzip, -f = filename
echo "Starting backup of $SOURCE_DIR..."

if tar -czf "$BACKUP_DIR/$BACKUP_FILENAME" "$SOURCE_DIR" 2>/dev/null; then
    echo "Backup successfully created at $BACKUP_DIR/$BACKUP_FILENAME"
else
    echo "Error: Backup failed. Please check if source directory exists."
fi
