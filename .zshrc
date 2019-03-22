export ZSH=/home/vaino/.oh-my-zsh

# Set theme
ZSH_THEME="agnoster"

plugins=(
  git
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
  python
  tmux
)

# Oh-My-Zsh integration
source $ZSH/oh-my-zsh.sh
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Pywal integration
#(cat ~/.cache/wal/sequences &)

# ALIASES
alias vim="nvim"
alias python="python3"
alias raspi="ssh vaino@89.106.42.210"


# Urxvt perl extensions
PATH="/home/vaino/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/vaino/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/vaino/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/vaino/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/vaino/perl5"; export PERL_MM_OPT;
