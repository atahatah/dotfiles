########################################
# Docker
#######################################
alias d='docker'
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

########################################
# etc
#######################################

# colab
alias colab='docker run --gpus=all -p 127.0.0.1:9000:8080 asia-docker.pkg.dev/colab-images/public/runtime'

########################################
# Only for Linux
#######################################
if [ `uname` = 'Linux' ]; then
    # sleep
    alias disableSleep='systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target'
    alias enableSleep='systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target'
fi