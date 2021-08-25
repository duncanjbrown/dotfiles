# Homebrew autocompletions
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Oh My Zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois-docker"
plugins=(git asdf)
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
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias cf='/usr/local/bin/cf'
export XDG_CONFIG_HOME="${HOME}/.config"

source "${HOME}/.zsh/asdf"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
