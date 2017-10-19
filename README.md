## Dependencies

- tmux plus `reattach-to-user-namespace`
- ZSH/oh-my-zshell
- Base16 Shell [repo](https://github.com/chriskempson/base16-shell)
- For Ruby: rbenv
- For JS: yarn
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
rcup
```

## Options

If you have a file called `.environment` in `~`, it will be sourced from zshrc.

## Troubleshooting

_tmux exits immediately_ You need `reattach-to-user-namespace`
