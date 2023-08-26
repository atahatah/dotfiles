#!/bin/bash

printf "${cyan}Start Darwin specific installation...${reset_color}\n"

########################################
# Homebrew
########################################

if $LOCAL; then
  printf "${yellow}did not install Homebrew because the "-l" option (install locally) was specified.${reset_color}\n"
else
  # install Homebrew
  if type brew > /dev/null; then
    printf "${cyan}Homebrew has already installed.${reset_color}\n"
  else
    printf "${cyan}Installing Homebrew...${reset_color}\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    __show_installation_status Homebrew
  fi

  # install all dependencies from the Brewfile with Homebrew
  printf "${cyan}Installing all dependencies from the Brewfile with Homebrew...${reset_color}\n"
  brew bundle --global
  # Homebrew will show installation result
fi

########################################
# font
########################################

if [ -f ~/Library/Fonts/Knack\ Regular\ Nerd\ Font\ Complete.otf ]; then
  printf "${cyan}Font(Knack Nerd Font) has already installed.${reset_color}\n"
else
  printf "${cyan}Downloading Font(Knack Nerd Font)...${reset_color}\n"
  pushd . > /dev/null
  mkdir -p ~/Library/Fonts
  cd ~/Library/Fonts && curl -fLo "Knack Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/0.9.0/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete.ttf
  popd > /dev/null
  __show_installation_status "Font(Knack Nerd Font)"
fi

printf "${green}Finished Darwin specific installation!${reset_color}\n"