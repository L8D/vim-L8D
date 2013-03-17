syntax on
set number
set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=4

set t_Co=256

call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

"colorscheme anotherdark
"let g:inkpot_black_background = 1
colorscheme inkpot

set ignorecase
set smartcase

nnoremap ,l mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
vnoremap ,l may`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
