#!/bin/bash

# you need to install rosetta2 for Apple Silicon
# but it may couse some issues when you runs the command more than once
# so i commented it out
# sudo softwareupdate --install-rosetta --agree-to-license
asdf plugin add jq
asdf install jq latest
asdf global jq latest
asdf plugin add flutter
asdf install flutter latest
