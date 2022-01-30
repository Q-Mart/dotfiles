#!/usr/bin/env bash

stow -t $HOME zsh git

stow -t $HOME/.config/nvim nvim
# stow -t $HOME/.config/mpd mpd
# stow -t $HOME/.ncmpcpp/ ncmpcpp

#NVIM stuff
#mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
#ln -s ~/.vim $XDG_CONFIG_HOME/nvim

echo "complete"
