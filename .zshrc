# Functions
export NO_AT_BRIDGE=1 
source ~/.shell/functions.sh
export LSCOLORS=bxfxhxhxgxhxhxgxgxbxbx

ZSH_THEME="robbyrussell"
# Allow local customizations in the ~/.shell_local_before file
if [ -f ~/.shell_local_before ]; then
    source ~/.shell_local_before
fi

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# External plugins (initialized before)
source ~/.zsh/plugins_before.zsh

# Settings
source ~/.zsh/settings.zsh

# Bootstrap
source ~/.shell/bootstrap.sh

# External settings
source ~/.shell/external.sh

# Aliases
source ~/.shell/aliases.sh

#如果你要展示最右边的qiluo at debian,在这个文件里面搜索qluo
# Custom prompt
source ~/.zsh/prompt.zsh

# External plugins (initialized after)
source ~/.zsh/plugins_after.zsh

# Allow local customizations in the ~/.shell_local_after file
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

# Allow private customizations (not checked in to version control)
if [ -f ~/.shell_private ]; then
    source ~/.shell_private
fi

#
###
###FZF
###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --hidden --follow -E ".git" -E "node_modules" -E "/Users/qluo/Library" -E "/Users/qluo/.Trash" . /home  /Users/qluo'
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview "echo {} | ~/.fzf/scripts/file_preview.py" --preview-window=down'

# use fzf in bash and zsh
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
#export FZF_COMPLETION_OPTS=''

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow -E ".git" -E "node_modules" -E "/Users/qluo/Library" -E  "/Users/qluo/.Trash"  . /home  /Users/qluo
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow -E ".git" -E "node_modules" -E "/Users/qluo/Library" -E  "/Users/qluo/.Trash" . /home  /Users/qluo
}

source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh




set -o emacs
eval 
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }
        
###############synopsys###################
if [ -f "$HOME/.bash_synopsys" ]; then
 
      . "$HOME/.bash_synopsys"
 
fi

PATH="/usr/local/bin:$PATH"
eval "$(fzf --zsh)"

#for latex
export PATH="/Library/TeX/texbin:$PATH"
#for bsc
export PATH=/Users/tools/bsc-2024.07-macos-14/bin:$PATH

##### for cs50 ######
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
export C_INCLUDE_PATH=/usr/local/include:$C_INCLUDE_PATH
export DYLD_LIBRARY_PATH=/usr/local/lib:$DYLD_LIBRARY_PATH

#for iterm2_shell_integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi


# for ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/Cellar/ruby/3.3.5/bin:$PATH"
