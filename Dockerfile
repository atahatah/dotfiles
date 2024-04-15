# FROM alpine:latest
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    # RUN apk update && apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    git \
    make \
    sudo \
    zsh \
    && rm -rf /var/cache/apk/*

RUN adduser --disabled-password --gecos '' --shell /bin/zsh user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

ENV HOME=/home/user

WORKDIR ${HOME}

# dotfiles
RUN export GIT_SSL_NO_VERIFY=1 \
    && mkdir -p ${HOME}/dotfiles \
    && git clone https://github.com/atahatah/dotfiles.git ${HOME}/dotfiles \
    && cd ${HOME}/dotfiles \
    && make install

CMD [ "/bin/zsh" ]