#!/bin/bash

stow -t $HOME git zsh tmux

stow -t $HOME/.config/nvim nvim

cp ./windows_terminal/settings.json /mnt/c/Users/quj/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/

cp ./powershell/Microsoft.PowerShell_profile.ps1 /mnt/c/Users/quj/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
