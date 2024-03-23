# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/duncan.brown/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/duncan.brown/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/Users/duncan.brown/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/Users/duncan.brown/.fzf/shell/key-bindings.zsh"
