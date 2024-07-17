-- conjure
vim.g.clojure_align_subforms = 1
vim.g["conjure#extract_tree_sitter_enabled"] = 'true'
vim.g["conjure#log_wrap"] = 'true'
vim.g["conjure#filetypes"] = { 'clojure' }
vim.g["conjure#log#hud#enabled"] = false

local function auto_conjure_select()
  local shadow_build = vim.fn.system([[ps aux | grep 'shadow-cljs watch' | head -1 | sed -E 's/.*?shadow-cljs watch //' | tr -d '\n']])
  local cmd = 'ConjureShadowSelect ' .. shadow_build
  vim.api.nvim_command(cmd)
end

vim.api.nvim_create_user_command('AutoConjureSelect', auto_conjure_select, {})

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*.cljs',
  callback = auto_conjure_select
})
