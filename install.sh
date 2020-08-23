#!/bin/bash

stow -t $HOME zsh tmux X vim picom
stow -t $HOME/.config/i3 i3
stow -t $HOME/.config/mpd mpd
stow -t $HOME/.ncmpcpp/ ncmpcpp
stow -t $HOME/.config/i3/blocks i3blocks
stow -t $HOME/.config/polybar polybar

#NVIM stuff
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim

echo "complete"
