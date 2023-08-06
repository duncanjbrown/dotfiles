set shiftwidth=2
set tabstop=2
set expandtab 
set foldmethod=indent
set nofoldenable

set formatprg=bundle\ exec\ rubocop\ --auto-correct\ --no-color\ --stderr\ --stdin\ %\ 2>/dev/null

