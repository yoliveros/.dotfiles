#!/usr/bin/env bash

export USER=$(logname)

# Paru/Pacman dependencies
dep=(
  "atuin"
  "bat" 
  "bear" 
  "btop" 
  "fastfetch"
  "calc"
  "catppucin-gtk-theme-mocha"
  "calcure"
  "chatterino"
  "cloc"
  "colorz"
  "discord"
  "eza" 
  "fzf" 
  "fnm"
  "fd"
  "wget" 
  "gdu" 
  "go" 
  "hypridle"
  "hyprlock"
  "hyprpolkintagent" # To do
  "hyprsysteminfo"
  "hyprcursor"
  "hyprlauncher"
  "hyprsunset"
  "hyprshot"
  "lazygit"
  "lutris"
  "modrinth-app"
  "ghostty" 
  "neovim" 
  "meson" 
  "okular"
  "pnpm" 
  "python-pywal16"
  "qbitorrent"
  "ripgrep"
  "starship" 
  "snitch"
  "stow" 
  "steam"
  "swaync"
  "stremio"
  "tldr" 
  "tmux" 
  "ttf-firacode-nerd"
  "unzip" 
  "wofi"
  "zsh"
  "zoxide"
  "qemu-full"
  "libvirt"
)

paru -S "${dep[@]}"
#

# Simlink dotfiles
stow .
#

# Themenizer service
systemctl --user daemon-reload

must_init_services=("themenizer.timer")

for service in "${must_init_services[@]}"; do
    systemctl --user enable "${service}"
    systemctl --user start "${service}"
done
# 

