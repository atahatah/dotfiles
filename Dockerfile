FROM ubuntu:22.04

RUN apt update && apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    make \
    sudo \
    zsh \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

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
    && make all

CMD [ "/bin/zsh" ]