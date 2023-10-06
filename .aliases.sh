########################################
# Directory
#######################################
alias cdd='cd ~/developments'

########################################
# Docker
#######################################
alias d='docker'
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

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