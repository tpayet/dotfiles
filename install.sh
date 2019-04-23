#! /bin/bash

files="alias tmux.conf vimrc zshrc history.zsh"

for file in $files ; do
    echo "Creating symlink for $file at $HOME/.$file";
    ln -s $(pwd)/$file "$HOME/.$file";
    if [[ $? -eq 1 ]]; then
        echo "Replacing with newer version";
        ln -sf $(pwd)/$file "$HOME/.$file";
    fi
    echo "---"
done

