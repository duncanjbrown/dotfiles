## Dependencies

- tmux plus `reattach-to-user-namespace`
- ZSH/oh-my-zshell
- Base16 Shell [repo](https://github.com/chriskempson/base16-shell)
- neovim, from homebrew
- rcm: https://github.com/thoughtbot/rcm
- fzf: https://github.com/junegunn/fzf
- Z: https://github.com/rupa/z/

## Installation

Download to `~/.dotfiles`.

```
brew bundle # You may need to install Homebrew first
rcup
```

## Vim leader bindings

### FZF

``` 
ff     Search inside all files
F      Search all ctags
w      Search inside all files using the word under the cursor
W      Search all ctags using the word under the cursor
pf     Search all filenames controlled by git
pa     Search all filenames in the folder
pc     Search filenames changed since last commit 
bb     Search open buffers 
```

## Aliases

### git

```
git please                # git push --force-with-lease
git smush                 # git commit --amend --no-edit && git please
git untracked             # show all untracked files in the current working tree
git steal <branch> <file> # pick a file off another branch
git jump                  # display recent branches in FZF 
git rewrite               # pick a commit with FZF and commit --fixup onto it
fix                       # open all merge-conflicted files in $EDITOR
shaf <search string>      # print first matching commit message, copy SHA to clipboard 
gset                      # hard-reset current branch to its state on origin
```

### ruby

```
be                        # bundle exec
r                         # bundle exec rubocop && bundle exec rspec
bopen                     # bundle open
rff                       # re-run failing specs, bailing on first failure
rubogit                   # run Rubocop on changed files
```

### misc

```
publicip                  # get the public IP of your machine
viewcsv <file>            # print a CSV file in columns
whozat <port>             # get the process/es listening on a given port
evict-listeners <port>    # kill the process/es listening on a given port
pipv                      # list available versions of a pip package
```

## Options

If you have a file called `.environment` in `~`, it will be sourced from zshrc.

## Troubleshooting

_tmux exits immediately_ You need `reattach-to-user-namespace`
