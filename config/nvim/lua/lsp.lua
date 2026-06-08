local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("poetry-nvim").setup() -- set vim.env.VIRTUAL_ENV to poetry if it's present

local function which_python()
  if vim.env.VIRTUAL_ENV then
    return vim.env.VIRTUAL_ENV .. "/bin/python"
  else
    return "python"
  end
end

vim.lsp.config('solargraph', {
  cmd = { "bundle", "exec", "solargraph", "stdio" },
  capabilities = capabilities,
  settings = {
    solargraph = {
      completion = true,
    }
  }
})

vim.lsp.config('html', {
  capabilities = capabilities,
  filetypes = { 'html', 'htmldjango' },
})

vim.lsp.config('taplo', {
  capabilities = capabilities,
})

vim.lsp.config('cssls', {
  capabilities = capabilities,
  filetypes = { 'css', 'scss' },
})

vim.lsp.config('tailwindcss', {
  capabilities = capabilities,
})

vim.lsp.config('clojure_lsp', {
  capabilities = capabilities,
})

vim.lsp.config('jsonls', {
  capabilities = capabilities,
})

vim.lsp.config('pylsp', {
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = true,
        },
        pylsp_mypy = {
          enabled = false,
          live_mode = false,
        },
        jedi_completion = { fuzzy = true, environment = which_python() },
      }
    }
  }
})

vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    }
  }
})

vim.lsp.config('marksman', {
  capabilities = capabilities,
})

vim.lsp.config('ts_ls', {
  capabilities = capabilities,
})

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    }
  }
})

vim.lsp.enable({
  'solargraph',
  'html',
  'taplo',
  'cssls',
  'tailwindcss',
  'clojure_lsp',
  'jsonls',
  'pylsp',
  'lua_ls',
  'marksman',
  'ts_ls',
  'rust_analyzer',
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>nn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>F', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
