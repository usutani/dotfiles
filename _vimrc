"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('w0ng/vim-hybrid') "colorscheme
  call dein#add('tpope/vim-fugitive') "fugitive
  call dein#add('itchyny/lightline.vim') "lightline
  call dein#add('preservim/nerdtree') "NERDTree
  " call dein#add('justinmk/vim-dirvish') "Directory viewer
  " call dein#add('ctrlpvim/ctrlp.vim') "Fuzzy file finder
  call dein#add('kana/vim-fakeclip') "tmux
  call dein#add('w0rp/ale') "Asynchronous Lint Engine

  call dein#add('ngmy/vim-rubocop')
  call dein#add('tpope/vim-rails')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('othree/yajs.vim')
  call dein#add('briancollins/vim-jst')
  call dein#add('slim-template/vim-slim.git')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set nobackup
set noswapfile

set clipboard+=unnamed

"encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos

set hlsearch
set list
set number
set showmatch
set textwidth=0

set autoindent
set backspace=indent,eol,start
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2

"Programming language---------------------
"ale
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

"Color------------------------------------
"colorscheme
set background=dark
colorscheme hybrid

if exists('&colorcolumn')
  set colorcolumn=+1
  autocmd FileType vim,ruby setlocal textwidth=80
endif

"lightline
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat' }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste', 'modified' ],
    \           [ 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
    \ 'left': [ ['modified'], [ 'relativepath' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ] }

"NERDTree---------------------------------
"NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Change cursor shape in different modes
"https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
"Mode Settings
"For Terminal on macOS
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"行末スペース
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

autocmd InsertLeave * set nopaste
