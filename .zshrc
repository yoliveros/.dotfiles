# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Custom settings
alias vim='nvim'
alias l='eza -l --icons'
alias ll='eza -l -a --icons'

# bash way
bindkey -s '\C-f' 'tmux-sessionizer\n'
# End of custom settings

# golang
export PATH=$PATH:/usr/local/go/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

#nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# bun completions
[ -s "/home/yoliveros/.bun/_bun" ] && source "/home/yoliveros/.bun/_bun"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#snap 
export PATH="$PATH:/snap/bin"

eval "$(starship init zsh)"

export PATH="$PATH:/home/yoliveros/.dotnet/tools"

export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/opt/dotnet/libexec"

# pnpm
export PNPM_HOME="/home/yoliveros/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# C includes
export CPATH="$CPATH:/home/linuxbrew/.linuxbrew/include"
export LIBRARY_PATH="$LIBRARY_PATH:/home/linuxbrew/.linuxbrew/lib"
#
