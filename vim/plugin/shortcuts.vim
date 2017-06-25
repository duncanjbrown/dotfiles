let mapleader = ' '
let maplocalleader = ' '

" save with ,s
nnoremap <Leader>s :w<CR>

" prompt with \
map \ :

noremap  <Leader>G :GV<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <S-u> :GundoToggle<CR>

vnoremap <Tab> >
vnoremap <S-Tab> <

" exit insert mode
inoremap <C-c> <Esc>
imap jj <Esc>

" Fzf
nnoremap <Leader>f :Ag<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <C-p> :Files<CR>
noremap  <Leader>F :Tags<CR>

" comment / decomment & normal comment behavior
nnoremap <Leader>c :TComment<CR>
vnoremap <Leader>c :TComment<CR>

inoremap <C-U> <C-G>u<C-U>

