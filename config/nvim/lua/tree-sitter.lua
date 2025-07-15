local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = {
  "python", "ruby", "javascript", "html", "css", "clojure", "rust", "go", "lua"
}, highlight = {enable = true}}
