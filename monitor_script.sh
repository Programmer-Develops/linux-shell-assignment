#!/bin/bash
# ==============================================
# Script Name: monitor_script.sh
# Author: Shantanu Pandya
# Description: Logs CPU and Memory usage to a file with timestamps.
# ==============================================

LOG_FILE="$HOME/system_monitor.log"

# Get current date for the log entry
NOW=$(date '+%Y-%m-%d %H:%M:%S')

# CPU Usage - Extracts the load average for the last 1 minute
CPU_LOAD=$(top -bn1 | grep "load average" | awk '{print $(NF-2)}' | sed 's/,//')

# Memory Usage - Extracts available free memory in MB
MEM_FREE=$(free -m | grep "Mem:" | awk '{print $7}')

# EXPLANATION:
# We append (>>) the data to the log file instead of overwriting (>) it.
echo "[$NOW] CPU Load (1min): $CPU_LOAD | Free Memory: ${MEM_FREE}MB" >> "$LOG_FILE"

echo "System metrics logged to $LOG_FILE"
