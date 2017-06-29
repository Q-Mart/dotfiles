#!/bin/bash

stow -t $HOME vim git zsh bash tmux

#NVIM stuff
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
