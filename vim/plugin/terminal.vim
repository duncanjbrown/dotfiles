autocmd TermOpen * set bufhidden=delete

nnoremap <Leader>T :split <bar> terminal<CR>
let g:neoterm_automap_keys = '§§'
let g:neoterm_keep_term_open = '0'
let g:neoterm_autoscroll = '1'

nnoremap <Leader>1 :T 
nnoremap <Leader>2 :TREPLSendSelection<CR>
nnoremap <Leader>3 :Tmap 

tnoremap <C-q> <C-\><C-n>:q<CR>

