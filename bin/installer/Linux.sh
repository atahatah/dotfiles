#!/bin/bash

[ -f /.dockerenv ] && . Linux-docker.sh || . Linux-native.sh

# install sheldon by pre-built binaries
[ -f $HOME/.local/bin/sheldon ] ||
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin