#!/bin/bash
echo "Import karabiner-elements settings..."
[ -f $HOME/.config/karabiner/karabiner.json  ] && rm $HOME/.config/karabiner/karabiner.json 
[ ! -L $HOME/.config/karabiner/karabiner.json ] && ln -s $HOME/dotfiles/bin/opt/Darwin/karabiner-elements/karabiner.json $HOME/.config/karabiner/karabiner.json 
echo "finished importing."