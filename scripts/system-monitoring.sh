#!/bin/bash

# Function to display header
print_header() {
    echo "========================================"
    echo "    System Monitoring - $(date)"
    echo "========================================"
}

# Function to check disk usage
check_disk() {
    echo "DISK USAGE:"
    df -h | grep -v "tmpfs" | grep -v "Filesystem"

    # Alert if any partition is over 90% full
    critical=$(df -h | grep -v "tmpfs" | awk '$5 > 90 {print $5 " - " $1}')

    if [ ! -z "$critical" ]; then
        echo "WARNING: The following partitions are nearly full:"
        echo "$critical"
    fi

    echo
}

# Function to check memory usage
check_memory() {
    echo "MEMORY USAGE:"
    free -h
    echo
}

# Function to check load average
check_load() {
    echo "LOAD AVERAGE:"
    uptime

    # Get number of cores
    cores=$(nproc)

    # Get 5-minute load average
    load_5min=$(uptime | awk -F'load average: ' '{print $2}' | awk -F', ' '{print $2}')

    # Check if load exceeds number of cores
    if (( $(echo "$load_5min > $cores" | bc -l) )); then
        echo "WARNING: Load average ($load_5min) exceeds number of cores ($cores)"
    fi

    echo
}

# Function to check running processes
check_processes() {
    echo "TOP 5 CPU-INTENSIVE PROCESSES:"
    ps aux --sort=-%cpu | head -6
    echo

    echo "TOP 5 MEMORY-INTENSIVE PROCESSES:"
    ps aux --sort=-%mem | head -6
    echo
}

# Main function
main() {
    print_header
    check_disk
    check_memory
    check_load
    check_processes

    echo "Report completed at $(date)"
}

# Run the script
main
