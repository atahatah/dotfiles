#!/bin/bash
echo "Import karabiner-elements settings..."
mkdir -p $HOME/dotfiles/backup/
[ -f $HOME/.config/karabiner/karabiner.json ] && mv $HOME/.config/karabiner/karabiner.json $HOME/dotfiles/backup/
mkdir -p $HOME/.config/karabiner
cp $HOME/dotfiles/bin/opt/Darwin/karabiner-elements/karabiner.json $HOME/.config/karabiner/karabiner.json 
echo "finished importing."