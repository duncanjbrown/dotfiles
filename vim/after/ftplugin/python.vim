set shiftwidth=4
set tabstop=4
set expandtab
set nofoldenable

lua vim.keymap.set('n', '<F5>', function() require('dap-python').test_method() end)
