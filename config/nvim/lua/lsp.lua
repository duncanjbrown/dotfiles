local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("poetry-nvim").setup() -- set vim.env.VIRTUAL_ENV to poetry if it's present

nvim_lsp.solargraph.setup {
  cmd = { "bundle", "exec", "solargraph", "stdio" },
  capabilities = capabilities,
  settings = {
    solargraph = {
      completion = true,
    }
  }
}

nvim_lsp.html.setup {
  capabilities = capabilities,
  filetypes = { 'html', 'htmldjango' }
}

nvim_lsp.taplo.setup {
  capabilities = capabilities,
}

nvim_lsp.cssls.setup {
  capabilities = capabilities,
  filetypes = { 'css', 'scss' }
}

nvim_lsp.tailwindcss.setup {
  capabilities = capabilities,
}

nvim_lsp.clojure_lsp.setup {
  capabilities = capabilities,
}

nvim_lsp.jsonls.setup {
  capabilities = capabilities,
}

-- nvim_lsp.ruff.setup {}

local function which_python()
  local pythonprog
  if vim.env.VIRTUAL_ENV then
    pythonprog = vim.env.VIRTUAL_ENV .. "/bin/python"
  else
    pythonprog = "python"
  end

  return pythonprog
end

nvim_lsp.pylsp.setup {
  capabilities = capabilities,
  -- cmd = {"pylsp", "-vvv", "--log-file", "/tmp/lsp.log"},
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = true
        },
        pylsp_mypy = {
          enabled = false,
          live_mode = false,
        },
        jedi_completion = { fuzzy = true, environment = which_python() },
      }
    }
  }
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim'
        },
      },
    }
  }
}

nvim_lsp.marksman.setup {
  capabilities = capabilities,
}

nvim_lsp.ts_ls.setup {
  capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup {
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      },
    }
  }
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
    vim.keymap.set({ 'n', 'v' }, '<space>F', function()
      vim.lsp.buf.format {
        async = true,
      }
    end, opts)
  end,
})

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
