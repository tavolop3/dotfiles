#!/bin/bash
shader="/home/tao/.config/hypr/shaders/grayscale.glsl"

if [ ! -f "$shader" ]; then
    notify-send "Grayscale shader not found!" "$shader"
    exit 1
fi

# Obtener la ruta actual del shader
current=$(hyprctl getoption decoration:screen_shader | grep "str:" | awk '{print $2}')

if [[ "$current" == "null" ]]; then
    hyprctl keyword decoration:screen_shader "$shader"
    notify-send "Grayscale ON"
else
  hyprctl keyword decoration:screen_shader "$HOME/.config/hypr/shaders/none.glsl"
    # hyprctl keyword decoration:screen_shader null
    # hyprctl keyword decoration:screen_shader ""
    notify-send "Grayscale OFF"
fi

