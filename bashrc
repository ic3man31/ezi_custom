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
TEXT_MODE='\[\e[0;1;38;5;129m\]\u \[\e[0;38;5;118m\]_\[\e[0;38;5;118m\]> \[\e[0;38;5;129m\][\[\e[0;1;96m\]\w\[\e[0;38;5;129m\]] \[\e[0;1;38;5;220m\]$(parse_git_branch) \n\[\e[0;3;38;5;129m\]$ \[\e[0m\]'
GUI_MODE='\[\e[0m\]🪵 \[\e[0;1;38;5;71m\]\u \[\e[0;38;5;118m\]_\[\e[0;5;38;5;118m\]> \[\e[0;38;5;223m\][\[\e[0;1;96m\]\w\[\e[0;38;5;223m\]] \[\e[0;1;33m\]$(parse_git_branch) \n\[\e[0m\]$ \[\e[0m\]'
ROOT_GUI='\[\e[0m\]❗ 🦈 \[\e[0;1;38;5;160m\]\u \[\e[0;38;5;118m\]_\[\e[0;5;38;5;118m\]> \[\e[0;38;5;223m\][\[\e[0;1;96m\]\w\[\e[0;38;5;223m\]] \[\e[0;1;38;5;183m\]$(parse_git_branch) \n\[\e[0;3;38;5;124m\]$ \[\e[0m\]'
ROOT_TEXT_MODE='\[\e[0;1;38;5;196m\]\u \[\e[0;91m\]_\[\e[0;38;5;118m\]> \[\e[0;91m\][\[\e[0;1;96m\]\w\[\e[0;91m\]] \[\e[0;1;38;5;220m\]$(parse_git_branch) \n\[\e[0;3;91m\]$ \[\e[0m\]'

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
