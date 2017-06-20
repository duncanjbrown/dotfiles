autocmd! BufEnter,BufWritePost *.rb,*.rake Neomake rubocop
command Rubofix ! rubocop -a %
let g:neomake_open_list = 2
