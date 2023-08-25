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
[[ -L "$HOME/$f" ]] && unlink "$HOME/$f"
[[ -f "$HOME/$f" ]] && mkdir -p ./backup && mv "$HOME/$f" ./backup/
mkdir -p "$HOME/.config/sheldon/sheldon"
ln -snfv "$SCRIPT_DIR/$f" "$HOME/.config/sheldon/plugins.toml"
