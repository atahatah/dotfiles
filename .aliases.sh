########################################
# Color Support
#######################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
elif [ `uname` = 'Darwin' ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

########################################
# Directory
#######################################
alias cdd='cd ~/developments'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ..2='cd ../..'
alias ..3='cd ../../..'

########################################
# Docker
#######################################
alias d='docker'
alias dc='docker compose'
alias dcb='docker compose build'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcr='dcd&&dcu'

########################################
# Docker
#######################################
alias dot='cd ~/dotfiles'

########################################
# sleep settings
#######################################
if [ `uname` = 'Linux' ]; then
    alias disablesleep='systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target'
    alias enablesleep='systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target'
elif [ `uname` = 'Darwin' ]; then
    alias disablesleep='pmset -a disablesleep 1'
    alias enablesleep='pmset -a disablesleep 0'
fi

########################################
# etc
#######################################

# colab
alias colab='docker run --rm --gpus=all -p 127.0.0.1:9000:8080 asia-docker.pkg.dev/colab-images/public/runtime'
# path
alias path='echo $PATH | tr ":" "\n"'
