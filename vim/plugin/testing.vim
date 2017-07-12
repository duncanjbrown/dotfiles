nmap <silent> <leader>r :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>e :TestLast<CR>
nmap <silent> <leader>l :TestSuite --only-failures<CR>

let test#strategy = 'dispatch'

let g:dispatch_compilers = {
      \ 'bundle exec': ''}
