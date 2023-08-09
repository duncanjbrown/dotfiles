nmap <silent> <leader>r :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>e :TestLast<CR>
nmap <silent> <leader>l :TestSuite --only-failures<CR>
nmap <silent> <leader>ll :silent !tmux split-window -vbd -p 33 "bundle exec rspec --only-failures; read -k1 -s;"<CR>

let test#ruby#rspec#executable = 'RUBYOPT="-W0" bundle exec rspec'
let test#strategy = 'dispatch'

let test#python#runner = 'pytest'

let g:dispatch_compilers = {
      \ 'RUBYOPT="-W0" bundle exec': '',
      \ 'python3 -m ': ''}
