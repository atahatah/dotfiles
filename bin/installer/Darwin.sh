#!/bin/bash

########################################
# Homebrew
########################################

if $LOCAL; then
  echo 'did not install Homebrew because the "-l" option (install locally) was specified.'
else
  # install Homebrew
  type brew > /dev/null || \
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # install all dependencies from the Brewfile with Homebrew
  brew bundle --global
fi

########################################
# font
########################################

if [ ! -f ~/Library/Fonts/Knack\ Regular\ Nerd\ Font\ Complete.otf ]; then
  pushd . > /dev/null
  mkdir -p ~/Library/Fonts
  cd ~/Library/Fonts && curl -fLo "Knack Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/0.9.0/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete.ttf
  popd > /dev/null
fi