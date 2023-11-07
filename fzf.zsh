# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/duncan/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/duncan/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/Users/duncan/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/Users/duncan/.fzf/shell/key-bindings.zsh"
