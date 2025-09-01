#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/backgrounds"
RANDOM_WALL=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# matar swaybg previo (por si ya estaba corriendo)
pkill swaybg

# lanzar swaybg con el fondo elegido
swaybg -i "$RANDOM_WALL" -m fill &
