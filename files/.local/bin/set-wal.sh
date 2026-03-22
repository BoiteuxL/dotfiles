#!/bin/bash
# Usage: ./changewall.sh path/to/image.jpg

# 1. Set wallpaper (using swww for a smooth fade)
awww img "$1" --transition-type center

# 2. Generate colors
matugen image "$1"

# 3. Reload UI components
# Refresh Waybar (requires a css template in matugen)
pkill -USR2 waybar 

# Optional: Send notification
notify-send "Theme Updated" "Colors matched to $(basename $1)"