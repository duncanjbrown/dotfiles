" Exclude quickfix buffers from :bn and :bp
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

" Exclude terminals from bufferlist
autocmd TermOpen * set nobuflisted

set number
set rnu
nnoremap 0 ^
nnoremap ^ 0

" Ctrl-K to Kill
nnoremap <C-k>  :Sayonara!<CR>
inoremap <C-k>  <Esc>:Sayonara!<CR>i

" do not lose history when leaving a buffer
set hidden

" Spacing between icon and title in NERDTree
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" No fileicons at top of screen
let g:webdevicons_enable_airline_tabline = 0
