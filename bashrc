# Make Bash Great Again

# Disable ctrl-s and ctrl-q
stty -ixon

# Set autocd
shopt -s autocd

# Set as Infinite History
HISTSIZE= HISTFILESIZE= 

# Bash Prompt
# Show branch for GIT
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Define PS1 variables for different consoles
TEXT_MODE='\[\e[38;5;40;1m\]\u \[\e[0;38;5;118m\]_> \[\e[38;5;40m\][\[\e[38;5;27;1m\]\w\[\e[0;38;5;40m\]] \[\e[38;5;220;1m\]$(parse_git_branch) \n\[\e[0;38;5;40;3m\]\$ \[\e[0m\]'
GUI_MODE='🪵 \[\e[38;5;71;1m\]\u \[\e[0;38;5;118m\]_\[\e[5m\]> \[\e[0;38;5;40m\][\[\e[38;5;33;1m\]\w\[\e[0;38;5;40m\]] \[\e[33;1m\]$(parse_git_branch) \n\[\e[0;38;5;41m\]\$ \[\e[0m\]'
ROOT_GUI='❗ \[\e[38;5;160m\]♠ \[\e[1m\]\u \[\e[0;38;5;118m\]_\[\e[5m\]> \[\e[0;38;5;160m\][\[\e[38;5;33;1m\]\w\[\e[0;38;5;160m\]] \[\e[38;5;183;1m\]$(parse_git_branch) \n\[\e[38;5;124;4m\]\$ \[\e[0m\]'
ROOT_TEXT_MODE='\[\e[38;5;196;1m\]\u \[\e[0;91m\]_\[\e[38;5;118m\]> \[\e[91m\][\[\e[38;5;33;1m\]\w\[\e[0;91m\]] \[\e[38;5;220;1m\]$(parse_git_branch) \n\[\e[0;91;3m\]\$ \[\e[0m\]'

# Check the value of $TERM to determine console type
if [[ $TERM == "linux" ]]; then
    if [[ $EUID == 0 ]]; then
        PS1="$ROOT_TEXT_MODE"
    else
        PS1="$TEXT_MODE"
    fi
else
    if [[ $EUID == 0 ]]; then
        PS1="$ROOT_GUI"
    else
        PS1="$GUI_MODE"
    fi
fi

# Adding color to some basic commands
alias ls='ls -lhN --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ccat='highlight --out-format=ansi --force'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Some aliases
alias sa='sudo apt'
alias v='vim'
alias sv='sudo vim'
alias SS='sudo systemctl'
alias hst='history'
alias rst='init 6'
alias pwf='init 0'

# Aliases for GIT
alias gts='git status'
alias gta='git add'
alias gtc='git commit'
alias gtl='git log'
alias graph='git log --all --decorate --oneline --graph'

# Allow Bash_Completion

source /etc/profile.d/bash_completion.sh
