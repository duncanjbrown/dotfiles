let mapleader = ' '
let maplocalleader = ' '

" save with <leader>-s
nnoremap <Leader>s :w<CR>
" ...and <leader>-fs, to make switching between vim and emacs less painful
nnoremap <Leader>fs :w<CR>

" prompt with \
map \ :

noremap  <Leader>g :Gstatus<CR>
noremap  <Leader>G :GV<CR>

" exit insert mode
inoremap <C-c> <Esc>
imap jj <Esc>

" apply formatprg to buffer
nnoremap <leader>R :let save_cursor = getcurpos()<CR>gggqG:call setpos('.', save_cursor)<CR>:echo "✨ formatted"<CR>

" Fzf
nnoremap <Leader>ff :Ag<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bd :Sayonara!<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>pf :GFiles<CR>
nnoremap <Leader>pa :Files<CR>
nnoremap <Leader>on :on<CR>
noremap  <Leader>F :Tags<CR>

" comment / decomment & normal comment behavior
nnoremap <Leader>c :TComment<CR>
vnoremap <Leader>c :TComment<CR>

" NERDTree
nnoremap <Leader>ft :NERDTreeToggle<CR>

inoremap <C-U> <C-G>u<C-U>

" Flip between files with Space-Tab
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

vnoremap <Leader>ht :TidyHTMLFragment<CR>

" Macro repetition
vnoremap aa :normal @a<CR>

nnoremap <Leader>pl :r !lorem -l 3<CR>

nnoremap <Leader>nv :NV<CR>
