#!/bin/sh

#Generates file structure for shows expteced by Jellyfin (eg: /<SHOW>/<SEASONS>)
SHOWNAME=""
SEASONS=-1
EXTRAS=false

while getopts 's:c:eh' OPTION; 
do
    case $OPTION in
        s)
            SHOWNAME="$OPTARG"
            ;;
        c)
            SEASONS="$OPTARG"
            ;;
        h)
            echo -e "Usage $0 -s \"<show name>\" -c <season count>\n"
            echo "Optional Flags: -e (If show has extra content, will create a directory called \"Specials\")"
            exit 1
            ;;
        e)
            EXTRAS=true
            ;;
        ?)
            echo "Invalid flag, use -h to display help."
            exit 1
            ;;
    esac
done

if [ -z "$SHOWNAME" ] || [ -z "$SEASONS" ]; then
    echo "Usage: $0 -s \"<show name>\" -c <season count>"
    exit 1
fi

if [[ ! "$SEASONS" =~ ^[0-9]+$ ]]; then
    echo "Error: Season count must be a positive integer."
    exit 1
fi

mkdir "$PWD/$SHOWNAME"

for ((i=1 ; i<=$SEASONS ; i++))
do
    FILE="Season $i"
    mkdir "$PWD/$SHOWNAME/$FILE"

    echo "Created $FILE in $PWD/$SHOWNAME"
done

if [ "$EXTRAS" = true ]; then
    mkdir "$PWD/$SHOWNAME/Specials"

    echo "Created Specials in $PWD/$SHOWNAME"
fi

echo -e "\nDone! check $PWD/$SHOWNAME"