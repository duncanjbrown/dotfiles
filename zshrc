# Oh My Zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois-docker"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# tmuxinator
source "${HOME}/.bin/tmuxinator.zsh"

# local configuration
test -e "${HOME}/.environment" && source "${HOME}/.environment"

export EDITOR=nvim
source "${HOME}/.zsh/aliases"
source "${HOME}/.zsh/functions"
source "${HOME}/.zsh/python"
source "${HOME}/.zsh/base16"
source "${HOME}/.zsh/fzf"
source "${HOME}/.zsh/ssh"

# Display "$(pwd)" in the terminal window title
DISABLE_AUTO_TITLE="true"
function precmd () {
  window_title="\033]0;${PWD}\007"
  echo -ne "$window_title"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Z
. /usr/local/etc/profile.d/z.sh

export PATH="/usr/local/sbin:$PATH"
