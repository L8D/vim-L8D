syntax on
set number
set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=4
set ls=2

" Set 256 color support
set t_Co=256

" Setup plugin support
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" Set colorscheme
" colorscheme inkpot
set background=dark
colorscheme solarized

let g:startify_show_files = 0

set directory=/tmp/vim-swp/

set ignorecase
set smartcase

" Dictionary lookup with ',l'
nnoremap ,l mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
vnoremap ,l may`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>

" Smart and auto indent
set ai
set si

" Return to last edit position when opening files
autocmd BufReadPost *
     \  if line("'\"") > 0 && line("'\"") <= line("$") |
     \  exe "normal! g`\"" |
     \  endif
" Remember info about open buffers on close
set viminfo^=%

" Seperate undo file
set undodir=~/.vim_runtime/temp_dirs/undodir
set undofile

let g:vim_markdown_folding_disabled=1

set pastetoggle=<F2>
