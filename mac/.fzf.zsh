# Setup fzf
# ---------
if [[ ! "$PATH" == */home/qluo/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/qluo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/qluo/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/qluo/.fzf/shell/key-bindings.zsh"
