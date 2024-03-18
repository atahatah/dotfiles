FROM alpine:3.18
# FROM ubuntu:22.04

# RUN apt update && apt install -y \
RUN apk --update add \
    bash \
    ca-certificates \
    curl \
    git \
    make \
    sudo \
    zsh \
    zsh-vcs \
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