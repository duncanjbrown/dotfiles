vim.g.sayonara_confirm_quit = 1

vim.api.nvim_set_keymap('n', '<C-k>', ':Sayonara!<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:Sayonara!<CR>i', { noremap = true })
