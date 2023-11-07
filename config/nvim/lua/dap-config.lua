local mason_registry = require("mason-registry")
local debugpy = mason_registry.get_package("debugpy")

require('dap')
require('dap-python').setup(debugpy:get_install_path() .. "/venv/bin/python")
require('dap-python').test_runner = 'pytest'

vim.keymap.set('n', '<space>B', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)

require("dapui").setup()
vim.keymap.set('n', '<F4>', function() require('dapui').toggle() end)

