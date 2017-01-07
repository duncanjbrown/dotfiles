call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'thoughtbot/vim-rspec'
Plug 'neomake/neomake'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'mileszs/ack.vim'
Plug 'schickling/vim-bufonly'
Plug 'mtth/scratch.vim'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'junegunn/gv.vim'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme hybrid
set nocompatible
filetype off

set background=dark
filetype plugin indent on

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set showmatch " highlight matching parens
set showmode
set smarttab

set nrformats-=octal " Do not permit octals when adding using <c-A> and <c-X>
set shiftround " Round indents to a multiple of shiftwidth

" Timeout for leader
set ttimeout
set ttimeoutlen=50

set laststatus=2
set ruler " line and column under cursor
set showcmd " print building command on lower RHS
set wildmenu

set autoread  " reload changed files

set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

set completeopt=menuone,longest,preview

" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}

" Split to the right, and below, not to the left and above
set splitright
set splitbelow

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
