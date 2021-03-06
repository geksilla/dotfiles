set nocompatible

"Plugins: {{{
call plug#begin(expand('~/.vim/plugged/'))

Plug 'mhinz/vim-startify'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neossh.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-haml'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'honza/vim-snippets'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'notpratheek/vim-luna'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/simple-javascript-indenter', { 'for': ['javascript'] }
Plug 'jiangmiao/auto-pairs'
Plug 'othree/yajs.vim', { 'for': ['javascript'] }
Plug 'marijnh/tern_for_vim', { 'for': ['javascript'] }
Plug 'luochen1990/rainbow'
Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'no \| ./install'  }
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'moll/vim-bbye', { 'on': 'Bdelete' }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'bogado/file-line'
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee']}
Plug 'jpo/vim-railscasts-theme'
Plug 'ryanoasis/vim-devicons'
Plug 'hecal3/vim-leader-guide'

call plug#end()
" }}}

"Defaults: {{{
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set autoread
set autowrite
set nu " line numbers
set t_ut=
set t_Co=256 " nice colors in therminal
set ttimeoutlen=50
set encoding=utf-8
set laststatus=2
set backspace=2

set cursorline
set columns=90
set colorcolumn=90,100
set mouse=a

" default tab width
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " no tabs!!!

set nobackup
set noswapfile

set ignorecase
set smartcase
set smartindent

set hlsearch
set incsearch
set noshowmode
set showmatch
set showcmd

colorscheme railscasts
" get my shell
set shell=/bin/zsh
set shellcmdflag=-lc

" silver searcher rocks!
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

if has('gui_running')
  " set fullscreen on start
  set guifont=Monaco
  set lines=999 columns=999
  set guioptions-=M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

