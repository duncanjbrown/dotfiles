call plug#begin()

Plug 'dstein64/vim-startuptime'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/mason.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" DAP
" Plug 'mfussenegger/nvim-dap'
" Plug 'mfussenegger/nvim-dap-python'
" Plug 'rcarriga/nvim-dap-ui'

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
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'haya14busa/incsearch.vim'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'junegunn/vim-easy-align'
Plug 'gregsexton/MatchTag'

" External processes
" Plug 'kassio/neoterm'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
" Plug 'j-hui/fidget.nvim'

" Buffers
Plug 'schickling/vim-bufonly'
Plug 'mhinz/vim-sayonara'

" Ruby
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-rbenv'
" Plug 'tpope/vim-bundler'
" Plug 'vim-ruby/vim-ruby'
" Plug 'nelstrom/vim-textobj-rubyblock'

" JS
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" clj
Plug 'Olical/conjure'
Plug 'clojure-vim/vim-jack-in'
Plug 'venantius/vim-cljfmt'
Plug 'bhurlow/vim-parinfer'
Plug 'guns/vim-clojure-static'

" py
Plug 'tartansandal/vim-compiler-pytest'
Plug 'tweekmonster/django-plus.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'Vimjas/vim-python-pep8-indent'

" rs
" Plug 'rust-lang/rust.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'stephpy/vim-yaml'
Plug 'radenling/vim-dispatch-neovim'
Plug 'slim-template/vim-slim'
Plug 'preservim/vim-markdown'

" Quickfix
Plug 'tpope/vim-unimpaired'

" Navigation
Plug 'preservim/nerdtree'

call plug#end()

if exists('$BASE16_THEME')
      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
    let base16colorspace=256
    colorscheme base16-$BASE16_THEME
endif

lua << EOF
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  require("mason").setup()

  require('appearance')
  require('completion')
  require('fzf-config')
  require('tree-sitter')
  require('clipboard')
  require('disk')
  require('conjure')
  require('lsp')
  --require('dap-config')
  require('whitespace')
  require('sayonara')
  require('buffers')
  require('testing')
  require('terminal-config')

  -- require("fidget").setup {}

  vim.o.updatetime = 300
  vim.o.ttimeout = true
  vim.o.ttimeoutlen = 50
  vim.o.mouse = 'a'
  vim.o.hidden = true
  vim.o.grepprg = ag
  vim.o.inccommand = 'split'
  vim.o.incsearch = true
  vim.o.hlsearch = true
  vim.o.smartcase = true

  -- deal with terminal not having proper ftplugin
  vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
  })

  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "quickfix",
    callback = function()
      vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<CR>', { noremap = true, silent = true })
    end,
  })

  -- generic keymaps
  vim.api.nvim_set_keymap('n', '0', '^', { noremap = true })
  vim.api.nvim_set_keymap('n', '^', '0', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>s', ':w<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>fs', ':w<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '\\', ':', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>c', ':TComment<CR>', { noremap = true })
  vim.api.nvim_set_keymap('v', '<Leader>c', ':TComment<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader><Tab>', '<C-^>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>ft', ':NERDTreeToggle<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>kk', ':BufOnly<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Tab>', '%', { noremap = true })
  vim.api.nvim_set_keymap('v', '<Tab>', '%', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>fc', ':let @*=expand("%:p")<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR>', { noremap = true, silent = true })
EOF

