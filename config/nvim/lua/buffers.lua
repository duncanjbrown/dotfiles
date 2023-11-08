-- Exclude quickfix buffers from :bn and :bp
vim.api.nvim_create_augroup('qf', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'qf',
  pattern = 'qf',
  command = 'set nobuflisted',
})

-- Exclude terminals from bufferlist
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  command = 'set nobuflisted',
})

-- format buffer with formatprg (where LSP not available)
vim.api.nvim_set_keymap('n', '<leader>R',
  ':let save_cursor = getcurpos()<CR>gggqG:call setpos(".", save_cursor)<CR>:echo "✨ formatted"<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>bd', ':Sayonara!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>bn', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>bp', ':bp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>on', ':on<CR>', { noremap = true })
