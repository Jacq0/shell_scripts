#!/bin/sh
echo $1
OUT="CX_"
OUT+=$1
echo $OUT
ffmpeg -i "$1" -vcodec libx264 -acodec aac "$OUT"