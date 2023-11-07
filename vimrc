call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/mason.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" DAP
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'

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
Plug 'rust-lang/rust.vim'
Plug 'slim-template/vim-slim'
Plug 'preservim/vim-markdown'
Plug 'tartansandal/vim-compiler-pytest'
Plug 'tweekmonster/django-plus.vim'

" Quickfix
Plug 'tpope/vim-unimpaired'

" Navigation
Plug 'preservim/nerdtree'

call plug#end()

lua << EOF
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  vim.o.mouse = 'a'
  vim.o.hidden = true

  vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
  })

  require("mason").setup()

  require('appearance')
  require('fzf')
  require('tree-sitter')
  require('clipboard')
  require('disk')
  require('lsp')
  require('dap-config')
  require('conjure')
  require('whitespace')
  require('sayonara')

  vim.o.grepprg = ag
  vim.o.inccommand = 'split'

  vim.o.updatetime = 300
  vim.o.ttimeout = true
  vim.o.ttimeoutlen = 50

  vim.api.nvim_set_keymap('n', '0', '^', { noremap = true })
  vim.api.nvim_set_keymap('n', '^', '0', { noremap = true })
EOF

