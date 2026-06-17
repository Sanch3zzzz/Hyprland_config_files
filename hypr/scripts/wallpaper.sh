#!/bin/bash

# Inicia awww-daemon só se não estiver rodando
if ! pgrep -x awww-daemon > /dev/null; then
    awww-daemon &
    sleep 0.5
fi

WALLPAPER_DIR="/home/gustavosp/Imagens/Wallpapers"

while true; do
    RANDOM_WALL=$(ls "$WALLPAPER_DIR" | grep -E '\.(png|jpg|jpeg|webp|gif|mp4)$' | shuf -n1)

    if [[ "$RANDOM_WALL" == *.mp4 ]]; then
        pkill mpvpaper
        mpvpaper -o "no-audio --loop --keepaspect=no" '*' "$WALLPAPER_DIR/$RANDOM_WALL" &
    else
        pkill mpvpaper
        awww img "$WALLPAPER_DIR/$RANDOM_WALL" \
            --transition-type random \
            --transition-duration 2
    fi

    sleep 3600  # 1 hora
done
