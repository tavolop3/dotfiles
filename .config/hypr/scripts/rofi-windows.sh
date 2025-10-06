#!/bin/bash

# Armamos lista con "class: title" y guardamos también el address
windows=$(hyprctl clients -j | jq -r '.[] | "\(.address) \t \(.class): \(.title)"')

chosen=$(echo "$windows" | awk -F'\t' '{print $2}' | rofi -dmenu -i -p "Ventanas" -config ~/.config/rofi/rofidmenu.rasi)

if [ -n "$chosen" ]; then
    addr=$(echo "$windows" | grep -F "$chosen" | awk -F'\t' '{print $1}')
    hyprctl dispatch focuswindow address:$addr
fi
