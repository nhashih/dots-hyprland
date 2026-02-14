#!/bin/bash
CURRENT_BORDER=$(hyprctl getoption general:col.active_border -j | jq -r '.rgba')

if [[ "$CURRENT_BORDER" == *"cba6f7ff"* ]]; then # 
    ~/.config/hypr/scripts/switch_mode.sh work 
else
    ~/.config/hypr/scripts/switch_mode.sh personal
fi
