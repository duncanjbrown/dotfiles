nnoremap <Leader>gh :CargoRun<CR>

com! -nargs=* CargoRun call cargo#run('run ' . <q-args>)

func! cargo#run(cmd)
  let s:cargo_command = substitute("Dispatch! cargo {cmd}", "{cmd}", a:cmd, 'g')
  execute s:cargo_command
endf
