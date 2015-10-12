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
"set wildignore=*.class,*.o,*~,*.pyc,.git,third_party,node_modules,bower_components,static_root
set laststatus=2
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
command! Q q
command! W w


" Colors
set t_Co=256
set t_ut=
set background=dark
colorscheme badwolf
let g:badwolf_darkgutter = 1
let g:badwolf_html_link_underline = 0
let g:badwolf_css_props_highlight = 1


" Plugin stuff
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_sass_checkers = ['scss_lint']
"let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|min\.js|min\.css)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|static_root'


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" don't remove indent on python comments #
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#<space>
" Set the right indent for each file.
autocmd BufNewFile,BufRead *.py :set ts=4 sw=4
autocmd BufNewFile,BufRead *.html :set ts=2 sw=2 filetype=htmldjango
autocmd BufNewFile,BufRead *.js,*.scss :set ts=2 sw=2
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript


" lightline - badwolf
let s:red      = '#ff2c4b'
let s:green    = '#aeee00'
let s:blue     = '#0a9dff'
let s:orange   = '#ffa724'
let s:c_red    = '196'
let s:c_green  = '154'
let s:c_blue   = '39'
let s:c_orange = '214'
let s:white    = '#f8f6f2'
let s:c_white  = '15'
let s:black1   = '#242321'
let s:black2   = '#35322d'
let s:black3   = '#45413b'
let s:black4   = '#857f78'
let s:c_black1 = '235'
let s:c_black2 = '236'
let s:c_black3 = '233'
let s:c_black4 = '243'
let s:p = {
      \ 'normal':{},
      \ 'inactive':{},
      \ 'insert':{},
      \ 'replace':{},
      \ 'visual':{},
      \ 'tabline':{}
      \ }
let s:p.normal.middle = [
      \ [s:white, s:black1, s:c_white, s:c_black1]
      \ ]
let s:p.normal.left = [
      \ [s:black1, s:green, s:c_black1, s:c_green],
      \ [ s:white, s:black2, s:c_white, s:c_black2 ]
      \ ]
let s:p.normal.right = [
      \ [s:black4, s:white, s:c_black4, s:c_white],
      \ [ s:white, s:black2, s:c_white, s:c_black2 ]
      \ ]
let s:p.insert.left = [
      \ [s:white, s:blue, s:c_white, s:c_blue],
      \ [ s:white, s:black2, s:c_white, s:c_black2 ]
      \ ]
let s:p.visual.left = [
      \ [s:white, s:orange, s:c_white, s:c_orange],
      \ [ s:white, s:black2, s:c_white, s:c_black2 ]
      \ ]
let s:p.replace.left = [
      \ [s:white, s:red, s:c_white, s:c_red],
      \ [ s:white, s:black2, s:c_white, s:c_black2 ]
      \ ]
let s:p.inactive.middle = [
      \ [s:white, s:black2, s:c_white, s:c_black2]
      \ ]
let s:p.inactive.right = [
      \ s:p.inactive.middle[0],
      \ s:p.inactive.middle[0]
      \ ]
let s:p.inactive.left = [
      \ s:p.inactive.middle[0],
      \ s:p.inactive.middle[0]
      \ ]
let s:p.tabline.middle = [
      \ [s:white, s:black2, s:c_white, s:c_black2]
      \ ]
let s:p.tabline.right = [
      \ [s:white, s:black2, s:c_white, s:c_black2]
      \ ]
let s:p.tabline.left = [
      \ [s:black4, s:black2, s:c_black4, s:c_black2]
      \ ]
" current tab
let s:p.tabline.tabsel = [
      \ [s:black1, s:green, s:c_white, s:c_black4]
      \ ]
let g:lightline#colorscheme#badwolf#palette = lightline#colorscheme#fill(s:p)


let g:lightline = {
      \ 'colorscheme': 'badwolf',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
