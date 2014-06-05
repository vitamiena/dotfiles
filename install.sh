#!/bin/bash

relative_dir=`dirname $0`
dotfiles_dir=`(cd $relative_dir; pwd)`
echo $dotfiles_dir

for file in zshrc vimrc tmux.conf gitconfig
do
  src=$dotfiles_dir/$file
  ln -fs $src $HOME/.$file
done

if [ ! -d "${HOME}/.cask" ]; then
    curl -fsSkL https://raw.github.com/cask/cask/master/go | python 
fi
