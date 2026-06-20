# Hyprland Config Files

Configuração pessoal do Hyprland no CachyOS, usando a API Lua (`hl.*`) do CachyOS.

## 🖥️ Setup

- **WM**: Hyprland (config via Lua, específico do CachyOS)
- **Distro**: CachyOS (Arch-based)
- **Shell**: fish + starship
- **Terminal**: kitty
- **Barra**: Waybar (uma em cada monitor)
- **Menu**: rofi-wayland
- **Wallpaper**: awww (imagens) + mpvpaper (vídeos)
- **Gerenciador de arquivos**: yazi
- **Lock screen**: hyprlock + hypridle
- **Logout/power menu**: wlogout
- **Notificações**: swaync
- **Login manager**: greetd + regreet

## 📁 Estrutura

| Pasta/Arquivo       | O que configura                                      |
|----------------------|-------------------------------------------------------|
| `hypr/`             | Config principal do Hyprland (keybindings, monitores, autostart, hyprlock, hypridle) |
| `waybar/`           | Duas barras: `config-main`/`style-main` (monitor principal) e `config-secondary`/`style-secondary` (monitor secundário) |
| `rofi/`             | Tema e config do menu (drun + window para alt-tab)   |
| `wlogout/`          | Menu de power (lock, logout, suspend, shutdown, reboot) |
| `starship/`         | Tema do prompt do terminal (Nord)                    |
| `yazi/`             | Openers customizados (AppImage, imagens, vídeos)     |
| `fish/`             | Config do shell fish                                 |
| `mimeapps.list`     | Associação de apps padrão (VLC para vídeos, swayimg para imagens) |

## 🔧 Dependências

Instalar via `pacman`:

```bash
sudo pacman -S waybar rofi-wayland yazi hyprlock hypridle wlogout \
    swaync bluez bluez-utils blueman nm-connection-editor \
    starship fish vlc swayimg playerctl brightnessctl jq \
    greetd ttf-jetbrains-mono-nerd
```

Via AUR (`yay`):

```bash
yay -S awww mpvpaper greetd-regreet rofi-theme-selector
```

## 🚀 Restaurando num PC novo

1. Instala o CachyOS com o perfil Hyprland
2. Instala as dependências acima
3. Clona o repositório:
   ```bash
   git clone https://github.com/Sanch3zzzz/Hyprland_config_files.git ~/dotfiles
   ```
4. Copia as configs:
   ```bash
   cd ~/dotfiles
   cp -r hypr waybar rofi wlogout starship yazi fish ~/.config/
   cp mimeapps.list ~/.config/
   ```
5. Cria a pasta de wallpapers (não versionada por serem arquivos grandes):
   ```bash
   mkdir -p ~/Imagens/Wallpapers
   ```
6. Habilita o greetd como display manager:
   ```bash
   sudo rm -f /etc/systemd/system/display-manager.service
   sudo systemctl enable greetd
   ```
7. Reinicia

## 📝 Notas

- O CachyOS usa um fork do swww chamado **awww** — os comandos são `awww-daemon` e `awww img`, não `swww`
- A API Lua do Hyprland aqui (`hl.*`) é específica do CachyOS, diferente do Hyprland vanilla (que usa `hyprland.conf`)
- O **hyprswitch** não é compatível com essa API Lua (usa submaps que dão erro) — o alt-tab é feito com `rofi -show window`
- Wallpapers em vídeo (`.mp4`) usam **mpvpaper**, não o awww (que só suporta imagens estáticas)

## ⌨️ Keybindings principais

| Atalho                  | Ação                          |
|--------------------------|-------------------------------|
| `SUPER + T`              | Terminal (kitty)              |
| `SUPER + E`              | Gerenciador de arquivos (kitty + yazi) |
| `SUPER + Space`          | Menu (rofi)                   |
| `SUPER + B`              | Navegador (Floorp)             |
| `SUPER + G`              | Steam                          |
| `SUPER + F`              | Fullscreen                     |
| `SUPER + V`              | Toggle float                   |
| `SUPER + Q`              | Fechar janela                  |
| `SUPER + O`              | Menu de power (wlogout)        |
| `SUPER + N`              | Painel de notificações (swaync)|
| `SUPER + M`              | Sair do Hyprland / shutdown    |
| `SUPER + S`              | Toggle scratchpad              |
| `SUPER + D`              | Mover janela pro scratchpad    |
| `SUPER + 1-0`            | Trocar workspace               |
| `SUPER + SHIFT + 1-0`    | Mover janela pro workspace     |
| `SUPER + SHIFT + ←↑↓→`   | Mover janela entre monitores   |
| `ALT + TAB`              | Alt-tab (rofi window)          |
| `SUPER + SHIFT + S`      | Screenshot de área             |
