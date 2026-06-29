#!/bin/bash

LOCKFILE="/tmp/waybar-launch.lock"

# Se já tem uma execução rodando, sai
if [ -e "$LOCKFILE" ]; then
    exit 0
fi

touch "$LOCKFILE"
trap 'rm -f "$LOCKFILE"' EXIT

pkill waybar
sleep 0.5

MONITORS=$(hyprctl monitors -j | jq -r '.[].name')
HAS_SECONDARY=$(echo "$MONITORS" | grep -c "HDMI-A-1")

if [ "$HAS_SECONDARY" -gt 0 ]; then
    waybar -c ~/.config/waybar/config-main.jsonc -s ~/.config/waybar/style-main.css &
    waybar -c ~/.config/waybar/config-secondary.jsonc -s ~/.config/waybar/style-secondary.css &
else
    waybar -c ~/.config/waybar/config-main-full.jsonc -s ~/.config/waybar/style-main.css &
fi
