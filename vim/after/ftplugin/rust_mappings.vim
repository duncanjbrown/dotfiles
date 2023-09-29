nnoremap <Leader>gh :CargoRun<CR>

func! MyCargoRun(cmd)
  let s:cargo_command = substitute("Dispatch! cargo {cmd}", "{cmd}", a:cmd, 'g')
  execute s:cargo_command
endf

com! -nargs=* CargoRun call MyCargoRun('run ' . <q-args>)
