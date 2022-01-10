#!/bin/bash

install_commons() {
  if [ ! -d ~/.oh-my-zsh ]
  then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi
}

install_links() {
    dir=~/dotfiles             # dotfiles directory
    files="zshrc gitconfig"    # list of files/folders to symlink in homedir

    for file in $files; do
      echo "Creating symlink to .$file"
      ln -sf $dir/.$file ~/.$file
    done
}

install_commons
install_links
