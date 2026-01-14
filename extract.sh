#!/bin/sh

extract()
{
    FILEDIR="$1"
    OUTDIR="$2"

    if [[ "$FILEDIR" == *.7z ]] then
      echo "[7zip] Extracting $FILEDIR"
      7z x "$FILEDIR" -aos -o"$OUTDIR" 
    fi
    if [[ "$FILEDIR" == *.zip ]] then
      echo "[zip] Extracting $FILEDIR"
      unzip "$FILEDIR" -d "$OUTDIR"
    fi
}

ALL=false
ONE=false
ALLDIR=""
ONEDIR=""

while getopts 'a:o:' OPTION; 
do
    case $OPTION in
    a)
        ALL=true
        ALLDIR="$OPTARG"
        ;;
    o)
        ONE=true
        ONEDIR="$OPTARG"
        ;;
    ?)
        echo "Invalid flags detected, use -a for full directory or -o for single files."
        exit 1
        ;;
    esac
done

if [[ "$ALL" == true && "$ONE" == true  ]]; then
    echo "Only one flag (-a or -o) is valid at a time."
    exit 1
fi

if $ALL; then
    if [ ! -d "$ALLDIR" ]; then
        echo "Directory: $ALLDIR does not exist."
        exit 1
    fi

    echo "Extracting files in folder: $ALLDIR"

    for FILE in "$ALLDIR"/*; do
        extract "$FILE" "$ALLDIR"
    done
fi

if $ONE; then
    if [ ! -f "$ONEDIR" ]; then
        echo "File: $ONEDIR does not exist"
        exit 1
    fi

    echo "Extracting file: $ONEDIR"
    FILEDIR=$(dirname "$ONEDIR")

    extract "$ONEDIR" "$FILEDIR"
fi