let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
set guifont=Consolas:h10

set filetype=javascript

set t_Co=256

" go case sensitive if there are caps
set smartcase

" don't wrap a line
set nowrap

" keep 10 lines top and bottom for scope
set scrolloff=10

" show matched brackets
set showmatch

" show tabs
set list
" show tabs and trailing spaces
set listchars=tab:»\ ,trail:·

" don't insert extra pixel lines between rows
set linespace=0

" use mouse anywhere
set mouse=a

" make backspace a more flexible
set backspace=indent,eol,start

" load filetype plugins/indent settings
filetype plugin indent on

" setting history to 10000
set history=10000

" set background to a dark color
set background=dark

" allows for syntax processing
syntax enable

" autoindent
set shiftwidth=2
" shows number of visual spaces per tab
set tabstop=2
" shows number of spaces in tab when editting
set softtabstop=2
" sets tab button to place with 4 spaces
set expandtab

" shows line numbers
set number
set numberwidth=5

" shows the last command entered at the bottom right 
set showcmd

" highlights current line
set cursorline

" highlight matched searches
set hlsearch

" highlight as you type your search phrase
set incsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
