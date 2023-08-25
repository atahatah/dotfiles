#!/bin/bash

# install Homebrew
type brew > /dev/null || \
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install all dependencies from the Brewfile with Homebrew
brew bundle --global