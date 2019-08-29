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



" __      __  _____   _______              _
" \ \    / / |_   _| |__   __|     /\     | |
"  \ \  / /    | |      | |       /  \    | |
"  	\ \/ /     | |      | |      / /\ \   | |
"    \  /     _| |_     | |     / ____ \  | |____
"     \/     |_____|    |_|    /_/    \_\ |______|

set nocompatible            " required
set exrc                    " required
set secure                  " NEVER REMOVE, YOUR VIM MIGHT EXECUTE DANGEROUS CODE
filetype on                 " required
filetype plugin indent on   " Enable ftplugin suppoer



"  _____    _        _    _    _____   _____   _   _    _____
" |  __ \  | |      | |  | |  / ____| |_   _| | \ | |  / ____|
" | |__) | | |      | |  | | | |  __    | |   |  \| | | (___
" |  ___/  | |      | |  | | | | |_ |   | |   | . ` |  \___ \
" | |      | |____  | |__| | | |__| |  _| |_  | |\  |  ____) |
" |_|      |______|  \____/   \_____| |_____| |_| \_| |_____/

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
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'vimroom.vim'
Plugin 'lervag/vimtex'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'morhetz/gruvbox'
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" AIRLINE
let g:airline#extensioins#tabline#enable = 1
" set laststatus=2
let g:airline_theme='distinguished' " set look


" GOYO
function! s:goyo_enter()
	:set textwidth 130
	:set wrap on
	:set nocursorline
	:set linebreak on
endfunction
function! s:goyo_leave()
	:set wrap off
	:set linebreak off
	:set cursorline
endfunction
let g:SimpylFold_docstring_preview=1

" PENCIL
augroup pencil " Initialize by file type
	autocmd!
	autocmd FileType markdown,mkd call pencil#init()
	autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END
" Softwrap with pencil
let g:pencil#wrapModeDefault = 'soft'


" YOU-COMPLETE-ME
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_show_diagnostics_ui = 0


" NERD TREE
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

hi Directory guifg=#FF0000 ctermfg=red


" TAGBAR
nmap <F8> :TagbarToggle<CR>


" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_cpp_checkers = ["clang_check", "gcc"]

" VIMADE
let g:vimade = {
  \ "normalid": '',
  \ "basefg": '',
  \ "basebg": '',
  \ "fadelevel": 0.4,
  \ "colbufsize": 30,
  \ "rowbufsize": 30,
  \ "checkinterval": 32,}

" ULTISNIPS
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"


"   _____   ______   _   _   ______   _____               _
"  / ____| |  ____| | \ | | |  ____| |  __ \      /\     | |
" | |  __  | |__    |  \| | | |__    | |__) |    /  \    | |
" | | |_ | |  __|   | . ` | |  __|   |  _  /    / /\ \   | |
" | |__| | | |____  | |\  | | |____  | | \ \   / ____ \  | |____
"  \_____| |______| |_| \_| |______| |_|  \_\ /_/    \_\ |______|

set nu									" Set numbers
set nocursorline				" Remove cursor line
set background=dark			" tmux backgraund fix
set ruler               " show line and column number
set scrolloff=5
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line

" Set gruvbox theme
colorscheme gruvbox
""""set background=light
highlight Normal ctermbg=None
" Color change commands:
command Light execute "set background=light"
command Dark execute "set background=dark"

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
nnoremap <space> za
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:vimroom_background="none"
set clipboard=unnamed


" MOUSE SUPPORT
:set mouse=a

" Set persistent undo
set undodir=~/.vim/undodir
set undofile

" read odt files in vim
autocmd BufReadPost *.odt :%!odt2txt %

" Bash Terminal
"
"	  _                   _______   ______  __   __
"	 | |          /\     |__   __| |  ____| \ \ / /
"	 | |         /  \       | |    | |__     \ V /
"	 | |        / /\ \      | |    |  __|     > <
"	 | |____   / ____ \     | |    | |____   / . \
"	 |______| /_/    \_\    |_|    |______| /_/ \_\

" Latex
" Pdf autoview settings
let g:livepreview_previewer = 'Okular'
