#!/bin/bash

DISK=$(df -h / | grep / | awk '{print $5}' | cut -d% -f1)

echo "Checking Disk Usage..."

if [ $DISK -gt 80 ]; then
    echo "🚨 Warning: Disk is almost full! Usage is $DISK%"
else
    echo "✅ Everything is fine. Disk usage is $DISK%"
fi
