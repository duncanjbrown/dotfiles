function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin()

" File browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Surround with (), '' etc
Plug 'tpope/vim-surround'

" Repeat things achieved by surround
Plug 'tpope/vim-repeat'

" HUD at bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show Git status in page gutter
Plug 'airblade/vim-gitgutter'

" cx and cxx
Plug 'tommcdo/vim-exchange'

" Code completion
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Comments 
Plug 'tomtom/tcomment_vim'

" Take editorconfig into account
Plug 'editorconfig/editorconfig-vim'

" Permit splits to remain when killing buffer
Plug 'qpkorr/vim-bufkill'

" Linter
Plug 'neomake/neomake'

" Ruby bindings for plugins
Plug 'vim-ruby/vim-ruby'

" Rails shortcuts
Plug 'tpope/vim-rails'

" Enables vim-rspec to run in a tmux split
Plug 'tpope/vim-dispatch'

" Git tools
Plug 'tpope/vim-fugitive'

" Do.end for ruby
Plug 'tpope/vim-endwise'

" No need for pastetoggle
Plug 'ConradIrwin/vim-bracketed-paste'

" Visual undo
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }

" Paste with indentation
Plug 'sickill/vim-pasta'

" Display CSS colours
Plug 'ap/vim-css-color'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pretty icons in nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'

Plug 'kchmck/vim-coffee-script'
Plug 'janko-m/vim-test'

" REPL
Plug 'tpope/vim-fireplace'

" (sexps)
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" ((((rainbows))))
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

colorscheme hybrid
set nocompatible
filetype off

set background=dark
filetype plugin indent on

syntax enable

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
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
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

" Split to the right, and below, not to the left and above
set splitright
set splitbelow

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2

set guifont=Sauce\ Code\ Pro\ Medium\ Nerd\ Font\ Complete:h14 

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
