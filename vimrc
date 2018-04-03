set nocompatible              " be iMproved, required

""" Vim Plug
call plug#begin()
" solarized color-scheme
Plug 'altercation/vim-colors-solarized'

" track the engine.
Plug 'SirVer/ultisnips'

" snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" auto-completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" auto syntax check
"Plug 'vim-syntastic/syntastic'

" all about surroundings
Plug 'tpope/vim-surround'

" complementary pairs of mappings
Plug 'tpope/vim-unimpaired'

" show a git diff in the 'gutter' (sign column)
Plug 'airblade/vim-gitgutter'

" easy toggle comments
Plug 'scrooloose/nerdcommenter'

" a tree explorer
Plug 'scrooloose/nerdtree'

call plug#end()
"""


"""Customization Starts from here

" set leader key
map <space> <leader>

" enable syntax highlighting
syntax on

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


" set smartindent

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

" toggle on paste mode
nnoremap <leader>pp :set paste!<CR>

" fast saving
nnoremap <leader>w :w<CR>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.vim/viminfo
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

set undofile                 " turn on the feature
set undodir=$HOME/.vim/undo  " directory where the undo files will be stored

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

" at least 7 lines before or after current line is shown
set so=7

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" automatically remove trailing spaces
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> %s/\s\+$//e

" pep8 setting
set colorcolumn=80

""" Plugin Setting
" set for solarized colorscheme
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Youcompletme setting
"let g:ycm_path_to_python_interpreter="/jin/.pyenv/shims/python"
let g:ycm_server_python_interpreter = "python"
let g:ycm_python_binary_path = "python"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

" vim-gitgutter setting
set updatetime=100

" nerdtree setting
map <C-m> :NERDTreeToggle<CR>
