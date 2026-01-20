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
  "nvm" 
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
  "unzip" 
  "wofi"
  "zsh"
  "zoxide"
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

