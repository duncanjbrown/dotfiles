## Dependencies

- tmux plus `reattach-to-user-namespace`
- ZSH/oh-my-zshell
- Base16 Shell [repo](https://github.com/chriskempson/base16-shell)
- For Ruby: rbenv
- neovim, from homebrew
- pyenv plus python 2.7 and 3.x for Vim plugins
- rcm: https://github.com/thoughtbot/rcm
- fzf: https://github.com/junegunn/fzf
- Z: https://github.com/rupa/z/

### Pyenv

If you get Python errors when starting neovim, run `make python` to
install sandboxed pythons with neovim support.

## Installation

Download to `~/.dotfiles`.

```
brew bundle # You may need to install Homebrew first
rcup
```

## Aliases

### git

```
git please                # git push --force-with-lease
git untracked             # show all untracked files in the current working tree
git steal <branch> <file> # pick a file off another branch
fix                       # open all merge-conflicted files in $EDITOR
delete-merged             # delete all branches not merged into develop or master
shaf <search string>      # print first matching commit message, copy SHA to clipboard
```

### ruby

```
be                        # bundle exec
r                         # bundle exec rubocop && bundle exec rspec
bopen                     # bundle open
```

### misc

```
publicip                  # get the public IP of your machine
viewcsv <file>            # print a CSV file in columns
```

## Options

If you have a file called `.environment` in `~`, it will be sourced from zshrc.

## Troubleshooting

_tmux exits immediately_ You need `reattach-to-user-namespace`
