#!/bin/bash
#This Script checks the system health & RAM Usage
DISK=$(df -h / | grep / | awk '{print $5}' | cut -d% -f1)
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
echo "Checking Disk Usage..."

if [ $DISK -gt 80 ]; then
    echo "🚨 Warning: Disk is almost full! Usage is $DISK%"
else
    echo "✅ Everything is fine. Disk usage is $DISK%"
fi
