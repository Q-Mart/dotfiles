#/usr/bin/bash
ln -s ~/dotfiles/files/.* ~/

#NVIM stuff
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
