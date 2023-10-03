echo 'reading colab'
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
