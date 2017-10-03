autocmd! BufEnter,BufWritePost *.rb,*.rake Neomake
autocmd! BufEnter,BufWritePost *.coffee Neomake

let g:neomake_ruby_rubocop_args = ['bundle', 'exec', 'rubocop']
let g:neomake_ruby_rubocop_exe = '/usr/bin/env'
command Rubofix ! bundle exec rubocop -a %

" let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['rubocop']
