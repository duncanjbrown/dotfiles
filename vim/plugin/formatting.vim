" Use Q to format lines. Highlight stray long lines to wrap them.
" Like C-q in emacs
map Q gq

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
augroup END

let g:EditorConfig_core_mode = 'python_external'
