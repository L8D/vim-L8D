syntax on
set number
set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=4

" Set 256 color support
set t_Co=256

" Setup plugin support
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" Set colorscheme
colorscheme inkpot

set ignorecase
set smartcase

" Dictionary lookup with ',l'
nnoremap ,l mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
vnoremap ,l may`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>

" Smart and auto indent
set ai
set si
