function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin()

" File browser
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }

" Surround with (), '' etc
Plug 'tpope/vim-surround'

" Repeat things achieved by surround
Plug 'tpope/vim-repeat'

" HUD at bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show Git status in page gutter
Plug 'airblade/vim-gitgutter'

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

" Ruby bindings for plugins
Plug 'vim-ruby/vim-ruby'

" e.g. vir to select the inside of a block
Plug 'nelstrom/vim-textobj-rubyblock'

" Rails shortcuts
Plug 'tpope/vim-rails'

" Enables vim-rspec to run in a tmux split
Plug 'tpope/vim-dispatch'

" Git tools
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-rhubarb' " Enables :Gbrowse for GitHub
Plug 'junegunn/gv.vim'
Plug 'idanarye/vim-merginal' " branching for fugitive

" Do.end for ruby
Plug 'tpope/vim-endwise'

" No need for pastetoggle
Plug 'ConradIrwin/vim-bracketed-paste'

" Paste with indentation
Plug 'sickill/vim-pasta'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pretty icons in nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'chriskempson/base16-vim'

Plug 'kchmck/vim-coffee-script'
Plug 'janko-m/vim-test'

" REPL, sexps, rainbows
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'clojurescript'] }
Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure', 'clojurescript'] }
Plug 'bhurlow/vim-parinfer', { 'for': ['clojure', 'clojurescript'] }

" ae and ie for the whole buffer
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'

" Distration-free mode
Plug 'junegunn/goyo.vim'

" Use a terminal as a REPL
Plug 'kassio/neoterm'

" Delete all other buffers
Plug 'schickling/vim-bufonly'

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
set showcmd " print building command on lower RHS
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

" Ever-living undo
set undofile

" Keep cursor away from the edge when scrolling
set scrolloff=12

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

set guifont=Sauce\ Code\ Pro\ Medium\ Nerd\ Font\ Complete:h14

highlight Comment cterm=italic

" don't set mappings on <Leader>b etc
" https://github.com/qpkorr/vim-bufkill/issues/14
let g:BufKillCreateMappings = 0

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

