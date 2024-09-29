#!/bin/bash

# Configuration
LOG_FILE="/var/log/syslog"          # Path to your log file
MAX_SIZE=100000000                  # Maximum size in bytes (100 MB)
BACKUP_DIR="/var/log/myapp/backups" # Directory to store rotated logs
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")  # Timestamp for backup filename

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Function to rotate log files
rotate_logs() {
    if [ -f "$LOG_FILE" ]; then
        echo "Rotating log file: $LOG_FILE"
        mv "$LOG_FILE" "$BACKUP_DIR/myapp_$TIMESTAMP.log" # Rename the log file with a timestamp
        touch "$LOG_FILE"                                 # Create a new empty log file
        echo "Log file rotated and stored as $BACKUP_DIR/myapp_$TIMESTAMP.log"
    else
        echo "Log file $LOG_FILE does not exist."
    fi
}

# Check if the log file size exceeds the maximum size
if [ -f "$LOG_FILE" ]; then
    FILE_SIZE=$(stat -c%s "$LOG_FILE") # Get the size of the log file in bytes
    if [ "$FILE_SIZE" -gt "$MAX_SIZE" ]; then
        rotate_logs
    else
        echo "Log file size is under control: ${FILE_SIZE} bytes"
    fi
else
    echo "Log file does not exist. No action taken."
fi
