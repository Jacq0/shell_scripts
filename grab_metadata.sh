#!/bin/bash

#grab metadata from a full directory of videos
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIR="$1"

if [ ! -d "$DIR" ]; then
    echo "Error: $DIR is not a valid directory"
    exit 1
fi

OUTPUT_FILE="$DIR/metadata.txt"

#create/clear output
> "$OUTPUT_FILE"

for FILE in "$DIR"/*; do
    if [ -f "$FILE" ]; then 
        echo "--- Metadata for: $FILE ---" >> "$OUTPUT_FILE"
        mediainfo "$FILE" >> "$OUTPUT_FILE"
        echo -e "\n" >> "$OUTPUT_FILE"
    fi
done

echo "Metadata extraction completed. Check $OUTPUT_FILE"