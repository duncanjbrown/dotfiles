" For :Ack, use ag instead of ack because ag.vim is abandoned
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

set incsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Press enter to unhighlight searches
nnoremap <CR> :noh<CR><CR>

set hlsearch
set ignorecase
set smartcase
