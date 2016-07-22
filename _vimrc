if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('w0ng/vim-hybrid')
call dein#add('justinmk/vim-dirvish')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('kana/vim-fakeclip') "tmux

"call dein#add('neocomplete.vim')
"call dein#add('Shougo/neosnippet')
"call dein#add('Shougo/neosnippet-snippets')

call dein#add('vim-ruby/vim-ruby')
"call dein#add('tpope/vim-endwise')
call dein#add('ngmy/vim-rubocop')
call dein#add('tpope/vim-rails')
call dein#add('kchmck/vim-coffee-script')
call dein#add('pangloss/vim-javascript')
call dein#add('briancollins/vim-jst')

call dein#add('fatih/vim-go')

call dein#add('tpope/vim-fugitive')
call dein#add('gregsexton/gitv')

call dein#end()

"neocomplete
"let g:neocomplete#enable_at_startup = 1
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"neosnippet
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif

filetype plugin indent on
syntax on

if dein#check_install()
  call dein#install()
endif

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
set backspace=indent,eol,start

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

"行末スペース
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

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
