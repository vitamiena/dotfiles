#!/bin/bash

relative_dir=`dirname $0`
dotfiles_dir=`(cd $relative_dir; pwd)`
echo $dotfiles_dir

for file in vimrc tmux.conf gitconfig
do
  src=$dotfiles_dir/$file
  ln -fs $src $HOME/.$file
done

(
cd zsh.d
./install.sh
)

if [ ! -d "${HOME}/.emacs.d/inits/" ]; then
    rm -rf "${HOME}/.emacs.d"
    git clone git@github.com:vitamiena/.emacs.d.git ~/.emacs.d
fi

if [ ! -d "${HOME}/.cask" ]; then
    curl -fsSkL https://raw.github.com/cask/cask/master/go | python
    export PATH="${HOME}/.cask/bin:${PATH}"
    (cd $HOME/.emacs.d; cask)
fi
