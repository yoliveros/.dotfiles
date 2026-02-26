if status is-interactive
  # Commands to run in interactive sessions can go here
end

set -U fish_greeting

fish_config theme choose "catppuccin-mocha"

fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path /usr/local/go/bin
fish_add_path ~/development/flutter/bin
if test -d ~/adb-fastboot/platform-tools
  fish_add_path ~/adb-fastboot/platform-tools
end

alias v 'nvim'
alias vim 'nvim'
alias l 'eza -lh --icons --color --no-user'
alias ll 'eza -lah --icons --color --no-user'
alias lt 'eza -lh --tree --icons --color --no-user'
alias llt 'eza -lah --tree --icons --color --no-user'
alias grep 'grep --color'
alias lg 'lazygit'
alias mail 'neomutt'
alias chat 'weechat'

bind \ct 'tmux-sessionizer; commandline -f repaint'

set -gx MANPAGER "nvim +Man!"
set -gx MAILSYNC_MUTE 1

set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

set -gx DOTNET_ROOT "$HOME/.dotnet"
fish_add_path "$DOTNET_ROOT" "$DOTNET_ROOT/tools"

set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path "$PNPM_HOME"

starship init fish | source
zoxide init fish | source
fnm env --use-on-cd --shell fish | source
atuin init fish --disable-up-arrow | source

if not set -q SSH_AUTH_SOCK
  eval (ssh-agent -c) > /dev/null
end
if not contains "personal" (ssh-add -l)
  ssh-add ~/.ssh/personal 2>/dev/null
end

bass source ~/vulkan/1.4.335.0/setup-env.sh
