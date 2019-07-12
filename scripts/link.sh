#!/bin/bash

relative_dir=`dirname $0`
dotfiles_dir=`(cd $relative_dir; pwd)`
echo $dotfiles_dir

for file in vimrc tmux.conf gitconfig
do
  src=$dotfiles_dir/$file
  ln -fs $src $HOME/.$file
done

# zsh.d
(
cd zsh.d
base_path=`pwd`
echo "creating zsh symlinks.."

for file in zshrc zshenv
do
  ln -sf $base_path/$file $HOME/.$file
done

echo "Are you need proxy setting?"
read -p "Proxy URL or empty : " url

if [ -n "${url}" ]; then
  cat <<PROXY > ${HOME}/.proxy
export http_proxy=$url
export https_proxy=$url
export ftp_proxy=$url
export HTTP_PROXY=$url
export HTTPS_PROXY=$url
export FTP_PROXY=$url
export no_proxy=localhost,127.0.0.1
PROXY
fi
)

# emacs.d
(
cd emacs.d
base_path=`pwd`
echo "creating emacs symlinks.."
if [ ! -d "${HOME}/.emacs.d/inits/" ]; then
    rm -rf "${HOME}/.emacs.d"
    ln -fs $base_path/ $HOME/.emacs.d
fi
)

# SSH
echo "creating ssh symlinks.."
mkdir -p ${PWD}/.ssh
ln -fs ${PWD}/ssh/config ${HOME}/.ssh/config

# brew
echo "creating brew symlinks.."
mkdir -p ${HOME}/.config/brewfile
ln -fs ${PWD}/brew/Brewfile ${HOME}/.config/brewfile/Brewfile
