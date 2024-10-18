# Use colors in coreutils utilities output

# alias ftime=printf “p (char)(void(*)())AudioDeviceDuck=0xc3\nq” | lldb -n FaceTime
alias env= 'source  ~/work_space/work_space/bin/activate'
alias ls='ls --color=auto'
alias grep='grep --color'
alias python='python3'
alias code='code .'
alias pip='pip3'
alias sshl='ssh_login'
alias rmd="/Applications/Typora.app/Contents/MacOS/Typora &"
alias csdn="source /Users/qluo/work_space/work_space/bin/activate; python /Users/qluo/work_space/scripts_ic/csdn.py"

# ls aliases
alias ra='ranger'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls'
alias sl='ls'
alias tree='tree -L 2'
alias cl='clear'
cd() {builtin cd "$@" && ls;}

#git
alias gti='git'
alias glg='git logs'
alias gaa='git add -A'
alias gc='git commit -m'
alias gs='git status'
alias gco='git checkout -b'
alias gbd='git branch -d'
alias gp='git push'
#有关一些压缩的
alias untar='tar -zxvf $1'




# some alias
alias g='gvim'
alias n='nvim'
alias ..='cd ..'
alias vpn='/home/qluo/software_tool/./Qv2ray-v2.7.0-linux-x64.AppImage'
alias sc="source ~/.zshrc"
alias rm="rm -rf"
alias mk="mkdir -p"
alias hmost='history | awk '\''{$1="";print substr($0,2)}'\'' | sort | uniq -c | sort -n | tail -n 10'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# git related aliases
alias gag='git exec ag'

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Use pip without requiring virtualenv
syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

syspip2() {
    PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

syspip3() {
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Jump to directory containing file
jump() {
    cd "$(dirname ${1})"
}

# cd replacement for screen to track cwd (like tmux)
scr_cd()
{
    builtin cd $1
    screen -X chdir "$PWD"
}

if [[ -n $STY ]]; then
    alias cd=scr_cd
fi

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && "${@}"
    )
}

# Check if a file contains non-ascii characters
nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' "${@}"
}

# Fetch pull request

fpr() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "error: fpr must be executed from within a git repository"
        return 1
    fi
    (
        cdgr
        if [ "$#" -eq 1 ]; then
            local repo="${PWD##*/}"
            local user="${1%%:*}"
            local branch="${1#*:}"
        elif [ "$#" -eq 2 ]; then
            local repo="${PWD##*/}"
            local user="${1}"
            local branch="${2}"
        elif [ "$#" -eq 3 ]; then
            local repo="${1}"
            local user="${2}"
            local branch="${3}"
        else
            echo "Usage: fpr [repo] username branch"
            return 1
        fi

        git fetch "git@github.com:${user}/${repo}" "${branch}:${user}/${branch}"
    )
}

# Serve current directory

serve() {
    ruby -run -e httpd . -p "${1:-8080}"
}

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'

# Mirror stdout to stderr, useful for seeing data going through a pipe
alias peek='tee >(cat 1>&2)'
