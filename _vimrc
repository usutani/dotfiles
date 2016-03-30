set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundle 'w0ng/vim-hybrid'

NeoBundle 'justinmk/vim-dirvish'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'scrooloose/syntastic' " RuboCop
NeoBundle 'tpope/vim-rails'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'briancollins/vim-jst'

NeoBundle 'fatih/vim-go'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

if has('vim_starting')
  call neobundle#end()
endif

filetype plugin indent on
filetype indent on
syntax on

"colorscheme
set background=dark
colorscheme hybrid

set nobackup
set noswapfile
set clipboard+=unnamed

"encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

let loaded_matchparen = 1
set showmatch
set number
highlight LineNr ctermfg=darkGray guifg=darkGray
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

"diff color
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

"completion menu color
hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

"insert mode keymap
imap <C-e> <END>

" RuboCop, JSHint
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'javascript', 'json'] }
let g:syntastic_ruby_checkers = ['rubocop']

"Go
if expand("%:t") =~ ".*\.go"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
  set nolist
endif
