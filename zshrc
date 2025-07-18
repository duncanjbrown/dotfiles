# Homebrew autocompletions
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# fi

# Oh My Zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois-docker"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# tmuxinator
source "${HOME}/.bin/tmuxinator.zsh"

# local configuration
test -e "${HOME}/.environment" && source "${HOME}/.environment"

export EDITOR=nvim
source "${HOME}/.zsh/aliases"
source "${HOME}/.zsh/functions"
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

export PATH="${HOME}/.dotfiles/bin:/usr/local/sbin:$PATH"

# export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/bin:/usr/local/bin:/opt/homebrew/opt/libpq/bin:$PATH"
alias cf='/usr/local/bin/cf'
export XDG_CONFIG_HOME="${HOME}/.config"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# python bins
export PATH="${HOME}/.local/bin:$PATH"

ulimit -n 1024

export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export PAGER="less"
export PATH="/Users/duncan.brown/.local/bin:$PATH"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
 export HOMEBREW_CASK_OPTS="--appdir=${HOME}/Apps"
