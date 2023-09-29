call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/mason.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-dap'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'chriskempson/base16-vim'

" Editing
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'haya14busa/incsearch.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'
Plug 'gregsexton/MatchTag'

" External processes
Plug 'kassio/neoterm'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'
Plug 'tpope/vim-eunuch'

" Buffers
Plug 'schickling/vim-bufonly'
Plug 'mhinz/vim-sayonara'

" Syntax and language
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'stephpy/vim-yaml'
Plug 'Olical/conjure'
Plug 'clojure-vim/vim-jack-in'
Plug 'venantius/vim-cljfmt'
Plug 'bhurlow/vim-parinfer'
Plug 'guns/vim-clojure-static'
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'rust-lang/rust.vim'
Plug 'slim-template/vim-slim'
Plug 'preservim/vim-markdown'
Plug 'tartansandal/vim-compiler-pytest'

" Quickfix
Plug 'tpope/vim-unimpaired'

call plug#end()

if filereadable(expand("~/.vimrc_background"))
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
set laststatus=2
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

highlight Comment cterm=italic gui=italic

" unobtrusive vertical splits
highlight VertSplit guibg=NONE

" don't set mappings on <Leader>b etc
" https://github.com/qpkorr/vim-bufkill/issues/14
let g:BufKillCreateMappings = 0

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

" FZF for files changed since the last commit
command! FZFChangedFiles call fzf#run(fzf#wrap(
  \ {'source': 'git ls-files --exclude-standard --others --modified'}
  \ ))

" FZF for Most Recently Used files
command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

set termguicolors

lua <<EOF
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = "all", highlight = {enable = true}}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" % can jump between opening and closing tags
runtime macros/matchit.vim

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set shortmess+=c
set updatetime=300

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect


lua << EOF
  require("mason").setup()

  local nvim_lsp = require('lspconfig')

  nvim_lsp.solargraph.setup{
    cmd = { "bundle", "exec", "solargraph", "stdio" },
    settings = {
      solargraph = {
          completion = true,
        }
      }
  }

  nvim_lsp.clojure_lsp.setup {}

  nvim_lsp.pylsp.setup {}

  nvim_lsp.tsserver.setup {
    cmd = { "npx", "typescript-language-server", "--stdio" }
  }

  nvim_lsp.rust_analyzer.setup {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
          },
        }
      }
    }

  vim.g.coq_settings = {
    auto_start = 'shut-up',
  }

  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
EOF

autocmd FileType markdown setlocal wrap textwidth=80

let g:git_messenger_always_into_popup = v:true

let g:sayonara_confirm_quit = 1

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ['right:30%', 'ctrl-/']

" Conjure
let g:conjure#log#wrap = 'true'
let g:conjure#extract#tree_sitter#enabled = 'true'

" make vim-clojure-static agree with cljfmt
let g:clojure_align_subforms = 1

set grepprg=ag

hi Normal ctermbg=none
hi Normal guibg=none

set nofoldenable

