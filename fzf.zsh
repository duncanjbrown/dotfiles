# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/duncan/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/duncan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/duncan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/duncan/.fzf/shell/key-bindings.zsh"
