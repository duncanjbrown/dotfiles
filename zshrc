# Oh My Zsh
export ZSH=/Users/duncan/.oh-my-zsh
ZSH_THEME="gallois-docker"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# javascript
export PATH="$PATH:`yarn global bin`"

# tmuxinator
source "${HOME}/.bin/tmuxinator.zsh"

# local configuration
test -e "${HOME}/.environment" && source "${HOME}/.environment"

export EDITOR=nvim
source "${HOME}/.zsh/iterm2_shell_integration.zsh"
source "${HOME}/.zsh/aliases"
source "${HOME}/.zsh/functions"
source "${HOME}/.zsh/python"
source "${HOME}/.zsh/base16"

# Make shell work in Emacs
if [ -n "$INSIDE_EMACS" ]; then
  export EDITOR=emacsclient
  unset zle_bracketed_paste  # This line
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="/usr/local/sbin:$PATH"
