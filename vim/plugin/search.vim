" For :Ack, use ag instead of ack because ag.vim is abandoned
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" The Silver Searcher
" if executable('ag')
"   " Use ag over grep
"   " set grepprg=ag\ --nogroup\ --nocolor
"
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"
"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" endif

set incsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Press enter to unhighlight searches
nnoremap <CR> :noh<CR><CR>

set hlsearch
set ignorecase
set smartcase
