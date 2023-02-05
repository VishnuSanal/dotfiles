#!/usr/bin/env bash

DIR="$HOME/.config/polybar/config"

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q internal -c "$DIR"/internal.ini &
polybar -q monitor -c "$DIR"/monitor.ini &
