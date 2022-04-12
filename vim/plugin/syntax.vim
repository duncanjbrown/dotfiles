autocmd! BufEnter,BufWritePost *.rb,*.rake,*.md Neomake
autocmd! BufEnter,BufWritePost *.coffee Neomake
autocmd! BufEnter,BufWritePost *.js,*.jsx Neomake
autocmd! BufEnter,BufWritePost *.scss Neomake

let g:neomake_ruby_rubocop_args = ['bundle', 'exec', 'rubocop']
let g:neomake_ruby_rubocop_exe = '/usr/bin/env'
command Rubofix ! bundle exec rubocop -a %

" let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_joker_maker = {
		\ 'exe': 'joker',
		\ 'args': ['--lint'],
		\ 'errorformat': '%f:%l:%c: %*[^ ] %t%*[^:]: %m',
		\ }

let g:neomake_cljkondo_maker = {
		\ 'exe': 'clj-kondo',
		\ 'args': ['--lint'],
		\ 'errorformat': '%f:%l:%c:\ Parse\ %t%*[^:]:\ %m,%f:%l:%c:\ %t%*[^:]:\ %m',
		\ }

let g:neomake_clojure_enabled_makers = ['joker', 'cljkondo']

call neomake#configure#automake('nrw')

command -range=% TidyHTMLFragment :<line1>,<line2> ! tidy --show-body-only yes -q -i --show-errors 0
