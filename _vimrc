set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-fakeclip'

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'scrooloose/syntastic' " RuboCop
NeoBundle 'tpope/vim-rails'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'briancollins/vim-jst'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

if has('vim_starting')
  call neobundle#end()
endif

filetype plugin indent on
filetype indent on
syntax on

set nobackup
set noswapfile

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
hi DiffAdd guibg=DarkMagenta ctermbg=DarkMagenta
hi DiffDelete guifg=Black guibg=LightMagenta ctermfg=Black ctermbg=LightMagenta
hi DiffText guibg=DarkGreen ctermfg=Black ctermbg=DarkGreen
hi DiffChange guibg=Gray30 ctermbg=DarkCyan ctermfg=White

"completion menu color
hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

"insert mode keymap
imap <C-e> <END>

" RuboCop
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

