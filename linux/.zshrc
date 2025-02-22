# Functions
export NO_AT_BRIDGE=1 
source ~/.shell/functions.sh

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

########=======================PA============================#######################
export NEMU_HOME=/home/qluo/pa_prj/NJU-ICS2021-PA-master/nemu
export AM_HOME=/home/qluo/pa_prj/NJU-ICS2021-PA-master/abstract-machine

export RISCV=/home/tools/rocket-tools/RISCV
######============ sbt ===================###
export PATH=$PATH:/home/tools/sbt/bin
######## bsc ################
export PATH=$PATH:/home/tools/bsc-2024.01-centos-7.9.2009/bin


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64
source ~/.nix-profile/etc/profile.d/nix.sh
if [ -e /home/ICer/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ICer/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
