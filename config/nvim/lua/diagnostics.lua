vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_set_keymap("n", "wh", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
