#!/bin/bash

install_links() {
    dir=~/dotfiles             # dotfiles directory
    #files="zshrc gitconfig"    # list of files/folders to symlink in homedir
    files = "gitconfig"

    for file in $files; do
      echo "Creating symlink to .$file"
      ln -sf $dir/.$file ~/.$file
    done
}

install_links
source ~/dotfiles/.zshrc
