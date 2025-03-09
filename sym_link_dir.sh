#!/bin/sh

#create symbolic links of a whole directory at a new directory
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input directory> <output directory>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: $1 does not exist"
    exit 1
fi

if [ ! -d "$2" ]; then
    echo "Error: $2 not a valid output directory"
    exit 1
fi

for FILE in "$1"/*; do
    ln -s $FILE $2
done

