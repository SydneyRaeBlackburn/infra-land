#!/bin/bash
#
# Script: example.sh
# Description: A template for shell scripts
# Author: Your Name
# Date: 2025-05-17
#
# Usage: ./example.sh [options] <argument>

# Exit on error
set -e

# Script constants
readonly PROGNAME=$(basename "$0")
readonly ARGS=("$@")

# Configuration
config_file="/etc/example.conf"
temp_dir="/tmp/example_$$"

# Function to display usage
usage() {
    cat << EOF
Usage: $PROGNAME [OPTIONS] <argument>

Options:
  -h, --help      Display this help message
  -v, --verbose   Enable verbose output
  -f FILE         Specify input file

Example:
  $PROGNAME -v -f input.txt

EOF
}

# Function to log messages
log() {
    local level="$1"
    shift
    echo "[$level] $*"
}

# Function to clean up temporary files
cleanup() {
    log "INFO" "Cleaning up..."
    rm -rf "$temp_dir"
}

# Set up trap to clean up on exit
trap cleanup EXIT

# Function to process arguments
process_args() {
    # Create temp directory
    mkdir -p "$temp_dir"

    # Process the main argument
    log "INFO" "Processing argument: $1"
    # Main logic here...
}

# Main function
main() {
    # Parse options
    local verbose=false
    local file=""

    while (( $# > 0 )); do
        case "$1" in
            -h|--help)
                usage
                exit 0
                ;;
            -v|--verbose)
                verbose=true
                shift
                ;;
            -f)
                file="$2"
                shift 2
                ;;
            -*)
                log "ERROR" "Unknown option: $1"
                usage
                exit 1
                ;;
            *)
                break
                ;;
        esac
    done

    if [[ $verbose == true ]]; then
        log "INFO" "Verbose mode enabled"
    fi

    if [[ -n "$file" ]]; then
        log "INFO" "Using file: $file"
    fi

    # Check for required arguments
    if (( $# < 1 )); then
        log "ERROR" "Missing required argument"
        usage
        exit 1
    fi

    # Process arguments
    process_args "$1"

    log "INFO" "Script completed successfully"
}

# Run the script
main "${ARGS[@]}"
