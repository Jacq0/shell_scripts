#!/bin/sh
if [ -z "$1" ]; then
    echo "Usage: $0 <directory> <OPTIONAL: output file name>"
    exit 1
fi

DIR="$1"

# Check if the argument is a valid directory
if [ ! -d "$DIR" ]; then
    echo "Error: $DIR is not a valid directory"
    exit 1
fi

if [ -z "$2" ]; then
    echo "Skipping output file, no directory specified."
else
    fdupes -rS "$DIR" >> "$DIR/$2"
    echo "Creating Output File: $DIR/$2"
fi
    
#remove dupes
fdupes -rdN "$1"

echo "Finished!"