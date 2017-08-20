autocmd! BufEnter,BufWritePost *.rb,*.rake Neomake

let g:neomake_ruby_rubocop_args = ['bundle', 'exec', 'rubocop']
let g:neomake_ruby_rubocop_exe = '/usr/bin/env'
command Rubofix ! bundle exec rubocop -a %

" let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['rubocop']

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
