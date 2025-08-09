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
alias dcb='docker compose build --no-cache'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcr='dcd&&dcu'

########################################
# Dotfiles
#######################################
alias dot='type code > /dev/null && code ~/dotfiles || cd ~/dotfiles'
alias install_command='echo "sudo apt update && sudo apt install -y make git curl zsh && git clone https://github.com/atahatah/dotfiles.git \$HOME/dotfiles && cd \$HOME/dotfiles && make install && chsh -s $(which zsh)" | pbcopy'
alias install_locally_command='echo "sudo apt update && sudo apt install -y make git curl zsh && git clone https://github.com/atahatah/dotfiles.git \$HOME/dotfiles && cd \$HOME/dotfiles && make install_locally && chsh -s $(which zsh)" | pbcopy'

########################################
# Git
#######################################
alias repo-url='git remote -v | sed -n -e "s/^origin[[:space:]]git@github\.com:*\(.*\)\.git[[:space:]]*(fetch)/github.com\/\1/p" | pbcopy'
alias clone-cmd='git remote -v | sed -n -e "s/^origin[[:space:]]*\(git@github.com:.*\)[[:space:]]*(fetch)/git clone \1/p" | pbcopy'

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

# vscode
alias c='code .'
# colab
alias colab='docker run --rm --gpus=all -p 127.0.0.1:9000:8080 asia-docker.pkg.dev/colab-images/public/runtime'
# correct time when the macbook has not been used for long time
alias correct_time='sudo sntp -Ss time.asia.apple.com'
# show ip addr
alias ipaddr='ip -br -c addr'
# tmux
alias t='tmux new-session -A -s default'
alias ta='tmux a'
# path
alias path='echo $PATH | tr ":" "\n"'
# copy to clip board
if [ `uname` = 'Linux' ]; then
    alias pbcopy='xsel --clipboard --input'
fi
