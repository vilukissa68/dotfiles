export ZSH=~/.oh-my-zsh

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
alias raspi="ssh vaino@88.193.156.189"
#alias renode='mono /Applications/Renode.app/Contents/MacOS/bin/Renode.exe'
#alias renode-test='/Applications/Renode.app/Contents/MacOS/tests/renode-test'
alias x86brew="arch -x86_64 /usr/local/bin/brew"

# Urxvt perl extensions
PATH="/home/vaino/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/vaino/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/vaino/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/vaino/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/vaino/perl5"; export PERL_MM_OPT;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/vainogranat/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/vainogranat/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/vainogranat/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/vainogranat/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Renode
export PATH="$HOME/work/renode/:$PATH"
