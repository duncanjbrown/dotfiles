" Exclude quickfix buffers from :bn and :bp
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set number
set rnu

" Ctrl-F and Ctrl-B to navigate, Ctrl-K to Kill
nnoremap <C-b>  :bp<CR>
inoremap <C-b>  <Esc>:bp<CR>i
nnoremap <C-f>  :bn<CR>
inoremap <C-f>  <Esc>:bn<CR>i
nnoremap <C-k>  :BD<CR>
inoremap <C-k>  <Esc>:BD<CR>i

" do not lose history when leaving a buffer
set hidden

" Spacing between icon and title in NERDTree
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" No fileicons at top of screen
let g:webdevicons_enable_airline_tabline = 0

