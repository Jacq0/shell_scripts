#!/bin/sh
#update script for discord (pacman version is often outdated)
output_dir="$HOME/Programs"
file_name="discord.tar.gz"

curl -L "https://discord.com/api/download?platform=linux&format=tar.gz" --output "$file_name"
tar -xf "$file_name"
mkdir -p "$output_dir"
rm -r "$output_dir/Discord"
cp -r Discord/ "$output_dir"
rm "$file_name"