" Fetch vim config to nvim (more info :help nvim-from-vim)
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set rtp^=/usr/share/vim/vimfiles/
