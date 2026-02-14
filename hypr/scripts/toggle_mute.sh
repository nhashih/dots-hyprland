#!/bin/bash

wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

INTERNAL_SINK=$(wpctl status | grep -i "Built-in Audio Analog Stereo" -m 1 | grep -oE "[0-9]+" | head -n 1)

if [ -n "$INTERNAL_SINK" ]; then
    if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"; then
        wpctl set-mute "$INTERNAL_SINK" 1
    else
        wpctl set-mute "$INTERNAL_SINK" 0
    fi
else
    echo "Speaker ID Not Found"
fi
