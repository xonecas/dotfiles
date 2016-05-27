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
set list
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

map <leader>] :bnext<CR>
map <leader>[ :bprev<CR>
nmap <leader>e :e#<CR>
map <leader>b :buffers<CR>
map <leader>x :bdelete<CR>
nmap <leader>h :nohlsearch<CR>
map j gj
map k gk
nmap <leader>n :NERDTreeToggle<CR>

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


" Colors
set t_Co=256
set background=light
colorscheme hemisu
"hi Normal ctermbg=none

" Set the right indent for each file.
autocmd BufNewFile,BufRead *.py :set ts=4 sw=4
autocmd BufNewFile,BufRead *.html :set ts=2 sw=2 filetype=htmldjango
autocmd BufNewFile,BufRead *.js,*.scss :set ts=2 sw=2
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
