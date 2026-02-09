#!/bin/bash

# Configuration
websites=("https://www.example.com" "https://www.google.com" "https://www.github.com")
log_file="/var/log/website_monitor.log"
email="admin@example.com"

# Function to check a website
check_website() {
    local url="$1"
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Get HTTP status code
    status_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")

    # Check if status code is 200 (OK)
    if [ "$status_code" -eq 200 ]; then
        echo "[$timestamp] SUCCESS: $url returned status code $status_code" | tee -a "$log_file"
        return 0
    else
        echo "[$timestamp] ERROR: $url returned status code $status_code" | tee -a "$log_file"
        return 1
    fi
}

# Function to send email alert
send_alert() {
    local url="$1"
    local status="$2"

    echo "Website $url is down (Status: $status)" | mail -s "Website Down Alert" "$email"
    echo "Alert sent to $email" | tee -a "$log_file"
}

# Main function
main() {
    echo "Starting website monitoring at $(date)" | tee -a "$log_file"

    for site in "${websites[@]}"; do
        echo "Checking $site..." | tee -a "$log_file"
        if ! check_website "$site"; then
            send_alert "$site" "$status_code"
        fi

        # Sleep between checks to avoid hammering the servers
        sleep 2
    done

    echo "Monitoring completed at $(date)" | tee -a "$log_file"
    echo "-----------------------------------------" | tee -a "$log_file"
}

# Create log file if it doesn't exist
touch "$log_file"

# Run the script
main
