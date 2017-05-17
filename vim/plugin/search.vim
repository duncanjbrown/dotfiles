" Highlighting in quickfix
" hi Search cterm=NONE ctermfg=none ctermbg=blue

set incsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Press enter to unhighlight searches
nnoremap <silent> <CR> :noh<CR><CR>

" in visual mode, press // to search highlighted text
vnoremap // y/<C-R>"<CR>


set hlsearch
set ignorecase
set smartcase
