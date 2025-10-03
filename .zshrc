# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris

# cmp opts
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33
# zstyle ':completion:*' file-list true

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Custom settings
alias v='nvim'
alias vim='nvim'
alias ls='eza -GHF --icons --color \$@'
alias l='eza -lh --icons --color --no-user'
alias ll='eza -lah --icons --color --no-user'
alias lt='eza -lh --tree --icons --color --no-user'
alias llt='eza -lah --tree --icons --color --no-user'
alias grep='grep --color'

# bash way
bindkey -s '\C-f' 'tmux-sessionizer\n'
# End of custom settings

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt correct
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# golang
export PATH=$PATH:/usr/local/go/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# bun completions
[ -s "/home/yoliveros/.bun/_bun" ] && source "/home/yoliveros/.bun/_bun"

# starship
eval "$(starship init zsh)"

# dotnet
export PATH="$PATH:/home/yoliveros/.dotnet/tools"

# pnpm
export PNPM_HOME="/home/yoliveros/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(atuin init zsh --disable-up-arrow)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# highlighting 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Manpages highlighting
# export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANPAGER="nvim +Man!"

# Flutter
export PATH="$HOME/development/flutter/bin:$PATH"

# adb android 
if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi
