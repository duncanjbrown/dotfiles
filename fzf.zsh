# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/duncan.brown/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/duncan.brown/.fzf/bin"
fi

eval "$(fzf --zsh)"
