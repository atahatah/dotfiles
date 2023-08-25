#!/bin/bash

########################################
# environment dependant settings
########################################
pushd . > /dev/null
cd bin/installer

if [ -f /.dockerenv ]; then
    . Linux-docker.sh
else
    . Linux-native.sh
fi

popd > /dev/null

########################################
# plugin manager
########################################

# install sheldon by pre-built binaries
if [ ! -f $HOME/.local/bin/sheldon ]; then
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
        | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
else
    echo 'sheldon has already installed.'
fi

########################################
# font
########################################

if [ ! -f ~/.local/share/fonts/Knack\ Regular\ Nerd\ Font\ Complete.otf ]; then
    pushd . > /dev/null
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts && curl -fLo "Knack Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/0.9.0/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete.ttf
    popd > /dev/null
fi