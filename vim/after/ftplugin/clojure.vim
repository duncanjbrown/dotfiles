call neomake#configure#automake('nrw')

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
