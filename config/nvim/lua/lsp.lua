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

