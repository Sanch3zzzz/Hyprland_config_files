#!/bin/bash

pkill waybar

sleep 0.5

MONITORS=$(hyprctl monitors -j | jq -r '.[].name')
HAS_SECONDARY=$(echo "$MONITORS" | grep -c "HDMI-A-1")

if [ "$HAS_SECONDARY" -gt 0 ]; then
    # Dois monitores: barra principal simples + barra secundária com os módulos extras
    waybar -c ~/.config/waybar/config-main.jsonc -s ~/.config/waybar/style-main.css &
    waybar -c ~/.config/waybar/config-secondary.jsonc -s ~/.config/waybar/style-secondary.css &
else
    # Só o monitor principal: sobe a barra completa
    waybar -c ~/.config/waybar/config-main-full.jsonc -s ~/.config/waybar/style-main.css &
fi
