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

" syntax highlighting for markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" high-speed vim for html and css
" I like it very much!
Plugin 'mattn/emmet-vim'

" highlight for css3 and html
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'

" easily delete, change and add surroundings: parentheses, brackets, quotes
" and tags
Plugin 'tpope/vim-surround'

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
map <space> <leader>

" enable syntax highlighting
syntax on

" allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
" it seems that I do not like working this way...
" set hidden



" set encoding for new file
set encoding=utf-8

" better command-line completion
set wildmenu

" let backspace work like other apps, allow backspacing over autoindent, line
" breaks and start of insert action
set backspace=eol,start,indent

" automatically wrap left and right
set whichwrap+=<,>,h,l,[,]

" for easy regular-expression formula
set magic

" show partial commands in the last line of the screen
set showcmd

" show current vim mode
set showmode

" display line numbers on the left
set number

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" show the cursor's current line
set cursorline

set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" highlight searches
set hlsearch

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" highlight when you are typing
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase


" set fold for code
set foldenable
set foldmethod=indent
set foldlevel=99


" set indent
set smartindent

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround

" toggle spell checking
nnoremap <leader>s :set spell!<CR>

" make . usable in visual mode
vnoremap . :norm.<CR>

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

let g:ycm_path_to_python_interpreter="/home/jin/.pyenv/shims/python"
let g:ycm_confirm_extra_conf=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files=0

" python file setting
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai


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
" set nowrap

" set textwidth for python
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79


" Don't redraw while executing macros (good performance config)
" set lazyredraw

" toggle on paste mode
nnoremap <leader>pp :set paste!<CR>

" fast saving
nnoremap <leader>w :w!<CR>

set so=7

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

set undofile                 "turn on the feature
set undodir=$HOME/.vim/undo  "directory where the undo files will be stored


" set for solarized colorscheme
set background=dark
colorscheme solarized

