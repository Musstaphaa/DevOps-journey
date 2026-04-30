#!/bin/bash

# 1. Variables Definition

THRESHOLD=80
RAM_THRESHOLD=70
DATE=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE="/tmp/system_health.log" # Abslout path

# 2. Get Disk Usage Nubmers Only & RAM Usage
DISK=$(df -h / | grep / | awk '{print $5}' | cut -d% -f1)
RAM=$(free -m | awk 'NR==2{printf "%.0f", $3*100/$2}')

# 3. Logic & Conditions
if [ "$DISK" -gt "$THRESHOLD" ]; then 
    echo "[$DATE] CRITICAL: Disk space is at ${DISK}%" >> "$LOG_FILE"
else
    echo "[$DATE] OK: Disk space is safe at ${DISK}%" >> "$LOG_FILE"
fi

if [ "$RAM" -ge "$RAM_THRESHOLD" ]; then
    echo "[$DATE] CRITICAL: RAM  is at ${RAM_THRESHOLD}%" >> "$LOG_FILE"
else
    echo "[$DATE] OK: RAM is at ${RAM}%" >> "$LOG_FILE"
fi
