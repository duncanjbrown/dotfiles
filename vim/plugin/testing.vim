" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>e :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Run rspec using thoughtbot/vim-rspec and tpope/dispatch.
let b:rspec_executable = "bundle exec rspec"
let g:rspec_command = "Dispatch " . b:rspec_executable . " {spec} --format=progress --no-color"
