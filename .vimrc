"
" NOTICE! This configuration uses set exrc and set secure. Set exrc allows vim to run some external commands,
" which could compromise your system if not used with set secure. NEVER REMOVE set secure without removing set exrc.
"
" This configuration has setting for: Python, C, C++, Latex
"
" Configuration supports features such as:  Airline and Nerdtree, for information
"                                           Simplyfold, YouCompleteMe and VimFugitive for ease of use
"                                           Goyo, pencil and vimroom for distraction free environment
"
"
" C-language configuration based on: Alexey Shmalko's setup and guide:
" http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
"
" Python configuration based on Real Python guide:
" https://realpython.com/vim-and-python-a-match-made-in-heaven/


" Enabled
set nocompatible            " required
set exrc                    " required
set secure                  " NEVER REMOVE, YOUR VIM MIGHT EXECUTE DANGEROUS CODE
filetype on                 " required
filetype plugin indent on   " Enable ftplugin support

" PLUGINS
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'	" let Vundle manage plugins

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'thomasfaingnaert/vim-lsp-ultisnips'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" AIRLINE
let g:airline#extensioins#tabline#enable = 1
" set laststatus=2
let g:airline_theme='base16' " set look


let g:SimpylFold_docstring_preview=1

" NERD TREE
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

hi Directory guifg=#FF0000 ctermfg=red

" TAGBAR
nmap <F8> :TagbarToggle<CR>

" FZF.VIM
" Fuzzy finder for vim
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

set number relativenumber		" Set numbers
set nu rnu
set nocursorline				" Remove cursor line
set background=dark		    	" tmux backgraund fix
set ruler                   " show line and column number
set scrolloff=5
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line

" Set gruvbox theme
"colorscheme gruvbox
""""set background=light
"highlight Normal ctermbg=None
" Color change commands:
"command Light execute "set background=light"
"command Dark execute "set background=dark"
set background=light

set t_Co=16

" Basic Functionality
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

set backspace=indent,eol,start	" make backspaces more powerfull
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" REMAPPINGS
" Leader key
let mapleader = " "

nnoremap e el

" SPLIT FUNCTIONALITY
"Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable arrows
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" Split config
set splitbelow
set splitright
nnoremap <silent> <Leader>ws :split<CR>
nnoremap <silent> <Leader>wv :vsplit<CR>
nnoremap <silent> <Leader>wd :close<CR>

" Split resizing
set winheight=10
:silent! set winminheight=5

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" FOLDING FUNCTIONALITY
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8
let g:vimroom_background="none"
set clipboard=unnamed

" MOUSE SUPPORT
:set mouse=a

" Set persistent undo
set undodir=~/.vim/undodir
set undofile

" Remove unwanted whitespace
autocmd BufWritePre *.py %s/\s\+$//e

" read odt files in vim
autocmd BufReadPost *.odt :%!odt2txt %

" Latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
