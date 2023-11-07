-- Clipboard configuration for tmux and pbcopy/pbpaste
vim.g.clipboard = {
  name = 'tmuxClipboard',
  copy = {
    ['+'] = 'tmux load-buffer -',
    ['*'] = 'pbcopy',
  },
  paste = {
    ['+'] = 'tmux save-buffer -',
    ['*'] = 'pbpaste',
  },
  cache_enabled = 1,
}

-- Set clipboard to use the '+' register, ie tmux
vim.o.clipboard = 'unnamedplus'

