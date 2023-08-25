#!/bin/bash

pushd . > /dev/null
cd bin/installer

if [ -f /.dockerenv ]; then
    . Linux-docker.sh
else
    . Linux-native.sh
fi

# install sheldon by pre-built binaries
if [ ! -f $HOME/.local/bin/sheldon ]; then
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
        | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
else
    echo 'sheldon has already installed.'
fi

popd > /dev/null