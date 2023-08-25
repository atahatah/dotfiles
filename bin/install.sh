#!/bin/bash

########################################
# environment dependant settings
########################################
. bin/installer/`uname`.sh

########################################
# cross-shell prompt
########################################
curl -sS https://starship.rs/install.sh | sh -s -- -y
