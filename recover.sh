#!/bin/bash

# Directory to save recovered blobs
RECOVERY_DIR="recovered_blobs"
mkdir -p "$RECOVERY_DIR"

# Locate all blob files
for blob_file in $(find .git/lost-found/other -type f); do
    # Extract the blob hash from the file path
    blob_hash=$(basename "$blob_file")

    # Create a file name for each blob
    file_name="${RECOVERY_DIR}/${blob_hash}.txt"

    # Try to recover the content of the blob
    git cat-file -p "$blob_hash" 2>/dev/null > "$file_name"

    # Check if the file was created successfully
    if [ -s "$file_name" ]; then
        echo "Recovered: $file_name"
    else
        # Remove empty or invalid files
        rm "$file_name"
    fi
done

echo "Recovery process completed. Check the '$RECOVERY_DIR' directory."
