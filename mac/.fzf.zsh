# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/qluo/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/qluo/.fzf/bin"
fi

eval "$(fzf --zsh)"
