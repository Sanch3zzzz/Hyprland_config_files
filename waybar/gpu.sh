#!/bin/bash
GPU_USAGE=$(cat /sys/class/drm/card1/device/gpu_busy_percent 2>/dev/null || echo "0")
GPU_TEMP=$(cat /sys/class/drm/card1/device/hwmon/hwmon*/temp1_input 2>/dev/null | head -1)
GPU_TEMP=$((GPU_TEMP / 1000))
echo "󰊴  ${GPU_USAGE}%  󰔏  ${GPU_TEMP}°C"
