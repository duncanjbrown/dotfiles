" vim-airline
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_type = 0

let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.maxlinenr=''
