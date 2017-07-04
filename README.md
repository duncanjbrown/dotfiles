## Dependencies

- iTerm2
- tmux 2.4
- ZSH/oh-my-zshell
- For Ruby: rbenv
- For JS: yarn
- neovim
- pyenv plus python 2.7 and 3.x for Vim plugins
- rcm: https://github.com/thoughtbot/rcm
- fzf: https://github.com/junegunn/fzf

## Dependencies

### Pyenv

If you get Python errors when starting neovim, run `make python` to
install sandboxed pythons with neovim support.

## Installation

Download to `~/.dotfiles`.

```
rcup
```

For nice icons in neovim, update the font settings in iTerm2 to 14pt Sauce
Code Pro Nerd Font.

## Options

If you have a file called `.environment` in `~`, it will be sourced from zshrc.

To enable italics in the terminal, use the file in ~/terminal and follow the instructions here https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/.