set foldmethod=marker
"Ignore: {{{
set wildignore=*.o,*.obj,*~,*.pyc "stuff to ignore when tab completing
set wildignore+=.env
set wildignore+=.env[0-9]+
set wildignore+=.env-pypy
set wildignore+=.git,.gitkeep
set wildignore+=.tmp
set wildignore+=.coverage
set wildignore+=*DS_Store*
set wildignore+=.sass-cache/
set wildignore+=__pycache__/
set wildignore+=.webassets-cache/
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=.tox/**
set wildignore+=.idea/**
set wildignore+=.vagrant/**
set wildignore+=.coverage/**
set wildignore+=*.egg,*.egg-info
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app
" }}}
au BufNewFile,BufRead *.js setf javascript
au BufNewFile,BufRead *.jsm setf javascript
" }}}

" leader-guide BEGIN: {{{
let g:lmap = {}
let g:lmap.f = { 
      \'name' : 'Open File',
      \'s' : ['w', 'Save File'],
      \'d' : ['e $MYVIMRC', 'Open .vimrc'],
      \'r' : ['so $MYVIMRC', 'Reload .vimrc']
      \}
let g:lmap.t = { 'name' : 'Toggle' }
let g:lmap.t.h = ['noh', 'highlight']
" }}}

"Key Maps: {{{
let mapleader="\<Space>"
let g:mapleader="\<Space>"
let maplocalleader="\<Space>"
let g:maplocalleader="\<Space>"

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>P "+P
vmap <Leader>P "+P
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
let g:lmap.b = { 'name' : 'Buffer' }
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bk :Bdelete<CR>

" Git
let g:lmap.g = { 'name' : 'Git' }
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gD :Gdiff<CR>
nnoremap <Leader>gdn :GitGutterNextHunk<CR>
nnoremap <Leader>gdN :GitGutterPrevHunk<CR>
nnoremap <Leader>gdr :GitGutterRevertHunk<CR>
nnoremap <Leader>ghd :GitGutterPreviewHunk<CR>

let g:lmap.p = { 'name' : 'Project' }
nnoremap <Leader>pt :NERDTreeToggle<CR>
nnoremap <Leader>pf :FZF<CR>
nnoremap <Leader>pst :TagbarToggle<CR>
nnoremap <Leader>=j :%!python -m json.tool<CR>

let g:lmap.q = { 'name' : 'Quit',
      \'q' : ['q', 'quit'],
      \'Q' : ['q!', '!quit']
      \}
" }}}

"neocomplete/neosnippet: {{{
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#use_vimproc = 1

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
" }}}

"vim-airline: {{{
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '⮀'
"let g:airline#extensions#tabline#left_alt_sep = '⮁'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_theme = "bubblegum"

let g:airline_left_sep = "\uE0C0"
let g:airline_right_sep = "\uE0C7"
" }}}

"unite: {{{
let g:unite_split_rule = "botright"
let g:unite_source_grep_max_candidates = 200
let g:unite_source_history_yank_enable = 1

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif
" like CtrlP
nnoremap <silent> <C-p> :<C-u>Unite -start-insert file_rec/async:! buffer file_mru<CR>
nnoremap <silent> <Leader>ff :<C-u>UniteWithCursorWord file_rec<CR>
" find by current word
nnoremap <silent> <Leader>fw :<C-u>UniteWithCursorWord -start-insert grep<CR>
" start grep
nnoremap <silent> <Leader>fa :<C-u>Unite -start-insert grep:. <CR>
" search selection
vnoremap <silent> <leader>fa "Zy :<C-u>Unite -start-insert grep:.<CR><C-r>Z<CR>
" yank history
nnoremap <silent> <leader>y :<C-u>Unite history/yank<CR>
" buffer list
nnoremap <silent> <Leader>bb :<C-u>Unite -start-insert buffer<CR>

try
  " Set up some custom ignores
  call unite#custom#source('buffer,file,file_rec/async,file_rec,file_mru,file,grep',
        \ 'ignore_pattern', join([
        \ '\.DS_Store',
        \ '\.tmp/',
        \ '\.git/',
        \ '\.gitkeep',
        \ '\.hg/',
        \ '\.tox',
        \ '\.idea',
        \ '\.pyc',
        \ '\.png',
        \ '\.gif',
        \ '\.jpg',
        \ '\.svg',
        \ '\.eot',
        \ '\.ttf',
        \ '\.woff',
        \ '\.ico',
        \ '\.o',
        \ '__pycache__',
        \ '.env',
        \ '.env*',
        \ '.vagrant',
        \ '_build',
        \ 'dist',
        \ '*.tar.gz',
        \ '*.zip',
        \ 'node_modules',
        \ 'bower_components',
        \ '.*\.egg',
        \ '*.egg-info',
        \ '.*egg-info.*',
        \ 'git5/.*/review/',
        \ 'google/obj/',
        \ '\.webassets-cache/',
        \ '\.sass-cache/',
        \ '\.coverage/',
        \ '\.m2/',
        \ '\.activator/',
        \ '\.composer/',
        \ '\.cache/',
        \ '\.npm/',
        \ '\.node-gyp/',
        \ '\.sbt/',
        \ '\.ivy2/',
        \ '\.local/activator/',
        \ ], '\|'))
catch
endtry

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
" }}}

" easymotion: {{{
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:lmap.j = {
      \'name' : 'jump',
      \'w' : ['call feedkeys("\<Plug>(easymotion-bd-w)")', 'Word'],
      \'j' : ['call feedkeys("\<Plug>(easymotion-bd-f)")', 'Char']
      \}
" }}}

"Syntastic: {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
" }}}

" Rainbow: {{{
let g:rainbow_active=1
" }}}

" vim-multiple-cursors {{{
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
" }}}

" emmet-vim {{{
let g:user_emmet_leader_key='<C-J>'
" }}}

" vim-go {{{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <leader>mgg <Plug>(go-def)
au FileType go nmap <leader>mgd <Plug>(go-doc)
au FileType go nmap <leader>mpr <Plug>(go-run)
au FileType go nmap <leader>mpb <Plug>(go-build)
" }}}

" javascript {{{

let g:tern_show_argument_hints = 'on_move'
let g:tern_show_signature_in_pum = 1

au FileType javascript nmap <Leader>mgg :TernDef<CR>
au FileType javascript nmap <Leader>mgG :TernDefSplit<CR>
au FileType javascript nmap <Leader>mgr :TernRefs<CR>
au FileType javascript nmap <Leader>mhd :TernDoc<CR>
au FileType javascript nmap <Leader>mhD :TernDocBrowse<CR>
au FileType javascript nmap <Leader>mrr :TernRename<CR>
" }}}

" session {{{
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
" }}}

" {{{ vim-startify
let g:startify_custom_header = []
" }}}

" leader-guide END: {{{
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
" }}}
