execute pathogen#infect()
syntax on
filetype plugin indent on

set relativenumber
set nocompatible
set encoding=utf-8
set ruler
set colorcolumn=80
set incsearch
set smartcase
set smartindent
set cinkeys-=0#
set hlsearch
set linebreak
set pastetoggle=<F2>
set noswapfile
set nobackup
set autoread
set hidden
set wildmenu
set wildmode=list:longest,full
set wildignore=*.pyc
set list
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set backspace=2 " make backspace work like most other apps
set laststatus=2

map <leader>] :bnext<CR>
map <leader>[ :bprev<CR>
nmap <leader>e :e#<CR>
map <leader>b :CommandTBuffer<CR>
map <leader>r :CommandTMRU<CR>
map <leader>x :bdelete<CR>
nmap <leader>h :nohlsearch<CR>
map <leader>n :NERDTreeToggle<CR>
map j gj
map k gk

" I always work on 4 or 2 spaces indent files :)
set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
map <leader>2 :set ts=2 <bar> set sw=2<CR>
map <leader>4 :set ts=4 <bar> set sw=4<CR>
command! Q q
command! W w

" Syntax helpers
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_sass_checkers = ['scss_lint']

" use git file scanner for Cmd+T
let g:CommandTFileScanner = 'git'

let g:airline_powerline_fonts=1
let g:closetag_filenames = "*.html,*.jinja2,*.jinja2_fe"

" Tagbar stuffs
nmap <F8> :TagbarToggle<CR>

" Set the right indent for each file.
autocmd BufNewFile,BufRead *.py :set ts=4 sw=4
autocmd BufNewFile,BufRead *.html :set ts=2 sw=2 filetype=htmldjango
autocmd BufNewFile,BufRead *.js,*.scss, :set ts=2 sw=2
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd BufNewFile,BufRead *.jinja2,*.jinja2_fe :set ts=2 sw=2 filetype=jinja

" Colors
if has("termguicolors")
  set termguicolors
endif
set t_Co=256
set background=dark

"colorscheme seattle
"colorscheme pencil
colorscheme badwolf
"colorscheme distinguished
"colorscheme hemisu
"colorscheme hybrid
"colorscheme jellybeans
"colorscheme molokai
"colorscheme nord
"colorscheme quantum
"colorscheme spacegray
"colorscheme tender
"colorscheme getafe
"colorscheme monrovia
"colorscheme minimalist
"let g:airline_theme='minimalist'
"let g:airline_theme='bubblegum'
"let g:airline_theme='distinguished'
"let g:airline_theme='quantum'
"let g:airline_theme='tender'
"let g:molokai_original=1
"let g:quantum_black = 1
"let g:rehash256=1
