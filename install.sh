#!/usr/bin/env bash

[ "$(id -u)" != 0 ] && exec sudo -- "$0" "$@"

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

services=("themenizer.service")

for service in "${services[@]}"; do
  cp ./systemd/"${service}".template ./systemd/"${service}"
  echo ExecStart=/home/"${USER}"/.local/bin/themenizer >> ./systemd/"${service}"
done

services+=("themenizer.timer")

for file in "${services[@]}"; do
    ln -sf /home/"${USER}"/.dotfiles/systemd/"${file}" /etc/systemd/system/"${file}"
done

systemctl daemon-reload

must_init_services=("themenizer.timer")

for service in "${must_init_services[@]}"; do
    systemctl enable "${service}"
    systemctl start "${service}"
done

