vim.api.nvim_set_keymap('n', '<leader>r', ':TestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':TestFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':TestSuite<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':TestLast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':TestSuite --only-failures<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ll', ':silent !tmux split-window -vbd -p 33 "bundle exec rspec --only-failures; read -k1 -s;"<CR>', { noremap = true, silent = true })

-- vim-test
vim.g['test#ruby#rspec#executable'] = 'RUBYOPT="-W0" bundle exec rspec'
vim.g['test#strategy'] = 'dispatch'
vim.g['test#python#runner'] = 'pytest'
vim.g['test#python#pytest#options'] = '--tb=short -q -vv'

-- dispatch
vim.g.dispatch_compilers = {
    ['RUBYOPT="-W0" bundle exec'] = '',
    ['python3 -m '] = '',
    ['poetry run '] = ''
}

