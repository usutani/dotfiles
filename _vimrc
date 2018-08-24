"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/usutani/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/usutani/.cache/dein')
  call dein#begin('/Users/usutani/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/usutani/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('w0ng/vim-hybrid') "colorscheme
  call dein#add('justinmk/vim-dirvish') "Directory viewer
  call dein#add('ctrlpvim/ctrlp.vim') "Fuzzy file finder
  call dein#add('kana/vim-fakeclip') "tmux
  call dein#add('w0rp/ale') "Asynchronous Lint Engine

  call dein#add('vim-ruby/vim-ruby')
  call dein#add('ngmy/vim-rubocop')
  call dein#add('tpope/vim-rails')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('pangloss/vim-javascript')
  call dein#add('briancollins/vim-jst')

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
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set backspace=indent,eol,start

let loaded_matchparen = 1
set showmatch
set number
set hlsearch

set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=+1
  autocmd FileType vim,ruby setlocal textwidth=80
endif
highlight ColorColumn ctermbg=235 guibg=#262626

set list
set listchars=trail:.,nbsp:%
highlight SpecialKey term=underline ctermfg=Blue guifg=Blue
"全角スペース
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

"行末スペース
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"Programming language---------------------
"ale
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

"Color------------------------------------
"colorscheme
set background=dark
colorscheme hybrid

