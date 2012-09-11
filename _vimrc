set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kana/vim-fakeclip'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'kana/vim-smartinput'
Bundle 'thinca/vim-quickrun'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'

"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-fugitive'

filetype plugin indent on
syntax enable

set nobackup
set noswapfile

"encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos

"set tabstop=4
"set shiftwidth=4
"set expandtab
"
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
"
set showmatch
set number
highlight LineNr ctermfg=darkGray guifg=darkGray
set cursorline

set list
set listchars=trail:.,nbsp:%
highlight SpecialKey term=underline ctermfg=Blue guifg=Blue
"全角スペース
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

" diff color
hi DiffAdd guibg=DarkMagenta ctermbg=DarkMagenta
hi DiffDelete guifg=Black guibg=LightMagenta ctermfg=Black ctermbg=LightMagenta
hi DiffText guibg=DarkGreen ctermfg=Black ctermbg=DarkGreen
hi DiffChange guibg=Gray30 ctermbg=DarkCyan ctermfg=White

"completion menu color
hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

"nnoremap p :r !pbpaste<CR>
"vnoremap p :r !pbpaste<CR>
"nnoremap y :.w !pbcopy<CR><CR>
"vnoremap y :w !pbcopy<CR><CR>

"quickrun
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" HTML, ERB
call smartinput#map_to_trigger('i', '<', '<', '<')
call smartinput#map_to_trigger('i', '>', '>', '>')
call smartinput#define_rule({
\   'at': '\%#', 'char': '<', 'input': '<><left>',
\   'filetype': ['html', 'eruby'],
\ })
call smartinput#define_rule({
\   'at': '<.*\%#.*>', 'char': '>', 'input': '<right>',
\   'filetype': ['html', 'eruby'],
\ })

" ERB
call smartinput#map_to_trigger('i', '%', '%', '%')
call smartinput#define_rule({
\   'at': '<\%#', 'char': '%', 'input': '%%<left>',
\   'filetype': ['eruby'],
\ })
call smartinput#define_rule({
\   'at': '%.*\%#.*%', 'char': '%', 'input': '<right>',
\   'filetype': ['eruby'],
\ })
