execute pathogen#infect()
syntax on
filetype plugin indent on

set number
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
set wildignore=*.class,*.o,*~,*.pyc,.git,third_party,node_modules,bower_components,static_root
set laststatus=2
set list
set lcs=trail:.,eol:$,tab:>-

map <leader>] :bnext<CR>
map <leader>[ :bprev<CR>
nmap <leader>e :e#<CR>
map <leader>b :buffers<CR>
map <leader>x :bdelete<CR>
nmap <leader>h :nohlsearch<CR>
map j gj
map k gk
nmap ; :CtrlPBuffer<CR>
nmap ' :CtrlPFile<CR>
" I always work on 4 or 2 spaces indent files :)
set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
map <leader>2 :set ts=2 <bar> set sw=2<CR>
map <leader>4 :set ts=4 <bar> set sw=4<CR>
" don't remove indent on python comments #
autocmd BufRead *.py inoremap # X<c-h>#<space>

command! Q q
command! W w

set t_Co=256
set t_ut=
set background=dark
colorscheme bubblegum-256-dark

" Plugin stuff
let g:airline_theme="bubblegum"
let g:airline_powerline_fonts = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_sass_checkers = ['scss_lint']
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|min\.js|min\.css)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|static_root'

hi IndentGuidesOdd ctermbg=235
hi IndentGuidesEven ctermbg=236
au VimEnter * :IndentGuidesEnable
