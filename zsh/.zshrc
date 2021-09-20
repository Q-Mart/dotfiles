#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export LC_ALL="en_GB.UTF-8"

# Editor
export VISUAL="nvim"
export EDITOR="nvim"

export GPG_TTY=$(tty)

# GO
export GOPATH=$HOME/prog/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Ruby
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

export PATH="$HOME/prog/shared/adb-sync:$PATH"

# CUDA
export PATH="$PATH:/opt/cuda/bin"

# TidalCycles
export TIDAL_BOOT_PATH=~/prog/tidalcycles/tlib/startup.ghci

# OpenFrameworks
export PG_OF_PATH=/opt/openFrameworks

# Aliases
alias tmux='tmux -2'
alias vim='nvim'
alias weather='curl wttr.in/cambridge'
alias sync_music='~/prog/dotfiles/sync_music.sh'

alias samples='ls ~/.local/share/SuperCollider/downloaded-quarks/Dirt-Samples/\
  ~/prog/tidalcycles/samples/tidal-samples/samples-extra'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/key-bindings.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
