#!/bin/bash

. bin/installer/Linux/funcs.sh
password

########################################
# Docker
########################################
if type docker > /dev/null 2>&1; then
    printf "${cyan}Docker has already installed.${reset_color}\n"
else
    printf "${cyan}Installing Docker...${reset_color}\n"

    # https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
    # 1. Set up Docker's apt repository.
    # Add Docker's official GPG key:
    # sudo apt-get update
    # sudo apt-get install ca-certificates curl
    echo "$password" | sudo -S install -m 0755 -d /etc/apt/keyrings
    echo "$password" | sudo -S curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    echo "$password" | sudo -S chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo "$password" | sudo -S \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    echo "$password" | sudo -S tee /etc/apt/sources.list.d/docker.list > /dev/null
    echo "$password" | sudo -S apt-get update

    # 2. Install the Docker packages.
    echo "$password" | sudo -S apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # 3. Verify that Docker is installed correctly by running the hello-world image.
    echo "$password" | sudo -S docker run --rm hello-world

    # in order to use docker without sudo
    echo "$password" | sudo -S usermod -aG docker $USER
    echo "{$red}!!Please log out and log back in to apply the changes!!{$reset_color}"
    __show_installation_status "Docker"
fi
