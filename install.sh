#!/usr/bin/env bash

user=$(logname)

dep=(
  "atuin", 
  "bat", 
  "bear", 
  "btop", 
  "fastfetch", 
  "eza", 
  "fzf", 
  "wget", 
  "gdu", 
  "go", 
  "ghostty", 
  "neovim", 
  "nvm", 
  "meson", 
  "pnpm", 
  "ripgrep",
  "starship", 
  "stow", 
  "tldr", 
  "tmux", 
  "unzip", 
  "zsh",
  "hypridle",
  "hyprlock",
)

cp ./systemd/themenizer.service.template ./systemd/themenizer.service
echo ExecStart=/bin/bash /home/$user/.local/bin/themenizer >> ./systemd/themenizer.service

ln -sf /home/$user/.dotfiles/systemd/themenizer.service /etc/systemd/system/themenizer.service
ln -sf /home/$user/.dotfiles/systemd/themenizer.timer /etc/systemd/system/themenizer.timer
