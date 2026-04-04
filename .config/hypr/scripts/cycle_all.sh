#!/bin/bash

# Get current active window address
current=$(hyprctl activewindow -j | jq -r '.address')

# Get all visible (mapped) windows across all monitors in stacking order
windows=$(hyprctl clients -j | jq -r '.[] | select(.mapped == true) | .address')

# Convert to array
mapfile -t win_array <<< "$windows"

# Find index of current window
for i in "${!win_array[@]}"; do
    if [[ "${win_array[$i]}" == "$current" ]]; then
        idx=$i
        break
    fi
done

# If no current window found, focus first one
if [ -z "$idx" ]; then
    next_win=${win_array[0]}
else
    # Pick the next window in list (wrap around)
    next_index=$(( (idx + 1) % ${#win_array[@]} ))
    next_win=${win_array[$next_index]}
fi

# Focus it
hyprctl dispatch focuswindow address:$next_win
