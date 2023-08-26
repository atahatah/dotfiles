#!/bin/bash

########################################
# variables and functions for installer
########################################

black=$(printf '\033[30m')
red=$(printf '\033[31m')
green=$(printf '\033[32m')
yellow=$(printf '\033[33m')
blue=$(printf '\033[34m')
magenta=$(printf '\033[35m')
cyan=$(printf '\033[36m')
white=$(printf '\033[37m')

reset_color=$(printf '\033[m')

__show_installation_status() {
    if [ $? -eq 0 ]; then
        printf "${green}Succeeded in installation of $1${reset_color}\n"
    else
        printf "${red}Failed in installation of $1${reset_color}\n"
    fi
}

########################################
# arguments
########################################

CMDNAME=`basename $0`

LOCAL=false

while getopts l OPT
do
  case $OPT in
    "l" ) LOCAL=true;;
      * ) echo "Usage: $CMDNAME [-l]" 1>&2
          exit 1 ;;
  esac
done

if $LOCAL ; then
    printf "${cyan}Installing locally...${reset_color}\n"
else
    printf "${cyan}Installing globally...${reset_color}\n"
fi

########################################
# environment dependant settings
########################################
. bin/installer/`uname`.sh

########################################
# cross-shell prompt
########################################
if $LOCAL; then
    if [ ! -f $HOME/.local/bin/starship ]; then
        printf "${cyan}Installing starship locally...${reset_color}\n"
        curl -sS https://starship.rs/install.sh | sh -s -- -y -b $HOME/.local/bin/
        __show_installation_status "starship locally"
    else
        printf "${cyan}starship has already installed locally.${reset_color}\n"
    fi
else
    if [ ! -f /usr/local/bin/starship ]; then
        printf "${cyan}Installing starship globaly...${reset_color}\n"
        curl -sS https://starship.rs/install.sh | sh -s -- -y
        __show_installation_status "starship globaly"
    else
        printf "${cyan}starship has already installed globally.${reset_color}\n"
    fi
fi

########################################
# unset
########################################
printf "${green}All installations are complete!!${reset_color}\n"

unset LOCAL
unset black red green yellow blue magenta cyan white
unset __show_installation_status

