#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch example bar
echo "---" | tee -a /tmp/polybar1.log
polybar example 2>&1 | tee -a /tmp/polybar1.log & disown
echo "Bars launched..."

# polybar -q example -c ~/.config/polybar/config & disown
