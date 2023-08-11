#!/bin/bash

DOT_DIR="$HOME/.dotfiles"
for f in *;
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == "Makefile" ]] && continue
    [[ "$f" == "README.md" ]] && continue

    ln -snf $DOT_DIR/"$f" $HOME/"$f"
    echo "Installed $f"
done