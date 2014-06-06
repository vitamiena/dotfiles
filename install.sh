#!/bin/bash

relative_dir=`dirname $0`
dotfiles_dir=`(cd $relative_dir; pwd)`
echo $dotfiles_dir

for file in zshrc vimrc tmux.conf gitconfig
do
  src=$dotfiles_dir/$file
  ln -fs $src $HOME/.$file
done

if [ ! -d "${HOME}/.emacs.d" ]; then
    git clone git@github.com:vitamiena/.emacs.d.git ~/.emacs.d
fi

if [ ! -d "${HOME}/.cask" ]; then
    curl -fsSkL https://raw.github.com/cask/cask/master/go | python 
    export PATH="${HOME}/.cask/bin:${PATH}"
    (cd $HOME/.emacs.d; cask)
fi

