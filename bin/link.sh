#!/bin/bash
SCRIPT_DIR="$HOME/dotfiles"
cd $SCRIPT_DIR

echo "linked files:"

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    [[ -L "$HOME/$f" ]] && unlink "$HOME/$f"
    [[ -f "$HOME/$f" ]] && mkdir -p ./backup && mv "$HOME/$f" ./backup/
    ln -snfv "$SCRIPT_DIR/$f" "$HOME/$f" > /dev/null
    echo "$f"
done

f="plugins.toml"
FILEDIR="$HOME/.config/sheldon"
[[ -L "$FILEDIR/$f" ]] && unlink "$FILEDIR/$f"
[[ -f "$FILEDIR/$f" ]] && mkdir -p ./backup && mv "$FILEDIR/$f" ./backup/
mkdir -p "$FILEDIR"
ln -snfv "$SCRIPT_DIR/$f" "$FILEDIR/$f"

f="starship.toml"
FILEDIR="$HOME/.config"
[[ -L "$FILEDIR/$f" ]] && unlink "$FILEDIR/$f"
[[ -f "$FILEDIR/$f" ]] && mkdir -p ./backup && mv "$FILEDIR/$f" ./backup/
mkdir -p "$FILEDIR"
ln -snfv "$SCRIPT_DIR/$f" "$FILEDIR/$f"


# create local files
touch $HOME/.zshrc_local.zsh
touch $HOME/.gitconfig.local

unset SCRIPT_DIR
unset f
unset FILEDIR