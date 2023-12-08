#!/bin/bash

wallpaper_dir="$1"
flag_file="${wallpaper_dir}/.continue_randomization"

# Check if the flag file exists
if [ -f "$flag_file" ]; then
  # Read the flag value
  continue_randomization=$(cat "$flag_file")

  # If the flag value is "true", continue randomization
  if [ "$continue_randomization" = "true" ]; then
    # Get a list of wallpapers in the directory
    wallpapers=("$wallpaper_dir"/*)

    # Select a random wallpaper from the list
    random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

    # Set the wallpaper
    feh --bg-fill "$random_wallpaper"
  fi
fi
