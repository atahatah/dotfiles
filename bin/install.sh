#!/bin/bash

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
    echo Installing locally...
else
    echo Installing globally...
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
        curl -sS https://starship.rs/install.sh | sh -s -- -y -b $HOME/.local/bin/
    else
        echo "starship has already installed locally."
    fi
else
    if [ ! -f /usr/local/bin/starship ]; then
        curl -sS https://starship.rs/install.sh | sh -s -- -y
    else
        echo "starship has already installed globally."
    fi
fi

########################################
# unset
########################################
unset LOCAL
