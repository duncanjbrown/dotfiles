-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Setup lazy.nvim
require("lazy").setup({
  -- Performance
  { "dstein64/vim-startuptime" },

  -- Tree-sitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    config = function()
      require('tree-sitter')
    end
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    config = function()
      require("mason").setup({
        PATH = "prepend"
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    config = function()
      require('lsp')
    end
  },

  -- Git
  { "tpope/vim-fugitive" },
  { "airblade/vim-gitgutter" },

  -- FZF
  {
    "junegunn/fzf",
    build = "./install --all",
    dir = "~/.fzf"
  },
  {
    "junegunn/fzf.vim",
    config = function()
      require('fzf-config')
    end
  },

  -- Themes
  {
    "chriskempson/base16-vim",
    config = function()
      require('appearance')
    end
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = { "CmdlineEnter", "InsertEnter" },
    config = function()
      require('completion')
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline"
    }
  },

  -- Text objects and editing
  { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "haya14busa/incsearch.vim" },
  { "AndrewRadev/splitjoin.vim" },
  { "gregsexton/MatchTag" },

  -- External processes
  {
    "vim-test/vim-test",
    config = function()
      require('testing')
    end
  },
  { "tpope/vim-dispatch" },
  { "tpope/vim-eunuch" },

  -- Buffers
  { "schickling/vim-bufonly" },
  {
    "mhinz/vim-sayonara",
    config = function()
      require('sayonara')
    end
  },

  -- Clojure
  {
    "Olical/conjure",
    lazy = true,
    ft = { "clojure", "clojurescript" },
    config = function()
      require('conjure')
    end
  },
  { "bhurlow/vim-parinfer" },
  { "guns/vim-clojure-static" },

  -- Python
  { "tartansandal/vim-compiler-pytest" },
  { "tweekmonster/django-plus.vim" },
  { "Glench/Vim-Jinja2-Syntax" },
  { "Vimjas/vim-python-pep8-indent" },
  { "karloskar/poetry-nvim" },

  -- Other languages
  { "editorconfig/editorconfig-vim" },
  { "stephpy/vim-yaml" },
  { "radenling/vim-dispatch-neovim" },
  { "slim-template/vim-slim" },
  { "preservim/vim-markdown" },

  -- Quickfix
  { "tpope/vim-unimpaired" },

  -- Navigation
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose", "NvimTreeFocus" },
    keys = {
      { "<Leader>ft", ":NvimTreeToggle<CR>", desc = "Toggle nvim-tree" },
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
        git = {
          ignore = false,
        },
      })
    end,
  },
})

-- Base16 theme setup
if vim.env.BASE16_THEME then
  local theme_name = 'base16-' .. vim.env.BASE16_THEME
  if not vim.g.colors_name or vim.g.colors_name ~= theme_name then
    vim.g.base16colorspace = 256
    vim.cmd.colorscheme(theme_name)
  end
end

-- Core settings
vim.o.updatetime = 300
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50
vim.o.mouse = 'a'
vim.o.hidden = true
vim.o.inccommand = 'split'
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.smartcase = true

-- Grep settings
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Autocmds
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

-- Keymaps
vim.api.nvim_set_keymap('n', '0', '^', { noremap = true })
vim.api.nvim_set_keymap('n', '^', '0', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fs', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '\\', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader><Tab>', '<C-^>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>kk', ':BufOnly<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Tab>', '%', { noremap = true })
vim.api.nvim_set_keymap('v', '<Tab>', '%', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fc', ':let @*=expand("%:p")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR>', { noremap = true, silent = true })

-- Load remaining modules
require('buffers')
require('clipboard')
require('disk')
require('diagnostics')
require('whitespace')
require('terminal-config')

