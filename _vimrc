set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kana/vim-fakeclip'
Bundle 'ack.vim'

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'taichouchou2/vim-rsense'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'kana/vim-smartinput'
"FIXME Bundle 'usutani/snipmate.vim'
Bundle 'thinca/vim-quickrun'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'

"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

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
let loaded_matchparen = 1
set showmatch
set number
highlight LineNr ctermfg=darkGray guifg=darkGray

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

"insert mode keymap
imap <C-e> <END>

"ack.vim
map <C-W>a :let a=expand("<cword>")<CR>:tabnew<CR>:Ack <C-R>=expand(a)<CR> ./<CR>
map <C-W>A :let a=expand("<cword>")<CR>:tabnew<CR>:Ack <C-R>=expand(a)<CR> ./

"nnoremap p :r !pbpaste<CR>
"vnoremap p :r !pbpaste<CR>
"nnoremap y :.w !pbcopy<CR><CR>
"vnoremap y :w !pbcopy<CR><CR>

"neocomplcache
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let snippets_dir='~/.vim/bundle/snipmate-snippets/snippets'
if isdirectory(snippets_dir)
  let g:neosnippet#snippets_directory=snippets_dir
endif
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

"quickrun
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" Rails
call smartinput#map_to_trigger('i', '<C-p>', '<C-p>', '<C-p>')
call smartinput#define_rule({
\   'at': '\%#', 'char': '<C-p>', 'input': 'params[:]<left>',
\   'filetype': ['ruby'],
\ })

" HTML, ERB
call smartinput#map_to_trigger('i', '<', '<', '<')
call smartinput#map_to_trigger('i', '>', '>', '>')
call smartinput#define_rule({
\   'at': '\%#', 'char': '<', 'input': '<><left>',
\   'filetype': ['html', 'eruby'],
\ })
call smartinput#define_rule({
\   'at': '<.*\%#>', 'char': '>', 'input': '<right>',
\   'filetype': ['html', 'eruby'],
\ })

" ERB
call smartinput#map_to_trigger('i', '%', '%', '%')
call smartinput#define_rule({
\   'at': '<\%#', 'char': '%', 'input': '%%<left>',
\   'filetype': ['eruby'],
\ })
call smartinput#define_rule({
\   'at': '%.*\%#%', 'char': '%', 'input': '<right>',
\   'filetype': ['eruby'],
\ })
