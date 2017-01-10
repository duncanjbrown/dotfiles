" Exclude quickfix buffers from :bn and :bp
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set number
" Toggle relative numbering with ,=
nmap <Leader>= :set rnu! rnu?<cr>

" Ctrl-F and Ctrl-B to navigate, Ctrl-K to Kill
nnoremap <C-b>  :bp<CR>
inoremap <C-b>  <Esc>:bp<CR>i
nnoremap <C-f>  :bn<CR>
inoremap <C-f>  <Esc>:bn<CR>i
nnoremap <C-k>  :BD<CR>
inoremap <C-k>  <Esc>:BD<CR>i

" do not lose history when leaving a buffer
set hidden
