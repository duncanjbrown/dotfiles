#!/usr/bin/env ruby

agenda_disk_cache = "~/.agenda"

if (Time.now - File.stat(agenda_disk_cache).mtime > 360)


agenda = File.read("~/.agenda")
out = `emacs -batch -l ~/.emacs.d/init.el --eval "(run-hooks 'emacs-startup-hook)" --eval '(org-batch-agenda "a")' 2> /dev/null`

puts out
