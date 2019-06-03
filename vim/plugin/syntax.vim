autocmd! BufEnter,BufWritePost *.rb,*.rake,*.md Neomake
autocmd! BufEnter,BufWritePost *.coffee Neomake
autocmd! BufEnter,BufWritePost *.js,*.jsx Neomake
autocmd! BufEnter,BufWritePost *.scss Neomake
" autocmd! BufEnter,BufWritePost *.php Neomake

let g:neomake_ruby_rubocop_args = ['bundle', 'exec', 'rubocop']
let g:neomake_ruby_rubocop_exe = '/usr/bin/env'
command Rubofix ! bundle exec rubocop -a %

let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
let g:neomake_php_phpcs_exe = $PWD .'/vendor/bin/phpcs'

" let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['phpcs']

command -range=% TidyHTMLFragment :<line1>,<line2> ! tidy --show-body-only yes -q -i --show-errors 0
