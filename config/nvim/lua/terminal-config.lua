-- :TT
vim.api.nvim_create_user_command('TT', 'Topen | T <args>', { nargs = '+' })

-- Key mappings
vim.api.nvim_set_keymap('n', '§', ':TT<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>2', ':TREPLSendSelection<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>0', ':Ttoggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-n>:q<CR>', { noremap = true, silent = true })

-- Global variables
vim.g.neoterm_autoscroll = '1'
vim.g.neoterm_size = 16
vim.g.neoterm_repl_ruby = 'pry'
vim.g.neoterm_default_mod = 'botright'

