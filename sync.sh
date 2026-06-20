#!/bin/bash

cd ~/dotfiles

# Atualiza as configs
cp -r ~/.config/hypr .
cp -r ~/.config/waybar .
cp -r ~/.config/rofi .
cp -r ~/.config/wlogout .
cp -r ~/.config/starship .
cp -r ~/.config/yazi .
cp -r ~/.config/fish .
cp ~/.config/mimeapps.list .

# Remove o .git do rofi/themes pra não conflitar
rm -rf ./rofi/themes/.git

# Commit e push
git add .
git commit -m "update dotfiles $(date '+%d/%m/%Y %H:%M')"
git push

echo "Dotfiles sincronizados!"
