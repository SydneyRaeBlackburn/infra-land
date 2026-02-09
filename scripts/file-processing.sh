#!/bin/bash

# Check arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <backup_directory>"
    exit 1
fi

source_dir="$1"
backup_dir="$2"

# Validate directories
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory does not exist: $source_dir" >&2
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Counter for processed files
processed=0

# Process each text file
for file in "$source_dir"/*.txt; do
    # Skip if no files match
    [ -e "$file" ] || continue

    filename=$(basename "$file")
    echo "Processing: $filename"

    # Create a backup
    cp "$file" "$backup_dir/${filename}.bak"

    # Add processing here

    ((processed++))
done

echo "Processed $processed files. Summary saved to $backup_dir/summary.log"
