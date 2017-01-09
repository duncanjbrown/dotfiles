# Oh My Zsh
export ZSH=/Users/duncan/.oh-my-zsh
ZSH_THEME="gallois"
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
source "${HOME}/.iterm2_shell_integration.zsh"
source "${HOME}/.aliases"

