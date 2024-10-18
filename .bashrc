# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export NO_AT_BRIDGE=1 



# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
# =======================================alias======================================================#
alias ll='ls -lah'
alias la='ls -a'
alias ls='ls --color=auto'
alias grep='grep --color'
alias l='ls'


alias g='gvim'
alias ..='cd ..'
alias vpn='/home/qluo/software_tool/./Qv2ray-v2.7.0-linux-x64.AppImage'
alias sc="source ~/.bashrc"
alias rm="rm -rf"
alias mkdir="mkdir -p"


#alias l='ls -CF'
alias  hmost='history | awk '\''{$1="";print substr($0,2)}'\'' | sort | uniq -c | sort -n | tail -n 10'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
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


####===============synopsys===============================##

#export DVE_HOME=/home/synopsys/vcs/O-2018.09-SP2
#export VCS_HOME=/home/synopsys/vcs/O-2018.09-SP2
#export VCS_MX_HOME=/home/synopsys/vcs-mx/O-2018.09-SP2
#export LD_LIBRARY_PATH=/home/synopsys/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUX64
#export VERDI_HOME=/home/synopsys/verdi/Verdi_O-2018.09-SP2
#export SCL_HOME=/home/synopsys/scl/2018.06
##export ICC2_HOME=/home/synopsys/icc2/R-2020.09-SP3


##ICC2
##PATH=$PATH:$ICC2_HOME/bin
##alias icc2="icc2_shell"


##Design Compalier
#export SYNOPSYS=/home/synopsys/dc2016           #不加这个路径，直接运行 dc 会报错
#export PATH=$PATH:/home/cjw/Synopsys/dc2016/bin     #改 Verdi 安装路径
#export DC_HOME=/home/cjw/Synopsys/dc2016
#alias dc='dc_shell'
#alias dv='design_vision'

##dve
#PATH=$PATH:$VCS_HOME/gui/dve/bin
#alias dve="dve"

##VCS
#PATH=$PATH:$VCS_HOME/bin
#alias vcs="vcs"

##VERDI
#PATH=$PATH:$VERDI_HOME/bin
#alias verdi="verdi"

##scl
#PATH=$PATH:$SCL_HOME/linux64/bin
#export VCS_ARCH_OVERRIDE=linux

##LICENCE
#export SNPSLMD_LICENSE_FILE=27000@debian
##export LM_LICENSE_FILE=27000@debian
#alias lmg_synopsys="lmgrd -c /home/synopsys/scl/2018.06/admin/license/Synopsys.dat"

#export LM_LICENSE_FILE=/home/synopsys/scl/2018.06/admin/license/Synopsys.dat        # license文件的位置
##alias lmg_scl='/home/synopsys/scl/2018.06/linux64/bin/lmgrd -c /home/synopsys/scl/2018.06/admin/license/Synopsys.dat'  #注意改路径
##如果lmgrd找不到这个，解决方法是   ln -s /lib64/ld-linux-x86-64.so.2   /lib64/ld-lsb-x86-64.so.3 
##原文链接https://www.mathworks.cn/matlabcentral/answers/1679234-debian-10-lmgrd-no-such-file-or-directory-error


# # 如果想自动进入tmux，但不好用
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux


export NEMU_HOME=/home/qluo/pa_prj/NJU-ICS2021-PA-master/nemu
export AM_HOME=/home/qluo/pa_prj/NJU-ICS2021-PA-master/abstract-machine
