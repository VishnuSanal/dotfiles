#!/bin/sh

MODE=$(cat ~/.screenlayout/mode)

# both monitors
if [ $MODE == 0 ] || [ $MODE == 1 ] || [ $MODE == 4 ] || [ $MODE == 5 ] || [ $MODE == 6 ]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off
# intenral monitor off
elif [ $MODE == 2 ] || [ $MODE == 3 ]; then
    xrandr --output eDP-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off
fi
