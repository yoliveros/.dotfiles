#!/usr/bin/env bash

export USER=$(logname)

# Paru/Pacman dependencies
dep=(
  "atuin"
  "bat" 
  "bear" 
  "btop" 
  "fastfetch"
  "eza" 
  "fzf" 
  "wget" 
  "gdu" 
  "go" 
  "ghostty" 
  "neovim" 
  "nvm" 
  "meson" 
  "pnpm" 
  "ripgrep"
  "starship" 
  "stow" 
  "tldr" 
  "tmux" 
  "unzip" 
  "zsh"
  "hypridle"
  "hyprlock"
  "hyprpolkintagent" # To do
  "hyprsysteminfo"
  "hyprcursor"
  "hyprsunset"
  "linux-wallpaperengine-git"
  "python-pywal16"
)

# paru -S "${dep[@]}"
#

# Themenizer service
systemctl --user daemon-reload

must_init_services=("themenizer.timer")

for service in "${must_init_services[@]}"; do
    systemctl --user enable "${service}"
    systemctl --user start "${service}"
done
# 

# Simlink dotfiles
stow .
