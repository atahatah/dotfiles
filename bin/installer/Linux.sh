#!/bin/bash

printf "${cyan}Start Linux specific installation...${reset_color}\n"

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
    printf "${cyan}Downloading sheldon...${reset_color}\n"
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
        | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
    __show_installation_status "sheldon"
else
    printf "${cyan}Sheldon has already installed.${reset_color}\n"
fi

########################################
# font
########################################

if [ -f ~/.local/share/fonts/Knack\ Regular\ Nerd\ Font\ Complete.otf ]; then
    printf "${cyan}Font(Knack Nerd Font) has already installed.${reset_color}\n"
else
    printf "${cyan}Downloading Font(Knack Nerd Font)...${reset_color}\n"
    pushd . > /dev/null
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts && curl -fLo "Knack Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/0.9.0/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete.ttf
    popd > /dev/null
    __show_installation_status "Font(Knack Nerd Font)"
fi

printf "${green}Finished Linux specific installation!${reset_color}\n"
