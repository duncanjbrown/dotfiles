-- true color support
vim.o.termguicolors = true

-- read colour scheme from base16's conventional ~/.vimrc_background file
local vimrc_background = vim.fn.expand("~/.vimrc_background")
if vim.fn.filereadable(vimrc_background) == 1 then
  vim.cmd("source " .. vimrc_background)
end

-- Highlight matching parentheses
vim.o.showmatch = true

vim.cmd [[highlight Comment cterm=italic gui=italic]]
vim.cmd [[highlight VertSplit guibg=NONE]]
vim.cmd [[hi Normal ctermbg=none]]
vim.cmd [[hi Normal guibg=none]]

-- numbers
vim.o.number = true
vim.o.relativenumber = true

-- statusline
vim.o.showmode = true
vim.o.ruler = true
vim.o.wildmenu = true
vim.wo.cursorline = true
vim.o.statusline = "%f%= %{&filetype}"  -- Filetype
vim.o.statusline = vim.o.statusline .. " %5l"  -- Current line, with space for 5 characters
vim.o.statusline = vim.o.statusline .. "/%L"  -- Total lines

-- window title
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = '*',
  command = 'let &titlestring = expand("%:f")'
})
vim.o.title = true

-- Split directions
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 12

