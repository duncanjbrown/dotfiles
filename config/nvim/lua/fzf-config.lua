vim.g.fzf_layout = { down = '~40%' }
vim.g.fzf_preview_window = { 'right:30%', 'ctrl-/' }

vim.api.nvim_set_keymap('n', '<Leader>ff', ':Ag<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>bb', ':Buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>pf', ':GFiles<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>pa', ':Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ":call fzf#vim#ag(expand('<cword>'))<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>W', ":call fzf#vim#tags(expand('<cword>'))<CR>", { noremap = true })
