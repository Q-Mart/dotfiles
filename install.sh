#!/bin/bash

stow -t $HOME zsh tmux
stow -t $HOME/.config/i3 i3
stow -t $HOME/.config/mpd mpd
stow -t $HOME/.ncmpcpp/ .ncmpcpp

#NVIM stuff
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
