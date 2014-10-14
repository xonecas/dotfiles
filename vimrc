execute pathogen#infect()
syntax on
filetype plugin indent on

set relativenumber
set nocompatible
set encoding=utf-8
set ruler
set colorcolumn=100
set incsearch
set smartcase
set smartindent
set cinkeys-=0#
set hlsearch
set linebreak
set autoindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set pastetoggle=<F2>
set noswapfile
set nobackup
set autoread
set hidden
set wildmenu
set wildmode=list:longest,full
set wildignore=*.class,*.o,*~,*.pyc,.git,third_party,node_modules
set laststatus=2
set list
set listchars=tab:▸\ ,trail:•,eol:¬

map <leader>] :bnext<CR>
map <leader>[ :bprev<CR>
nmap <leader>e :e#<CR>
map <leader>b :buffers<CR>
map <leader>x :bdelete<CR>
nmap <leader>h :nohlsearch<CR>
map j gj
map k gk

command! Q q
command! W w

set t_Co=256
set t_ut=
colorscheme gotham256
let g:airline_powerline_fonts=0