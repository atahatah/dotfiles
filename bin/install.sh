#!/bin/bash

########################################
# environment dependant settings
########################################
. bin/installer/`uname`.sh

########################################
# cross-shell prompt
########################################
if [ ! -f /usr/local/bin/starship ]; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "starship has already installed."
fi
