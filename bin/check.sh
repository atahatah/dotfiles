#!/usr/bin/env zsh

DOTFILES_HOME="$HOME/dotfiles"

if test -n "$(git -C $DOTFILES_HOME status --porcelain)"; then
    autoload -Uz colors
    colors
    echo ""
    echo "${fg[cyan]}==================WORNING==================${reset_color}" 
    echo "${fg[cyan]}there are ${fg[magenta]}LOCALLY ${fg[cyan]}some changes of dotfiles.${reset_color}" 
    echo "${fg[cyan]}===========================================${reset_color}" 
    echo ""
elif ! git -C $DOTFILES_HOME diff --exit-code --stat --cached origin/main > /dev/null; then
    autoload -Uz colors
    colors
    echo ""
    echo "${fg[cyan]}==================WORNING==================${reset_color}" 
    echo "${fg[cyan]}thre are ${fg[magenta]}REMOTELY ${fg[cyan]}some changes of dotfiles.${reset_color}" 
    echo "${fg[cyan]}===========================================${reset_color}" 
    echo ""
fi
