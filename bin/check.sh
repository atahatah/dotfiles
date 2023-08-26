#!/usr/bin/env zsh

DOTFILES_HOME="$HOME/dotfiles"

autoload -Uz colors
colors
echo "${fg[cyan]}Checking the updates...${reset_color}" 
if test -n "$(git -C $DOTFILES_HOME status --porcelain)"; then
    echo ""
    echo "${fg[cyan]}=====================WORNING======================${reset_color}" 
    echo "${fg[cyan]}There are uncommitted changes related to dotfiles.${reset_color}" 
    echo "${fg[cyan]}==================================================${reset_color}" 
    echo ""
elif ! git -C $DOTFILES_HOME diff --exit-code --stat --cached origin/main > /dev/null; then
    echo ""
    echo "${fg[cyan]}===================WORNING===================${reset_color}" 
    echo "${fg[cyan]}It is not in sync with the remote repository.${reset_color}" 
    echo "${fg[cyan]}=============================================${reset_color}" 
    echo ""
else
    echo "${fg[green]}Anything related to dotfiles is the latest!${reset_color}" 
fi

unset DOTFILES_HOME