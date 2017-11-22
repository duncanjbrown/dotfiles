function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin()

" Git
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'
Plug 'idanarye/vim-merginal' " branching for fugitive
Plug 'airblade/vim-gitgutter'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'chriskempson/base16-vim'

" Editing
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'sickill/vim-pasta'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'haya14busa/incsearch.vim'
Plug 'sjl/gundo.vim'

" External processes
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'
Plug 'tpope/vim-eunuch'

" Buffers
Plug 'schickling/vim-bufonly'
Plug 'qpkorr/vim-bufkill'

" Syntax and language
Plug 'smerrill/vcl-vim-plugin'
Plug 'chr4/nginx.vim'
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'clojurescript'] }
Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure', 'clojurescript'] }
Plug 'bhurlow/vim-parinfer', { 'for': ['clojure', 'clojurescript'] }
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-endwise' " For Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'editorconfig/editorconfig-vim'

" Navigation
Plug 'tpope/vim-vinegar'

" Quickfix
Plug 'romainl/vim-qlist'
Plug 'tpope/vim-unimpaired'

call plug#end()

let base16colorspace=256
set nocompatible

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

filetype plugin indent on

" never fold git commit details
autocmd FileType git set foldlevel=1

syntax enable " enable syntax highlighting

set autoindent
set backspace=indent,eol,start
set showmatch " highlight matching parens
set showmode " display the mode

set nrformats-=octal " Do not permit octals when adding using <c-A> and <c-X>
set shiftround " Round indents to a multiple of shiftwidth

" Timeout for leader
set ttimeout
set ttimeoutlen=50

set laststatus=2 " always show a statusline in inactive windows
set ruler " line and column under cursor
set wildmenu
set cursorline " highlight the current line

set autoread  " reload changed files

set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

if has('mouse')
  set mouse=a
endif

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

set completeopt=menuone,longest,preview

set inccommand=split

" Split to the right, and below, not to the left and above
set splitright
set splitbelow

" Expand tabs by default
set expandtab

" Ever-living undo
set undofile

" don't bother with showcmd
set noshowcmd

" Keep cursor away from the edge when scrolling
set scrolloff=12

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

highlight Comment cterm=italic

" don't set mappings on <Leader>b etc
" https://github.com/qpkorr/vim-bufkill/issues/14
let g:BufKillCreateMappings = 0
" dont remap leader-f to ranger
let g:ranger_map_keys = 0

let g:clipboard = {
      \   'name': 'tmuxClipboard',
      \   'copy': {
      \      '+': 'tmux load-buffer -',
      \      '*': 'pbcopy',
      \    },
      \   'paste': {
      \      '+': 'tmux save-buffer -',
      \      '*': 'pbpaste',
      \   },
      \   'cache_enabled': 1,
      \ }

set clipboard=unnamedplus

au TermOpen * setlocal nonumber norelativenumber

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
