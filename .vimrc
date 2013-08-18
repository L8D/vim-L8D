syntax on
set number
set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=4
set ls=2
set list
set listchars=tab:\|_,trail:·,eol:¬
set cursorline
set fillchars=

augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
augroup END

" Syntastic
let g:syntastic_coffee_checkers = ['coffeelint']

" Space to toggle folds
nnoremap <Space> za
vnoremap <Space> za

nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

set noswapfile

" Until I find a need for H, K, or L, they will just be stuff that makes sense
nnoremap L $
nnoremap H 0
nnoremap K kJ

nnoremap vv ^vg_

cmap w!! w !sudo tee % >/dev/null

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

highlight OverLength ctermbg=bg ctermfg=red
match OverLength /\%81v.\+/

" Don't move on *
nnoremap * *<c-o>

let g:startify_show_files = 0

set directory=/tmp/vim-swp/

set ignorecase
set smartcase

" Dictionary lookup with ',l'
nnoremap ,l mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
vnoremap ,l may`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>

set hlsearch
" Clear hl with hlsearch
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

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
map <F3> :NERDTreeToggle<CR>
map Zz :w<CR>
map Za :wa<CR>
map ZA :wqa<CR>

" save states and stuff
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

" awesome folding
function MyFoldText()
  let line = getline(v:foldstart)
  let subl = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let endline = getline(v:foldend)
  let subel = substitute(endline, '/\*\|\*/\|{{{\d\=', '', 'g')
  return subl . ' … ' . subel
endfunction

set foldtext=MyFoldText()

"highlight Folded ctermbg=bg ctermfg=fg cterm=bold
hi clear Folded
hi Folded ctermbg=bg ctermfg=fg

highlight SignColumn ctermbg=bg
set foldmethod=syntax
set foldlevelstart=99

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" resize splits when window is resized
au VimResized * :wincmd =

" automatic removal of whitespace
autocmd BufWritePre * :%s/\s\+$//e
