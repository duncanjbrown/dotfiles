let mapleader = ' '
let maplocalleader = ' '

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

" save with <leader>-s
nnoremap <Leader>s :w<CR>
" ...and <leader>-fs, to make switching between vim and emacs less painful
nnoremap <Leader>fs :w<CR>

" prompt with \
map \ :

noremap  <Leader>g :Gstatus<CR>
noremap  <Leader>G :GV<CR>

nnoremap <Leader>n :RangerCurrentFile<CR>

" exit insert mode
inoremap <C-c> <Esc>
imap jj <Esc>

" Fzf
nnoremap <Leader>ff :Ag<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bd :BD<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>on :on<CR>
noremap  <Leader>F :Tags<CR>

" comment / decomment & normal comment behavior
nnoremap <Leader>c :TComment<CR>
vnoremap <Leader>c :TComment<CR>

inoremap <C-U> <C-G>u<C-U>

nnoremap <Leader>U :GundoToggle<CR>

nnoremap <Leader><Tab> <C-^>

" Delete all the buffers except this one
nnoremap <Leader>kk :BufOnly<CR>

nnoremap <Leader>w :call fzf#vim#ag(expand('<cword>'))<CR>
nnoremap <Leader>W :call fzf#vim#tags(expand('<cword>'))<CR>

nnoremap <Tab> %
vnoremap <Tab> %

nmap <Leader>fc :let @*=expand("%:p")<CR>

noremap H ^
noremap L g$

nnoremap <Leader>R :Rubofix<CR>
vnoremap <Leader>ht :TidyHTMLFragment<CR>

" Macro repetition
vnoremap aa :normal @a<CR>
