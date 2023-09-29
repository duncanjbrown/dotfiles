set shiftwidth=4
set tabstop=4
set expandtab
set nofoldenable

set formatprg=black\ -q\ --stdin-filename\ %\ -

nnoremap <buffer><silent> <c-q> <cmd>call Black()<cr>
inoremap <buffer><silent> <c-q> <cmd>call Black()<cr>
