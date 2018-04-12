autocmd TermOpen * set bufhidden=delete

nnoremap <Leader>T :split <bar> terminal<CR>
let g:neoterm_autoscroll = '1'
let g:neoterm_automap_keys = '<F5>'
let g:neoterm_size = 16
let g:neoterm_repl_ruby = 'pry'
let g:neoterm_default_mod = 'botright'

command! -nargs=+ TT Topen | T <args>

nnoremap § :TT 
vnoremap <Leader>2 :TREPLSendSelection<CR>
nnoremap <Leader>2 :TREPLSendLine<CR>
nnoremap <Leader>3 :TREPLSendFile<CR>
nnoremap <Leader>4 :Tmap 
nnoremap <Leader>0 :Ttoggle<CR> 
nnoremap <Leader>9 :Tclose<CR> 

tnoremap <C-q> <C-\><C-n>:q<CR>

