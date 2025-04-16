#!/bin/bash

WALLPAPERS="$HOME/Pictures/Wallpaper"

# Set the DISPLAY variable explicitly
export DISPLAY=:0.0

# Change wallpaper using feh with --randomize 
feh --randomize --bg-fill --slideshow-delay 3 "$WALLPAPERS/"
