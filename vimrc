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

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

lua << EOF
  -- Highlight comments with italic text
  vim.cmd [[highlight Comment cterm=italic gui=italic]]

  -- Unobtrusive vertical splits
  vim.cmd [[highlight VertSplit guibg=NONE]]

  -- Clipboard configuration for tmux and pbcopy/pbpaste
  vim.g.clipboard = {
    name = 'tmuxClipboard',
    copy = {
      ['+'] = 'tmux load-buffer -',
      ['*'] = 'pbcopy',
    },
    paste = {
      ['+'] = 'tmux save-buffer -',
      ['*'] = 'pbpaste',
    },
    cache_enabled = 1,
  }

  -- Terminal buffer options for fzf
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "fzf",
    command = "setlocal noshowmode noruler nonumber"
  })

  -- whitespace
  vim.o.autoindent = true
  vim.o.shiftround = true
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.expandtab = true
  vim.o.backspace = 'indent,eol,start'

  -- Set clipboard to use the '+' register
  vim.o.clipboard = 'unnamedplus'

  -- Highlight matching parentheses
  vim.o.showmatch = true

  -- statusline
  vim.o.showmode = true
  vim.o.ruler = true
  vim.o.wildmenu = true
  vim.wo.cursorline = true

  -- true color support
  vim.o.termguicolors = true

  -- window title
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = '*',
    command = 'let &titlestring = expand("%:f")'
  })
  vim.o.title = true

  -- List chars
  vim.o.listchars = 'tab:»\\ ,extends:›,precedes:‹,nbsp:·,trail:·'
  vim.o.list = true

  -- Mouse support
  vim.o.mouse = 'a'

  -- Backup, writebackup, and swapfile
  vim.o.backup = false
  vim.o.writebackup = false
  vim.o.swapfile = false

  -- File formats
  vim.o.fileformats = 'unix,dos,mac'

  -- Completion options
  vim.o.completeopt = 'menuone,longest,preview'

  -- Incremental command preview :D
  vim.o.inccommand = 'split'

  -- Split directions
  vim.o.splitright = true
  vim.o.splitbelow = true
  vim.o.scrolloff = 12

  -- Ever-living undo
  vim.o.undofile = true

  -- Disable showcmd
  vim.o.showcmd = false

  -- Autocommands to trigger `autoread` when files change on disk
  -- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
  -- and https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
  vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    callback = function()
      if vim.fn.mode() ~= 'c' then
        vim.cmd 'checktime'
      end
    end,
  })

  vim.api.nvim_create_autocmd("FileChangedShellPost", {
    callback = function()
      vim.api.nvim_echo({{"File changed on disk. Buffer reloaded.", "WarningMsg"}}, true, {})
    end,
  })

  -- Set shortmess options
  vim.o.shortmess = vim.o.shortmess .. 'c'

  -- idle time before writing to swap/running callbacks on CursorHold
  vim.o.updatetime = 300

  -- Leader key timeout
  vim.o.ttimeout = true
  vim.o.ttimeoutlen = 50

  -- tree sitter
  local ts = require 'nvim-treesitter.configs'
  ts.setup {ensure_installed = "all", highlight = {enable = true}}

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

  nvim_lsp.marksman.setup{}

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

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>nn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
    end, opts)
    end,
  })

  -- nvim-dap
  local mason_registry = require("mason-registry")
  local debugpy = mason_registry.get_package("debugpy")

  require('dap-python').setup(debugpy:get_install_path() .. "/venv/bin/python")
  require('dap-python').test_runner = 'pytest'

  vim.keymap.set('n', '<space>B', function() require('dap').toggle_breakpoint() end)
  vim.keymap.set('n', '<F6>', function() require('dap').step_into() end)
  vim.keymap.set('n', '<F7>', function() require('dap').step_over() end)
  vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)

  require("dapui").setup()
  vim.keymap.set('n', '<F4>', function() require('dapui').toggle() end)

  -- sayonara
  vim.g.sayonara_confirm_quit = 1

  -- fzf
  vim.g.fzf_layout = { down = '~40%' }
  vim.g.fzf_preview_window = {'right:30%', 'ctrl-/'}

  -- conjure
  vim.g.conjure_log_wrap = 'true'
  vim.g.conjure_extract_tree_sitter_enabled = 'true'
  vim.g.clojure_align_subforms = 1

  -- use ag for grepping
  vim.o.grepprg = ag

  -- keep folds open
  vim.o.foldenable = false

  vim.cmd 'hi Normal ctermbg=none'
  vim.cmd 'hi Normal guibg=none'
EOF

