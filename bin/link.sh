#!/bin/bash
SCRIPT_DIR="$HOME/dotfiles"
cd $SCRIPT_DIR

echo "linked files:"

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == "Makefile" ]] && continue
    [[ "$f" == "README.md" ]] && continue

    [[ -L "$HOME/$f" ]] && unlink "$HOME/$f"
    [[ -f "$HOME/$f" ]] && mkdir -p ./backup && mv "$HOME/$f" ./backup/
    ln -snfv "$SCRIPT_DIR/$f" "$HOME/$f"
    echo "$f"
done

f="plugins.toml"
[[ -L "$HOME/$f" ]] && unlink "$HOME/$f"
[[ -f "$HOME/$f" ]] && mkdir -p ./backup && mv "$HOME/$f" ./backup/
ln -snfv "$SCRIPT_DIR/$f" "$XDG_CONFIG_HOME/sheldon/plugins.toml"
