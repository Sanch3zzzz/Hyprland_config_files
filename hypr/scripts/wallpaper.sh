#!/bin/bash
awww-daemon &
sleep 0.5
awww img /home/gustavosp/Imagens/Wallpapers/$(ls /home/gustavosp/Imagens/Wallpapers | shuf -n1) \
  --transition-type random \
  --transition-duration 2
