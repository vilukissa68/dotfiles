export ZSH=/home/vaino/.oh-my-zsh

# Set theme
ZSH_THEME="agnoster"

plugins=(
  git
  vi-mode
)

# Oh-My-Zsh integration
source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Pywal integration
(cat ~/.cache/wal/sequences &)

# ALIASES
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
