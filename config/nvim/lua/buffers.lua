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

