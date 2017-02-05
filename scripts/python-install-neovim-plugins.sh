#!/bin/sh

source $HOME/.zsh/python
pyenv activate neovim2
pip install --upgrade neovim
pyenv activate neovim3
pip install --upgrade neovim
