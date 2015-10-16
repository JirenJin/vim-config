set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" auto-completion
Plugin 'Valloric/YouCompleteMe'

" check syntacs
Plugin 'scrooloose/syntastic'

" auto-completion for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'

" python highlight
Plugin 'hdima/python-syntax'

" solarized color-scheme
Plugin 'altercation/vim-colors-solarized'



" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" set leader key
let g:mapleader=','
let mapleader=','

" open syntax highlight
syntax on

" let backspace work like other apps
set backspace=eol,start,indent

" automatically wrap left and right
set whichwrap+=<,>,h,l,[,]

" for easy regular-expression formula
set magic

" show command information in the last line
set showcmd

" show current vim mode
set showmode

" show row number
set number

set ruler

set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" highlight target text
set hlsearch
" highlight when you are typing
set incsearch

set ignorecase
set smartcase


" set fold for code
set foldenable
set foldmethod=indent
set foldlevel=99


" set indent
set smartindent
set autoindent

" set tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround


" hidden a buffer that is abandoned
set hidden
set ttyfast

set wildmode=list:longest




" setting for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0


" setting for Youcompleteme
set completeopt=longest,menu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" close preview when leaving Insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0

" python file setting
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# -*- coding:utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc


" set for solarized colorscheme
set background=light
colorscheme solarized
let t_Co=256


" setting for relative number in normal mode
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" set encoding for new file
set encoding=utf-8

" set options for auto deciding encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" set unix as default filetype for buffer
set ffs=unix,dos,mac

" enhance command line mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>

" force you to use jk instead of <esc>
inoremap jk <esc>

" no wrap for text
set nowrap 
