let mapleader = ','

" save with ,s
nnoremap <Leader>s :w<CR>

" prompt with \
map \ :

noremap  <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <S-u> :GundoToggle<CR>

vnoremap <Tab> >
vnoremap <S-Tab> <

" exit insert mode
inoremap <C-c> <Esc>
imap jj <Esc>

" Fzf
nnoremap <Leader>c :Commands<CR>
nnoremap <Leader>f :Ag<CR>

" comment / decomment & normal comment behavior
vmap <C-m> gc

inoremap <C-U> <C-G>u<C-U>

