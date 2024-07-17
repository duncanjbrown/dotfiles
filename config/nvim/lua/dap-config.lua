if vim.env.POETRY_ACTIVE then
  require('dap-python').setup("python")
else
  local mason_registry = require("mason-registry")
  local debugpy = mason_registry.get_package("debugpy")
  require('dap-python').setup(debugpy:get_install_path() .. "/venv/bin/python")
end

require('dap-python').test_runner = 'pytest'

vim.keymap.set('n', '<space>B', function() require('dap').toggle_breakpoint() end)

require("dapui").setup()
vim.keymap.set('n', '<F4>', function() require('dapui').toggle() end)

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
vim.keymap.set({ "n", "v" }, "<Leader>dt", function() require("dap-python").test_method() end)

