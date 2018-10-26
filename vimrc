function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin()

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'
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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'haya14busa/incsearch.vim'
Plug 'sjl/gundo.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'

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
Plug 'luochen1990/rainbow', { 'for': ['clojure', 'clojurescript'] }
Plug 'bhurlow/vim-parinfer', { 'for': ['clojure', 'clojurescript'] }
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-endwise' " For Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'editorconfig/editorconfig-vim'
Plug 'afternoon/vim-phpunit'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Quickfix
Plug 'romainl/vim-qlist'
Plug 'tpope/vim-unimpaired'

Plug 'liuchengxu/vim-which-key'

call plug#end()

let base16colorspace=256

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

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

auto BufEnter * let &titlestring = expand("%:f")
set title
set laststatus=0
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

let g:rainbow_active = 1

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
  \| autocmd BufLeave <buffer> set showmode ruler

let g:fzf_layout = { 'window': '20split enew' }

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Always use ft=php.html in PHP files
au BufRead *.php set ft=php.html
au BufNewFile *.php set ft=php.html

" % can jump between opening and closing tags
runtime macros/matchit.vim

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

let g:ycm_autoclose_preview_window_after_insertion = 1
