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

" ORG
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" Ruby bindings for plugins
Plug 'vim-ruby/vim-ruby'

" Rails shortcuts
Plug 'tpope/vim-rails'

" Enables vim-rspec to run in a tmux split
Plug 'tpope/vim-dispatch'

" Git tools
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-rhubarb' " Enables :Gbrowse for GitHub
Plug 'junegunn/gv.vim'

" Do.end for ruby
Plug 'tpope/vim-endwise'

" No need for pastetoggle
Plug 'ConradIrwin/vim-bracketed-paste'

" Paste with indentation
Plug 'sickill/vim-pasta'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Registers and macros
Plug 'junegunn/vim-peekaboo'

" Pretty icons in nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'arcticicestudio/nord-vim'
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

" Distration-free mode
Plug 'junegunn/goyo.vim'

Plug 'wellle/targets.vim'

call plug#end()

colorscheme nord
set nocompatible

filetype plugin indent on

" never fold git commit details
autocmd FileType git set foldlevel=1

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

" Keep cursor away from the edge when scrolling
set scrolloff=12

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

set guifont=Sauce\ Code\ Pro\ Medium\ Nerd\ Font\ Complete:h14 

let g:peekaboo_window = 'vertical botright 80new'

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
